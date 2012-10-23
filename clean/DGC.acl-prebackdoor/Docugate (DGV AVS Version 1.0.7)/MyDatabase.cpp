// MyDatabase.cpp: implementation of the CMyDatabase class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "AVS.h"
#include "MyDatabase.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CMyDatabase::CMyDatabase()
{

}

CMyDatabase::~CMyDatabase()
{

}


int CMyDatabase::OpenConnection( CString &Connect)
{
		
		int result = 0;

		try
		{
		    SetLoginTimeout(3);
			OpenEx(Connect, CDatabase::noOdbcDialog);
		}
		catch( CDBException *e)
		{
  		    Message.Format("CMyDatabase::OpenConnection(%s)",e->m_strError);
			e->Delete();
	   		result = 1001;
		}

		return result;
}


int CMyDatabase::CloseConnection(  void)
{

	int result = 1;

	try
	{
		if ( IsOpen() )
		     Close();
	
	}
	catch( CDBException *e)
	{
		Message.Format("CMyDatabase::CloseConnection(%s)", e->m_strError);
		e->Delete();
	}

	return result;
}




void CMyDatabase::ECashier_GetCashier( LPVOID pData)
{

	//////////////////////////////////////////////////////////////////////////
	// we will get the ecashier data using the Badge # passed on  command Line/
	///////////////////////////////////////////////////////////////////////////
	ECASHIER *pBuffer = (ECASHIER *)pData;
	CRecordset       m_RS( this );//&m_Database );
		
	try
	{
		//ACC_FIRSTNAME is the IP Address
		//ACC_PASSWORD  is if the pin is required
		//ACC_OU_GUID   is the OU GUIDthis ecasier belongs to
		//ACC_ACC_GUID  is the GUID this ecasier belongs to
		
		pBuffer->pinrequired = false;
	  	pBuffer->located     = false;
	    pBuffer->addaccount  = false;
		
	 	m_Query.Format("SELECT FIRSTNAME,PINREQUIRED,GUIDACC,GUIDOU,EMAIL,OUNAME,FULLNAME,ADDACCT FROM ECASHIER_VIEW WHERE BADGE = '%s'",pBuffer->badge);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		if ( !m_RS.IsEOF() )
		{	
	  		   pBuffer->located = true;
			   CString Pin;
			   CString AddAcct;

			   m_RS.GetFieldValue( short(0),    pBuffer->address);
			   m_RS.GetFieldValue( short(1),    Pin);
			   m_RS.GetFieldValue( short(2),    pBuffer->accguid);
			   m_RS.GetFieldValue( short(3),    pBuffer->ouguid);
			   m_RS.GetFieldValue( short(4),    pBuffer->institution);
			   m_RS.GetFieldValue( short(5),    pBuffer->ouname);
			   m_RS.GetFieldValue( short(6),    pBuffer->fullname);
			   m_RS.GetFieldValue( short(7),    AddAcct);


			   if ( Pin.CompareNoCase("1") == 0 )
				    pBuffer->pinrequired = true;

			   if ( AddAcct.CompareNoCase("1") == 0 )
				    pBuffer->addaccount = true;
		
		}

		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{
		Message.Format("CMyDatabase::ECashier_GetDetails(%s)",e->m_strError);
		e->Delete();
	}


}




void CMyDatabase::ECashier_GetAccount(LPVOID pData, int Method)
{

	EACCOUNT *pBuffer = (EACCOUNT *)pData;
	CRecordset       m_RS( this); //&m_Database );

	try
	{
		pBuffer->located = false;

		if ( Method == 0 ) /// copyid only
			m_Query.Format("SELECT FULLNAME,FUNDS,GUIDACC,GUIDOU,OUNAME,BADGE,ACCESS FROM ECASHIER_VIEW WHERE COPYID = '%s'", pBuffer->copyid);
		else               // copyid and copypin
			m_Query.Format("SELECT FULLNAME,FUNDS,GUIDACC,GUIDOU,OUNAME,BADGE,ACCESS FROM ECASHIER_VIEW WHERE COPYID = '%s' AND COPYPIN = '%s'", pBuffer->copyid,pBuffer->copypin);
	
		
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
	    if ( !m_RS.IsEOF() )
		{
			CString sfunds;
			double  ffunds;
		
			pBuffer->located = true;
		
			m_RS.GetFieldValue( short(0), pBuffer->fullname);
 			m_RS.GetFieldValue( short(1), sfunds);
			m_RS.GetFieldValue( short(2), pBuffer->accguid);
 			m_RS.GetFieldValue( short(3), pBuffer->ouguid);
			m_RS.GetFieldValue( short(4), pBuffer->ouname);
 			m_RS.GetFieldValue( short(5), pBuffer->badge);
 			m_RS.GetFieldValue( short(6), pBuffer->access);
 			
			ffunds = atof(sfunds);
			pBuffer->startbalance =  (long)(ffunds*100);
			pBuffer->curbalance    = 0;
			pBuffer->escrowed      = 0;
	 		pBuffer->endbalance    = 0;
		}

		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{
		Message.Format("CMyDatabase::GetAccount(%s)",e->m_strError);
		e->Delete();
	}

}




void CMyDatabase::ECashier_GetLastInsertID( LPVOID pData)
{

	ETRANSACTION *pBuffer = (ETRANSACTION *)pData;
	CRecordset       m_RS( this );//&m_Database );

	try
	{

		m_Query.Format("SELECT @@identity from %s", pBuffer->tablename);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		m_RS.GetFieldValue( short(0), pBuffer->transid);
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{
		Message.Format("CMyDatabase::GetLastInsertID(%s)",e->m_strError);
		e->Delete();
	}

}






bool CMyDatabase::ECashier_IsAccountNumAvailible( LPVOID pData)
{


	EACCOUNT *pBuffer = (EACCOUNT *)pData;
	CRecordset       m_RS( this );//&m_Database );
	CDBVariant       varValue;

	try
	{
	
	 	m_Query.Format("SELECT COUNT(*) FROM DOCUGATE_GENERAL_ACC WHERE ACC_COPYID = '%s'", pBuffer->copyid);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
	    m_RS.GetFieldValue( short(0), varValue); 
		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		Message.Format("CMyDatabase::VerifyNewAccountNum(%s)",e->m_strError);
		e->Delete();
	}

	if (varValue.m_lVal > 0 ) 
		return false;
	else
		return true;


}



void CMyDatabase::ECashier_UpdateAccountFunds    (LPVOID pData)
{	

	EACCOUNT *pBuffer = (EACCOUNT *)pData;
	float balance = ((float)pBuffer->endbalance)/100;


	try
	{
		m_Query.Format("UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = %.2f WHERE ACC_ACC_GUID = '%s'",balance, pBuffer->accguid);
		this->ExecuteSQL( m_Query);
	}
	catch(CDBException *e)
	{
		Message.Format("CMyDatabase::UpdateAccount(%s)",e->m_strError);
		e->Delete();
	}

}

bool CMyDatabase::ECashier_CreateAccount ( LPVOID pData)
{

	EACCOUNT *pAccount = (EACCOUNT *)pData;
	m_Query.Format("INSERT INTO DOCUGATE_GENERAL_ACC (ACC_FIRSTNAME,ACC_LASTNAME,ACC_FULLNAME,ACC_BADGE,ACC_COPYID,ACC_COPYPIN,ACC_OU_GUID,ACC_FUNDS,ACC_CMETHOD,ACC_PASSWORD,ACC_ACCESS_LEVEL) VALUES ('%s','%s','%s','%s','%s','%s','%s',0.00,'DEBIT','%s',1)",
									"NA",
									"NA",
									"NA",
									pAccount->copyid,
									pAccount->copyid,
									pAccount->copypin,
									pAccount->ouguid,
									pAccount->copypin		
									);
	try
	{
		this->ExecuteSQL( m_Query);
	    return true;
	}
	catch( CDBException *e)
	{
		Message.Format("CMyDatabase::CreateNewAccount(%s)",e->m_strError);
		e->Delete();
		return false;
	}

}




void CMyDatabase::ECashier_LogTransaction  (LPVOID pData)
{
	
	  ETRANSACTION *pTransaction = (ETRANSACTION *)pData;
	  
	  float amount = ((float)pTransaction->amount)/100;
	  float sbal   = ((float)pTransaction->sbal)/100;
	  float ebal   = ((float)pTransaction->ebal)/100;

	  try
	  {

		m_Query.Format( "INSERT INTO ECASHIER_TRANSACTIONS (TYPE,AMOUNT,GUIDECASHIER,GUIDACC,SBAL,EBAL)VALUES ('%s',%.2f,'%s','%s',%.2f,%.2f)",		\
						pTransaction->type,			
						amount,						
						pTransaction->guidecashier,	
						pTransaction->guidacc,		
						sbal,						
						ebal );

		  
		this->ExecuteSQL( m_Query);
	    pTransaction->success = true;
	  
	  }
	  catch( CDBException *e)
	  {
			e->Delete();
		    pTransaction->success = false;
	  }
}

void CMyDatabase::ECashier_LogJournel  (LPVOID pData)
{
	
	  ETRANSACTION *pTransaction = (ETRANSACTION *)pData;
	  
	  float amount = ((float)pTransaction->amount)/100;
	  float sbal   = ((float)pTransaction->sbal)/100;
	  float ebal   = ((float)pTransaction->ebal)/100;

	  try
	  {

		m_Query.Format( "INSERT INTO DOCUGATE_GENERAL_ACTIVITY_JOURNEL (J_TYPE,J_AMOUNT,J_GUID,J_DESC) VALUES ('AVS CREDIT',%.2f,'%s','%s')",		\
						amount,						
						pTransaction->guidacc,
						pTransaction->guidecashier);

		  
		this->ExecuteSQL( m_Query);
	    pTransaction->success = true;
	  
	  }
	  catch( CDBException *e)
	  {
			e->Delete();
		    pTransaction->success = false;
	  }
}

void CMyDatabase::ECashier_LogSecurity  (LPVOID pData)
{
	
	  ESECURITY *pSecurity = (ESECURITY *)pData;
	  
	
	  try
	  {

		m_Query.Format( "INSERT INTO ECASHIER_HISTORY (accguid,ecguid,funccode,rq_reset,rq_bill0,rq_bill1,rq_bill2,rq_bill3,rq_bill4,rq_bill5,rq_bill6,rq_bill7,lq_bill0,lq_bill1,lq_bill2,lq_bill3,lq_bill4,lq_bill5,lq_bill6,lq_bill7) VALUES ('%s','%s','%s',%d, %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d)",		\
						pSecurity->accguid,			
						pSecurity->cashierguid,						
						pSecurity->function,
						pSecurity->reset,
						pSecurity->rq_bill0,
						pSecurity->rq_bill1,
						pSecurity->rq_bill2,
						pSecurity->rq_bill3,
						pSecurity->rq_bill4,
						pSecurity->rq_bill5,
						pSecurity->rq_bill6,
						pSecurity->rq_bill7,
						pSecurity->lq_bill0,
						pSecurity->lq_bill1,
						pSecurity->lq_bill2,
						pSecurity->lq_bill3,
						pSecurity->lq_bill4,
						pSecurity->lq_bill5,
						pSecurity->lq_bill6,
						pSecurity->lq_bill7);
	
		  
		this->ExecuteSQL( m_Query);
	    pSecurity->success = true;
	  
	  }
	  catch( CDBException *e)
	  {
			e->Delete();
		    pSecurity->success = false;
	  }
}

void CMyDatabase::ECashier_LogLogin(LPVOID pData)
{
	
	  ELOGIN *pLogin = (ELOGIN*)pData;
	  

	  try
	  {
		if ( pLogin->accguid.GetLength() == 0 )
		{	
			
		m_Query.Format( "INSERT INTO ECASHIER_LOGONS (COPYID,COPYPIN,GUIDECASHIER,RESULT,MODE) VALUES ('%s','%s','%s','%s','%s')",		\
						 pLogin->copyid,	
						 pLogin->copypin,		
						 pLogin->cashierguid,
						 pLogin->result,						
						 pLogin->mode
						);
		
		}
		else
		{

			m_Query.Format( "INSERT INTO ECASHIER_LOGONS (COPYID,COPYPIN,GUIDACC,GUIDECASHIER,RESULT,MODE) VALUES ('%s','%s','%s','%s','%s','%s')",		\
						 pLogin->copyid,	
						 pLogin->copypin,
						 pLogin->accguid,
						 pLogin->cashierguid,
						 pLogin->result,						
						 pLogin->mode
						);
	
		}

		this->ExecuteSQL( m_Query);
	  
	  }
	  catch( CDBException *e)
	  {
			e->Delete();
	  }
}



int CMyDatabase::ECashier_IsActiveSession(CString &AccountGUID)
{

	CRecordset       m_RS( this );
	CString          m_Query;
	CString          m_Data;
    int res          = 0;


	try
	{

		m_Query.Format("SELECT count(*) as mcount FROM DOCUGATE_GENERAL_ACTIVE_SESSION where ACC_GUID = '%s'",AccountGUID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		m_RS.GetFieldValue( short(0),m_Data);

		if ( m_RS.IsOpen() )
			 m_RS.Close();

		if ( atoi(m_Data) == 0 ) // no sessions
			res = 0;
		else				     // has active session	
			res = 1;

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::IsActiveSession(%s)",e->m_strError);
		e->Delete();
	}
	
	return res;
	

}