// AVSDlg.cpp : implementation file
//
//
//


#include "stdafx.h"
#include "AVS.h"
#include "AVSDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAVSDlg dialog

CAVSDlg::CAVSDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAVSDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAVSDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

}

void CAVSDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAVSDlg)
	DDX_Control(pDX, IDC_LASTDATA, m_LastData);
	DDX_Control(pDX, IDC_EDIT1, m_sta);
	DDX_Control(pDX, IDC_DATALIST, m_DataList);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAVSDlg, CDialog)
	//{{AFX_MSG_MAP(CAVSDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAVSDlg message handlers


BOOL CAVSDlg::OnInitDialog()
{
	CDialog::OnInitDialog();


	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	///////////////////////////////////////
	// TODO: Add extra initialization here/
	///////////////////////////////////////

    if ( __argc == 1 )
	{
			
			_Message.Format("Need the IP/Host name of the SQL Server");
			WriteLog();
			ASSERT(AfxGetApp()->m_pMainWnd != NULL);
		    AfxGetApp()->m_pMainWnd->SendMessage(WM_CLOSE);
  			return TRUE; 
	}


    if ( __argc == 2 )
	{
			
			_Message.Format("Need the ECashier Badge # to Manage");
			WriteLog();
			ASSERT(AfxGetApp()->m_pMainWnd != NULL);
		    AfxGetApp()->m_pMainWnd->SendMessage(WM_CLOSE);
  			return TRUE; 
	}


	m_Connect.Format("Driver={SQL Server};Server=%s;Database=docugate;Uid=RTT;Pwd=Qwerty#1;Application=DGC_AVS",__argv[1]);
   	m_MyDatabaseErr  = m_MyDatabase.OpenConnection(m_Connect); 
	if ( m_MyDatabaseErr != 0)
	{
			_Message.Format("Failed to connect to database server (%s)",m_Server);
			WriteLog();
			ASSERT(AfxGetApp()->m_pMainWnd != NULL);
		    AfxGetApp()->m_pMainWnd->SendMessage(WM_CLOSE);
  			return TRUE; 

	}


	 mThisCashier.badge.Format("%s",__argv[2]);
   	_Message.Format("DGC_AVS.exe started (Server = %s, AVS Name %s)",__argv[1],__argv[2]);
  	 WriteLog();
    _Message.Format("Connected to Database(%s)",m_Server);
     WriteLog();
     m_MyDatabase.ECashier_GetCashier( (LPVOID)&mThisCashier);
     m_MyDatabase.CloseConnection();
    _Message.Format("Disconnected from Database(%s)",m_Server);
     WriteLog();
 
	 if ( mThisCashier.located == false ) 
	 {
			_Message.Format("ECashier Badge(%s) is not configured",AfxGetApp()->m_lpCmdLine);
			WriteLog();
			ASSERT(AfxGetApp()->m_pMainWnd != NULL);
		    AfxGetApp()->m_pMainWnd->SendMessage(WM_CLOSE);
  			return TRUE; 
	 
	 } else {

	 	 mConnectTimer = SetTimer(98, 100,0);    
	 }
	 return TRUE;  // return TRUE  unless you set the focus to a control
}



void CAVSDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	CDialog::OnSysCommand(nID, lParam);
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CAVSDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

HCURSOR CAVSDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


INT CAVSDlg::FireConnected(USHORT &usStatusCode, LPTSTR &lpszDescription)
{
    
	 if ( usStatusCode == 0 )  
	 {	
 			 _Message.Format("TCP Connection Success");
			 WriteLog();
	         mInitAvs     = SetTimer(100, 100, 0);
	 }
	 else
	 {
  			 _Message.Format("TCP Connection Failure(%d),reconnect in 15 seconds)",usStatusCode);
			 WriteLog();
			 mConnectTimer = SetTimer(98, 15000,0);    
     }
	 return 0;
}



INT CAVSDlg::FireDataIn(LPSTR &lpText, USHORT FAR &lenText, BOOL &bEOL )
{

		CTime t = CTime::GetCurrentTime();
   	    CString Message;
		char  ActivityData[255];

		Length = lenText;
		ZeroMemory   ( (LPVOID)&pBuf[0], 512);
		memcpy       ( (LPVOID)&pBuf[0], (LPVOID)lpText, Length);
		pData  = &pBuf[0];
		DataReceived = 1;
	   	_NetcashPacket packet;

		int  *billvalue = 0;
		long *balance   = 0;
		long  *sessiontotal     = 0;
		long  *sessionbalance   = 0;
		int   sessionend;
		short  *BillCount = 0;
		short  *abillvalue = 0;
	
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
							case 0x91: 
								       sprintf(ActivityData,"%s",t.Format("%c"));
								       Activitylist.AddTail( new CActivity(0x91, ActivityData));
									   break;
							
							case 0x27: 
								       billvalue = (int * )&packet.data16;
									   balance   = (long *)&packet.dataX;
									   *balance   = htonl(*balance);
									   sprintf(ActivityData,"%ld %ld",*billvalue,*balance);
									   Activitylist.AddTail( new CActivity(0x27, ActivityData)); 
								       break;
							
							case 0xA6: // we caused the end session maybe a keyboard 
								       sessionend        = packet.data8[0];
									   sessiontotal      = (long *)&packet.dataX[0];
									   sessionbalance    = (long *)&packet.dataX[4];
									   *sessiontotal 	 = htonl(*sessiontotal);
									   *sessionbalance	 = htonl(*sessionbalance);
									   sprintf(ActivityData,"%ld %ld %d",*sessiontotal,*sessionbalance,sessionend);
								   	   Activitylist.AddTail( new CActivity(0xA6, ActivityData)); 
								       break;
							
							case 0x26: // avs terminated for some reason
								       sessionend        = packet.data8[0];
									   sessiontotal      = (long *)&packet.dataX[0];
									   sessionbalance    = (long *)&packet.dataX[4];
									   *sessiontotal 	 = htonl(*sessiontotal);
									   *sessionbalance	 = htonl(*sessionbalance);
									   sprintf(ActivityData,"%ld %ld %d",*sessiontotal,*sessionbalance,sessionend);
								   	   Activitylist.AddTail( new CActivity(0x26, ActivityData)); 
								       break;

							case 0xB0: Message.Format("Clear Screen  ack received");        break;
							case 0xB8: Message.Format("Print Command ack received");        break;
									  // sprintf(ActivityData,"Print Command Ack=%d",packet.data8[0]);
								   	  // Activitylist.AddTail( new CActivity(0xB8, ActivityData)); 
								      // break;
					
							case 0xB1: Message.Format("Display ack received");             break;
							case 0xB3: Message.Format("Keyboard Mode ack received");       break;
							case 0xE5: Message.Format("Offline mode Ack received");        break;
							case 0xE4: Message.Format("Offline Max Ack received");         break;
							case 0x90: Message.Format("Mac received");                     break;
							case 0xAA: Message.Format("Delay Ack received");               break;
							case 0x94: Message.Format("Clock Set Ack");                    break;
							case 0x92: Message.Format("Reset Ack");					       break;
							case 0xB6: Message.Format("Card Swipe Ack"); 			       break;
							case 0x35: sprintf(ActivityData,"%s",packet.dataS);
								       Activitylist.AddTail( new CActivity(0x35, ActivityData));
									   break; 
							
							

							case 0xD0: 
								       if ( packet.data8[0] == 0) //On Hand Bills 0-7
									   {
											mThisBills.Bill1.BillCount = ntohs( *(short *)&packet.dataX[0]  );
											mThisBills.Bill2.BillCount = ntohs( *(short *)&packet.dataX[2]  );
											mThisBills.Bill3.BillCount = ntohs( *(short *)&packet.dataX[4]  );
											mThisBills.Bill4.BillCount = ntohs( *(short *)&packet.dataX[6]  );
											mThisBills.Bill5.BillCount = ntohs( *(short *)&packet.dataX[8]  );
											mThisBills.Bill6.BillCount = ntohs( *(short *)&packet.dataX[10] );
											mThisBills.Bill7.BillCount = ntohs( *(short *)&packet.dataX[12] );
									   
										    mThisBills.Bill1.Amount = mThisBills.Bill1.BillCount * mThisBills.Bill1.BillValue;
									        mThisBills.Bill2.Amount = mThisBills.Bill2.BillCount * mThisBills.Bill2.BillValue;
									        mThisBills.Bill3.Amount = mThisBills.Bill3.BillCount * mThisBills.Bill3.BillValue;
									        mThisBills.Bill4.Amount = mThisBills.Bill4.BillCount * mThisBills.Bill4.BillValue;
									        mThisBills.Bill5.Amount = mThisBills.Bill5.BillCount * mThisBills.Bill5.BillValue;
									        mThisBills.Bill6.Amount = mThisBills.Bill6.BillCount * mThisBills.Bill6.BillValue;
									        mThisBills.Bill7.Amount = mThisBills.Bill7.BillCount * mThisBills.Bill7.BillValue;

									        sprintf(ActivityData,"%s","GO1");
									        Activitylist.AddTail( new CActivity(0xD0, ActivityData));
									   }

									   if ( packet.data8[0] == 8) //Life Bills 0-7
									   {
										    UINT val = 0;
											
											val = packet.dataX[0] << 16 | packet.dataX[1] << 8 | packet.dataX[2];
											mThisBills.Bill1.BillCount = val;
											
											val = packet.dataX[3] << 16 | packet.dataX[4] << 8 | packet.dataX[5];
											mThisBills.Bill2.BillCount = val;
								
											val = packet.dataX[6] << 16 | packet.dataX[7] << 8 | packet.dataX[8];
											mThisBills.Bill3.BillCount = val;
										
											val = packet.dataX[9] << 16 | packet.dataX[10] << 8 | packet.dataX[11];
											mThisBills.Bill4.BillCount = val;
											
											val = packet.dataX[12] << 16 | packet.dataX[13] << 8 | packet.dataX[14];
											mThisBills.Bill5.BillCount = val;
											
											val = packet.dataX[15] << 16 | packet.dataX[16] << 8 | packet.dataX[17];
											mThisBills.Bill6.BillCount = val;
											
											val = packet.dataX[18] << 16 | packet.dataX[19] << 8 | packet.dataX[20];
											mThisBills.Bill7.BillCount = val;
										

										    mThisBills.Bill1.Amount = mThisBills.Bill1.BillCount * mThisBills.Bill1.BillValue;
									        mThisBills.Bill2.Amount = mThisBills.Bill2.BillCount * mThisBills.Bill2.BillValue;
									        mThisBills.Bill3.Amount = mThisBills.Bill3.BillCount * mThisBills.Bill3.BillValue;
									        mThisBills.Bill4.Amount = mThisBills.Bill4.BillCount * mThisBills.Bill4.BillValue;
									        mThisBills.Bill5.Amount = mThisBills.Bill5.BillCount * mThisBills.Bill5.BillValue;
									        mThisBills.Bill6.Amount = mThisBills.Bill6.BillCount * mThisBills.Bill6.BillValue;
									        mThisBills.Bill7.Amount = mThisBills.Bill7.BillCount * mThisBills.Bill7.BillValue;

									        sprintf(ActivityData,"%s","GO2");
									        Activitylist.AddTail( new CActivity(0xD0, ActivityData));
									   }

									   break; 

							case 0xCC: 
								   			abillvalue = (short *)&packet.dataX[0];
											mThisBills.Bill1.BillValue = ntohs(*abillvalue);
											abillvalue  = (short *)&packet.dataX[2];
											mThisBills.Bill2.BillValue = ntohs(*abillvalue);
											abillvalue  = (short *)&packet.dataX[4];
											mThisBills.Bill3.BillValue = ntohs(*abillvalue);
											abillvalue  = (short *)&packet.dataX[6];
											mThisBills.Bill4.BillValue = ntohs(*abillvalue);
											abillvalue  = (short *)&packet.dataX[8];
											mThisBills.Bill5.BillValue = ntohs(*abillvalue);
											abillvalue  = (short *)&packet.dataX[10];
											mThisBills.Bill6.BillValue = ntohs(*abillvalue);
											abillvalue  = (short *)&packet.dataX[12];
											mThisBills.Bill7.BillValue = ntohs(*abillvalue);
									   
										   break; 
		   

							default:   printf("Dont-Know %d",packet.fc);
								       break;
					}
			
					if ( Message.GetLength() > 0 )
						m_sta.SetWindowText(Message);
				
				}else {
				
					break;
				}
	
		}

	    return 0;

}


INT CAVSDlg::FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription )
{
 	    KillTimer(mPingTimer);
		KillTimer(mActivityTimer);
		_Message.Format("TCP Connection Dropped(%d),reconnect in 15 seconds)",usStatusCode);
		WriteLog();
		mConnectTimer = SetTimer(98, 15000,0);    
    	return 0;
}


INT CAVSDlg::FireError(USHORT &usErrorCode, LPSTR &lpszDescription )
{
	    KillTimer(mPingTimer);
		KillTimer(mActivityTimer);
		_Message.Format("TCP Connection Error(%d),reconnect in 15 seconds)",usErrorCode);
		WriteLog();
		mConnectTimer = SetTimer(98, 15000,0);    
		return 0;
}




void CAVSDlg::SetupDatabaseFailure(int err)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[25] = {0};
	

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 1
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 3;
	packet.lenS = strlen("Database failure !");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Database failure !");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"Error # %d",err);
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 3;
	packet.data8[1] = 3;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	Sleep(2000);
}

void CAVSDlg::SetupDuplicateAccount(void)
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

	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 1
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 1;
	packet.lenS = strlen("Error Encountered");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Error Encountered");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen("Try a different");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Try a different");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen("Account #");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Account #");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	SetDataToSend((LPSTR)&Buffer[0],Size);
	Sleep(3000);
}


void CAVSDlg::eCashierError( int Errornum )
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[255];
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Lose the Keyborad cursor
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"eCashier Error");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"Error #: %d",Errornum);
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	Sleep(2000);

}


void CAVSDlg::eCashierError( int Errornum, LPSTR pMsg)
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[255];
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Lose the Keyborad cursor
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"eCashier Error");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	
	sprintf(Message,"Error #: %d",Errornum);
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"%s", pMsg);
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	Sleep(2000);

}


void CAVSDlg::eCashierPrintingReceipt()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[255];
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Lose the Keyborad cursor
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"Printing Receipt.");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}





void CAVSDlg::SetupClearScreen()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	// Lose the Keyborad cursor
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}




void CAVSDlg::SetupMainMenu()
{

	// make sure the database is closed
	///////////////////////////////////
     _Message.Format("SetupMainMenu(Closing Database)");
	WriteLog();
	m_MyDatabase.CloseConnection();
	
	
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 1
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen("www.docugate.biz");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "www.dougate.biz");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen("Add Value?   Press 1");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Add Value?   Press 1");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// remove option as per hightech
	//  Line 3
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen("New Account? Press 2");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "New Account? Press 2");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 4
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 1;
	packet.lenS = strlen("  Then press Enter");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "  Then press Enter");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}



void CAVSDlg::SetupSecurityFunction()
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

	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 2;
	packet.lenS = strlen("Enter the function");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Enter the function");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 3
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen("code # required");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "code # required");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 3
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 2;
	packet.lenS = strlen("Code #:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Code #:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 3;
	packet.data8[2] = 9;
	packet.data8[3] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}


void CAVSDlg::SetupSecurityAccount()
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

	SetDataToSend((LPSTR)&Buffer[0],Size);


		// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen("Enter your security");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Enter your security");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

		// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 2;
	packet.lenS = strlen("Account #:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Account #:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// set the keyboard mode
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 3;
	packet.data8[2] = 12;
	packet.data8[3] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the Cursor pos
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x31;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = 3;
	packet.data8[1] = 12;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


}



void CAVSDlg::SetupResetMeters()
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
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 3;
	packet.lenS = strlen("Reset Meters ???");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Reset Meters ???");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 3;
	packet.lenS = strlen("Press Yes or No");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Press Yes or No");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}



void CAVSDlg::SetupPrintReceipt()
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
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 3;
	packet.lenS = strlen("Print Receipt.??)");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Print Receipt.??");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 3;
	packet.lenS = strlen("Press (Yes/No)");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Press (Yes/No)");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}



void CAVSDlg::SetupFundingType()
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
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen("1.) Cash");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "1.) Cash");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 3;
	packet.lenS = strlen("2.) Credit Card");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "2.) Credit Card");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 3;
	packet.lenS = strlen("3.) Debit Card");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "3.) Debit Card");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 3;
	packet.lenS = strlen("4.) PayPal");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "4.) PayPal");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x03;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}


void CAVSDlg::HandleActivity_LiveBanking( CActivity *newActivity)
{

	  char Message[255] = {0};
	  char data[255] = {0};
	  lstrcpyn(data, newActivity->GetData(),255);

	  
  	  if ( newActivity->GetType() == 0x35) 
	  {
		  sprintf(Message,"KeyBoard Activity,Data = %s",data);
	      m_DataList.AddString(Message);
		  AddValue_EndBanking();
		  return;
	  }


  	  if ( newActivity->GetType() == 0x27) 
	  {
		  char billvalue[10] = {0};
		  char balance[50]   = {0};
		  sscanf(data,"%s%s",billvalue,balance);
		  
		  mThisAccount.escrowed   += atol(billvalue);
		  mThisAccount.curbalance = atol(balance);
		  mThisAccount.endbalance = atol(balance);
		  
		  m_DataList.AddString(Message);
		  AddValue_SendBillAck();
		  return;
	  }


  	  if ( newActivity->GetType() == 0xA6) 
	  {
		
		  char endtotal[25]     = {0};
		  char endbalance[25]   = {0};
		  char endreason[25]    = {0};

		  sscanf(data,"%s%s%s",endtotal,endbalance,endreason);
  		  mThisAccount.escrowed   = atol(endtotal);
		  mThisAccount.endbalance = atol(endbalance);

		  
		  mThisTransaction.tablename.Format("ECASHIER_TRANSACTIONS");
		  mThisTransaction.type.Format     ("FUND ADJ");
		  mThisTransaction.guidacc      = mThisAccount.accguid;
		  mThisTransaction.guidecashier = mThisCashier.accguid;
		  mThisTransaction.amount       = mThisAccount.escrowed;
		  mThisTransaction.sbal         = mThisAccount.startbalance;
		  mThisTransaction.ebal         = mThisAccount.endbalance;
		  mThisTransaction.success      = false;

 		  m_MyDatabase.ECashier_LogJournel        ( (LPVOID)&mThisTransaction);
		  m_MyDatabase.ECashier_LogTransaction    ( (LPVOID)&mThisTransaction);
		  if ( mThisTransaction.success == true)
		  {
			  m_MyDatabase.ECashier_GetLastInsertID   ( (LPVOID)&mThisTransaction);
			  m_MyDatabase.ECashier_UpdateAccountFunds((LPVOID)&mThisAccount);
			  RcpType = RCP_ADDVALUE;
			  SetupPrintReceipt();
			  CurState = PRINTRECEIPT;
		  }

	  }
  	  

	  if ( newActivity->GetType() == 0x26) 
	  {
		  char endtotal[25]     = {0};
		  char endbalance[25]   = {0};
		  char endreason[25]    = {0};
		  sscanf(data,"%s%s%s",endtotal,endbalance,endreason);

  		  mThisAccount.escrowed   = atol(endtotal);
		  mThisAccount.endbalance = atol(endbalance);
		  
		  
		  mThisTransaction.tablename.Format("ECASHIER_TRANSACTIONS");
		  mThisTransaction.type.Format     ("FUND ADJ");
		  mThisTransaction.guidacc      = mThisAccount.accguid;
		  mThisTransaction.guidecashier = mThisCashier.accguid;
		  mThisTransaction.amount       = mThisAccount.escrowed;
		  mThisTransaction.sbal         = mThisAccount.startbalance;
		  mThisTransaction.ebal         = mThisAccount.endbalance;
		  mThisTransaction.success      = false;

	 	  m_MyDatabase.ECashier_LogJournel        ( (LPVOID)&mThisTransaction);
		  m_MyDatabase.ECashier_LogTransaction    ( (LPVOID)&mThisTransaction);
		  if ( mThisTransaction.success == true)
		  {
			  m_MyDatabase.ECashier_GetLastInsertID   ( (LPVOID)&mThisTransaction);
			  m_MyDatabase.ECashier_UpdateAccountFunds( (LPVOID)&mThisAccount);
			  RcpType = RCP_ADDVALUE;
			  SetupPrintReceipt();
			  CurState = PRINTRECEIPT;
		  
		  }
	  }



  	  if ( newActivity->GetType() == 0xB8) 
	  {
		  sprintf(Message,"Print Command ACK,Data = %s",data);
	      m_DataList.AddString(Message);
//		  SetupMainMenu();
//		  SetKeyBoard_DirectMode();
  //        AddValue_PrintReceipt();
	//	  CurState = MAINMENU;
		  return;
	  }



}


void CAVSDlg::HandleActivity_MainMenu( CActivity *newActivity)
{


		_Message.Format("HandleActivity_MainMenu() Data(%s)",newActivity->GetData() );
		WriteLog();

		
		 if ( strcmp(newActivity->GetData(),"1") == 0) 
		 {	  
		 		 /////////////////////////////////////////////
				 // lets make sure the database is alive first
				 // else back to main menu
				 /////////////////////////////////////////////
				 _Message.Format("HandleActivity_MainMenu() Database Connection Closed");
				 WriteLog();
				 m_MyDatabase.CloseConnection();
				 m_MyDatabaseErr  = m_MyDatabase.OpenConnection(m_Connect); 
				 if ( m_MyDatabaseErr != 0)
				 {
					  SetupDatabaseFailure(m_MyDatabaseErr);
					  _Message.Format("HandleActivity_MainMenu() Error(10001)");
					  WriteLog();
					  SetupMainMenu();
					  CurState = MAINMENU;
				 
				 } else {
 						 

				   _Message.Format("HandleActivity_MainMenu() Database Connection Opened");
				   WriteLog();

   				   SetupAddValueNum();
				   CurState = ADDVALUENUM;
		     
				 }
				 return;
				  
		 }
			
			
		 if ( strcmp(newActivity->GetData(),"2") == 0 )
		 { 	  
				 /////////////////////////////////////////////
				 // lets make sure the database is alive first
				 // else back to main menu
				 /////////////////////////////////////////////
				 _Message.Format("HandleActivity_MainMenu() Database Connection Closed");
				 WriteLog();
				 m_MyDatabase.CloseConnection();
				 m_MyDatabaseErr  = m_MyDatabase.OpenConnection(m_Connect); 
				 
				 if ( m_MyDatabaseErr != 0)
				 {
					  SetupDatabaseFailure(m_MyDatabaseErr);
					  _Message.Format("HandleActivity_MainMenu() Error(10001)");
					  WriteLog();
					  SetupMainMenu();
					  CurState = MAINMENU;
				 }
				 else if ( mThisCashier.addaccount != true)
				 {
					  eCashierError(20001);
				      _Message.Format("HandleActivity_MainMenu() Error(20001)");
			          WriteLog();
			  		  SetupMainMenu();
					  CurState = MAINMENU;
				 }
				 else
				 {
				    _Message.Format("HandleActivity_MainMenu() Database Connection Opened");
			  	    WriteLog();
					SetupNewAccountNum();
					CurState = NEWACCOUNTNUM;
				 }

				 return;
			}
	 

		 if ( strcmp(newActivity->GetData(),"9") == 0 )
		 { 	  
				 /////////////////////////////////////////////
				 // lets make sure the database is alive first
				 // else back to main menu
				 /////////////////////////////////////////////
				 _Message.Format("HandleActivity_MainMenu() Database Connection Closed");
				 WriteLog();
				 m_MyDatabase.CloseConnection();
				 m_MyDatabaseErr  = m_MyDatabase.OpenConnection(m_Connect); 
				 if ( m_MyDatabaseErr != 0)
				 {
					  SetupDatabaseFailure(m_MyDatabaseErr);
					  _Message.Format("HandleActivity_MainMenu() Error(10001)");
					  WriteLog();
					  SetupMainMenu();
					  CurState = MAINMENU;
				 
				 } else {
 						 
						   _Message.Format("HandleActivity_MainMenu() Database Connection Opened");
						   WriteLog();
						   SetupSecurityAccount();
						   CurState = SECURITYACCOUNT;
			  	 }
		         return;
			}
				
}





void CAVSDlg::HandleActivity_SecurityFunction( CActivity *newActivity)
{

		  
	  char data[5] = {0};
	  lstrcpyn(data,newActivity->GetData(),5);

  	  _Message.Format("HandleActivity_SecurityFunction() Data(%s)",data );
	  WriteLog();


	  if ( strstr(data,"'") )
 	       return;
	  else if ( strlen(data) == 0 ) // enter no data
	  {
		  	SetupMainMenu();
			CurState = MAINMENU;
		    return;
	  }
	  else if (strcmp(data,"1001") == 0)
	  {
			mThisSecurity.function.Format("1001");
		    AddValue_GetBillValues();
			AddValue_GetOnHandsBills();
	  }
	  else if (strcmp(data,"1002") == 0)
	  {
			mThisSecurity.function.Format("1002");
			AddValue_GetBillValues();
			AddValue_GetLifeBills();
	  }
	  else if (strcmp(data,"GO1") == 0)
	  {
			//ResetableMeters
			mThisSecurity.rq_bill0 = mThisBills.Bill1.BillCount;
			mThisSecurity.rq_bill1 = mThisBills.Bill2.BillCount;
			mThisSecurity.rq_bill2 = mThisBills.Bill3.BillCount;
			mThisSecurity.rq_bill3 = mThisBills.Bill4.BillCount;
			mThisSecurity.rq_bill4 = mThisBills.Bill5.BillCount;
			mThisSecurity.rq_bill5 = mThisBills.Bill6.BillCount;
			mThisSecurity.rq_bill6 = mThisBills.Bill7.BillCount;
			mThisSecurity.rq_bill7 = 0;
		
			mThisSecurity.lq_bill0 = 0;
			mThisSecurity.lq_bill1 = 0;
			mThisSecurity.lq_bill2 = 0;
			mThisSecurity.lq_bill3 = 0;
			mThisSecurity.lq_bill4 = 0;
			mThisSecurity.lq_bill5 = 0;
			mThisSecurity.lq_bill6 = 0;
			mThisSecurity.lq_bill7 = 0;
	
			AddValue_PrintOnHandMeters();
			SetupResetMeters();
		    CurState = RESETMETERS;
	  }
	  else if (strcmp(data,"GO2") == 0)
	  {
			//LifeMeters
			mThisSecurity.lq_bill0 = mThisBills.Bill1.BillCount;
			mThisSecurity.lq_bill1 = mThisBills.Bill2.BillCount;
			mThisSecurity.lq_bill2 = mThisBills.Bill3.BillCount;
			mThisSecurity.lq_bill3 = mThisBills.Bill4.BillCount;
			mThisSecurity.lq_bill4 = mThisBills.Bill5.BillCount;
			mThisSecurity.lq_bill5 = mThisBills.Bill6.BillCount;
			mThisSecurity.lq_bill6 = mThisBills.Bill7.BillCount;
			mThisSecurity.lq_bill7 = 0;
		
			
			mThisSecurity.rq_bill0 = 0;
			mThisSecurity.rq_bill1 = 0;
			mThisSecurity.rq_bill2 = 0;
			mThisSecurity.rq_bill3 = 0;
			mThisSecurity.rq_bill4 = 0;
			mThisSecurity.rq_bill5 = 0;
			mThisSecurity.rq_bill6 = 0;
			mThisSecurity.rq_bill7 = 0;
	
			AddValue_PrintLifeMeters();
			SetupResetMeters();
		    CurState = RESETMETERS;
	  }
	  else
	  {
		  	eCashierError(90003);
			_Message.Format("HandleActivity_SecurityAccount() Error(90003)",data);
			WriteLog();
			SetupMainMenu();
			CurState = MAINMENU;
		    return;
	  }
		  

}



void CAVSDlg::HandleActivity_SecurityAccount( CActivity *newActivity)
{

	 char data[255] = {0};
	 lstrcpyn(data, newActivity->GetData(),255);

	 _Message.Format("HandleActivity_SecurityAccount() Data(%s)",data);
	  WriteLog();
	
	  if ( (strcmp(data,"'U") == 0) )
	  {
  	  		SetupMainMenu();
			CurState = MAINMENU;
		    return;
	  }

  	  if ( (strcmp(data,"'D") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'Y") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'N") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'C") == 0) )
	  {
		    return;
	  }	   	

		  if ( strlen(data) == 0 ) // enter no data
		  {
		  		SetupMainMenu();
				CurState = MAINMENU;
			    return;
		  }


  		   mThisAccount.copyid.Format("%s",data);
	  	   m_MyDatabase.ECashier_GetAccount((LPVOID)&mThisAccount,0);
			if ( mThisAccount.located == false)
			{
	 	   		 _Message.Format("Security Account not located");
				  WriteLog();

			  	  mThisLogin.accguid      = mThisAccount.accguid;
			   	  mThisLogin.cashierguid  = mThisCashier.accguid;
				  mThisLogin.copyid       = mThisAccount.copyid;
				  mThisLogin.copypin      = mThisAccount.copypin;
				  mThisLogin.result.Format("FAILURE");
				  mThisLogin.mode.Format  ("SECURITY");
				  m_MyDatabase.ECashier_LogLogin(&mThisLogin);
				  eCashierError( 90001 );
				  _Message.Format("HandleActivity_SecurityAccount() Error(90001)",data);
			      WriteLog();
				  
				  SetupMainMenu();
			      CurState = MAINMENU;
			      return;
			}
	


		  	if ( atoi(mThisAccount.access) != 3)
			{
	 	   		 _Message.Format("Security Account has insufficent access");
				  WriteLog();
				mThisLogin.accguid      = mThisAccount.accguid;
				mThisLogin.cashierguid  = mThisCashier.accguid;
				mThisLogin.copyid       = mThisAccount.copyid;
				mThisLogin.copypin      = mThisAccount.copypin;
				mThisLogin.result.Format("NOACCESS");
				mThisLogin.mode.Format  ("SECURITY");
				m_MyDatabase.ECashier_LogLogin(&mThisLogin);

				eCashierError( 90002,"No Access");
				_Message.Format("HandleActivity_SecurityAccount() Error(90002)",data);
			    WriteLog();
	
				SetupMainMenu();
			    CurState = MAINMENU;
			    return;
			}

			
			mThisLogin.accguid      = mThisAccount.accguid;
			mThisLogin.cashierguid  = mThisCashier.accguid;
			mThisLogin.copyid       = mThisAccount.copyid;
			mThisLogin.copypin      = mThisAccount.copypin;
			mThisLogin.result.Format("SUCCESS");
			mThisLogin.mode.Format  ("SECURITY");
			m_MyDatabase.ECashier_LogLogin(&mThisLogin);
		  
			mThisSecurity.accguid = mThisAccount.accguid;
			mThisSecurity.cashierguid = mThisCashier.accguid;

			SetupSecurityFunction();
		    CurState = SECURITYFUNCTION;

}


void CAVSDlg::HandleActivity_ResetMeters( CActivity *newActivity)
{

		 char data[255] = {0};
		 lstrcpyn(data, newActivity->GetData(),255);

		 _Message.Format("HandleActivity_ResetMeters Data(%s)",data);
		  WriteLog();
	
		  mThisSecurity.reset = 0;
		
	   	  if ( strstr(data,"'Y") )
		  {
			  AddValue_ResetMeters();
		      mThisSecurity.reset = 1;
		  }
	

		  // log the security transaction
		  m_MyDatabase.ECashier_LogSecurity( &mThisSecurity);

		  SetupMainMenu();
		  CurState = MAINMENU;
		  return;
}


void CAVSDlg::HandleActivity_PrintReceipt( CActivity *newActivity)
{

		 char data[255] = {0};
		 lstrcpyn(data, newActivity->GetData(),255);

		 _Message.Format("HandleActivity_PrintReceipt Data(%s)",data);
		  WriteLog();
	
		
	   	  if ( strstr(data,"'Y") )
		  {
			  if ( RcpType == RCP_ADDVALUE)
			        AddValue_PrintBankingReceipt();
			  if ( RcpType == RCP_ADDACCOUNT)
			        AddValue_PrintNewAccountReceipt();
		  }


		  SetupMainMenu();
		  CurState = MAINMENU;
		  return;
}


void CAVSDlg::HandleActivity_FundingType( CActivity *newActivity)
{

		 char data[255] = {0};
		 lstrcpyn(data, newActivity->GetData(),255);

		 _Message.Format("HandleActivity_FundingType Data(%s)",data);
		  WriteLog();
	
		
	   	  if ( strstr(data,"1") )
		  {
			
				AddValue_StartBanking();
				CurState = LIVEBANKING;
		  }
		  else if ( strstr(data,"2") )
		  {
	
			   eCashierError(40002,"No Credit Card/s"); 
			   SetupFundingType();
			   CurState = FUNDINGTYPE;
		  }
		  else if ( strstr(data,"3") )
		  {
			   eCashierError(40003,"No Debit Card/s");
  			   SetupFundingType();
			   CurState = FUNDINGTYPE;
		  }
		  else if ( strstr(data,"4") )
		  {
			   eCashierError(40004,"No Paypal");
			   SetupFundingType();
			   CurState = FUNDINGTYPE;
		 
		  } else {

			  SetupMainMenu();
			  CurState = MAINMENU;
		  }

		  return;
}



void CAVSDlg::HandleActivity_AddValueNum( CActivity *newActivity)
{

	  char data[255] = {0};
	  lstrcpyn(data, newActivity->GetData(),255);
	  
	  _Message.Format("HandleActivity_AddValueNum() Data(%s)",data);
	  WriteLog();

	  if ( (strcmp(data,"'U") == 0) )
	  {
  	  		SetupMainMenu();
			CurState = MAINMENU;
		    return;
	  }

  	  if ( (strcmp(data,"'D") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'Y") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'N") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'C") == 0) )
	  {
		    return;
	  }
	  	  
	  
	  if ( strlen(data) > 0 ) // enter no data
	  {
  			mThisAccount.copyid.Format("%s",data);
		
			if ( mThisCashier.pinrequired == true ) 
            {
				SetupAddValuePin();
				CurState = ADDVALUEPIN;
				return;
			}

			//////////////////////////////////////
			// verify account using the badge only
			// No Pin is Required
			///////////////////////////////////////
			m_MyDatabase.ECashier_GetAccount((LPVOID)&mThisAccount,0);
			if ( mThisAccount.located == false)
			{
				mThisLogin.accguid.Format("");
				mThisLogin.cashierguid = mThisCashier.accguid;
				mThisLogin.copyid  =  mThisAccount.copyid;
				mThisLogin.copypin = mThisAccount.copypin;
				mThisLogin.result.Format("FAILURE");
				mThisLogin.mode.Format  ("ADDVALUE");
				m_MyDatabase.ECashier_LogLogin(&mThisLogin);
				eCashierError( 30001 );
			    
			   _Message.Format("HandleActivity_AddValueNum() Error(30001)",data);
			    WriteLog();

				SetupMainMenu();
			    CurState = MAINMENU;
			    return;
			}


			////////////////////////////////////////////
			//ver 1.7 added to check for active session/
			////////////////////////////////////////////
			
			if ( m_MyDatabase.ECashier_IsActiveSession(	mThisAccount.accguid ) == 1)
			{
				mThisLogin.accguid.Format("");
				mThisLogin.cashierguid = mThisCashier.accguid;
				mThisLogin.copyid  =  mThisAccount.copyid;
				mThisLogin.copypin = mThisAccount.copypin;
				mThisLogin.result.Format("FAILURE");
				mThisLogin.mode.Format  ("ADDVALUE");
				m_MyDatabase.ECashier_LogLogin(&mThisLogin);
				//eCashierError( 30003 );
			  
				//Message.Format("HandleActivity_AddValueNum() Error(30003)",data);
			    WriteLog();

				SetupMainMenu();
			    CurState = MAINMENU;
			    return;
			}


			
			mThisLogin.accguid      = mThisAccount.accguid;
			mThisLogin.cashierguid  = mThisCashier.accguid;
			mThisLogin.copyid       = mThisAccount.copyid;
			mThisLogin.copypin      = mThisAccount.copypin;
			mThisLogin.result.Format("SUCCESS");
			mThisLogin.mode.Format  ("ADDVALUE");
			m_MyDatabase.ECashier_LogLogin(&mThisLogin);
			SetupClearScreen();
			SetupFundingType();
			CurState = FUNDINGTYPE;
			return;
	  
	  } else {

		SetupMainMenu();
		CurState = MAINMENU;
		return;

	  }
}



void CAVSDlg::HandleActivity_AddValuePin( CActivity *newActivity)
{

	  char data[255] = {0};
	  lstrcpyn(data, newActivity->GetData(),255);

	    _Message.Format("HandleActivity_AddValuePin Data(%s)",data);
	  WriteLog();

	 

	  if ( strlen(data) == 0 )      // enter pressed but no pin data
	  {
			  SetupMainMenu();
			  CurState = MAINMENU;
			  return;
	  
	  } else {
		  
		  // we have the pin data
		  ///////////////////////
		  if ( strlen(data) != 4 )      // enter pressed but no pin data
		  {
			   eCashierError(30002);
			   SetupAddValuePin();
			   CurState = ADDVALUEPIN;
			   return;
	  	  }

		
	  	    mThisAccount.copypin.Format("%s",data);

			m_MyDatabase.ECashier_GetAccount( (LPVOID)&mThisAccount,1);
			if ( mThisAccount.located == false)
			{
				  mThisLogin.accguid.Format("");
				  mThisLogin.cashierguid  = mThisCashier.accguid;
				  mThisLogin.copyid       = mThisAccount.copyid;
				  mThisLogin.copypin      = mThisAccount.copypin;
				  mThisLogin.result.Format("FAILURE");
				  mThisLogin.mode.Format  ("ADDVALUE");
				  m_MyDatabase.ECashier_LogLogin(&mThisLogin);
	 			  eCashierError( 30001 );
			
				  _Message.Format("HandleActivity_AddValuePin() Error(30001)",data);
			      WriteLog();
				  
				  SetupMainMenu();
				  CurState = MAINMENU;
				  return;
			}


			////////////////////////////////////////////
			//ver 1.7 added to check for active session/
			////////////////////////////////////////////
			if ( m_MyDatabase.ECashier_IsActiveSession(	mThisLogin.accguid ) == 1)
			{
				mThisLogin.accguid.Format("");
				mThisLogin.cashierguid = mThisCashier.accguid;
				mThisLogin.copyid  =  mThisAccount.copyid;
				mThisLogin.copypin = mThisAccount.copypin;
				mThisLogin.result.Format("FAILURE");
				mThisLogin.mode.Format  ("ADDVALUE");
				m_MyDatabase.ECashier_LogLogin(&mThisLogin);
				//eCashierError( 30003 );
			    
			   //_Message.Format("HandleActivity_AddValuePin() Error(30003)",data);
			    WriteLog();

				SetupMainMenu();
			    CurState = MAINMENU;
			    return;
			}


			mThisLogin.accguid      = mThisAccount.accguid;
			mThisLogin.cashierguid  = mThisCashier.accguid;
			mThisLogin.copyid       = mThisAccount.copyid;
			mThisLogin.copypin      = mThisAccount.copypin;
			mThisLogin.result.Format("SUCCESS");
			mThisLogin.mode.Format  ("ADDVALUE");
			m_MyDatabase.ECashier_LogLogin(&mThisLogin);

			SetupClearScreen();
			SetupFundingType();
			CurState = FUNDINGTYPE;
		    return;
	  }
}




void CAVSDlg::HandleActivity_NewAccountPin( CActivity *newActivity)
{

	  char Message[255] = {0};
	  char data[255] = {0};
	  lstrcpyn(data, newActivity->GetData(),255);

  	  _Message.Format("HandleActivity_NewAccountPin() data(%s)",data);
	  WriteLog();


   	  if ( (strcmp(data,"'C") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'U") == 0) )
	  {
  		    return;
	  }

  	  if ( (strcmp(data,"'D") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'Y") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'N") == 0) )
	  {
  		    return;
	  }

	  if ( strlen(data) == 0 )      // enter pressed but no pin data
	  {
			  SetupMainMenu();
			  CurState = MAINMENU;
		      return;
	  
	  } else {                      // we have the pin data

		  if ( strlen(data) != 4 )      // enter pressed but no pin data
		  {
			   eCashierError(20003,"4 digit pin only.!");
			   _Message.Format("HandleActivity_NewAccountPin() Error(20003)",data);
			   WriteLog();
			   SetupNewAccountPin();
			   CurState = NEWACCOUNTPIN;
			   return;
	  	  }
		  

			mThisAccount.copypin.Format("%s",data);
	 
			 /////////////////////////////////////
			 // so here we can add the new account
		     /////////////////////////////////////
             mThisAccount.ouguid = mThisCashier.ouguid;
   			 if ( m_MyDatabase.ECashier_CreateAccount ( (LPVOID)&mThisAccount) == true)
			 {
			
				 m_MyDatabase.ECashier_GetAccount( (LPVOID)&mThisAccount,1);
				
				 if ( mThisAccount.located == false)
				 {
	 				mThisLogin.accguid.Format("");
					mThisLogin.cashierguid = mThisCashier.accguid;
					mThisLogin.copyid  =  mThisAccount.copyid;
					mThisLogin.copypin = mThisAccount.copypin;
					mThisLogin.result.Format("FAILURE");
					mThisLogin.mode.Format  ("NEWACCOUNT");
					m_MyDatabase.ECashier_LogLogin(&mThisLogin);
					eCashierError( 20002 );
					_Message.Format("HandleActivity_NewAccountPin() Error(20002)",data);
			        WriteLog();
					SetupMainMenu();
					CurState = MAINMENU;
				
				 } else {
		
					mThisLogin.accguid = mThisAccount.accguid;
					mThisLogin.cashierguid = mThisCashier.accguid;
					mThisLogin.copyid  =  mThisAccount.copyid;
					mThisLogin.copypin = mThisAccount.copypin;
					mThisLogin.result.Format("SUCCESS");
					mThisLogin.mode.Format  ("NEWACCOUNT");
					m_MyDatabase.ECashier_LogLogin(&mThisLogin);

					RcpType = RCP_ADDACCOUNT;
				    SetupPrintReceipt();
				    CurState = PRINTRECEIPT;

					
//					AddValue_PrintNewAccountReceipt();
//					SetupClearScreen();
//					AddValue_StartBanking();
//					CurState = LIVEBANKING;
				}
				
				return;
			 }

			 SetupMainMenu();
			 CurState = MAINMENU;
		     return;
	  }
}



void CAVSDlg::HandleActivity_NewAccountNum( CActivity *newActivity)
{
	  char Message[255] = {0};
	  char data[255] = {0};
	  lstrcpyn(data, newActivity->GetData(),255);
	  _Message.Format("HandleActivity_NewAccountNum() Data(%s)",data);
	  WriteLog();
	 
  	  if ( (strcmp(data,"'C") == 0) )
	  {
		    return;
	  }

	  if ( (strcmp(data,"'U") == 0) )
	  {
  	   		SetupMainMenu();
			CurState = MAINMENU;
		    return;
	  }

  	  if ( (strcmp(data,"'D") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'Y") == 0) )
	  {
  		    return;
	  }

	  if ( (strcmp(data,"'N") == 0) )
	  {
  		    return;
	  }

  
	  if ( strlen(data) > 0 )      // enter no data go back to mainmenu
	  {
			  
		  mThisAccount.copyid.Format("%s",data);

		  if ( m_MyDatabase.ECashier_IsAccountNumAvailible( (LPVOID)&mThisAccount) == false)
		  {

			    eCashierError(20002, "Try another Acct.#");
			    _Message.Format("HandleActivity_NewAccountNum() Error(20002)",data);
			    WriteLog();

			    SetupNewAccountNum();
			    CurState = NEWACCOUNTNUM;
			    return; 
		  }
		   
		  if ( mThisCashier.pinrequired == true ) 
          {
				SetupNewAccountPin();
				CurState = NEWACCOUNTPIN;
				return;
		  } 
		  
		  /////////////////////////////////////
		  // we are here because we do not need a pin
		  // for any new accounts
	  	  // so here we can add the new account
		  /////////////////////////////////////
          mThisAccount.ouguid = mThisCashier.ouguid;
   		  if ( m_MyDatabase.ECashier_CreateAccount ( (LPVOID)&mThisAccount) == true)
		  {
			 
		 		//////////////////////////////////////
	  			// verify account using the badge only
				// No Pin is Required
				///////////////////////////////////////
				m_MyDatabase.ECashier_GetAccount((LPVOID)&mThisAccount,0);
				if ( mThisAccount.located == false)
				{
	 					mThisLogin.accguid.Format("");
						mThisLogin.cashierguid = mThisCashier.accguid;
						mThisLogin.copyid  =  mThisAccount.copyid;
						mThisLogin.copypin = mThisAccount.copypin;
						mThisLogin.result.Format("FAILURE");
						mThisLogin.mode.Format  ("NEWACCOUNT");
						m_MyDatabase.ECashier_LogLogin(&mThisLogin);
						eCashierError( 20002 );
					    _Message.Format("HandleActivity_NewAccountNum() Error(20002)",data);
						WriteLog();
						SetupMainMenu();
						CurState = MAINMENU;
				
				} else {
	
					mThisLogin.accguid = mThisAccount.accguid;
					mThisLogin.cashierguid = mThisCashier.accguid;
					mThisLogin.copyid  =  mThisAccount.copyid;
					mThisLogin.copypin = mThisAccount.copypin;
					mThisLogin.result.Format("SUCCESS");
					mThisLogin.mode.Format  ("NEWACCOUNT");
					m_MyDatabase.ECashier_LogLogin(&mThisLogin);
				    
					RcpType = RCP_ADDACCOUNT;
				    SetupPrintReceipt();
				    CurState = PRINTRECEIPT;
					
			//		AddValue_PrintNewAccountReceipt();
		//			SetupClearScreen();
		//			AddValue_StartBanking();
		//			CurState = LIVEBANKING;
				}
				
				return;
	  
		  }

	 }
	  
	 SetupMainMenu();
	 CurState = MAINMENU;
	 return;

}

void CAVSDlg::SetupInitialize()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Line[20] = {0};

	// Line 1
	sprintf(Line,"www.docugate.biz");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen(Line);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"NPS Inc");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 8;
	packet.lenS = strlen(Line);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"2203 North Lois Ave");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 2;
	packet.lenS = strlen(Line);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Tampa,FL 33607");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 4;
	packet.lenS = strlen(Line);
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	CTime t = CTime::GetCurrentTime();
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x14;
	packet.df = NAT_DF_XBYTES;
	packet.lenX = 7;
	packet.dataX[0] = 20;
	packet.dataX[1] = t.GetYear()-2000;
	packet.dataX[2] = t.GetMonth();
	packet.dataX[3] = t.GetDay();
	packet.dataX[4] = t.GetHour();
	packet.dataX[5] = t.GetMinute();
	packet.dataX[6] = t.GetSecond();
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x37;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = '$';
	packet.data8[1] = 2;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}


void CAVSDlg::SetupAddValueNum()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[25] = {0};
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"TOUCH ON IBUTTON");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"OR ENTER ACCOUNT #");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"AND PRESS ENTER");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 3;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"ACCOUNT #:");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 4;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the keyboard mode
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 4;
	packet.data8[2] = 14;
	packet.data8[3] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the Cursor pos
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x31;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = 4;
	packet.data8[1] = 14;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}



void CAVSDlg::SetupAddValuePin()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[25] = {0};
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"ENTER ACCOUNT PIN #");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 1;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"AND PRESS ENTER");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"4 DIGIT PIN #:");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 3;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


		// set the keyboard mode
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 3;
	packet.data8[2] = 16;
	packet.data8[3] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the Cursor pos
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x31;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = 3;
	packet.data8[1] = 16;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}





void CAVSDlg::AddValue_EndBanking()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	// Line 1
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x26;
	packet.df = NAT_DF_NONE;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}



void CAVSDlg::AddValue_PrintLifeMeters()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Line[255] = {0};
	long DollarTotal = 0;


	sprintf(Line,"Institution: %s", mThisCashier.institution);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	CTime t = CTime::GetCurrentTime();

	sprintf(Line,"Date       : %s", t.Format("%x") );
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Line,"Time       : %s", t.Format("%X") );
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Line,"ECashier   : %s", mThisCashier.badge);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Operator   : %s", mThisAccount.copyid);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x01;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Non Resettable Meters");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x09;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line, "Bill    Quantity      Amount");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill1.BillValue/100, mThisBills.Bill1.BillCount, mThisBills.Bill1.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill2.BillValue/100, mThisBills.Bill2.BillCount, mThisBills.Bill2.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill3.BillValue/100, mThisBills.Bill3.BillCount, mThisBills.Bill3.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill4.BillValue/100, mThisBills.Bill4.BillCount, mThisBills.Bill4.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill5.BillValue/100, mThisBills.Bill5.BillCount, mThisBills.Bill5.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	DollarTotal += mThisBills.Bill1.Amount;
	DollarTotal += mThisBills.Bill2.Amount;
	DollarTotal += mThisBills.Bill3.Amount;
	DollarTotal += mThisBills.Bill4.Amount;
	DollarTotal += mThisBills.Bill5.Amount;
	DollarTotal += mThisBills.Bill6.Amount;
	DollarTotal += mThisBills.Bill7.Amount;

	sprintf(Line,"Total                 $%d.00", DollarTotal/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x09;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x40;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x80;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}



void CAVSDlg::AddValue_PrintOnHandMeters()
{


	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Line[255] = {0};
	long DollarTotal = 0;


	sprintf(Line,"Institution: %s", mThisCashier.institution);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	CTime t = CTime::GetCurrentTime();

	sprintf(Line,"Date       : %s", t.Format("%x") );
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Line,"Time       : %s", t.Format("%X") );
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Line,"ECashier   : %s", mThisCashier.badge);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Operator   : %s", mThisAccount.copyid);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x01;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Resettable Meters");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x09;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line, "Bill    Quantity      Amount");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill1.BillValue/100, mThisBills.Bill1.BillCount, mThisBills.Bill1.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill2.BillValue/100, mThisBills.Bill2.BillCount, mThisBills.Bill2.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill3.BillValue/100, mThisBills.Bill3.BillCount, mThisBills.Bill3.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill4.BillValue/100, mThisBills.Bill4.BillCount, mThisBills.Bill4.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"$%-7d%-14d$%d.00",mThisBills.Bill5.BillValue/100, mThisBills.Bill5.BillCount, mThisBills.Bill5.Amount/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	DollarTotal += mThisBills.Bill1.Amount;
	DollarTotal += mThisBills.Bill2.Amount;
	DollarTotal += mThisBills.Bill3.Amount;
	DollarTotal += mThisBills.Bill4.Amount;
	DollarTotal += mThisBills.Bill5.Amount;
	DollarTotal += mThisBills.Bill6.Amount;
	DollarTotal += mThisBills.Bill7.Amount;

	sprintf(Line,"Total                 $%d.00", DollarTotal/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x09;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x40;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x80;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}

////////////////////////////////
// print a new account receipt//
////////////////////////////////

void CAVSDlg::AddValue_ResetMeters()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x51;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0xFF;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}


void CAVSDlg::AddValue_GetBillValues()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x4C;
	packet.df = NAT_DF_NONE;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}


void CAVSDlg::AddValue_GetLifeBills()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x50;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x08;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}


void CAVSDlg::AddValue_GetOnHandsBills()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x50;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x00;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}


void CAVSDlg::AddValue_PrintBankingReceipt()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Line[255] = {0};
	long DollarTotal = 0;



	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = 32;
	lstrcpy((char *)packet.dataS, "--------------------------------");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen("eCashier Receipt");
	lstrcpy((char *)packet.dataS, "eCashier Receipt");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	CTime t = CTime::GetCurrentTime();
	sprintf(Line,"%s", t.Format("%c") );
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"eCashier # %s", mThisCashier.badge);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Institution: %s", mThisCashier.institution);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = 32;
	lstrcpy((char *)packet.dataS, "--------------------------------");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Funding Transaction",mThisTransaction.transid);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Trans #%.10s",mThisTransaction.transid);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x01;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	int offset = strlen(mThisAccount.copyid);
	offset -= 4;
	if ( offset < 0)
         offset = 0;

	sprintf(Line,"Account #    : ********%.4s",mThisAccount.copyid.Mid(offset,4));
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

//  Print the Full Name
//	sprintf(Line,"Name: %.20s", mThisAccount.fullname);
//	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
//	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
//	packet.fc = 0x38;
//	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
//	packet.data8[0] = 0x01;
//	packet.lenS = strlen(Line);
//	lstrcpy((char *)packet.dataS, Line);
//	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
//	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Start Balance: $%.2f",(float)mThisAccount.startbalance/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Escrowed     : $%.2f",(float)mThisAccount.escrowed/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"End Balance  : $%.2f",(float)mThisAccount.endbalance/100);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);



	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x40;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x80;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}



void CAVSDlg::AddValue_PrintNewAccountReceipt()
{
	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Line[255] = {0};


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = 32;
	lstrcpy((char *)packet.dataS, "--------------------------------");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen("eCashier Receipt");
	lstrcpy((char *)packet.dataS, "eCashier Receipt");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	CTime t = CTime::GetCurrentTime();
	sprintf(Line,"%s", t.Format("%c") );
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"eCashier # %s", mThisCashier.badge);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Institution: %s", mThisCashier.institution);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = 32;
	lstrcpy((char *)packet.dataS, "--------------------------------");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	/// here we go
	sprintf(Line,"New Account Transaction");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Trans #%.10s",mThisTransaction.transid);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x0A;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x01;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	int offset = strlen(mThisAccount.copyid);
	offset -= 4;
	if ( offset < 0)
         offset = 0;

	sprintf(Line,"Account  #:********%.4s",mThisAccount.copyid.Mid(offset,4));
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
	
	sprintf(Line,"Pin      #:****");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Line,"Balance  $$: 0.00");
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1|NAT_DF_STRING;
	packet.data8[0] = 0x01;
	packet.lenS = strlen(Line);
	lstrcpy((char *)packet.dataS, Line);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
	
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x40;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x38;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 0x80;
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}



void CAVSDlg::AddValue_StartBanking()
{
	

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  message[255];

	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 1
	sprintf(message,"Acc  : %.13s", mThisAccount.fullname);
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 1;
	packet.data8[1] = 1;
	packet.lenS = strlen(message);
	lstrcpy((char *)packet.dataS, message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 2;
	packet.data8[1] = 1;
	packet.lenS = strlen("Funds:");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Funds:");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 2
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 3;
	packet.data8[1] = 1;
	packet.lenS = strlen("Enter $1,$5,$10,$20");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Enter $1,$5,$10,$20");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	// Line 4
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.data8[0] = 4;
	packet.data8[1] = 1;
	packet.lenS = strlen("Press ENTER to end");
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	lstrcpy((char *)packet.dataS, "Press ENTER to end");
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	////////////////////////
	// Start Banking Session
	////////////////////////
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x25;
	packet.df = NAT_DF_16BIT1;
	packet.data16[0] = 120;
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x28;
	packet.df = NAT_DF_8BIT1;
	packet.data8[0] = 2;
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x24;
	packet.df = NAT_DF_XBYTES;
	packet.lenX = 4;
	long *pData = (long *)&packet.dataX[0];
	*pData = htonl(mThisAccount.startbalance);
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}

void CAVSDlg::AddValue_SendBillAck()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0xA7;
	packet.df = NAT_DF_NONE;
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}

void CAVSDlg::SetupNewAccountNum()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[25] = {0};
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"TOUCH ON IBUTTON");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 1;
	packet.data8[1] = 3;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"OR ENTER ACCOUNT #");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"AND PRESS ENTER");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 3;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"ACCOUNT #:");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 4;
	packet.data8[1] = 4;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the keyboard mode
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 4;
	packet.data8[2] = 14;
	packet.data8[3] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the Cursor pos
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x31;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = 4;
	packet.data8[1] = 14;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

}

void CAVSDlg::SetupNewAccountPin()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;
	char  Message[25] = {0};
	
	// Clear Screen
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc        = NAT_A_CLEAR;
	packet.df        = NAT_DF_NONE;
	Size             = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	sprintf(Message,"ENTER ACCOUNT PIN #");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 1;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"AND PRESS ENTER");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 2;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


	sprintf(Message,"4 DIGIT PIN #:");
    ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_DISP_AT;
	packet.df = NAT_DF_8BIT2|NAT_DF_STRING;
	packet.data8[0] = 3;
	packet.data8[1] = 2;
	packet.lenS = strlen(Message);
	lstrcpy((char *)packet.dataS, Message);
	Size          = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);


		// set the keyboard mode
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_KEY_MODE;
	packet.df = NAT_DF_8BIT4;
	packet.data8[0] = 0x01;
	packet.data8[1] = 3;
	packet.data8[2] = 16;
	packet.data8[3] = 0x01;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);

	// set the Cursor pos
	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = 0x31;
	packet.df = NAT_DF_8BIT2;
	packet.data8[0] = 3;
	packet.data8[1] = 16;
	Size            = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);
	SetDataToSend((LPSTR)&Buffer[0],Size);
}





int CAVSDlg::PingNat()
{

	_NetcashPacket packet;
	BYTE Buffer[255];
	long  Size;

	ZeroMemory((LPVOID)&packet, sizeof( _NetcashPacket) );
	ZeroMemory((LPVOID)&Buffer, sizeof( Buffer)      );
	packet.fc = NAT_A_PING;
	packet.df = NAT_DF_NONE;
	Size      = Packet2Buffer(&packet, (BYTE *)&Buffer[0]);

	CTime Now = CTime::GetCurrentTime();
	CTime Current;
	CTimeSpan Lasped;
	DataReceived = 0;
	SetDataToSend((LPSTR)&Buffer[0],Size);
	return 0;

}

void CAVSDlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CTime t = CTime::GetCurrentTime();
 //	CString Message;

   // this timer goes off only once we succesfully connect
   // establishes the AVS Unit
	//////////////////////////////////////////////////////
   if (nIDEvent == 100)
   {
		KillTimer(mInitAvs);
	    _Message.Format("Initilizing eCashier(%s) at %s",mThisCashier.address,t.Format("%c"));
	    WriteLog();
	
		SetupInitialize();
		DoEvents();
		Sleep(2000);
		SetupMainMenu();
		SecsSinceLastPong  = 0;
		CurState           = MAINMENU;
		((CAVSApp *)AfxGetApp())->SetKeyBoardBufferState(0);
		mPingTimer         = SetTimer(99, 1000,0); 
		mActivityTimer     = SetTimer(97, 100, 0); 
   }


	if (nIDEvent == 99)
    {
	
		if ( SecsSinceLastPong >= 3) 
		{
			KillTimer(mPingTimer);
			KillTimer(mActivityTimer);
  			SetConnected(false);

		    _Message.Format("No Pong for 3 Seconds");
		    WriteLog();

		} else {
			
			PingNat();
			SecsSinceLastPong++;
		}
   }

   
   if (nIDEvent == 98)
   {
		KillTimer(mConnectTimer);
	    _Message.Format("Establishing TCP Connection");
   	    WriteLog();

		SetTimeout(0);
		SetRemoteHost( mThisCashier.address);
		SetRemotePort( 1070 );
		SetLinger(FALSE);
		SetConnected(true);
   }


   // this is where we process activity objects
   // and Decide what to do
   if (nIDEvent == 97)
   {

		ElementCount = 	Activitylist.GetCount();
		
		if ( ElementCount > 0 ) // we have items
		{
		
			 CActivity *newActivity = (CActivity *)Activitylist.GetHead();
			 Activitylist.RemoveHead();
			
				if ( newActivity->GetType() == 0x91) //is this a pong
				{
					SecsSinceLastPong = 0;
					_Message.Format("Pong Received @ %s",newActivity->GetData() );
					m_sta.SetWindowText(_Message);
			
				
				}else{
					
					switch(CurState)
					{
						case MAINMENU:			HandleActivity_MainMenu(newActivity);
												break;
						case ADDVALUENUM:		HandleActivity_AddValueNum(newActivity);
												break;
						case ADDVALUEPIN:		HandleActivity_AddValuePin(newActivity);
												break;
						case NEWACCOUNTNUM:		HandleActivity_NewAccountNum(newActivity);
												break;
						case NEWACCOUNTPIN:		HandleActivity_NewAccountPin(newActivity);
												break;
						case SECURITYFUNCTION:  HandleActivity_SecurityFunction(newActivity);
										        break;
						case SECURITYACCOUNT:   HandleActivity_SecurityAccount(newActivity);
												break;
						case LIVEBANKING:		HandleActivity_LiveBanking(newActivity);
												break;
						case RESETMETERS:		HandleActivity_ResetMeters(newActivity);
												break;
						case PRINTRECEIPT:		HandleActivity_PrintReceipt(newActivity);
												break;
						case FUNDINGTYPE:		HandleActivity_FundingType(newActivity);
												break;
					}

				}
		
			delete newActivity;

		} // end of if ( ElementCount > 0 )
   
   } // end of if (nIDEvent == 97)
	
	CDialog::OnTimer(nIDEvent);
}


void CAVSDlg::WriteLog(void)
{
	 
	CTime t = CTime::GetCurrentTime();
    CString Message;
	Message.Format("%s|%s",t.Format("%c"), _Message);
	
	m_LastData.SetWindowText(Message);
	m_DataList.InsertString(0,Message);

	////////////////////////////////////////////
	// also write this message to the log file//
	////////////////////////////////////////////
	char pFileName[MAX_PATH]= {0};
	char path_buffer[_MAX_PATH] = {0};
	char drive[_MAX_DRIVE]= {0};
    char dir[_MAX_DIR]= {0};
    char fname[_MAX_FNAME]= {0};
    char ext[_MAX_EXT]= {0};
    memset( path_buffer, 0, sizeof( path_buffer ) );
    memset( drive,       0, sizeof( drive ) );
    memset( dir,         0, sizeof( dir ) );
    memset( fname,       0, sizeof( fname ) );
    memset( ext,         0, sizeof( ext ) );

	GetModuleFileName( 0, path_buffer, 1023 );
    _splitpath ( path_buffer, drive, dir, fname, ext );
	if ( mThisCashier.badge.IsEmpty() )
		 mThisCashier.badge.Format("DGC_AVS");

	sprintf(pFileName,"%s%s%s.log",drive,dir,mThisCashier.badge);
	
	CFile f;
	CFileException ex;
	DWORD dwActual = 0;

	if( f.Open( pFileName, CFile::modeRead | CFile::shareDenyWrite, &ex) !=0)
	{
		dwActual = f.SeekToEnd();
		f.Close();
	
		if ( dwActual >=  500000)
	        DeleteFile(pFileName);
	}
	

	FILE *fp = fopen(pFileName, "a");
	if (fp)
	{
		 fputs(Message,fp);
		 fputs("\n",fp);
		 fclose(fp);
	}

	return;
}



