// ActiveAccounts.h: interface for the CActiveAccounts class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ACTIVEACCOUNTS_H__A50526D7_7809_446A_8C55_FF25101B297F__INCLUDED_)
#define AFX_ACTIVEACCOUNTS_H__A50526D7_7809_446A_8C55_FF25101B297F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CActiveAccounts  
{
public:
	CActiveAccounts();
	virtual ~CActiveAccounts();
private:
	CStringList      mActiveAccounts;
    CCriticalSection mLock;

public:

   int  IsAccountActive			       ( LPSTR pstrAccountGUID);
   int  AddActiveAccount		       ( LPSTR pstrAccountGUID);
   int  RemoveActiveAccount			   ( LPSTR pstrAccountGUID);
 
};

#endif // !defined(AFX_ACTIVEACCOUNTS_H__A50526D7_7809_446A_8C55_FF25101B297F__INCLUDED_)
