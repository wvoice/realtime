#ifndef _ACTIVATION_TIMER_
#define _ACTIVATION_TIMER_

struct Thread		// Structure that incapsulates the thread handle.
{
	// Only Thread list is allowed to create/close threads:
	friend class ThreadList;

protected:

	// Active thread handle:
	HANDLE ThreadHandle;

	Thread* Next;			// Next thread in a list.
	Thread* Prev;			// Previous thread in a list.

	// Construction / destruction:
			 Thread(HANDLE hNewThreadHandle);
	virtual ~Thread();
};

class ThreadList	// Double-linked list of thread objects.
{
	// Only task is allowed to handle ThreadList:
	friend class Task;

protected:

	Thread* Begin;			// Head of list
	Thread* End;			// Tail of list
	int 	NumOfThreads;	// Number of threads in a list.

	// Construction / destruction:
			 ThreadList(HANDLE hNewThreadHandle = NULL);
	virtual ~ThreadList();

	// Add a new thread to the list:
	int AppendThread(HANDLE hNewThreadHandle);

	// Get the pointer to a 'num'th thread object:
	Thread* operator[] (const int num) const;

	// Determine if 'num'th thread is active or not:
	bool IsThreadActive(const int num) const;

	// Close the 'num'th thread object:
	int CloseThreadObject(const int num);

	// Get the number of threads in a list:
	int GetNumOfThreads() const;
};

class Task		// Class that incapsulates task data.
{
	// No one is allowed to create and handle Task except for TaskList:
	friend class TaskList;

protected:

	// Time (in milliseconds), at which task is periodically performed:
	unsigned long timeout;

	void*		  pFunc;		// Pointer to the task (i.e.: function).
	void*		  pParameter;	// Pointer to a *structure* parameter of task.
	ThreadList*   listOfThreads;// List of active threads opened by a task.

	Task* Next; 				// Pointer to the next task.
	Task* Prev; 				// Pointer to the previous task

	// Construction / destruction:
			 Task(const unsigned long msTimeout, void* pNewFunc, void* pParam);
	virtual ~Task();

	void Execute(); 			// Call a task AND clean the threadlist.
};

class TaskList	// Double-linked list of task data.
{
	// No one is allowed to create and handle TaskList except for ActivationTimer:
	friend class ActivationTimer;

protected:

	Task* Begin;		// The very first Task.
	Task* End;			// The last Task.

	int NumOfTasks; 	// Number of Tasks in the list

	// Construction / destruction:
			 TaskList(const unsigned long msTimeout = 0, void* pNewFunc = NULL, void* pParam = NULL);
	virtual ~TaskList();

	// Retrieve a pointer to the 'num'th task:
	Task* operator[] (const int num) const;

	// Get the number of tasks:
	int  GetNumOfTasks () const;

	// Get the timeout value for the 'num'-th  task:
	unsigned long GetTaskTimeout(const int num) const;

	// Add a task:
	int  AppendTask(const unsigned long msTimeout, void* pNewFunc, void* pParam);

	// Remove a task from the list:
	int  DeleteTask(const int num);

	// Call a task and create an individual thread for it:
	void CallTask  (const int num);
};

class ActivationTimer			// A simple task scheduler - designed as a singleton.
{
protected:

	static TaskList* listOfTasks;		// Pointer to the list of tasks.

	// Minimal timeout - timer checks tasks for execution every 'minTimeout' milliseconds:
	static unsigned long minTimeout;
	static unsigned long maxTimeout;	// Maximum timeout in the list.
	static unsigned long curTimeout;	// Current time.
	static unsigned int  TimerId;		// ID of the internal timer.

	// Check if it is a time to call a task:
	static void ExecAppropriateFunc();

	// Calculate 'minTimeout' value.
		   void RecalcTimerInterval();

	static void CALLBACK TimerProc(HWND, UINT, UINT, DWORD);

public:

	// Construction / destruction:
			 ActivationTimer(const unsigned long msTimeout = 0, void* pNewFunc = NULL, void* pParam = NULL);
	virtual ~ActivationTimer();

	// Add a single task:
	int AddTask(const unsigned long msTimeout, void* pNewFunc, void* pParam = NULL);

	// Remove a task:
	int RemoveTask(const int cpPos);

	// Get the number of active tasks:
	int GetNumOfTasks() const;

	// Stop the timer
	void Halt();

	// Restart the timer:
	void Restart();

	// Deallocate a singleton object and 
	// reallocate it once again.
	void Reset();
};

#endif