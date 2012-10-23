#if !defined(AFX_STDAFX_H__7C03A5A1_5A67_464F_AFC8_6FD25814D2B5__INCLUDED_)
#define AFX_STDAFX_H__7C03A5A1_5A67_464F_AFC8_6FD25814D2B5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers

#include <afx.h>
#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#include <afxdisp.h>
#include <afxtempl.h>
#include <afxmt.h>
#include <afxcoll.h>
#include <afxdb.h>
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// MFC support for Windows Common Controls
#endif // _AFX_NO_AFXCMN_SUPPORT


// Windows Header Files:
#include <windows.h>

// C RunTime Header Files
#include <stdlib.h>
#include <malloc.h>
#include <memory.h>
#include <tchar.h>

// TODO: reference additional headers your program requires here
#include <iostream>
#include <winbase.h>
#include <stdio.h>
#include <io.h>
#include "ipworks.h"
#include "IniEx.h"
#include "activeaccounts.h"

// Local Header Files
#include "ActivationTimer.h"


const char strModule[]  = "DGC_MCR";
const char strVersion[] = "7.3";


typedef struct _NetcashDevice
{
	char	CopyAccount[51];
	char	CopyPassword[51];
	int     RequirePin;

	//Lynette Austin - added these two lines
	char	CopyClient[51];
	char	CopyMatter[51];
	//
	char	CopyTask1[51];
	char	CopyTask2[51];
   
	char	Group[51];
	char	GroupCharge[51];
	UCHAR   GroupLocked;
	char	GroupClient[51];
	char	GroupMatter[51];
	char	GroupName[51];

	
	long	AccountID;
	char	AccountGUID[51];
	char	Account[51];
	char	AccountDomain[51];
	char	AccountCharge[51];
	char	Balance[51];
	char	AccountClient[51];
	char	AccountMatter[51];
	UCHAR   AccountLocked;
	UCHAR   AllowNeg;


	long	 DeviceID;
	char	 DeviceName[51];
	char	 DeviceLocation[51];
	UCHAR	 DeviceLocked;
	char 	 DeviceCount[51];
	

	char	 Copies[51];
	char	 CopyCost[51];
	char	 Document[51];
	
	long    StationID;
	char    Location[51];
	char	Address[51];
	char	Mask[51];
	char	Gateway[51];
	char	Activity[51];

	char    ErrorDescr[51];
	int	    State;
	int     Error;
	
	float   MonoCost;
	float   ColorCost;

	float   SFBW;
	float   LFBW;
	float   SFCOLOR;
	float   LFCOLOR;
	float   SITE_MULTIPLR;
	float   HIGHEST_COST;
		
	short   OffLineMax;
	UCHAR   UseColor;

	float   QCCost;
	char	QCClient[51];
	char	QCMatter[51];
	char	QCCode[51];
	
	char	Client[51];
	char	Matter[51];


	char    ThreadID[51];
	

	UCHAR   Currency;
	UCHAR   Decimal;
	UCHAR   EnablePassword;
	UCHAR   EnableSecure;
	UCHAR   EnableQC;
	bool    PasswordRcved;

	float StartSessionBalance;
	float StartSessionCost;
	float CurSessionBalance;
	float CurSessionCost;
	long  CurSessionCount;
	
	long  InitCount;
	float InitBalance;

	long  OfflineCount;
	float OfflineCost;

	UCHAR Charging;

	//peterd added this 1 31/7/2007
	float pl[10];

	//peterd added this 1/13/2009
	char CustomPL[10];

	//peterd added this 3/15/2010
	int         UnitValueEnabled;
	char        UnitValue[10];
	char		UnitGUID[51];
	char		InsertGUID[51];
	int			plCounter[5];
	ULONG       maxspend;
	int         maxspendenabled;

	ULONG       Accmaxspend;
	ULONG       Oumaxspend;
	ULONG       Globalmaxspend;
	int         AccmaxspendEnabled;
	int         OumaxspendEnabled;
	int         GlobalmaxspendEnabled;

	float  	    pl1CustomCost;
	float 	    pl2CustomCost;
	float 	    pl3CustomCost;
	float  	    pl4CustomCost;
	int			plCustomCostEnabled;


} NetcashDevice;



typedef unsigned char uint8;
typedef unsigned short UINT16;
typedef signed char INT8;
typedef signed short INT16;

const uint8 NAT_MYMAC_msg[4] = {
	1,		// SOP
	0x10,	// fc = MYMAC
	0,		// df = NONE
	0x10,	// checksum
};

const uint8 NAT_LOCATION_msg[4] = {
	1,		// SOP
	0x4A,	// fc = LOCATION
	0,		// df = NONE
	0x4A,	// checksum
};

const uint8 NAT_SW_VERSION_msg[4] = {
	1,		// SOP
	0x13,	// fc = SW_VERSION
	0,		// df = NONE
	0x13,	// checksum
};

typedef struct _TagAuditorIni 
{
	char CONNECT[255];
	char DBMS[50];

}AuditorIni;



typedef struct _TagStation 
{
	char        UnitAddress[50];
	char        UnitPort[10];
	char        IdleReset[10];
	char  		ReqCopyClient[5];
	char    	ReqCopyMatter[5];
	char		ReqPin[5];
    int         UnitConnected;
	int         UnitActive;
	char  		PulseIdle[10];
	char    	Keyboard[10];
	char		Debug[5];
	char        CustomPL[10];
	int         UnitValueEnabled;
	char        UnitValue[10];
	char	    UnitGUID[51];
	float  	    pl1CustomCost;
	float  	    pl2CustomCost;
	float  	    pl3CustomCost;
	float 	    pl4CustomCost;
	int			plCustomCostEnabled;


}TagStation;



#define NAT_STX_BYTE		0	// 1
#define NAT_FC_BYTE			1	// 1
#define NAT_DF_BYTE			2	// 1
#define NAT_DATA_BYTE		3	// 0
#define NAT_DATA8			4	// 4
#define NAT_DATA16			5	// 8
#define NAT_DATA_SLEN		6	// 1
#define NAT_DATA_STR		7	// 40
#define NAT_DATA_XLEN		8	// 1
#define NAT_DATA_DATAX		9	// 44
#define NAT_CS_BYTE			10	// 1

/* Data Format bitmap defines */
#define NAT_DF_NONE		0x00

#define NAT_DF_8BITX	0x03
#define NAT_DF_8BIT1	0x01
#define NAT_DF_8BIT2	0x02
#define NAT_DF_8BIT4	0x03

#define NAT_DF_16BITX	0x0C
#define NAT_DF_16BIT1	0x04
#define NAT_DF_16BIT2	0x08
#define NAT_DF_16BIT4	0x0C

#define NAT_DF_STRING	0x10
#define NAT_DF_XBYTES	0x20
#define NAT_DF_ERROR	0x80

/* Function codes */
#define NAT_A_MYMAC			0x10
#define NAT_A_PING			0x11
#define NAT_A_RESET			0x12
#define NAT_A_SW_VERSION	0x13
#define NAT_A_CLOCK			0x14
#define NAT_A_CON_TIMER		0x15

#define NAT_A_AUTHORIZE		0x20
#define NAT_A_BALANCE		0x21
#define NAT_A_VALUES		0x22
#define NAT_A_COUNTER		0x23
#define NAT_A_SES_START		0x24
#define NAT_A_SES_TIMOUT	0x25
#define NAT_A_SES_END		0x26
#define NAT_A_NEW_PAGE		0x27
#define NAT_A_NEW_VALUE		0x27
#define NAT_A_DISP_BAL		0x28
#define NAT_A_DSP_CARD		0x29

#define NAT_A_CLEAR			0x30
#define NAT_A_DISP_AT		0x31
#define NAT_A_DISP_CHAR		0x32
#define NAT_A_KEY_MODE		0x33
#define NAT_A_KEY_TIMEOUT	0x34
#define NAT_A_USER_DATA		0x35
#define NAT_A_FLTR_ACCNT	0x36
#define NAT_A_CURRENCY		0x37
#define NAT_A_RECEIPT		0x38

#define NAT_A_PL_CONFIG		0x40
#define NAT_A_RELAY_CONFIG	0x41
#define NAT_A_PL_BLIND		0x42
#define NAT_A_PL_LENGTH		0x43
#define NAT_A_PL_POL		0x44
#define NAT_A_MY_IP			0x45
#define NAT_A_MY_NETMASK	0x46
#define NAT_A_MY_GATEWAY	0x47
#define NAT_A_MY_PORT		0x48
#define NAT_A_DHCP			0x49
#define NAT_A_LOCATION		0x4A
#define NAT_A_ENCRYPT_KEY	0x4B
#define	NAT_A_BNC_VALUES	0x4C
#define	NAT_A_BNC_ENABLES	0x4D
#define	NAT_A_BNC_STATUS	0x4E

#define NAT_A_NUM_TRANS		0x60
#define NAT_A_GET_TRANS		0x61
#define NAT_A_CLEAR_TRANS	0x62
#define NAT_A_OL_CONFIG		0x63
#define NAT_A_OL_MAX_VALUE	0x64
#define NAT_A_OL_MODE		0x65
#define NAT_A_OOS_MSG		0x66
#define NAT_A_ACCNT_ADD		0x67
#define NAT_A_ACCNT_CLEAR	0x68

/* Error codes */
#define NAT_ERR_CHECKSUM		0x00
#define NAT_ERR_BAD_CODE		0x01
#define NAT_ERR_DATA_MISSING	0x02
#define NAT_ERR_DATA_BAD		0x03
#define NAT_ERR_OOR				0x04
#define NAT_ERR_STR_LEN_OOR		0x05
#define NAT_ERR_SET_ACCOUNT		0x06
#define NAT_ERR_SET_CLOCK		0x07

/* NAT_A_SES_END codes */
#define NAT_SES_END_USER	0x01 // User ended session.
#define NAT_SES_END_FUNDS	0x02 // Out of funds
#define NAT_SES_END_SERVER	0x03 // Server ended session.
#define NAT_SES_END_TIMEOUT	0x04 // Session timeout
#define NAT_SES_END_RESET	0x05 // Reset command received
#define NAT_SES_END_JAM		0x06 // paper jam
#define NAT_SES_END_BNC		0x07 // bill or coin error


#define MONEY_NOCHARGE		0x00
#define MONEY_DEBIT	  	    0x01
#define MONEY_CREDIT	    0x02

#include "database.h"

extern void PauseServiceNow			 ( void );
extern void ContinueServiceNow		 ( void );
extern HANDLE hGlobalThreadWait;
extern UINT DiscoverySearchThread    (VOID *);
extern UINT DiscoveryResultThread    (VOID *);
extern UINT WorkerThread             (VOID *);
extern UINT DatabaseChecker          (VOID *);	
extern UINT NetCashActivationThread  (VOID * );
extern UINT HandleLicenseThread      (VOID * );


#define MSSQL		0x00
#define MYSQL 	    0x01
#define ORACLE	    0x02


extern  TagStation Stations[];
extern	CCriticalSection m_DBLock;
extern  void  WriteLog	(LPSTR pMessage, LPSTR pDebugMode);
extern  void  WriteLog	(CString &pMessage, LPSTR pDebugMode);
extern	CCriticalSection mWriteLog;
extern  CIniEx m_gIni;
extern  CStringArray    m_gStationArray;
extern  CString         m_gConnect;
extern  CActiveAccounts m_ActiveAccounts;



//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__7C03A5A1_5A67_464F_AFC8_6FD25814D2B5__INCLUDED_)
