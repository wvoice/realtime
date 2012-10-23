//#include "ActivationTimer.h"

//or:

#include "stdafx.h"

// Initialization of ActivationTimer' static members:
unsigned long  ActivationTimer::curTimeout	= 0;
unsigned long  ActivationTimer::maxTimeout	= 0;
unsigned long  ActivationTimer::minTimeout	= 0;
unsigned  int  ActivationTimer::TimerId 	= 0;
	 TaskList* ActivationTimer::listOfTasks = NULL;

// Routine that finds the Greatest Common Measure of 2 numbers:
static unsigned long GCM(unsigned long x, unsigned long y)
{
	if((x <= 0UL) || (y <= 0UL))
		return 1UL;

	while(x != y)
	{
		if(x > y)
			x -= y;
		else
			y -= x;
	}

	return x;
}

////////////////////////////////////////////////////////
//
//	  Thread structure - a node of ThreadList.
//
//	  Note that only ThreadList is allowed to create
//	  and handle 'Thread's.
//
////////////////////////////////////////////////////////
Thread::Thread(HANDLE hNewThreadHandle)
{
	// Maybe safer? Or it doesn't matter?
/*	HANDLE hProcess = GetCurrentProcess();
	DuplicateHandle(hProcess, hNewThreadHandle, hProcess, &ThreadHandle,
					THREAD_ALL_ACCESS, false, DUPLICATE_CLOSE_SOURCE);
*/
	ThreadHandle = hNewThreadHandle;

	Next = NULL;
	Prev = NULL;
}

Thread::~Thread()
{
	// Check if thread has exited.
	// If it did not - terminate it.
	DWORD exitCode;
	GetExitCodeThread(ThreadHandle, &exitCode);

	// !!! UNSAFE CODE !!!
	// Try not to use lengthy operations OR
	// use some kind of internal completition
	// flag to explicitly instruct thread to exit.
	// Refer MSDN on hazards of TerminateThread.
	if(exitCode == STILL_ACTIVE)
		TerminateThread(ThreadHandle, 0);

	CloseHandle(ThreadHandle);
}

////////////////////////////////////////////////////////
//
//	  ThreadList class - a double-linked list of 'Thread's.
//
//	  Note that only Task and TaskList objects are allowed
//	  to create and handle 'ThreadList's.
//
////////////////////////////////////////////////////////
ThreadList::ThreadList(HANDLE hNewThreadHandle)
{
	if(!hNewThreadHandle)
	{
		Begin		 = NULL;
		End 		 = NULL;
		NumOfThreads = 0;

		return;
	}

	Begin = new Thread(hNewThreadHandle);
	End   = Begin;

	NumOfThreads = 1;
}

// Add a thread object to the end of the thread list:
int ThreadList::AppendThread(HANDLE hNewThreadHandle)
{
	Thread* newThread = new Thread(hNewThreadHandle);

	if(!Begin)
		Begin = End = newThread;
	else
	{
		newThread->Prev = End;
		End->Next		= newThread;
		End 			= newThread;
	}

	return ++NumOfThreads;
}

// Close all thread handles and rearrange the list:
int ThreadList::CloseThreadObject(const int num)
{
	Thread* target = operator[](num);
	if(target && (!IsThreadActive(num)))
	{
		if(target->Next)
			target->Next->Prev = target->Prev;

		if(target->Prev)
			target->Prev->Next = target->Next;

		if(target == End)
			End = target->Prev;

		if(target == Begin)
			Begin = target->Next;

		delete target;
		return --NumOfThreads;
	}
	else
		return -1;
}

int ThreadList::GetNumOfThreads() const
{
	return NumOfThreads;
}

// Return the state of thread:
bool ThreadList::IsThreadActive(const int num) const
{
	Thread* target = operator[](num);
	if(target)
	{
		DWORD exitCode;
		GetExitCodeThread(target->ThreadHandle, &exitCode);
		return (exitCode == STILL_ACTIVE);
	}
	else
		// On error function returns true,
		// which means that 'num'th thread cannot
		// be safely shut down:
		return true;
}

// Get the pointer to a 'num'th thread object:
Thread* ThreadList::operator[](const int num) const
{
	if((num < 0) || (num >= NumOfThreads))
		return NULL;

	Thread* target = Begin;
	for(int i = 0; i < num; i++)
		target = target->Next;

	return target;
}

ThreadList::~ThreadList()
{
	Thread* target = Begin;
	Thread* temp;

	if(target)		// If ThreadList is not empty...
	while(target)
	{
		temp = target->Next;

		delete target;

		target = temp;
	}
}

////////////////////////////////////////////////////////
//
//	  Task class - a node of TaskList.
//
//	  Note that only TaskList is allowed to create
//	  and handle 'Task's.
//
////////////////////////////////////////////////////////
Task::Task(const unsigned long msTimeout, void* pNewFunc, void* pParam)
{
	timeout    = msTimeout;
	pFunc	   = pNewFunc;
	pParameter = pParam;

	listOfThreads = new ThreadList();

	Next = NULL;
	Prev = NULL;
}

Task::~Task()
{
	delete listOfThreads;
}

// Create an individual thread for a task:
void Task::Execute()
{
	listOfThreads->AppendThread(CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)pFunc, pParameter, 0, 0));

	// ...and wipe out all unused thread handles:
	int numThreads = listOfThreads->GetNumOfThreads();
	for(int i = 0; i < numThreads - 1; i++)
	{
		if(!(listOfThreads->IsThreadActive(i)))
			 listOfThreads->CloseThreadObject(i);
	}
}

////////////////////////////////////////////////////////
//
//	  TaskList class - a double-linked list of 'Task's.
//
//	  Note that only ActivationTimer is allowed
//	  to create and handle 'TaskList's.
//
////////////////////////////////////////////////////////
TaskList::TaskList(const unsigned long msTimeout, void* pNewFunc, void* pParam)
{
	if((msTimeout <= 0UL) || !pNewFunc)
	{
		Begin	   = NULL;
		End 	   = NULL;
		NumOfTasks = 0; 
		
		return;
	}

	Task* newNode = new Task(msTimeout, pNewFunc, pParam);

	Begin = End = newNode;

	++NumOfTasks;
}

Task* TaskList::operator[] (const int num) const
{
	if((num < 0) || (num >= NumOfTasks))
		return NULL;

	Task* target = Begin;

	for(int i = 0; i < num; i++)
		target = target->Next;

	return target;
}

int TaskList::GetNumOfTasks() const
{
	return NumOfTasks;
}

// Returns the 'timeout' value of the 'num'-th task:
unsigned long TaskList::GetTaskTimeout(const int num) const
{
	return operator[](num)->timeout;
}

// Add a task to the end of the list.
// Return value: position in the task list.
int TaskList::AppendTask(const unsigned long msTimeout, void* pNewFunc, void* pParam)
{
	Task* newNode = new Task(msTimeout, pNewFunc, pParam);

	if(!Begin)
		Begin = End = newNode;
	else
	{
		newNode->Prev = End;
		End->Next	  = newNode;
		End 		  = newNode;
	}

	return (++NumOfTasks) - 1;
}

// Delete a task at position of 'num' (zero-based!).
// Return value: number of tasks in the task list.
int TaskList::DeleteTask(const int num)
{
	Task* target = operator[](num);
	if(!target)
		return NumOfTasks;

	if(target->Next)
		target->Next->Prev = target->Prev;

	if(target->Prev)
		target->Prev->Next = target->Next;

	if(target == End)
		End = target->Prev;

	if(target == Begin)
		Begin = target->Next;

	delete target;

	return --NumOfTasks;
}

// Call a task:
void TaskList::CallTask(const int num)
{
	Task* task = operator[](num);
	task->Execute();
}

TaskList::~TaskList()
{
	Task* target = Begin;
	Task* temp;

	if(target)		// If TaskList is not empty...
	while(target)
	{
		temp = target->Next;

		delete target;

		target = temp;
	}
}

////////////////////////////////////////////////////////
//
//	  ActivationTimer class - an aggregate for TaskList.
//
//	  Handles all operations on TaskList and calls
//	  individual 'Task's when necessary.
//
////////////////////////////////////////////////////////
ActivationTimer::ActivationTimer(const unsigned long msTimeout, void* pNewFunc, void* pParam)
{
	if((msTimeout <= 0UL) || !pNewFunc)
	{
		listOfTasks = new TaskList();
		TimerId 	= 0;
		minTimeout	= 0;
		maxTimeout	= 0;
		curTimeout	= 0;

		return;
	}

	listOfTasks = new TaskList(msTimeout, pNewFunc, pParam);
	minTimeout	= msTimeout;
	maxTimeout	= msTimeout;
	curTimeout	= msTimeout;

	Restart();
}

ActivationTimer::~ActivationTimer()
{
	Halt();

	delete listOfTasks;
}

// Add a new task to the task list.
// Return value: zero-based position of task in a task list.
int ActivationTimer::AddTask(const unsigned long msTimeout, void* pNewFunc, void* pParam)
{
	// A little bit of parameter validation:
	if((msTimeout <= 0UL) || !pNewFunc)
		return -1;

	// Kill the timer:
	Halt();

	// Append a new task:
	int pos = listOfTasks->AppendTask(msTimeout, pNewFunc, pParam);

	// Recalculate 'maxTimeout' value:
	maxTimeout = maxTimeout < msTimeout ? msTimeout : maxTimeout;

	// Recalculate 'minTimeout' value:
	RecalcTimerInterval();

	// Recreate the timer:
	Restart();

	return pos;
}

// Remove task at the position of 'cpPos' (zero-based!) from the list.
// Return value: number of tasks in the task list.
int ActivationTimer::RemoveTask(const int cpPos)
{
	// Kill the timer:
	Halt();

	listOfTasks->DeleteTask(cpPos);

	// Recalculate 'maxTimeout' value:
	maxTimeout = listOfTasks->GetTaskTimeout(0);
	for(int i = 1; i < listOfTasks->NumOfTasks; i++)
	{
		unsigned long temp = listOfTasks->GetTaskTimeout(i);
		if(maxTimeout < temp)
		   maxTimeout = temp;
	}

	// Recalculate 'minTimeout' value:
	RecalcTimerInterval();

	// Recreate the timer:
	Restart();

	return listOfTasks->GetNumOfTasks();
}

int ActivationTimer::GetNumOfTasks() const
{
	return listOfTasks->GetNumOfTasks();
}

// Check if it is a time to call one of the tasks from the task list.
void ActivationTimer::ExecAppropriateFunc()
{
	bool reset = true;
	for(int i = 0; i < listOfTasks->NumOfTasks; i++)
	{
		// If time has come, call the 'i'th task:
		if((curTimeout % listOfTasks->GetTaskTimeout(i)) == 0)
		{
			listOfTasks->CallTask(i);
			reset &= true;
		}
		else
		{
			reset &= false;
		}
	}

	// If all tasks are called simultaneously,
	// reset curTimeout value:
	if(reset)
		curTimeout	= minTimeout;
	else
		curTimeout += minTimeout;
}

// Calculate the value of minTimeout.
// This is a time when 'ExecAppropriateFunc()' routine is periodically called.
void ActivationTimer::RecalcTimerInterval()
{
	minTimeout = listOfTasks->GetTaskTimeout(0);
	for(int i = 0; i < listOfTasks->NumOfTasks; i++)
	{
		unsigned long tempTimeout = GCM(minTimeout, listOfTasks->GetTaskTimeout(i));
					   minTimeout = minTimeout > tempTimeout ? tempTimeout : minTimeout;
	}

	curTimeout = minTimeout;
}

// Stop the timer.
void ActivationTimer::Halt()
{
	KillTimer(NULL, TimerId);
	TimerId  = 0;
}

// Restart the timer.
void ActivationTimer::Restart()
{
	TimerId = SetTimer(NULL, NULL, minTimeout, TimerProc);
}

// Not a member, but a friend to ActivationTimer.
void CALLBACK ActivationTimer::TimerProc(HWND, UINT, UINT timerId, DWORD sysTime)
{
	ActivationTimer::ExecAppropriateFunc();
}

// Reset the ActivationTimer.
// All tasks are discarded, timer is inactive.
void ActivationTimer::Reset()
{
	Halt();

	delete listOfTasks;

	TimerId 	= 0;
	minTimeout	= 0;
	maxTimeout	= 0;
	curTimeout	= 0;
	listOfTasks = new TaskList();
}