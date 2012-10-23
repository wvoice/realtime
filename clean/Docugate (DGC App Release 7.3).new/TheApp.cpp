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

