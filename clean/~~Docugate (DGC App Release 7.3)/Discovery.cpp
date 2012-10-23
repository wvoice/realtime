//////////////////////////////////////////////////////////////////////
//                                                                  //
//  Copyright(C) Network Printing Solutions,INC - Tampa,Florida     //
//  All Rights Reserved                                             //
//  no unauthorized distribution or reuse permitted                 //
//  with the consent of Network Printing Solutions,INC.             //
//  www.printstudy.com - sales@printstudy.com                       //
//  this Copyright message must not be removed from this file       //
//                                                                  //
//////////////////////////////////////////////////////////////////////



#include "stdafx.h"
#include <winbase.h>




UINT NetCashActivationThread( VOID *pParam )	
{	

	char _Message[255] = {0};
//	CServiceApp *pApp = (CServiceApp *)AfxGetApp();
	
	while( WaitForSingleObject(hGlobalThreadWait,5000) != WAIT_OBJECT_0 )
	{

		for ( int a = 0; a < 255; a++ )
		{
			if ( (Stations[a].UnitActive == 1) & (Stations[a].UnitConnected == 0) )
			{
				int *pParam = new int;
				*pParam = a;
				sprintf(_Message,"DG Control(1027) Monitor Thread - A new thread has been started for:[%s] at Array Index[%d]",Stations[a].UnitAddress, a);
//				pApp->AddToMessageLog( _Message, EVENTLOG_INFORMATION_TYPE);
				AfxBeginThread( WorkerThread, (void *)pParam);
			}

		}
	
	}


	return 0;
}


   





