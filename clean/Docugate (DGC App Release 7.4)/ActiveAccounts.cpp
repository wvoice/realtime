// ActiveAccounts.cpp: implementation of the CActiveAccounts class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "TheApp.h"
#include "ActiveAccounts.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////


CActiveAccounts::CActiveAccounts()
{
   mActiveAccounts.RemoveAll();
}


CActiveAccounts::~CActiveAccounts()
{
  mActiveAccounts.RemoveAll();

}



/////////////////////////////////////////////
// lets see if the account is already active/
/////////////////////////////////////////////
int CActiveAccounts::IsAccountActive(LPSTR pstrAccountGUID)
{


	    // 6.9 this needs to query the database for any active logged on account
		////////////////////////////////////////////////////////////////////////
	    int result = 0;
		mLock.Lock();
		POSITION pos = mActiveAccounts.Find(pstrAccountGUID);
		if ( pos != NULL )
			result = 1;
		mLock.Unlock();
		return result;

}


////////////////////////////////
// Add this account as active//
///////////////////////////////
int CActiveAccounts::AddActiveAccount(LPSTR pstrAccountGUID)
{
		
	int result = 0;
    	mLock.Lock();
   	    POSITION pos = mActiveAccounts.AddHead(pstrAccountGUID);
		
		mLock.Unlock();
    return result;
}


//////////////////////////////////
// Remove this account as active//
//////////////////////////////////
int CActiveAccounts::RemoveActiveAccount(LPSTR pstrAccountGUID)
{
	
	// Remove this account as active
    int result = 0;
	
		mLock.Lock();
    	POSITION pos = mActiveAccounts.Find(pstrAccountGUID);
	    if ( pos != NULL )
		     mActiveAccounts.RemoveAt(pos);
		mLock.Unlock();
    
	return result;
}


