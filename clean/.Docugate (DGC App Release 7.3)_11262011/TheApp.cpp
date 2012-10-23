// TheApp.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "TheApp.h"
#include "ActivationTimer.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

////////////////////////////////////// 
/////// Adding Timer function to re-scan Db. Added 8/29/2011 by Mike Young
//////////////////////////////////////


#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;								// current instance
TCHAR szTitle[MAX_LOADSTRING];					// The title bar text
TCHAR szWindowClass[MAX_LOADSTRING];			// The title bar text

// Here are the timers:
ActivationTimer timer;

// Task 1:
TCHAR* argv[1];
void F1()
{
	int a = 0;
	CMyDatabase      m_hMyDatabase;
	CDatabase        m_hDatabase;
    
	m_gConnect.Format("Driver={SQL Server};Server=%s;Database=docugate;Uid=RTT;Pwd=Qwerty#1;Application=DGC_MCR",argv[1]);
	m_hMyDatabase.ReadIni();
	m_hMyDatabase.ReadStationsFromTable(m_hDatabase);
    
	for ( a = 0; a < 255; a++ )
	{
		strncpy(Stations[a].UnitValue,        m_hMyDatabase.m_UnitValue, 10);
		Stations[a].UnitValueEnabled   = atoi(m_hMyDatabase.m_UnitValueEnabled);
		Stations[a].UnitActive		   = 0;
		Stations[a].UnitConnected	   = 0;
	}
	
    
	int StationCount = 0;
	StationCount     = m_hMyDatabase.ReadStationsFromTable     (m_hDatabase);
    
	////////////////////////////////////////////////
	// Get the CustomPL for each active unit
	/////////////////////////////////////////////////
	for ( a = 0; a < 255; a++ )
	{
        if (  Stations[a].UnitActive == 1)
            m_hMyDatabase.GetStationCustomPL(Stations[a],m_hDatabase,0);
	}
}

// Foward declarations of functions included in this code module:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance   (HINSTANCE, int);
LRESULT CALLBACK	WndProc		   (HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK	About		   (HWND, UINT, WPARAM, LPARAM);

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
 	// TODO: Place code here.
	MSG msg;
	HACCEL hAccelTable;
    
	// Initialize global strings
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_ACTIVATIONTIMERDEMO, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);
    
	// Perform application initialization:
	if (!InitInstance (hInstance, nCmdShow)) 
	{
		return FALSE;
	}
    
	hAccelTable = LoadAccelerators(hInstance, (LPCTSTR)IDC_ACTIVATIONTIMERDEMO);
    
	// Main message loop:
	while (GetMessage(&msg, NULL, 0, 0)) 
	{
		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg)) 
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}
    
	return msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
//  COMMENTS:
//
//    This function and its usage is only necessary if you want this code
//    to be compatible with Win32 systems prior to the 'RegisterClassEx'
//    function that was added to Windows 95. It is important to call this function
//    so that the application will get 'well formed' small icons associated
//    with it.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;
    
	wcex.cbSize = sizeof(WNDCLASSEX); 
    
	wcex.style			= CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc	= (WNDPROC)WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, (LPCTSTR)IDI_ACTIVATIONTIMERDEMO);
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= (LPCSTR)IDC_ACTIVATIONTIMERDEMO;
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, (LPCTSTR)IDI_SMALL);
    
	return RegisterClassEx(&wcex);
}

//
//   FUNCTION: InitInstance(HANDLE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
    HWND hWnd;
    
    hInst = hInstance; // Store instance handle in our global variable
    
    hWnd = CreateWindow(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
                        CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);
    
    if (!hWnd)
    {
        return FALSE;
    }
    
    ShowWindow(hWnd, nCmdShow);
    UpdateWindow(hWnd);
    
    // Here we add the tasks:
    
    // task...        will execute every....
    
    //   1                7.5 seconds.
    
	timer.AddTask(1000,  F1);
    
    return TRUE;
}

//
//  FUNCTION: WndProc(HWND, unsigned, WORD, LONG)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;
	TCHAR szHello[MAX_LOADSTRING];
	LoadString(hInst, IDS_HELLO, szHello, MAX_LOADSTRING);
    
	switch (message) 
	{
		case WM_COMMAND:
			wmId    = LOWORD(wParam); 
			wmEvent = HIWORD(wParam); 
			// Parse the menu selections:
			switch (wmId)
        {
            case IDM_ABOUT:
                DialogBox(hInst, (LPCTSTR)IDD_ABOUTBOX, hWnd, (DLGPROC)About);
                break;
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
        }
			break;
		case WM_PAINT:
			hdc = BeginPaint(hWnd, &ps);
			// TODO: Add any drawing code here...
			RECT rt;
			GetClientRect(hWnd, &rt);
			DrawText(hdc, szHello, strlen(szHello), &rt, DT_CENTER);
			EndPaint(hWnd, &ps);
			break;
		case WM_DESTROY:
			PostQuitMessage(0);
			break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Mesage handler for about box.
LRESULT CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		case WM_INITDIALOG:
            return TRUE;
            
		case WM_COMMAND:
			if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL) 
			{
				EndDialog(hDlg, LOWORD(wParam));
				return TRUE;
			}
			break;
	}
    return FALSE;
}

/////////////////////////////////////////////////////////////////////////////
// The one and only application object


CWinApp theApp;

using namespace std;

CCriticalSection ProcessLock;

char ThisMachineName[(MAX_COMPUTERNAME_LENGTH+1)];
char _Message[255] = {0};
char  _Result[255] = {0};
DWORD Length = 255;

UINT DiscoveryThread	 (VOID *cs);
UINT WorkerThread		 (VOID *cs);

HANDLE    hGlobalThreadWait    = CreateEvent(NULL,TRUE,FALSE,NULL);

TagStation Stations[255] = {0};


CStringArray     m_gStationArray;
CIniEx		     m_gIni;
CString		     m_gConnect;
char             m_gLogFileName[_MAX_PATH];

CActiveAccounts  m_ActiveAccounts;


int _tmain(int argc, TCHAR* argv[], TCHAR* envp[])
{


	int nRetCode = 0;
	int a = 0;
	GetComputerName(ThisMachineName,&Length);


	// initialize MFC and print and error on failure
	if (!AfxWinInit(::GetModuleHandle(NULL), NULL, ::GetCommandLine(), 0))
	{
		// TODO: change error code to suit your needs
		cerr << _T("Fatal Error: MFC initialization failed") << endl;
		nRetCode = 1;
		return nRetCode;
	}

	if (argc < 2)
	{
			sprintf ( _Message,"Main() Thread ID:%d;Need the Host or IP Address of MS SQL Server",GetCurrentThreadId());
			printf( "%s\n",_Message);
			WriteLog( _Message, "");
			nRetCode = 1;
			return nRetCode;
	}
    void F1();

	m_gConnect.Format("Driver={SQL Server};Server=%s;Database=docugate;Uid=RTT;Pwd=Qwerty#1;Application=DGC_MCR",argv[1]);

	CMyDatabase      m_hMyDatabase;
	CDatabase        m_hDatabase;
	m_hMyDatabase.ReadIni();

	if (argc == 3)
	{
		m_hMyDatabase.m_LocationFilter.Format("%s",argv[2]);
		sprintf(m_gLogFileName,"DGC_MCR_%s.log",argv[2]);
	
	} else {
	
		sprintf(m_gLogFileName,"DGC_MCR.log");
	}

		
		///////////////////////////////////////////////////////
        // do we actually have a good database connect string//
		///////////////////////////////////////////////////////
		if ( m_hMyDatabase.OpenConnection ( m_hDatabase) != 1 )
		{
			sprintf ( _Message,"Main() Thread ID:%d; Failed to establish a database connection to (%s)",GetCurrentThreadId(),argv[1]);
			printf( "%s\n",_Message);
			WriteLog( _Message, "");
			return nRetCode;
		}

		
		sprintf(_Message,"Main() Thread ID:%d;Database Open Success",GetCurrentThreadId());
		WriteLog( _Message, "");
			
		m_hMyDatabase.UpdateSchema(m_hDatabase);
		sprintf(_Message,"Main() Thread ID:%d;Database Schema Updated",GetCurrentThreadId());
		WriteLog( _Message, "");
	
    	m_hMyDatabase.Handle_ServiceUp          (m_hDatabase );
		m_hMyDatabase.RemoveAllActiveSessions   (m_hDatabase );
		m_hMyDatabase.GetUnitOrCurrency		    (m_hDatabase );
						
			
		///////////////////////////////////////////////////////
		// InitMCRStations and start the initial worker thread/
		// for each MCR Station                               /
		///////////////////////////////////////////////////////
		for ( a = 0; a < 255; a++ )
		{
			strncpy(Stations[a].UnitValue,        m_hMyDatabase.m_UnitValue, 10);
			Stations[a].UnitValueEnabled   = atoi(m_hMyDatabase.m_UnitValueEnabled);
			Stations[a].UnitActive		   = 0;
			Stations[a].UnitConnected	   = 0;
		}
	
			
		int StationCount = 0;
		StationCount     = m_hMyDatabase.ReadStationsFromTable     (m_hDatabase);

		////////////////////////////////////////////////
		// Get the CustomPL for each active unit
		/////////////////////////////////////////////////
		for ( a = 0; a < 255; a++ )
		{
				if (  Stations[a].UnitActive == 1)
					  m_hMyDatabase.GetStationCustomPL(Stations[a],m_hDatabase,0);
		}


		sprintf(_Message,"Main() Thread ID:%d;Service Startup - Detected[%d] Stations",GetCurrentThreadId(),StationCount);
		WriteLog( _Message, "");
	
		m_hMyDatabase.CloseConnection           (m_hDatabase );
		sprintf(_Message,"Main() Thread ID:%d;Database Closed",GetCurrentThreadId());
		WriteLog( _Message, "");
					
		////////////////////////////////////////////////
		// start the worker threads for each control unit
		/////////////////////////////////////////////////
		for ( a = 0; a < 255; a++ )
		{
				if ( (Stations[a].UnitActive == 1) & (Stations[a].UnitConnected == 0) )
				{
					int *pParam = new int;
					*pParam = a;
					sprintf(_Message,"Thread ID:%d; Thread started for:[%s] at Array Index[%d]",GetCurrentThreadId(),Stations[a].UnitAddress, a);
					WriteLog( _Message, "");
					AfxBeginThread ( WorkerThread,  (void *)pParam);
				}
		}

		WaitForSingleObject(hGlobalThreadWait,        1000);

		///////////////////////////////////////////////////////
		// Start the Monitor Active Connection Thread
		// this Threads monitors dead connections and restarts
		///////////////////////////////////////////////////////
		sprintf (_Message,  "Main() Thread ID:%d; Active connections monitor thread starting",GetCurrentThreadId());
		WriteLog( _Message, "");
		AfxBeginThread     (NetCashActivationThread,  NULL);

		
	    // now wait until we are terminated
	    //////////////////////////////////
	    WaitForSingleObject(hGlobalThreadWait, INFINITE);
		return nRetCode;
}

