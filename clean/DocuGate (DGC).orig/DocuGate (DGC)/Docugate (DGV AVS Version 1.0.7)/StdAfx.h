// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__F9DB54B1_11FD_4937_B18B_375F2A26C299__INCLUDED_)
#define AFX_STDAFX_H__F9DB54B1_11FD_4937_B18B_375F2A26C299__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdisp.h>        // MFC Automation classes
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#include <afxdb.h>
#include <afxmt.h>
#include <afxcoll.h>
#include <afxdb.h>
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// MFC support for Windows Common Controls
#endif // _AFX_NO_AFXCMN_SUPPORT


#include "ipworks.h"
#include "netcash_lib.h"
#include "activity.h"
#include "iniex.h"
#include "mydatabase.h"
#include <afxsock.h>		// MFC socket extensions

enum protocolstate {

	MAINMENU, 
	ADDVALUENUM,
	ADDVALUEPIN,
	NEWACCOUNTNUM,
	NEWACCOUNTPIN,
	SECURITYACCOUNT,
	SECURITYFUNCTION,
	LIVEBANKING,
	RESETMETERS,
	PRINTRECEIPT,
	FUNDINGTYPE
};


enum receipttype{

	RCP_ADDVALUE, 
	RCP_ADDACCOUNT
};


typedef struct ECASHIER
{
	CString address;
	CString badge;
    CString accguid;
	CString ouguid;
	CString ouname;
	CString fullname;
	bool    located;
	bool    pinrequired;
	bool    addaccount;
	CString institution;

} eCashier;


typedef struct ETRANSACTION
{
	CString type;
	CString guidacc;
	CString guidecashier;
	CString tablename;
	CString transid;
	long    sbal;
   	long    ebal;
    long    amount;
	bool    success;

} eTransaction;


typedef struct EBILL
{
	long BillCount;
	long BillValue;
	long Amount;

} ebill;

typedef struct EBILLS
{
	ebill Bill1;
	ebill Bill2;
	ebill Bill3;
	ebill Bill4;
	ebill Bill5;
	ebill Bill6;
	ebill Bill7;

} eBills;


typedef struct EACCOUNT
{
	CString badge;
	CString copyid;
	CString copypin;
    CString accguid;
	CString ouguid;
	CString ouname;
	CString fullname;
	bool    located;
	long    startbalance;
    long    curbalance; 
	long    endbalance;
    long    escrowed;
	CString access;

} eAccount;


typedef struct ELOGIN
{
	CString copyid;
	CString copypin;
    CString accguid;
	CString cashierguid;
	CString result;
	CString mode;

} eLogin;


typedef struct ESECURITY
{
	CString accguid;
	CString cashierguid;
	CString function;

	long    rq_bill0;
   	long    rq_bill1;
   	long    rq_bill2;
   	long    rq_bill3;
   	long    rq_bill4;
   	long    rq_bill5;
   	long    rq_bill6;
   	long    rq_bill7;
   
	long    lq_bill0;
   	long    lq_bill1;
   	long    lq_bill2;
   	long    lq_bill3;
   	long    lq_bill4;
   	long    lq_bill5;
   	long    lq_bill6;
   	long    lq_bill7;

	int     reset;
	bool    success;
   
} eSecurity;


//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__F9DB54B1_11FD_4937_B18B_375F2A26C299__INCLUDED_)
