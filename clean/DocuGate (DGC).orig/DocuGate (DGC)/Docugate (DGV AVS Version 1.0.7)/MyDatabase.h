// MyDatabase.h: interface for the CMyDatabase class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_MYDATABASE_H__A7192515_95ED_4EE0_8B44_541C4E9B0662__INCLUDED_)
#define AFX_MYDATABASE_H__A7192515_95ED_4EE0_8B44_541C4E9B0662__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CMyDatabase : public CDatabase 
{
private:

//	CDatabase m_Database;
	CString   Message;
	CString   m_Query;

public:

	CMyDatabase();
	virtual ~CMyDatabase();
	int OpenConnection( CString &Connect);
	int CloseConnection(void);

	void ECashier_GetCashier			( LPVOID pData);
	void ECashier_GetAccount			( LPVOID pData,int Method);
	void ECashier_GetLastInsertID		( LPVOID pData);
	bool ECashier_IsAccountNumAvailible ( LPVOID pData);
	bool ECashier_CreateAccount			( LPVOID pData);
	void ECashier_LogTransaction		( LPVOID pData);
	void ECashier_LogJournel			( LPVOID pData);
	void ECashier_UpdateAccountFunds	( LPVOID pData);
	void ECashier_LogLogin              ( LPVOID pData);
	void ECashier_LogSecurity			( LPVOID pData);
	int  ECashier_IsActiveSession       ( CString &AccountGUID);
	
};

#endif // !defined(AFX_MYDATABASE_H__A7192515_95ED_4EE0_8B44_541C4E9B0662__INCLUDED_)
