//////////////////////////////////////////////////////////////////////
//                                                                  //
//  Copyright(C) Network Printing Solutions,INC	2007-2010			//
//  All Rights Reserved                                             //
//  no unauthorized distribution or reuse permitted                 //
//  without the consent of Network Printing Solutions,INC.          //
//  this Copyright message must not be removed from this file       //
//                                                                  //
//  source code is provided "AS-IS" with all errors and faults		//
//  no warranty of any king is made for any suitablblity
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include <winbase.h>
#include "ipworks.h"
#include "netcash_lib.h"


#define NAT_STATE_INIT					1	// 1
#define NAT_STATE_SETUP					2	// 1
#define NAT_STATE_LOCATION				3	// 1
#define NAT_STATE_GATEWAY				4	// 1
#define NAT_STATE_MASK					5	// 1
#define NAT_STATE_CONNECTED				6	// 1
#define NAT_STATE_NOT_CONNECTED			7	// 0
#define NAT_STATE_SESSION_ACTIVE		8	// 4
#define NAT_STATE_SESSION_CLOSED		9	// 8
#define NAT_STATE_ERROR					10	// 8
#define NAT_STATE_AUTHENTICATE			11	// 8
#define NAT_STATE_IDLE				    13	// 8
#define NAT_STATE_OFFLINE			    14	// 8
#define NAT_STATE_PROCESSING_OFFLINE	15	// 8
#define NAT_STATE_CONNECTED2			16	// 1

#define NAT_STATE_GETACCOUNT			17	// Peter Drysdale - added this line
#define NAT_STATE_GETPASSWORD			18	// Peter Drysdale -----------------
#define NAT_STATE_GETCLIENT				19	// Lynette Austin - added this line
#define NAT_STATE_GETMATTER				20	// Peter Drysdale - added this line

extern HANDLE hGlobalThreadWait;
void HandleCharge( _NetcashDevice &);
int  HandleIdler ( CTime &IdleStart, long IdleResetMinutes, long Thread);

union 
{ 
     unsigned long l; 
     unsigned char c[ 4 ]; 
} u;


class CHandler : public IPPort {


	public:
		CHandler (int mIndex);
		~CHandler();
//		CServiceApp *pApp;
		DWORD      m_Thread;
		CTime      m_ThreadCurrent;
		CTime      m_ThreadLastActivity;
		CTimeSpan  m_ThreadTimeSpan;
    		
		CTime      m_LastPong;
	    
		long       m_IdleReset;
		int        m_ArrayIndex;

		NetcashDevice  Station;
		_NetcashPacket packet;
		int		mData;	
		int     Pinged;
		
		bool m_GetAccountSent;
	    bool m_GetClientSent;
		bool m_GetMatterSent;
		bool m_GetPasswordSent;

		USHORT  Length;
		BYTE    pBuf[512];
		LPBYTE  pData;
		int x;
		LPSTR pTester;

		int  OffLineCount;
		int  OffLineCountRcv;
		int  OffLineDataProcessed;
		int  DataReceived;
		char Message[255];
		char DebugMessage[255];

	 	CMyDatabase      m_hMyDatabase;
		CDatabase        m_Database;
		int dbms;
		int IgnoreDisconnect;

		void InitIdleMinutes( long IdleReset)
		{
			m_ThreadCurrent      = CTime::GetCurrentTime();
			m_ThreadLastActivity = CTime::GetCurrentTime();
		    m_IdleReset          = IdleReset;
		}

		int GetIdleMinutes( void )
		{
			long IdleTime;
			m_ThreadCurrent      = CTime::GetCurrentTime();
			m_ThreadTimeSpan     = m_ThreadCurrent - m_ThreadLastActivity;

			IdleTime = m_ThreadTimeSpan.GetTotalMinutes();
			if ( IdleTime >= m_IdleReset)
				return 1;
			else
			    return 0;
		}

		
		long GetDeadConnSpan( void )
		{
			CTimeSpan  Span;
			CTime      TimeNow  = CTime::GetCurrentTime();
			Span                = TimeNow - m_LastPong;
			return ( Span.GetSeconds() );
		}


		
		virtual INT FireDataIn(LPSTR &lpText, USHORT FAR &lenText, BOOL &bEOL )
		{
			    
				m_ThreadLastActivity = CTime::GetCurrentTime();
				
			    Length = lenText;
				ZeroMemory   ( (LPVOID)&pBuf[0], 512);
				memcpy       ( (LPVOID)&pBuf[0], (LPVOID)lpText, Length);
				pData  = &pBuf[0];
		        DataReceived = 1;
               	int Required = 1;   // for now all entries are required
					

				while (Length)
				{

					ZeroMemory   ( (LPVOID )&packet, sizeof( _NetcashPacket) );
					x = Buffer2Packet( Length, pData, &packet);
					if ( x > 0)
					{
						Length -= x;
						pData  = &pBuf[x];

						switch(packet.fc)
						{
						
							case 0xE0: 
								       OffLineCountRcv = 0;
									   printf("OffLine Count Rcved, %d Transactions\n",packet.data16[0]);
									   OffLineCount    = (unsigned int)packet.data16[0];
								       OffLineCountRcv = 1;
									   break;
						
							case 0xE1: 
								   	
										OffLineDataProcessed = 0;
								 	
										if ( packet.df != NAT_DF_NONE)  // is a valid Trans Action
										{
											int pLine1  = packet.dataX[7];
											int pLine2  = packet.dataX[8];
											
											Station.OfflineCount = pLine1;
											lstrcpy(Station.CopyAccount, (LPSTR)packet.dataS);

																														
											if ( Station.UseColor)
												 Station.OfflineCost  = (float)pLine1 * Station.ColorCost;
											else
											     Station.OfflineCost  = (float)pLine1 * Station.ColorCost;
																						
											
												 m_hMyDatabase.GetOfflineAccountID ( Station, m_Database, dbms);
												 if ( Station.AccountID == -1 )
												 {
													 	lstrcpy(Station.Account,Station.CopyAccount);
														lstrcpy(Station.AccountDomain,"UNKNOWN");
														lstrcpy(Station.Group,"UNKNOWN");
														Station.Charging = MONEY_DEBIT;
												 }	
												 else
												 {
													  m_hMyDatabase.GetAccount          ( Station, m_Database, dbms );
												      m_hMyDatabase.GetGroup            ( Station, m_Database, dbms );
												  	  HandleCharge                      ( Station );
													  m_hMyDatabase.UpdateOfflineAccount( Station, m_Database, dbms );
												 }
												 
												 Station.CurSessionCount = Station.OfflineCount;
								   				 Station.CurSessionCost  = Station.OfflineCost;
												 lstrcpy(Station.Document,"COPYJOB");

												 m_hMyDatabase.UpdateOfflineCopier  ( Station, m_Database, dbms );
												 m_hMyDatabase.LogCopyJob           ( Station, m_Database, dbms );
										}
									    
										OffLineDataProcessed = 1;
									    
										break;
						
							case 0x91: m_LastPong  = CTime::GetCurrentTime(); break;
														 
							case 0xB1: printf("Display At ack received for Row %d,Col %d\n",packet.data8[0],packet.data8[1]); break;

							case 0xE5: printf("Offline mode Ack received\n",lenText); break;
						
							case 0xE4: printf("Offline Max Ack received\n",lenText); break;
						
							case 0x90: printf("Mac received\n",lenText); break;
							
							case 0xAA: printf("Delay Ack received\n",lenText); break;

							case 0x94: printf("Clock Set Ack\n",lenText); break;
					
							case 0x26:

								 printf("MCR Session Terminated clean - %d\n",packet.data8[0]);
							     sprintf(DebugMessage,"Thread ID:%d;DG Control (%s): MCR Session Terminated 0x26",m_Thread, strVersion);
								 WriteLog(DebugMessage,Stations[m_ArrayIndex].Debug);
								 Station.State = NAT_STATE_SESSION_CLOSED;
								 break;
							
							case 0xA6:

							 	 printf("HOST Session Terminated clean - %d\n",packet.data8[0]);
							     sprintf(DebugMessage,"Thread ID:%d;DG Control (%s): MCR Session Terminated 0xA6",m_Thread, strVersion);
								 WriteLog(DebugMessage,Stations[m_ArrayIndex].Debug);
								 Station.State = NAT_STATE_SESSION_CLOSED;
								 break;

						    case 0x27:
								 
								 _NetcashPacket Pulse_Packet;
								 BYTE           Pulse_Buffer[512];
								 long           Pulse_Size;
								 long           Pulses;
								 float          PulseCost;
								 char           Message[51];
								 long           plused;
								// char           Status[1024]; 
							

								 Pulses     = 1; //(long)packet.data16[0];
								 plused     = (long)packet.data8[0];
								 Station.plCounter[plused] += 1;
								 
								 
								 PulseCost  = Pulses * Station.pl[plused];
						 		 Station.CurSessionCost    = Station.CurSessionCost  + PulseCost;
 								 Station.CurSessionCount   = Station.CurSessionCount + Pulses;
						

							//	 if ( Station.UseColor )
							//		 PulseCost  = Pulses * Station.ColorCost; 
							//	 else
							//	 	 PulseCost  = Pulses * Station.MonoCost; 
				
	
								 switch( Station.Charging)
								 {
									case MONEY_DEBIT   : Station.CurSessionBalance   = Station.StartSessionBalance - Station.CurSessionCost;    break;
									case MONEY_NOCHARGE: Station.CurSessionBalance   = Station.StartSessionBalance;break;
									case MONEY_CREDIT  : Station.CurSessionBalance   = Station.StartSessionBalance + Station.CurSessionCost;    break;
								 }
							
								
								 ZeroMemory((LPVOID)&Pulse_Packet, sizeof( _NetcashPacket) );
								 ZeroMemory((LPVOID)&Pulse_Buffer, 512);
								 Pulse_Packet.fc = NAT_A_DISP_AT;
								 Pulse_Packet.data8[0] = 3;
								 Pulse_Packet.data8[1] = 2;
								 
								// ver 7.0 units or currency
								 if ( Station.UnitValueEnabled == 1 )
								 {
									int    balanceunits = 0;
									float  unitvalue    = atof(Station.UnitValue);
									balanceunits        = (int)(Station.CurSessionBalance/unitvalue);
									sprintf(Message,"Balance: %d Units",balanceunits);
	
								 } else {
	
									 sprintf(Message,"Balance: $%.2f",Station.CurSessionBalance);
								 }

								 Pulse_Packet.lenS = strlen(Message);
								 Pulse_Packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
								 lstrcpy((char *)Pulse_Packet.dataS, Message);
								 Pulse_Size          = Packet2Buffer(&Pulse_Packet, (BYTE *)&Pulse_Buffer[0]);
								 Send( (LPSTR)&Pulse_Buffer[0],Pulse_Size);


								 ZeroMemory((LPVOID)&Pulse_Packet, sizeof( _NetcashPacket) );
								 ZeroMemory((LPVOID)&Pulse_Buffer, 512);
								 Pulse_Packet.fc       = NAT_A_DISP_AT;
								 Pulse_Packet.data8[0] = 4;
								 Pulse_Packet.data8[1] = 2;
							 	 
								
								 // ver 7.0 display in units or currency
								 if ( Station.UnitValueEnabled == 1 )
								 {
									int    balanceunits = 0;
									float  unitvalue    = atof(Station.UnitValue);
									balanceunits        = (int)(Station.CurSessionCost/unitvalue);
									sprintf(Message,"Session: %d Units",balanceunits);
	
								 } else {
	
									sprintf(Message,"Session: $%.2f",Station.CurSessionCost);
								 }
								 								 
								 
								 Pulse_Packet.lenS = strlen(Message);
								 Pulse_Packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
								 lstrcpy((char *)Pulse_Packet.dataS, Message);
								 Pulse_Size          = Packet2Buffer(&Pulse_Packet, (BYTE *)&Pulse_Buffer[0]);
								 Send( (LPSTR)&Pulse_Buffer[0],Pulse_Size);
								 
								 m_hMyDatabase.UpdateAccount ( Station, m_Database, dbms);
								 m_hMyDatabase.UpdateCopier  ( Station, m_Database, dbms);

								 break;

							case 0xB7:
								 printf("Currency Ack received\n");
								 break;

							case 0xC5: //address
								 printf("Address received\n",lenText);
								 sprintf(Station.Mask,"%d.%d.%d.%d", packet.dataX[0],packet.dataX[1],packet.dataX[2],packet.dataX[3]);
							     break;
	
							case 0xC6: //mask
								 printf("Mask received\n",lenText);
								 sprintf(Station.Mask,"%d.%d.%d.%d", packet.dataX[0],packet.dataX[1],packet.dataX[2],packet.dataX[3]);
								 break;

							case 0xC7: //gateway
								 printf("Gateway received\n",lenText);
								 sprintf(Station.Gateway,"%d.%d.%d.%d", packet.dataX[0],packet.dataX[1],packet.dataX[2],packet.dataX[3]);
								 break;

							case 0xCA: //Location
								 
								 printf("Location received\n",  lenText);
								 sprintf(Station.Location,"%s", packet.dataS );
								 printf("Station Location = %s\n",packet.dataS);
							     m_hMyDatabase.Handle_NewConnection( Station, m_Database, dbms );
				 	 			 Station.Error = 0;
								 break;

						    case 0x35: // Data
						
								if ( strstr((char *)packet.dataS,"DOWN") )
									 break;

								if ( strstr((char *)packet.dataS,"UP") )
									break;
								
								if ( strstr((char *)packet.dataS,"CLEAR") )
									break;
					                      
						
								
								switch ( Station.State )
								{
										case  NAT_STATE_GETACCOUNT:
									
											Required = 1;
											 
						
											if ( ( Required == 1) & ( strlen( (char *)packet.dataS) == 0) )
											{
												Station.Error  = 0;
												m_GetAccountSent = 0;
											}
											else
											{
												sprintf(Station.CopyAccount,"%s", packet.dataS );
 										  	    sprintf(DebugMessage,"Thread ID:%d;DG Control (%s): Account = %s",m_Thread, strVersion,packet.dataS);
								 		        WriteLog(DebugMessage,Stations[m_ArrayIndex].Debug);
																				
												//Station.State = NAT_STATE_GETPASSWORD;
												//goto to password/pin request
												
												if ( atoi(Stations[m_ArrayIndex].ReqPin) == 1)
										   		   Station.State = NAT_STATE_GETPASSWORD;
												else if ( atoi(Stations[m_ArrayIndex].ReqCopyClient) == 1)
										   		   Station.State = NAT_STATE_GETCLIENT;
									            else
												   Station.State = NAT_STATE_AUTHENTICATE;
											}

											break;
											
										case  NAT_STATE_GETPASSWORD:
											
											Required = 1; 
											// modified so that a Pin is always required
											// no empty pin required

											if ( ( Required == 1) & ( strlen( (char *)packet.dataS) == 0) )
											{
												Station.Error  = 0;
												m_GetPasswordSent = 0;
											}
											else
											{
												sprintf(Station.CopyPassword,"%s", packet.dataS );
												sprintf(DebugMessage,"Thread ID:%d;DG Control (%s): Password = %s\n",m_Thread,strVersion, packet.dataS);
						   					    WriteLog(DebugMessage,Stations[m_ArrayIndex].Debug);
						
												if ( atoi(Stations[m_ArrayIndex].ReqCopyClient) == 1)
										   		   Station.State = NAT_STATE_GETCLIENT;
									            else
												   Station.State = NAT_STATE_AUTHENTICATE;
									
												
									//			Station.State = NAT_STATE_GETCLIENT;
											}
									
											break;

								
										case  NAT_STATE_GETCLIENT:
										
											Required = 0;
											if ( ( Required == 1) & ( strlen( (char *)packet.dataS) == 0) )
											{
												Station.Error  = 0;
												m_GetClientSent = 0;
											}
											else
											{
												sprintf(Station.CopyClient,"%s", packet.dataS );
											  	sprintf(DebugMessage,"Thread ID:%d;DG Control (%s): Client = %s\n",m_Thread,strVersion,packet.dataS);
												WriteLog(DebugMessage,Stations[m_ArrayIndex].Debug);										
											}

											if ( atoi(Stations[m_ArrayIndex].ReqCopyMatter) == 1)
												 Station.State = NAT_STATE_GETMATTER;
									        else
												 Station.State = NAT_STATE_AUTHENTICATE;

											break;

										case  NAT_STATE_GETMATTER:
											
											Required = 0;
											if ( ( Required == 1) & ( strlen( (char *)packet.dataS) == 0) )
											{
											  Station.Error  = 0;
											  m_GetMatterSent = 0;
											}
											else
											{
												sprintf(Station.CopyMatter,"%s", packet.dataS );
											  	sprintf(DebugMessage,"Thread ID:%d;DG Control (%s): Matter = %s\n",m_Thread,strVersion,packet.dataS);
												WriteLog(DebugMessage,Stations[m_ArrayIndex].Debug);										
												Station.State = NAT_STATE_AUTHENTICATE;
											}
											
											break;
								   
								} //end Switch
									
							    
								break;

				
							default:
									break;	
						} // end switch
				
					} // end if valid packet
					else
					{
						break;
					}
				
				} // end while data
	

			return 0;
		}	


		virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription )
		{


 		    m_ActiveAccounts.RemoveActiveAccount(Station.AccountGUID);
		    m_hMyDatabase.DeleteActiveSession   (Station.AccountGUID,m_Database);
			
			sprintf (Message, "Connection was Terminated - Active account was (%s)",Station.AccountGUID);
			WriteLog(Message,Stations[m_ArrayIndex].Debug);
            printf("%s\n",Message);


			if ( IgnoreDisconnect == 0)
			{
				sprintf(Message,"Thread ID:%d;DG Control (%s): Abnormal Disconnect(%s)",m_Thread, strVersion,lpszDescription);
				WriteLog(Message,Stations[m_ArrayIndex].Debug);
				Station.State = NAT_STATE_NOT_CONNECTED;
				Station.Error = 0;
			}
			return 0;
		}


		virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription )
		{
	
			sprintf(Message,"Thread ID:%d;DG Control (%s): Abnormal Error(%s)",m_Thread,strVersion, lpszDescription);
// 		    pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
			WriteLog(Message,Stations[m_ArrayIndex].Debug);
			Station.State = NAT_STATE_NOT_CONNECTED;
			Station.Error = NAT_STATE_ERROR;
			return 0;
		}
	
};


CHandler::CHandler( int mIndex )
{
	
    m_GetAccountSent  = 0;
    m_GetClientSent   = 0;
    m_GetMatterSent   = 0;
	m_GetPasswordSent  = 0;


	m_ArrayIndex = mIndex;
	IgnoreDisconnect = 0;

//	pApp = (CServiceApp *)AfxGetApp();
	
    m_hMyDatabase.ReadIni();
	
	dbms = m_hMyDatabase.OpenConnection( m_Database, NULL);
	if ( dbms == -1)
	{
		char Message[255] = {0};
		printf("No Database Connection @ %s\n",m_ThreadCurrent.Format("%c") );
		sprintf(Message,"DG Control (%s): No Database Connection Available",strVersion);
// 	    pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
 	}
}


CHandler::~CHandler()
{
	CTime t = CTime::GetCurrentTime();
 	int status;
	char Message[255] = {0};
	
	if (GetConnected() == 1)
	{
		
		IgnoreDisconnect = 1;

		printf("Thread Disconnecting @ %s\n",  t.Format("%c") );
		sprintf(Message,"Thread ID:%d;TCPIP Connection Disconnection started @ %s", m_Thread, t.Format("%c") );
		WriteLog(Message,Stations[m_ArrayIndex].Debug);
		
		SetTimeout(4);
		status = SetConnected(0);
		
		printf("Thread Disconnected @ %s - Result(%d)\n", t.Format("%c"), status );
		sprintf(Message,"Thread ID:%d;TCPIP Connection Disconnected @ %s - Result(%d)", m_Thread,t.Format("%c"), status );
		WriteLog(Message,Stations[m_ArrayIndex].Debug);
	}

	printf("Thread Terminated @ %s\n",  t.Format("%c") );
	sprintf(Message,"Thread ID:%d;Thread Terminated @ %s", m_Thread, t.Format("%c") );
	WriteLog(Message,Stations[m_ArrayIndex].Debug);
	
	m_hMyDatabase.CloseConnection( m_Database, NULL);
	Stations[m_ArrayIndex].UnitConnected = 0;
}


void SetupGetAccount    ( CHandler &Handler );
void SetupGetClient		( CHandler &Handler );
void SetupGetMatter     ( CHandler &Handler );
void SetupGetPassword   ( CHandler &Handler );


void StartCopierSession ( CHandler &Handler );
void EndCopierSession   ( CHandler &Handler );
int  RequestLocation	( CHandler &Handler );
int  RequestGateway 	( CHandler &Handler );
int  RequestMask		( CHandler &Handler );
int  RequestAddress 	( CHandler &Handler );
int  RequestMac		 	( CHandler &Handler );
void PingNat            ( CHandler &Handler );
void SetOffline         ( CHandler &Handler );
int  Reset              ( CHandler &Handler );
int  SetKeyBoard        ( CHandler &Handler, int Mode);
int  SetDelay           ( CHandler &Handler);
int  SetTime            ( CHandler &Handler);
int  SetInitial			( CHandler &Handler);
int  SetAuthenticate1   ( CHandler &Handler);
int  SetAuthenticate2   ( CHandler &Handler);
void SetDatabaseDown    ( CHandler &Handler);
void SetDatabaseError   ( CHandler &Handler, LPSTR pCode);
void ProcessingOffLine  ( CHandler &Handler );
int  SetCurrency        ( CHandler &Handler );
int  SetBadData			( CHandler &Handler );
void SetBalance         ( CHandler &Handler, USHORT Balance );
void SetHighBalance     ( CHandler &Handler, ULONG  Balance );
int  SetPriceLine		( CHandler &Handler );
void ShowError			( CHandler &Handler,LPSTR pError );



UINT WorkerThread(VOID *pParams)
{	
	
	int Index = *(int *)pParams;
	delete pParams;
	pParams = NULL;
	int ConnectStatus;
   

	CString   str;
	char Message[255]     = {0};
	long IdleResetMinutes = atoi(Stations[Index].IdleReset);
//	USHORT  MyBalance;
	ULONG   MaxCopyBalance  =0;
    float ftemp = 0.00f;
	char buf[100]; 
		

	DWORD Thread = 0;
//	CServiceApp *pApp = 0;
   
//	pApp = (CServiceApp *)AfxGetApp();
	Stations[Index].UnitConnected = 1;

	
	Thread = GetCurrentThreadId();
	
	CTime     LastPong      = CTime::GetCurrentTime();
	CTime     PongCurrent   = CTime::GetCurrentTime();
	CTimeSpan PongSpan;
	long      PongLapse;
	CTime	  t;

	CTime     IdleStart     = CTime::GetCurrentTime();
	CTime     IdleNow       = CTime::GetCurrentTime();
	CTimeSpan IdleSpan;

	
	sprintf(Message,"Thread ID:%d;Station Address:%s - Thread Started",Thread, Stations[Index].UnitAddress);
	WriteLog(Message,Stations[Index].Debug);


	CHandler Handler(Index);
	Handler.m_Thread = GetCurrentThreadId();
	Handler.IgnoreDisconnect = 0;
	
	if ( Handler.dbms == -1 )
	{
		sprintf (Message, "Thread ID:%d;Database Connection failed",Thread );
		WriteLog(Message,Stations[Index].Debug);
		goto exit;
	}

	sprintf (Message, "Thread ID:%d;Database Connection success",Thread );
	WriteLog(Message,Stations[Index].Debug);


    ZeroMemory ( (LPVOID)&Handler.Station, sizeof(NetcashDevice) );
	sprintf(Handler.Station.Activity, "");
	sprintf(Handler.Station.ThreadID, "%d", Thread);
	sprintf(Handler.Station.Address,  "%s", Stations[Index].UnitAddress);
	sprintf(Handler.Station.CustomPL, "%s", Stations[Index].CustomPL);

	
	Handler.Station.State = NAT_STATE_INIT;

	Handler.Station.StartSessionCost      = 0.00;
	Handler.Station.StartSessionBalance   = 0.00;
	Handler.Station.CurSessionBalance     = 0.00;
	Handler.Station.CurSessionCost        = 0.00;
	Handler.Station.InitBalance           = 0.00;
	Handler.Station.InitCount             = 0;
	Handler.Station.CurSessionCount       = 0;
	Handler.Station.StationID             = -1;
	Handler.Station.DeviceID              = -1;
	Handler.Station.AccountID             = -1;
	Handler.Station.Charging              = MONEY_DEBIT;

	Handler.mData                         = 0;
	Handler.OffLineCount           = 0;
	Handler.OffLineCountRcv        = 0;
	Handler.OffLineDataProcessed   = 0;
	Handler.Station.OffLineMax     = 1000; // units
	Handler.Station.Currency       = '$'; // units
	Handler.Station.Decimal        = 2;   // units
	Handler.Station.RequirePin=    atoi(Stations[Index].ReqPin);

	//ver 7.0 added 3/2/2010
	Handler.Station.UnitValueEnabled =  Stations[Index].UnitValueEnabled;
	sprintf(Handler.Station.UnitValue, "%s",Stations[Index].UnitValue);
	sprintf(Handler.Station.UnitGUID,  "%s",Stations[Index].UnitGUID);
	Handler.Station.plCounter[1] = 0;
	Handler.Station.plCounter[2] = 0;
	Handler.Station.plCounter[3] = 0;
	Handler.Station.plCounter[4] = 0;
	Handler.Station.maxspend        = (ULONG)(5 * 100); // 5 us * 100 = 500 cents
	Handler.Station.maxspendenabled = 1;

	
	//ver 7.0 added 3/2/2010
	Handler.Station.pl1CustomCost = 0.00f;
	Handler.Station.pl2CustomCost = 0.00f;
	Handler.Station.pl3CustomCost = 0.00f;
	Handler.Station.pl4CustomCost = 0.00f;
	Handler.Station.plCustomCostEnabled = 0;

	Handler.Station.plCustomCostEnabled = Stations[Index].plCustomCostEnabled;
	Handler.Station.pl1CustomCost = Stations[Index].pl1CustomCost;
	Handler.Station.pl2CustomCost = Stations[Index].pl2CustomCost;
	Handler.Station.pl3CustomCost = Stations[Index].pl3CustomCost;
	Handler.Station.pl4CustomCost = Stations[Index].pl4CustomCost;


	Handler.SetTimeout(4);
	Handler.SetRemoteHost( Stations[Index].UnitAddress);
	Handler.SetRemotePort( atoi(Stations[Index].UnitPort) );
	ConnectStatus = Handler.SetConnected(1);
	
	if ( Handler.GetConnected() == 0 )
	{
		sprintf (Message, "Thread ID:%d;TCP/IP Connection Failed(%d)",Thread, ConnectStatus );
		WriteLog(Message,Stations[Index].Debug);

		t = CTime::GetCurrentTime();
		printf("Connection Failed @ %s - (%d)", t.Format("%c"), ConnectStatus);
		goto exit;
	}

	sprintf (Message, "Thread ID:%d;TCP/IP Connection Success",Thread);
	WriteLog(Message,Stations[Index].Debug);

	t = CTime::GetCurrentTime();
	printf("Fire Connected @ %s\n", t.Format("%c"));

	Handler.Station.State = NAT_STATE_CONNECTED;
	Handler.Station.Error = 0;
	Handler.SetTimeout(0);

	
	Handler.m_LastPong  = CTime::GetCurrentTime();
    
	Handler.InitIdleMinutes(IdleResetMinutes);

	while( WaitForSingleObject(hGlobalThreadWait,50) != WAIT_OBJECT_0 )
	{
	
	
		Handler.DoEvents();
			

		////////////////////////
		// Send Pong         //
		///////////////////////
		PongCurrent = CTime::GetCurrentTime();
		PongSpan    = PongCurrent - LastPong;
		PongLapse   = PongSpan.GetSeconds();
		if ( PongLapse >= 1 )
		{
			
			LastPong = PongCurrent;
			PingNat(Handler);
		 //   printf("Pong Sent  @ %s\n", LastPong.Format("%c") );
			sprintf (Message, "Thread ID:%d;Pong Sent",Thread);
			//WriteLog(Message,Stations[m_ArrayIndex].Debug);

		}
		////////////////////////
		// End Send Pong      //
		///////////////////////


		////////////////////////
		// Dead Conn Time Span//
		///////////////////////
		int DeadConnSpan = 0;
		DeadConnSpan     = Handler.GetDeadConnSpan();
		if ( DeadConnSpan >= 5)
		{
			CTime t = CTime::GetCurrentTime();
  	 	    printf("Dead Conn Detected  @ %s\n", t.Format("%c") );
			sprintf (Message, "Thread ID:%d;Dead Connection Detected",Thread);
			WriteLog(Message,Stations[Index].Debug);
		    printf("%s\n",Message);	
	
			// incase we have an active logged on account when the connection
			// is dropped
			// ver 7.0 also remove from the database table
			m_ActiveAccounts.RemoveActiveAccount(Handler.Station.AccountGUID);
			Handler.m_hMyDatabase.DeleteActiveSession(Handler.Station.AccountGUID,Handler.m_Database);


			sprintf (Message, "Dead Connection Detected - Active account was (%s)",Handler.Station.AccountGUID);
			WriteLog(Message,Stations[Index].Debug);
			goto exit;
		}
		////////////////////////
		// Dead Conn Time Span//
		///////////////////////
	


		switch(Handler.Station.State)
		{
		
			        case NAT_STATE_GETACCOUNT:
						 
						 if ( Handler.m_GetAccountSent == 0)
						 {
							 SetupGetAccount ( Handler);
							 Handler.m_GetAccountSent = 1;
						 }
						 else
						 {
						     if ( HandleIdler(IdleStart,IdleResetMinutes,Thread) )
								  goto exit;

						 }
						
						 Handler.Station.Error = 0;
						 break;
			         
					 case NAT_STATE_GETPASSWORD:
						 
						 if ( Handler.m_GetPasswordSent == 0)
						 {
							 SetupGetPassword ( Handler );
							 Handler.m_GetPasswordSent = 1;
						 }
						 else
						 {
						     if ( HandleIdler(IdleStart,IdleResetMinutes,Thread) )
								  goto exit;
				
                		 }
				                       
	            		 Handler.Station.Error = 0;
					 break;

					 case NAT_STATE_GETCLIENT:
						
						 if ( Handler.m_GetClientSent == 0)
						 {
							 SetupGetClient ( Handler);
							 Handler.m_GetClientSent = 1;
						 }
						 else
						 {
						     if ( HandleIdler(IdleStart,IdleResetMinutes,Thread))
								  goto exit;

						 }
                         

						 Handler.Station.Error = 0;
						 break;

					case NAT_STATE_GETMATTER:

						 if ( Handler.m_GetMatterSent == 0)
						 {
							 SetupGetMatter ( Handler);
							 Handler.m_GetMatterSent = 1;
						 }
						 else
						 {
						     if ( HandleIdler(IdleStart,IdleResetMinutes,Thread) )
								  goto exit;

						 }
						 Handler.Station.Error = 0;
						 break;

					case NAT_STATE_INIT:
						 break;
					
					case NAT_STATE_SETUP:
						
						
						 Handler.m_hMyDatabase.Handle_SessionIdle( Handler.Station,Handler.m_Database);
  
						 Handler.InitIdleMinutes(IdleResetMinutes);

						 Handler.Station.PasswordRcved         = false;
						 Handler.Station.StartSessionCost      = 0.00;
						 Handler.Station.StartSessionBalance   = 0.00;
						 Handler.Station.CurSessionBalance     = 0.00;
						 Handler.Station.CurSessionCost        = 0.00;
						 Handler.Station.InitBalance           = 0.00;
						 Handler.Station.InitCount             = 0;
						 Handler.Station.CurSessionCount       = 0;
						 Handler.Station.StationID             = -1;
						 Handler.Station.DeviceID              = -1;
						 Handler.Station.AccountID             = -1;
						 Handler.Station.Charging              = MONEY_DEBIT;
								
						 printf  (Message, "SetKeyboard() @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf (Message, "Thread ID:%d;DG Control (%s): Calling SetKeyBoard()",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);

						 if ( SetKeyBoard ( Handler, 1) == -1)
						 {
						 	 printf("no response to SetKeyBoard() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to SetKeyboard() within 5 seconds, Thread Terminating",Thread,strVersion);
						 	 WriteLog(Message,Stations[Index].Debug);
//						     pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
							 goto exit;
						 }
						
						 Handler.m_GetAccountSent  = 0;
					     Handler.m_GetClientSent   = 0;
						 Handler.m_GetMatterSent   = 0;
						 Handler.m_GetPasswordSent  = 0;
						 lstrcpy(Handler.Station.CopyAccount, "");
						 lstrcpy(Handler.Station.CopyPassword,"");
						 lstrcpy(Handler.Station.CopyClient,  "");
						 lstrcpy(Handler.Station.CopyMatter,  "");
						 lstrcpy(Handler.Station.AccountGUID, "");

						 Handler.Station.State = NAT_STATE_GETACCOUNT;
						 Handler.Station.Error = 0;
						 break;


					case NAT_STATE_CONNECTED:

						Handler.InitIdleMinutes(IdleResetMinutes);

						
						printf ("Calling SetTime() @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetTime()",Thread,strVersion);
						WriteLog(Message,Stations[Index].Debug);
						if ( SetTime ( Handler ) == -1)
						{
							 printf("No response to SetTime() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No Response to SetTime() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
							 goto exit;
						}
												

						printf ("Calling SetInitial() @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetInitial()",Thread,strVersion);
						WriteLog(Message,Stations[Index].Debug);
				  	    if ( SetInitial  ( Handler ) == -1)
						{
							 printf("No response to SetInitial() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to SetInitial() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//						     pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						     goto exit;
						}

						Handler.Station.State = NAT_STATE_CONNECTED2;
						Handler.Station.Error = 0;
				 		break;

						 
					case NAT_STATE_CONNECTED2:

						Handler.InitIdleMinutes(IdleResetMinutes);

	 					 
						printf ("Requesting Location @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						sprintf(Message,"Thread ID:%d;DG Control (%s): Requesting Location",Thread,strVersion);
						WriteLog(Message,Stations[Index].Debug);
						if ( RequestLocation  ( Handler ) == -1)
						{
							 printf("no response to RequestLocation time within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to RequestLocation() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
				  		     goto exit;
						}

						
						printf("Requesting Mac @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
						sprintf(Message,"Thread ID:%d;DG Control (%s): Requesting Mac",Thread,strVersion);
						WriteLog(Message,Stations[Index].Debug);
					    if ( RequestMac       ( Handler ) == -1)
						{
							 printf("no response to requestMac within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to RequestMac() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						 	 goto exit;
						 }

						 printf("Requesting Gateway @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf(Message,"Thread ID:%d;DG Control (%s): Requesting Gateway",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);
						 if ( RequestGateway   ( Handler ) == -1)
						 {
							 printf("no response to RequestGateway within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to RequestGateway() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
							 goto exit;
						 }
						
					     printf("Requesting Mask @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf(Message,"Thread ID:%d;DG Control (%s): Requesting Mask",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);
						 if ( RequestMask      ( Handler ) == -1)
				  		 {
							 printf("no response to RequestMask within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to RequestMask() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						     goto exit;
				 		 }

						 printf("Requesting Address @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf(Message,"Thread ID:%d;DG Control (%s): Requesting Address",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);
						 if ( RequestAddress   ( Handler ) == -1)
				  		 {
							 printf("no response to RequestAddress within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to RequestAddress() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						     goto exit;
						 }
				 	

						 printf("Calling SetCurrency @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetCurrency()",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);
 					     if ( SetCurrency      ( Handler ) == -1)
				  		 {
							 printf("No Response to set SetCurrency() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No Response to SetCurrency() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						     goto exit;
						 }
				 	
						
						 printf("Calling SetDelay() @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetDelay()",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);
						 if ( SetDelay         ( Handler ) == -1)
				  		 {
							 printf("No Response to set SetDelay() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to SetDelay() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						     goto exit;
						 }
				 	
						 printf("Calling SetBadData() @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 						 sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetBadData()",Thread,strVersion);
						 WriteLog(Message,Stations[Index].Debug);
				 	   	 if ( SetBadData       ( Handler ) == -1)
				  		 {
							 printf("No Response to SetBadData() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 							 sprintf(Message,"Thread ID:%d;DG Control (%s): No response to SetBadData() within 5 seconds, Thread Terminating",Thread,strVersion);
						     WriteLog(Message,Stations[Index].Debug);
//							 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
						     goto exit;
						 }
				 	
						 Handler.Station.State = NAT_STATE_PROCESSING_OFFLINE;
						 Handler.Station.Error = 0;
			
							
					case NAT_STATE_PROCESSING_OFFLINE:			
					
						 Handler.Station.State = NAT_STATE_SETUP;
						 Handler.Station.Error = 0;
				 		 break;
				
					case NAT_STATE_IDLE:
						 
						 Handler.m_hMyDatabase.Handle_SessionIdle( Handler.Station,Handler.m_Database);
		 				 IdleNow  = CTime::GetCurrentTime();
					 	 IdleSpan = IdleNow - IdleStart;
					
						 if ( IdleSpan.GetTotalMinutes() >= IdleResetMinutes)
						 {
							CTime t = CTime::GetCurrentTime();
					  	    printf("Idle Connection Detected  @ %s\n", t.Format("%c") );
							sprintf(Message,"Thread ID:%d;DG Control (%s): Idle Connection Detected",Thread,strVersion);
							WriteLog(Message,Stations[Index].Debug);
				 			goto exit;
						 }
						 else
							 break;

					
					case NAT_STATE_NOT_CONNECTED:
						
						 if ( Handler.Station.Error == NAT_STATE_ERROR)
							str.Format("Thread ID=%s,Address=%s,State=Not Connected,Error=%s\n", Handler.Station.ThreadID,Handler.Station.Address,Handler.Station.ErrorDescr);
						 else
						 {
							str.Format("Thread ID=%s,Address=%s,State=Not Connected\n", Handler.Station.ThreadID,Handler.Station.Address);
						  	Handler.m_hMyDatabase.Handle_DroppedConnection( Handler.Station,Handler.m_Database, Handler.dbms);
						 }
				 		 goto exit;

					case NAT_STATE_SESSION_ACTIVE: 
				
						 IdleStart = CTime::GetCurrentTime();
						 break;
			
					case NAT_STATE_OFFLINE:	
						 goto exit;
						 break;
				
					case NAT_STATE_SESSION_CLOSED:	
						
						/////////////////////////////////////
				        // remove this accounts as logged on/
						/////////////////////////////////////
					    m_ActiveAccounts.RemoveActiveAccount             ( Handler.Station.AccountGUID);
						Handler.m_hMyDatabase.DeleteActiveSession        ( Handler.Station.AccountGUID, Handler.m_Database);
						Handler.m_hMyDatabase.Handle_SessionClosed       ( Handler.Station,             Handler.m_Database);
												
						if ( Handler.Station.CurSessionCount > 0 )
						{
							Handler.m_hMyDatabase.GetInsertGuid  ( Handler.Station, Handler.m_Database, Handler.dbms);
							Handler.m_hMyDatabase.LogCopyJob     ( Handler.Station, Handler.m_Database, Handler.dbms);
							Handler.m_hMyDatabase.LogCopyJobPL   ( Handler.Station, Handler.m_Database, Handler.dbms);
							Handler.m_hMyDatabase.LogJournel     ( Handler.Station, Handler.m_Database, Handler.dbms);
						}
	
						IdleStart             = CTime::GetCurrentTime();
						Handler.Station.State = NAT_STATE_SETUP;
						break;

			

					case NAT_STATE_AUTHENTICATE:

								IdleStart = CTime::GetCurrentTime();

								Handler.InitIdleMinutes(IdleResetMinutes);

								sprintf (Message,"Thread ID:%d;DG Control (%s): Authenticating Acccount(%s) on Station(%s)",Thread,strVersion,Handler.Station.CopyAccount,Handler.Station.Location);
								WriteLog(Message,Stations[Index].Debug);
 						
					    		if ( Handler.m_hMyDatabase.CheckHandle(Handler.m_Database, Handler.dbms) == 0 )
								{	
	  								printf("no Database Connection @ %s\n",Handler.m_ThreadCurrent.Format("%c") );
									sprintf(Message,"Thread ID:%d;DG Control (%s): No Database Connection on Authenticate Account()",Thread,strVersion);
// 									pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
 									WriteLog(Message,Stations[Index].Debug);
 									ShowError(Handler,"Error: DG-0010");
									Sleep(750);
									goto exit;
								}
								
					  		
							 							   	
								
								printf("Calling SetAuthenticate1() @ %s\n", Handler.m_ThreadCurrent.Format("%c"));
	 							sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetAuthenticate1()",Thread,strVersion);
								WriteLog(Message,Stations[Index].Debug);
 								if ( SetAuthenticate1 (Handler) == -1)
					  			{
									printf("No Response to set SetAuthenticate1() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 									sprintf(Message,"Thread ID:%d;DG Control (%s): No Response to SetAuthenticate1() within 5 seconds, Thread Terminating",Thread,strVersion);
									WriteLog(Message,Stations[Index].Debug);
//									pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
									goto exit;
								}
  							   
								printf("Calling SetAuthenticate2() @ %s\n", Handler.m_ThreadCurrent.Format("%c"));
	 							sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetAuthenticate2()",Thread,strVersion);
								WriteLog(Message,Stations[Index].Debug);
 								if ( SetAuthenticate2 (Handler) == -1)
					  			{
									printf("No Response to set SetAuthenticate2() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 									sprintf(Message,"Thread ID:%d;DG Control (%s): No Response to SetAuthenticate2() within 5 seconds, Thread Terminating",Thread,strVersion);
									WriteLog(Message,Stations[Index].Debug);
//									pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
									goto exit;
								}

								printf("Calling SetKeyBoard(0) @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
	 							sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetKeyBoard(0)",Thread,strVersion);
								WriteLog(Message,Stations[Index].Debug);
 								if ( SetKeyBoard     (Handler,0) == -1)
					  			{
									printf("No Response to set SetKeyBoard(0) within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 									sprintf(Message,"Thread ID:%d;DG Control (%s): No Response to SetKeyBoard(0) within 5 seconds, Thread Terminating",Thread,strVersion);
									WriteLog(Message,Stations[Index].Debug);
//									pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
									goto exit;
								}
						
							   
							   if( Handler.m_hMyDatabase.GetStation (Handler.Station,Handler.m_Database, Handler.dbms)  == 1)
							   {
									 ShowError(Handler,"Error: DG-0010");
   									 Handler.Station.State = NAT_STATE_SETUP;
									 break;	
							   }


							   Handler.m_hMyDatabase.GetAccountID (Handler.Station,Handler.m_Database, Handler.dbms);	
							   if ( strlen(Handler.Station.AccountGUID) == 0 )
							   {
									   printf("No Account Located for ID %s\n",Handler.Station.CopyAccount);
 									   ShowError(Handler,"Error: DG-0004");
   									   Handler.Station.State = NAT_STATE_SETUP;
									   break;	
							   }
							
                               ////////////////////////////////////////////////
							   // is account already active on another mcr box
							   ////////////////////////////////////////////////
							   if ( m_ActiveAccounts.IsAccountActive(Handler.Station.AccountGUID) == 1)
							   {
									   printf("Account Already Logged On\n");
 									   ShowError(Handler,"Error: DG-0001");
   									   Handler.Station.State = NAT_STATE_SETUP;
									   break;	
							   }

							   ////////////////////////////////////////////////
							   // Does account have an active account anywhere
							   /////////////////////////////////////////////////
							   if ( Handler.m_hMyDatabase.IsActiveSession(Handler.Station.AccountGUID,Handler.m_Database) == 1)
							   {
									   printf("Account Already Logged On\n");
 									   ShowError(Handler,"Error: DG-0001a");
   									   Handler.Station.State = NAT_STATE_SETUP;
									   break;	
							   }

                               ////////////////////////////////////////////////
                               // Does account have an ACL
                               /////////////////////////////////////////////////
                               if ( Handler.m_hMyDatabase.AccountACL(Handler.Station.AccountGUID,Handler.m_Database) == 1)
                               {
                                   printf("Account has an ACL\n");
                                   ShowError(Handler,"Error: DG-0001b");
                                   Handler.Station.State = NAT_STATE_SETUP;
                                   break;	
                               } 
                
                               ////////////////////////////////////////////////
                               // Does CtlUnit have an ACL
                               /////////////////////////////////////////////////
                               if ( Handler.m_hMyDatabase.CtlUnitACL(Handler.Station,Handler.m_Database) == 1)
                               {
                                   printf("CtlUnit has an ACL\n");
                                   ShowError(Handler,"Error: DG-0001c");
                                   Handler.Station.State = NAT_STATE_SETUP;
                                   break;
                               }


							if ( atoi(Stations[Index].ReqCopyClient) == 1)
							{  
							   if ( Handler.m_hMyDatabase.VerifyClient(Handler.Station,Handler.m_Database, Handler.dbms ) == 0 )
							   {
									   ShowError(Handler,"Error: DG-0009");
							   		   Handler.Station.State = NAT_STATE_SETUP;
									   break;
							   }
							}


							if ( atoi(Stations[Index].ReqCopyMatter) == 1)
							{  
							   if ( Handler.m_hMyDatabase.VerifyMatter(Handler.Station,Handler.m_Database, Handler.dbms)  == 0)
							   {
									   ShowError(Handler,"Error: DG-0010");
									   Handler.Station.State = NAT_STATE_SETUP;
									   break;	
							   }
							}
							
					  		   											   
							   
							Handler.m_hMyDatabase.GetAccount   (Handler.Station,Handler.m_Database, Handler.dbms );
							if ( Handler.Station.AccountLocked == -1 )
							{
									   ShowError(Handler,"Error: DG-0005");
									   Handler.Station.State = NAT_STATE_SETUP;
							           break;	
							}	
							   
							
							Handler.m_hMyDatabase.GetGroup     (Handler.Station,Handler.m_Database, Handler.dbms );
							if ( Handler.Station.GroupLocked == 1 )
							{
								   ShowError(Handler,"Error: DG-0007");
								   Handler.Station.State = NAT_STATE_SETUP;
								   break;	
							}
									
							
							
							HandleCharge( Handler.Station);    //do we have enough funds for the highest amount
							if ( (Handler.Station.Charging == MONEY_DEBIT) & (Handler.Station.InitBalance < Handler.Station.HIGHEST_COST) )
							{
								ShowError(Handler,"Error: DG-0008");
							    Handler.Station.State = NAT_STATE_SETUP;
							    break;	
							}

							    
						  	 	MaxCopyBalance = 10000 * 100;           //10,000.00 dollars * 100 cents
								Handler.m_hMyDatabase.GetAccMaxSpend    (Handler.Station, Handler.m_Database, Handler.dbms);
								Handler.m_hMyDatabase.GetOUMaxSpend     (Handler.Station, Handler.m_Database, Handler.dbms);
								Handler.m_hMyDatabase.GetGlobalMaxSpend (Handler.Station, Handler.m_Database, Handler.dbms);
													
						  	 	
								if ( Handler.Station.Charging == MONEY_DEBIT) //debit charge
								{
									if (Handler.Station.AllowNeg != 0x01)

										// Casting does not work MS Bug"
								 	    ftemp = (Handler.Station.InitBalance * 100);
										sprintf(buf,"%f", ftemp); 
										MaxCopyBalance = atol(buf);

										//account is debit no negative so set the max balance as per the accounts current availible
									    //funds
										//if availble funds are higher than the maxspend
										//then use maxspend
									if ( Handler.Station.AccmaxspendEnabled) 
									{
										if ( MaxCopyBalance > Handler.Station.Accmaxspend )
											 MaxCopyBalance  = Handler.Station.Accmaxspend;
									}
									else if (Handler.Station.OumaxspendEnabled)
									{
										if ( MaxCopyBalance > Handler.Station.Oumaxspend )
											 MaxCopyBalance  = Handler.Station.Oumaxspend;
									}
									else if (Handler.Station.GlobalmaxspendEnabled)
									{
										if ( MaxCopyBalance > Handler.Station.Globalmaxspend )
											 MaxCopyBalance  = Handler.Station.Globalmaxspend;
									}
							
									
								} else { 
						
									if ( Handler.Station.AccmaxspendEnabled) 
										MaxCopyBalance  = Handler.Station.Accmaxspend;
									else if (Handler.Station.AccmaxspendEnabled)
										MaxCopyBalance  = Handler.Station.Oumaxspend;
									else if (Handler.Station.GlobalmaxspendEnabled)
										 MaxCopyBalance  = Handler.Station.Globalmaxspend;
								}


								Handler.Station.StartSessionBalance = Handler.Station.InitBalance;
								Handler.Station.CurSessionBalance   = Handler.Station.InitBalance;
							
								printf("Calling SetPriceLine @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
	 							sprintf(Message,"Thread ID:%d;DG Control (%s): Calling SetPriceLine()",Thread,strVersion);
								WriteLog(Message,Stations[Index].Debug);
 								if ( SetPriceLine   ( Handler ) == -1)
					  			{
									 printf("No Response to set SetPriceLine() within 5 seconds @ %s\n",Handler.m_ThreadCurrent.Format("%c"));
 									 sprintf(Message,"Thread ID:%d;DG Control (%s): No Response to SetPriceLine() within 5 seconds, Thread Terminating",Thread,strVersion);
									 WriteLog(Message,Stations[Index].Debug);
//									 pApp->AddToMessageLog( Message, EVENTLOG_ERROR_TYPE);
									 goto exit;
								}

						  	    //  SetBalance           ( Handler, (USHORT)MyBalance );




								//7.0 Always use the Default Account Client/Matter if the user did not select
								//one and only if the account has a default client
								////////////////////////////////////////////////////////////////////////////
								if ( strlen(Handler.Station.CopyClient) == 0 ) 
								{
									if ( strlen(Handler.Station.AccountClient) > 0 ) // always us the acccounts default first
									{
											strncpy(Handler.Station.CopyClient, Handler.Station.AccountClient,51);
											strncpy(Handler.Station.CopyMatter, Handler.Station.AccountMatter,51);
									
									} else {
									
										    strncpy(Handler.Station.CopyClient, Handler.Station.GroupClient, 51);
											strncpy(Handler.Station.CopyMatter, Handler.Station.GroupMatter, 51);
									}

								}
								
								/////////////////////////////////////
								// Set this account as logged on
					          	/////////////////////////////////////
					   			m_ActiveAccounts.AddActiveAccount         ( Handler.Station.AccountGUID);
								Handler.m_hMyDatabase.AddActiveSession    ( Handler.Station.AccountGUID,Handler.m_Database);
								Handler.m_hMyDatabase.Handle_SessionActive( Handler.Station,Handler.m_Database);
							
							
								SetHighBalance         ( Handler, MaxCopyBalance);
								StartCopierSession     ( Handler );
								
								Handler.Station.State = NAT_STATE_SESSION_ACTIVE;
								Handler.Station.Error = 0;
							    break;
					
					default:   break;	
		}

	}

	

	exit:


//  Handled in the CHandler Destructor
	return 0;
}



void StartCopierSession( CHandler &Handler)
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[51];

	
	//////////////////
	// Clear Screen //
	/////////////////
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 1
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 2;
	packet.lenS = strlen("Copier Activated");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Copier Activated");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen("Press CLEAR to End");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Press CLEAR to End");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 2;

	// ver 7.0 units or currency
	if ( Handler.Station.UnitValueEnabled == 1 )
	{
		int    balanceunits = 0;
		float  unitvalue    = atof(Handler.Station.UnitValue);
		balanceunits        = (int)(Handler.Station.CurSessionBalance/unitvalue);
		sprintf(Message,"Balance: %d Units",balanceunits);
	
	} else {
	
		sprintf(Message,"Balance: $%.2f",Handler.Station.CurSessionBalance);

	}

	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 2;
	
	if ( Handler.Station.UnitValueEnabled == 0 )
	{
		packet.lenS = strlen("Session: $0.00");
		packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
		lstrcpy((char *)packet.dataS, "Session: $0.00");
	
	} else {
	
		packet.lenS = strlen("Session: 0 Units");
		packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
		lstrcpy((char *)packet.dataS, "Session: 0 Units");
	}
	
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);


//  Set Authorized Account
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc    = NAT_A_AUTHORIZE;
	packet.df    = NAT_DF_STRING; 
	packet.lenS = lstrlen(Handler.Station.CopyAccount);
	lstrcpy((char *)packet.dataS, Handler.Station.CopyAccount);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

 //  Display Balance
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_BAL;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);



	// Inactivity Timeout
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x25;
	packet.df = NAT_DF_16BIT1;

	if ( atoi( Stations[Handler.m_ArrayIndex].PulseIdle) == 0 )
		packet.data16[0] = 60;
	else
		packet.data16[0] = 60 * atoi(Stations[Handler.m_ArrayIndex].PulseIdle);
	

	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);



	// Start the Session
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_SES_START;
	packet.df = NAT_DF_NONE;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

}

int  HandleIdler ( CTime &IdleStart, long IdleResetMinutes, long Thread)
{
   int result = 0;

   CTime     IdleNow     = CTime::GetCurrentTime();
   CTimeSpan IdleSpan    = IdleNow - IdleStart;
   char Message[255]     = {0};
   
   if ( IdleSpan.GetTotalMinutes() >= IdleResetMinutes)
   {
 	     CTime t = CTime::GetCurrentTime();
         printf("Idle Connection Detected  @ %s\n", t.Format("%c") );
	     sprintf(Message,"Thread ID:%d;DG Control (%s): Idle Connection Detected",Thread,strVersion);
	     WriteLog(Message,"1");
	     result = 1;
   }

   return result;

}



void SetBalance( CHandler &Handler,USHORT Balance)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 	NAT_A_BALANCE;
	packet.df =     NAT_DF_16BIT1;
    packet.data16[0] = Balance;
	
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
	printf("Set Balance = %d\n",Balance);
}


void SetHighBalance( CHandler &Handler,ULONG Balance)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

    u.l = Balance;
	

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 	NAT_A_BALANCE;
    packet.df =     NAT_DF_XBYTES;
    packet.lenX = 3;

	packet.dataX[0] = u.c[2];
	packet.dataX[1] = u.c[1];
	packet.dataX[2] = u.c[0];
	
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
	printf("Set Balance = %d\n",Balance);
}


int SetPriceLine( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
    long  Price = 0;

	// Price Lines
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_VALUES;
	packet.df        = NAT_DF_16BIT4;


	float sfbw     =  0.00f;
	float lfbw     =  0.00f;
	float sfcolor  =  0.00f;
	float lfcolor  =  0.00f;
	

	if (Handler.Station.plCustomCostEnabled == 1 )
	{

		sfbw     =  (float)(Handler.Station.pl1CustomCost*100);
		lfbw     =  (float)(Handler.Station.pl2CustomCost*100);
		sfcolor  =  (float)(Handler.Station.pl3CustomCost*100);
		lfcolor  =  (float)(Handler.Station.pl4CustomCost*100);
		
		Handler.Station.pl[1] = Handler.Station.pl1CustomCost;
		Handler.Station.pl[2] = Handler.Station.pl2CustomCost;
		Handler.Station.pl[3] = Handler.Station.pl3CustomCost;
		Handler.Station.pl[4] = Handler.Station.pl4CustomCost;
	

	} else {


		sfbw     =  (float)(Handler.Station.SFBW*100);
		lfbw     =  (float)(Handler.Station.LFBW*100);
		sfcolor  =  (float)(Handler.Station.SFCOLOR*100);
		lfcolor  =  (float)(Handler.Station.LFCOLOR*100);

		Handler.Station.pl[1] = Handler.Station.SFBW;
		Handler.Station.pl[2] = Handler.Station.LFBW;
		Handler.Station.pl[3] = Handler.Station.SFCOLOR;
		Handler.Station.pl[4] = Handler.Station.LFCOLOR;
	
	}


		char buf[100]; 

		sprintf(buf,"%f", sfbw); 
		Price = atol(buf);
		printf("Price(1) = %d\n",Price);
		packet.data16[0] = Price;
	
		sprintf(buf,"%f", lfbw); 
		Price = atol(buf);
		printf("Price(2) = %d\n",Price);
		packet.data16[1] = Price;

		sprintf(buf,"%f", sfcolor); 
		Price = atol(buf);
		printf("Price(3) = %d\n",Price);
		packet.data16[2] = Price;

		sprintf(buf,"%f", lfcolor); 
		Price = atol(buf);
		printf("Price(4) = %d\n",Price);
		packet.data16[3] = Price;


	
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;


//	while( Handler.DataReceived == 0)
//		   Handler.DoEvents();


}


void PingNat( CHandler &Handler)
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_PING;
	packet.df = NAT_DF_NONE;
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
}



int Reset( CHandler &Handler)
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x12;
	packet.df = NAT_DF_NONE;
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.SetDataToSend( (LPSTR)&Buffer[0],Size);
	Handler.DoEvents();
	return 0;
}


int SetDelay( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc         = 0x2A;
	packet.df         = NAT_DF_16BIT1;
	packet.data16[0]  = 1000;

	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;

	Handler.SetDataToSend( (LPSTR)&Buffer[0],Size);

	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;

}


int SetTime( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	CTime t = CTime::GetCurrentTime();


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc       = 0x14;
	packet.df       = NAT_DF_XBYTES;
	packet.lenX     = 7;
	packet.dataX[0] = 20;
	packet.dataX[1] = t.GetYear() - 2000;
	packet.dataX[2] = t.GetMonth();
	packet.dataX[3] = t.GetDay();
	packet.dataX[4] = t.GetHour();
	packet.dataX[5] = t.GetMinute();
	packet.dataX[6] = t.GetSecond();
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);


	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;
}


void ShowError( CHandler &Handler,LPSTR pError)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 4;
	packet.lenS = strlen(pError);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, pError);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
	WaitForSingleObject(hGlobalThreadWait,1000);

}

int SetInitial( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 4;
	packet.lenS = strlen("Initializing !!!");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Initializing !!!");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);


	CTime Now =CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	while( Handler.DataReceived == 0)
	{

		Current = CTime::GetCurrentTime();
		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;


}

int SetBadData( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x36;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = 1;
	packet.data8[1] = 2;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{

		Current = CTime::GetCurrentTime();
		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;


}



void SetOffline( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x63;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	while( Handler.DataReceived == 0)
		   Handler.DoEvents();


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x64;
	packet.df = NAT_DF_16BIT1;
	packet.data16[0] = Handler.Station.OffLineMax;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	while( Handler.DataReceived == 0)
		   Handler.DoEvents();


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x65;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	while( Handler.DataReceived == 0)
		   Handler.DoEvents();



}


void SetDatabaseError( CHandler &Handler, LPSTR pCode)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen("Database Exception:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Database Exception:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen(pCode);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, pCode);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
}

int SetAuthenticate1( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	
	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);

	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;
}

int SetAuthenticate2( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen("Authorizing Usage !");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Authorizing Usage !");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);

	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;
}


int RequestLocation( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc       = NAT_A_LOCATION;
	packet.df       = NAT_DF_NONE;
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
	
	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;
}


int RequestGateway( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc       = 0x47;
	packet.df       = NAT_DF_NONE;
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
		
	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);
	
	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;

}

int RequestMac( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc       = 0x10;
	packet.df       = NAT_DF_NONE;
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
	Handler.DataReceived = 0;
	
	Handler.SetDataToSend( (LPSTR)&Buffer[0],Size);

	
	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;
}




void ProcessingOffLine( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	int   Count = 0;
					
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 4;
	packet.lenS = strlen("Process Offline");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Process Offline");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
	Handler.DoEvents();
	

	// Get Count
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	Handler.OffLineCountRcv = 0;
	packet.fc       = 0x60;
	packet.df       = NAT_DF_NONE;
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	while( Handler.OffLineCountRcv == 0)
		   Handler.DoEvents();
	

	Count = Handler.OffLineCount;
    printf("Processing %d OffLine Transactions\n",Count);
		
 	if ( Count > 0 )
	{
		Handler.m_hMyDatabase.GetStation   ( Handler.Station,Handler.m_Database, Handler.dbms );
//		Handler.m_hMyDatabase.GetStationID ( Handler.Station ,Handler.m_Database, Handler.dbms);
//		Handler.m_hMyDatabase.GetDeviceID  ( Handler.Station ,Handler.m_Database, Handler.dbms);
		Handler.m_hMyDatabase.GetCopier    ( Handler.Station,Handler.m_Database, Handler.dbms );

	}

	for ( int a=0; a< Count; a++)
	{
	
		// ask for oldest
		ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
		ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
		Handler.OffLineDataProcessed = 0;
		packet.fc       = 0x61;
		packet.df       = NAT_DF_NONE;
		Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
		Handler.Send( (LPSTR)&Buffer[0],Size);
	
		while( Handler.OffLineDataProcessed == 0)
			   Handler.DoEvents();
	
		// delete oldest
		ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
		ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
		packet.fc       = 0x62;
		packet.df       = NAT_DF_NONE;
		Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
		Handler.Send( (LPSTR)&Buffer[0],Size);
	}
}


int RequestMask( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc       = 0x46;
	packet.df       = NAT_DF_NONE;
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
	Handler.DataReceived = 0;

	Handler.SetDataToSend( (LPSTR)&Buffer[0],Size);


	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;

}


int RequestAddress( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc       = 0x45;
	packet.df       = NAT_DF_NONE;
	Size            = Packet2Buffer(&packet,(BYTE *)&Buffer[0]);
	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);

	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;

}



int SetKeyBoard( CHandler &Handler,int Mode)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = Mode;
	packet.data8[1] = 4;
	packet.data8[2] = 8;
	packet.data8[3] = 0x02;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;
	Handler.SetDataToSend((LPSTR)&Buffer[0],Size);


	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current - Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;
	
}


int SetCurrency( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x37;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = Handler.Station.Currency;
	packet.data8[1] = Handler.Station.Decimal;

	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	Handler.DataReceived = 0;


	Handler.SetDataToSend( (LPSTR)&Buffer[0],Size);

	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	
	while( Handler.DataReceived == 0)
	{
		Current = CTime::GetCurrentTime();

		Lasped  = Current-Now;
		if ( Lasped.GetSeconds() >= 5)
			return -1;

		Handler.DoEvents();
	}

	return 0;

}



void EndCopierSession( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_SES_END;
	packet.df = NAT_DF_NONE;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);
}



void SetupGetAccount( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 1
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen("High Tech DGC");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "High Tech DGC");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 2
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen("Swipe Badge or Type");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Swipe Badge or Type");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 3
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen("Account # & ENTER");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Account # & ENTER");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 4
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 1;
	packet.lenS = strlen("Account #:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Account #:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	 //SetCursor Position
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 4;
	packet.data8[2] = 0x0b;

	//PJD 04/03/07 to handle the Alpha or Number only
	if ( strcmpi(Stations[Handler.m_ArrayIndex].Keyboard,"ALPHA") == 0)
		packet.data8[3] = 0x02;
	else
		packet.data8[3] = 0x01;

		
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

}

void SetupGetClient( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 1
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen("High Tech DGC");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "High Tech DGC");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 2
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen(" if required type");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " if required type");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 3
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Client # & ENTER");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " Client # & ENTER");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 4
	// always use the default if set
		
	
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Client #:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " Client #:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);






    //SetCursor Position
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 4;
	packet.data8[2] = 0x0b;

	//PJD 04/03/07 to handle the Alpha or Number only
	if ( strcmpi(Stations[Handler.m_ArrayIndex].Keyboard,"ALPHA") == 0)
		packet.data8[3] = 0x02;
	else
		packet.data8[3] = 0x01;


	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

}


void SetupGetMatter( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 1
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen("High Tech DGC");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "High Tech DGC");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 2
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen(" If required type");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " If required type");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 3
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Matter # & ENTER");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " Matter # & ENTER");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 4
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Matter #:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " Matter #:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 4;
	packet.data8[2] = 0x0b;

	//PJD 04/03/07 to handle the Alpha or Number only
	if ( strcmpi(Stations[Handler.m_ArrayIndex].Keyboard,"ALPHA") == 0)
		packet.data8[3] = 0x02;
	else
		packet.data8[3] = 0x01;

	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

}

void SetupGetPassword( CHandler &Handler)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 1
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen("High Tech DGC");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "High Tech DGC");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 2
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Please type your");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " Please type your");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 3
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Enter PIN & ENTER");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " copy pin & ENTER");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

	// Line 4
	Handler.mData = 0;
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 1;
	packet.lenS = strlen(" Enter PIN #:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, " copy pin #:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);


	//Keyboard
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 2;
	packet.data8[1] = 4;
	packet.data8[2] = 0x0d;
	packet.data8[3] = 0x02;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	Handler.Send( (LPSTR)&Buffer[0],Size);

}

void HandleCharge( _NetcashDevice &Station)
{

//	if (stricmp(Station.AccountCharge,"GROUP") == 0 )
//	{
		if (stricmp(Station.GroupCharge,"CREDIT") == 0 )
		{
			Station.Charging = MONEY_CREDIT;
		}

		if (stricmp(Station.GroupCharge,"NOCHARGE") == 0 )
		{
				Station.Charging = MONEY_NOCHARGE;
		}

		if (stricmp(Station.GroupCharge,"DEBIT") == 0 )
		{
				Station.Charging = MONEY_DEBIT;
		}

//}
 //  else // not group charging
//	{
//		if (stricmp(Station.AccountCharge,"CREDIT") == 0 )
//		{
//				Station.Charging = MONEY_CREDIT;
//		}
//
//		if (stricmp(Station.AccountCharge,"NOCHARGE") == 0 )
//		{
//				Station.Charging = MONEY_NOCHARGE;
//		}
//
//		if (stricmp(Station.AccountCharge,"DEBIT") == 0 )
//		{
//				Station.Charging = MONEY_DEBIT;
//		}

//   }

}



