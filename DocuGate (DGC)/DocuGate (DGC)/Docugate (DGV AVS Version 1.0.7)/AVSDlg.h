// AVSDlg.h : header file
//

#if !defined(AFX_AVSDLG_H__154960E2_9D03_481A_B4EF_B506836B4DA0__INCLUDED_)
#define AFX_AVSDLG_H__154960E2_9D03_481A_B4EF_B506836B4DA0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CAVSDlg dialog

class CAVSDlg:public CDialog, public IPPort
{

public:
	
	void WriteLog( void);
	
public:

	eCashier	 mThisCashier;
	eAccount	 mThisAccount;
	eBills	     mThisBills;
	eTransaction mThisTransaction;
    eLogin       mThisLogin;
    eSecurity    mThisSecurity;

	CObList  Activitylist;
    DWORD    ElementCount;

	virtual INT FireDataIn(LPSTR &lpText, USHORT FAR &lenText, BOOL &bEOL );
	virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription );
	virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription );
	virtual INT FireConnected(USHORT &usStatusCode, LPTSTR &lpszDescription);

	void SetupMainMenu();
	void SetupClearScreen();	
	void eCashierError( int Errornum );
	void eCashierError( int Errornum, LPSTR pMsg);
	void eCashierPrintingReceipt();
	

	void SetupInitialize();

	void SetupNewAccountNum();
	void SetupNewAccountPin();

	void SetupAddValueNum();
	void SetupAddValuePin();

	void SetupSecurityFunction();
	void SetupSecurityAccount();

	void SetupDatabaseFailure(int err);
	void SetupDuplicateAccount(void);

	void SetupResetMeters(void);
	void SetupPrintReceipt(void);
	void SetupFundingType(void);

	void AddValue_StartBanking();
	void AddValue_EndBanking();

	void AddValue_PrintBankingReceipt(void);
	void AddValue_PrintNewAccountReceipt(void);

	void AddValue_PrintOnHandMeters(void);
	void AddValue_PrintLifeMeters(void);

	void AddValue_GetBillValues  (void);
	void AddValue_GetLifeBills   (void);
	void AddValue_GetOnHandsBills(void);
	void AddValue_ResetMeters    (void);

	char KeyBuffer[255];
	int  KeyBufferActive;

	void HandleActivity_MainMenu		  (CActivity *pActivity);
	void HandleActivity_AddValueNum		  (CActivity *pActivity);
	void HandleActivity_AddValuePin       (CActivity *pActivity);
	void HandleActivity_NewAccountNum     (CActivity *pActivity);
	void HandleActivity_NewAccountPin     (CActivity *pActivity);
	void HandleActivity_SecurityFunction  (CActivity *pActivity);
	void HandleActivity_SecurityAccount   (CActivity *pActivity);
	void HandleActivity_LiveBanking       (CActivity *pActivity);
	void HandleActivity_ResetMeters       (CActivity *pActivity);
	void HandleActivity_PrintReceipt      (CActivity *pActivity);
	void HandleActivity_FundingType       (CActivity *pActivity);

	int PingNat();
	int DataReceived;
	void AddValue_SendBillAck();

	unsigned int mPingTimer;
	unsigned int mConnectTimer;
	unsigned int mActivityTimer;
	unsigned int mInitAvs;

	int SecsSinceLastPong;
	protocolstate curstate;

	int CurState;
	int RcpType;

	BYTE    pBuf[512];
	int  Length;
	LPBYTE  pData;
	int x;
	HANDLE mp;


	CString m_sqlserver;
	CString m_avsunit;
	CString m_cmdline; 

// Construction
public:
	CAVSDlg(CWnd* pParent = NULL);	// standard constructor
	CMyDatabase m_MyDatabase;
//	CIniEx	    m_IniClass;
	CString     m_Inipath;
	CString     m_Server;
	CString     m_Connect;
	int         m_MyDatabaseErr;

	CString _Message;

// Dialog Data
	//{{AFX_DATA(CAVSDlg)
	enum { IDD = IDD_AVS_DIALOG };
	CEdit	m_LastData;
	CEdit	m_sta;
	CListBox	m_DataList;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAVSDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CAVSDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_AVSDLG_H__154960E2_9D03_481A_B4EF_B506836B4DA0__INCLUDED_)
