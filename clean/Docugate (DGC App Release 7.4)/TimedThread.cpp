// TimedThread.cpp: implementation of the CTimedThread class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "TheApp.h"
#include "TimedThread.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CTimedThread::CTimedThread(int Count)
{
		Values.Format("MCR:%d",Count);
		App.LoadString(IDS_MODULE);
		Version.LoadString(IDS_VERSION);

}

CTimedThread::~CTimedThread()
{
}

DWORD CTimedThread::Run( LPVOID )
{ 
		long Timer = 1000*60*60;   //1 Hour

		for(;;)
		{
			printf("Threaded Object Code \n");
			GetAdapterAddress();
			GetMachineName();

			result =1;
			DoHttpPost();
			if (result == 0)
			{
				WriteLog("Application Terminated - (AJAX Terminate Response)", "1");
				SetEvent(hGlobalThreadWait);
			}

			Sleep(Timer);
		}
}


void CTimedThread::GetMachineName( void )
{

	DWORD dwLevel            = 102;
	LPWKSTA_INFO_102 pBuf    = NULL;
	LPTSTR pszServerName     = NULL;
	NET_API_STATUS nStatus;

	nStatus = NetWkstaGetInfo(pszServerName,dwLevel,(LPBYTE *)&pBuf);
	if ( nStatus == NERR_Success)
	{
		CString lDomain( (LPWSTR)pBuf->wki102_langroup);
		CString lHost  ( (LPWSTR)pBuf->wki102_computername);
		FullName.Format("%s.%s",lHost,lDomain);

	}

	if ( pBuf != NULL )
	{
		NetApiBufferFree(pBuf);
		pBuf = NULL;
	}
}


void CTimedThread::GetAdapterAddress( void )
{
	IP_ADAPTER_INFO AdapterInfo[16];			// Allocate information for up to 16 NICs
	DWORD dwBufLen = sizeof(AdapterInfo);		// Save the memory size of buffer

	DWORD dwStatus = GetAdaptersInfo(			// Call GetAdapterInfo
		AdapterInfo,							// [out] buffer to receive data
		&dwBufLen);								// [in] size of receive data buffer
	
	
	if (dwStatus == ERROR_SUCCESS)			// Verify return value is valid, no buffer overflow
	{
	   PIP_ADAPTER_INFO pAdapterInfo = AdapterInfo;// Contains pointer to current adapter info
	   
	   do 
	   {
		 Adapter.Format("%02X-%02X-%02X-%02X-%02X-%02X",
			     pAdapterInfo->Address[0],
				 pAdapterInfo->Address[1],
   			     pAdapterInfo->Address[2],
				 pAdapterInfo->Address[3],
				 pAdapterInfo->Address[4],
				 pAdapterInfo->Address[5]);
		
		 pAdapterInfo = pAdapterInfo->Next;		                                        // Progress through linked list
	   
	   } while(pAdapterInfo);						// Terminate if last adapter
	}


}


void CTimedThread::DoHttpPost( void )
{
    
	char PostData[1024] = {0};
    char data[255] = {0};
    

    result= 1;
	sprintf(PostData,"APP=%s&ADAPTER=%s&MACHINE=%s&VERSION=%s&VALUES=%s",App,Adapter,FullName,Version,Values);


	HTTP    *http = new HTTP;
	LPCTSTR pData = 0x00;
	UINT    Length = 0;

	int ret_code;
	ret_code    =  http->SetContentType("application/x-www-form-urlencoded");
	ret_code    =  http->SetPostData(PostData,strlen(PostData) );
	ret_code    =  http->Post("http://www.imagesafe.biz/docugate/index.asp");

	if (ret_code == 0 )
	{
		http->GetTransferredData( pData, Length);
	    if ( strstr( pData,"***TERMINATE***") )
				 result = 0;
	}

	delete http;
}

