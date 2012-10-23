#include "stdafx.h"

CCriticalSection m_DBLock;

CMyDatabase :: ~CMyDatabase()
{
}

CMyDatabase :: CMyDatabase()
{
	m_LocationFilter.Empty();
	m_UnitValue        = "1.00";
	m_UnitValueEnabled = "0";
}


int CMyDatabase::GetIniPath( void )
{
	  m_localpath = m_gIni.GetIniPath();
	  return 0;
}

int CMyDatabase::ReadStationsIni( void )
{

	CString Data;
	CString key;

	int StationCount = 0;
 
	for ( int a =0; a< m_gStationArray.GetUpperBound()+1; a++)
	{
		key  = m_gStationArray.GetAt(a);
		Data = m_gIni.GetValue("MCR-STATIONS", key);
		if ( Data.GetLength() > 0 )
		{
			Data.Replace(';',' ');
			sscanf(Data, "%s%s%s%s%s%s%s%s%s%s%s", Stations[StationCount].UnitAddress, Stations[StationCount].UnitPort,Stations[StationCount].IdleReset,Stations[StationCount].ReqCopyClient, Stations[StationCount].ReqCopyMatter,Stations[StationCount].Keyboard,Stations[StationCount].PulseIdle,Stations[StationCount].ReqPin,Stations[StationCount].ReqCopyClient,Stations[StationCount].Debug,Stations[StationCount].CustomPL);
			Stations[StationCount].UnitActive = 1;
			Stations[StationCount].UnitConnected = 0;
			StationCount++;
		}
	}

	return StationCount;
}


int CMyDatabase::ReadStationsFromTable( CDatabase &m_Database)
{


	CRecordset       m_RS( &m_Database );
	short nFields     = 0;
	int StationCount  = 0;
	CString mSQL;

	
	try
	{

		if ( m_LocationFilter.IsEmpty() )
			mSQL.Format( "SELECT * FROM DOCUGATE_GENERAL_CTLUNIT" );
		else
			mSQL.Format( "SELECT * FROM DOCUGATE_GENERAL_CTLUNIT WHERE CTLUNIT_LOCATION = '%s'",m_LocationFilter );
	
		m_RS.Open( CRecordset::forwardOnly, mSQL); //_T( "SELECT * FROM DOCUGATE_GENERAL_CTLUNIT" ) );
		nFields = m_RS.GetODBCFieldCount( );

		while( !m_RS.IsEOF() )
		{

			   CString		  varData;
			   CODBCFieldInfo varInfo;

			   for( short index = 0; index < nFields; index++ )
			   {
						m_RS.GetFieldValue    ( short(index), varData );
						m_RS.GetODBCFieldInfo ( short(index), varInfo );

						// ACLs - Mike Young 12/18/11
                        //if( varInfo.m_strName.CompareNoCase("CTLUNIT_OU_GUID") == 0 )
                        //     strncpy(UnitOUGUID,varData,51);
                   
                        if( varInfo.m_strName.CompareNoCase("CTLUNIT_GUID") == 0 )
					         strncpy(Stations[StationCount].UnitGUID,varData,51);

						if( varInfo.m_strName.CompareNoCase("CTLUNIT_IP") == 0 )
					         strncpy(Stations[StationCount].UnitAddress,varData,50);
	
						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_PORT_NO") == 0 )
					         strncpy(Stations[StationCount].UnitPort,varData,10);
					
						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_REQ_CLIENT") == 0 )
					         strncpy(Stations[StationCount].ReqCopyClient,varData,5);
	
						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_REQ_MATTER") == 0 )
					         strncpy(Stations[StationCount].ReqCopyMatter,varData,5);
					
						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_CONN_RESET") == 0 )
					         strncpy(Stations[StationCount].IdleReset,varData,10);

						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_COPYPIN_ENABLED") == 0 )
					         strncpy(Stations[StationCount].ReqPin,varData,5);

						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_KEYBRD_MODE") == 0 )
					         strncpy(Stations[StationCount].Keyboard,varData,10);

						else if( varInfo.m_strName.CompareNoCase("CTLUNIT_PULSE_IDLE_MIN") == 0 )
					         strncpy(Stations[StationCount].PulseIdle,varData,10);
			   }

			Stations[StationCount].UnitActive = 1;
			Stations[StationCount].UnitConnected = 0;
	
			StationCount++;
		    m_RS.MoveNext( );
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return StationCount;
}


void CMyDatabase::GetStationCustomPL(_TagStation &Station, CDatabase &m_Database, int dbms)
{

	CRecordset       m_RS( &m_Database );
	short nFields     = 0;
	CString mSQL;
	CString Message;

	try
	{

		mSQL.Format( "SELECT * FROM DOCUGATE_GENERAL_CTLUNIT_CUSTOM_PL WHERE CTLUNIT_GUID = '%s'",Station.UnitGUID );
		Message.Format("CMyDatabase::GetStationCustomPL(%s)",mSQL);
		WriteLog(Message,"");
	
		m_RS.Open( CRecordset::forwardOnly, mSQL);
		if( !m_RS.IsEOF() )
		{
	
			
			   CString		  varData;
			   CODBCFieldInfo varInfo;
			   nFields = m_RS.GetODBCFieldCount( );
			   for( short index = 0; index < nFields; index++ )
			   {
						m_RS.GetFieldValue    ( short(index), varData );
						m_RS.GetODBCFieldInfo ( short(index), varInfo );
					
						if( varInfo.m_strName.CompareNoCase("ENABLED") == 0 )
					         Station.plCustomCostEnabled = atoi(varData);
						else if( varInfo.m_strName.CompareNoCase("PL1") == 0 )
					         Station.pl1CustomCost=(float)atof(varData);
						else if( varInfo.m_strName.CompareNoCase("PL2") == 0 )
					         Station.pl2CustomCost=(float)atof(varData);
						else if( varInfo.m_strName.CompareNoCase("PL3") == 0 )
					         Station.pl3CustomCost=(float)atof(varData);
						else if( varInfo.m_strName.CompareNoCase("PL4") == 0 )
					         Station.pl4CustomCost=(float)atof(varData);
			   }

			  Message.Format("CMyDatabase::GetStationCustomPL(%s) was located ,Enabled = %d",Station.UnitGUID,Station.plCustomCostEnabled);
			  WriteLog(Message,"");


		} else {

				Message.Format("CMyDatabase::GetStationCustomPL(%s) not located",Station.UnitGUID);
				WriteLog(Message,"");

		}
 
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetStationCustomPL(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}




int CMyDatabase::GetUnitOrCurrency( CDatabase &m_Database)
{



	try
	{

		CRecordset       m_RS( &m_Database );

		m_RS.Open( CRecordset::forwardOnly,_T( "SELECT GLOBALS_UNITVALUE,GLOBALS_UNITVALUE_ENABLED FROM DOCUGATE_GENERAL_GLOBAL" ) );
		if( !m_RS.IsEOF() )
		{
		  	m_RS.GetFieldValue    ( short(0), m_UnitValue); 
			m_RS.GetFieldValue    ( short(1), m_UnitValueEnabled); 
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetUnitOrCurrency(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return 0;
}

CString CMyDatabase::ReadIni( void )
{
	m_strConnect = m_gConnect;
	return m_strConnect;
}

int CMyDatabase::OpenConnection( CDatabase &m_Database )
{
		
	    char  drivername[255] = {0};
   		int result = 0;
	    char Message[255] = {0};

		try
		{
			m_Database.SetLoginTimeout(2);
			m_Database.OpenEx(m_strConnect, CDatabase::noOdbcDialog);
			result = 1;
		}
		catch( CDBException *e)
		{
  		    sprintf(Message,"CMyDatabase::OpenConnection(%s)",e->m_strError);
			printf( "%s\n",Message);
		    WriteLog(Message,"");
			e->Delete();
		}

		return result;
}


int CMyDatabase::OpenConnection( CDatabase &m_Database,int dbms )
{
		char  drivername[255] = {0};
   		int result = 0;

		try
		{
			m_Database.SetLoginTimeout(2);
			m_Database.OpenEx(m_strConnect, CDatabase::noOdbcDialog);
		}
		catch( CDBException *e)
		{
			result = -1;
  		    char Message[255] = {0};
		    sprintf(Message,"CMyDatabase::OpenConnection(%s)",e->m_strError);
		    WriteLog(Message,"");
			e->Delete();
		}
		return result;

}


int CMyDatabase::OpenConnection( CDatabase &m_Database,int dbms,int Index )
{
		char  drivername[255] = {0};
   		int result = -1;
		StationIndex = Index;
		try
		{
			m_Database.SetLoginTimeout(2);
			m_Database.OpenEx(m_strConnect, CDatabase::noOdbcDialog);
		}
		catch( CDBException *e)
		{
			result = -1;
  		    char Message[255] = {0};
		    sprintf(Message,"CMyDatabase::OpenConnection(%s)",e->m_strError);
			WriteLog(Message,"");
			e->Delete();
		}
		return result;

}



int CMyDatabase::CheckHandle( CDatabase &m_Database, int dbms)
{

	int result = 1;
	CString          m_Query;

	try
	{
	
		CRecordset       m_RS( &m_Database );
		m_Query.Format("SELECT GETDATE();");
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		result = 0;
		char Message[255] = {0};
		sprintf(Message,"CMyDatabase::CheckHandle(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
	return result;

}


int CMyDatabase::CloseConnection(  CDatabase &m_Database,int dbms )
{

	try
	{
		if ( m_Database.IsOpen() )
		     m_Database.Close();
	
	}
	catch( CDBException *e)
	{
		char Message[255] = {0};
		sprintf(Message,"CMyDatabase::CloseConnection(%s)", e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return 0;
}

int CMyDatabase::CloseConnection(  CDatabase &m_Database)
{

	try
	{
		if ( m_Database.IsOpen() )
		     m_Database.Close();
	
	}
	catch( CDBException *e)
	{
		char Message[255] = {0};
		sprintf(Message,"CMyDatabase::CloseConnection(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return 0;
}



void CMyDatabase::GetGroup( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms )
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;

	try
	{
	
		m_Query.Format("SELECT OU_DEFAULT_CLIENT,OU_DEFAULT_MATTER,OU_LOCKED,OU_CHARGE,OU_ALLOWNEG,OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '%s'", McrStation.Group);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);

		if ( !m_RS.IsEOF() )
		{
				CString Data;
				m_RS.GetFieldValue( short(0), Data); lstrcpyn(McrStation.GroupClient,Data,50);
				m_RS.GetFieldValue( short(1), Data); lstrcpyn(McrStation.GroupMatter,Data,50);
				m_RS.GetFieldValue( short(2), Data); McrStation.GroupLocked = atoi(Data);     
				m_RS.GetFieldValue( short(3), Data); lstrcpyn(McrStation.GroupCharge,Data,50);
				m_RS.GetFieldValue( short(4), Data); McrStation.AllowNeg = atoi(Data);     
				m_RS.GetFieldValue( short(5), Data); lstrcpyn(McrStation.GroupName,Data,50);
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::GetGroup(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	
}

void CMyDatabase::GetInsertGuid(_NetcashDevice &McrStation, CDatabase &m_Database,int dbms)
{
	
	CRecordset       m_RS( &m_Database );
	CString Data;

	try
	{

		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, "SELECT NEWID()",CRecordset::executeDirect);
	
		if ( !m_RS.IsEOF() )
			  m_RS.GetFieldValue( short(0), Data); lstrcpyn(McrStation.InsertGUID,Data,51);
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
}


void CMyDatabase::GetAccMaxSpend(_NetcashDevice &McrStation, CDatabase &m_Database,int dbms  )
{

	
	CRecordset       m_RS( &m_Database );
	CString          m_Query;
    
	try
	{

		m_Query.Format("SELECT ENABLED,AMOUNT FROM DOCUGATE_GENERAL_ACC_MAXSPEND WHERE ACC_GUID = '%s'", McrStation.AccountGUID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);

		if ( !m_RS.IsEOF() )
		{
			CString Data;
			
			m_RS.GetFieldValue( short(0), Data);
			McrStation.AccmaxspendEnabled =atoi(Data);
		
			m_RS.GetFieldValue( short(1), Data);
			float t =atof(Data);
			McrStation.Accmaxspend       = (ULONG)t * 100;
		
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetAccMaxSpend(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
}

void CMyDatabase::GetOUMaxSpend(_NetcashDevice &McrStation, CDatabase &m_Database,int dbms  )
{

	
	CRecordset       m_RS( &m_Database );
	CString          m_Query;

	try
	{

		m_Query.Format("SELECT ENABLED,AMOUNT FROM DOCUGATE_GENERAL_OU_MAXSPEND WHERE OU_GUID = '%s'", McrStation.Group);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);

		if ( !m_RS.IsEOF() )
		{
			CString Data;

	
			m_RS.GetFieldValue( short(0), Data);
			McrStation.OumaxspendEnabled =atoi(Data);
		
			m_RS.GetFieldValue( short(1), Data);
			float t =atof(Data);
			McrStation.Oumaxspend  = (ULONG)t * 100;
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
}

void CMyDatabase::GetGlobalMaxSpend(_NetcashDevice &McrStation, CDatabase &m_Database,int dbms  )
{
	
	CRecordset       m_RS( &m_Database );
	CString          m_Query;

	try
	{

		m_Query.Format("SELECT GLOBALS_MAXSPEND_ENABLED,GLOBALS_MAXSPEND FROM DOCUGATE_GENERAL_GLOBAL");
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);

		if ( !m_RS.IsEOF() )
		{
			CString Data;


				
			m_RS.GetFieldValue( short(0), Data);
			McrStation.GlobalmaxspendEnabled =atoi(Data);
		
			m_RS.GetFieldValue( short(1), Data);
			float t =atof(Data);
			McrStation.Globalmaxspend  = (ULONG)t * 100;
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
}




void CMyDatabase::GetAccount(_NetcashDevice &McrStation, CDatabase &m_Database,int dbms  )
{
	
	CRecordset       m_RS( &m_Database );
	CString          m_Query;

	try
	{

		m_Query.Format("SELECT ACC_DEFAULT_CLIENT,ACC_DEFAULT_MATTER,ACC_LOCKED,ACC_FUNDS,ACC_OU_GUID,ACC_CMETHOD FROM DOCUGATE_GENERAL_ACC WHERE ACC_ACC_GUID = '%s'", McrStation.AccountGUID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);

		if ( !m_RS.IsEOF() )
		{
			CString Data;
			m_RS.GetFieldValue( short(0), Data); lstrcpyn(McrStation.AccountClient,Data,50);
			m_RS.GetFieldValue( short(1), Data); lstrcpyn(McrStation.AccountMatter,Data,50);
			m_RS.GetFieldValue( short(2), Data); McrStation.AccountLocked  = atoi(Data);
			m_RS.GetFieldValue( short(3), Data); McrStation.InitBalance = (float)atof(Data);
			m_RS.GetFieldValue( short(4), Data); lstrcpyn(McrStation.Group,Data,50);
			m_RS.GetFieldValue( short(5), Data); lstrcpyn(McrStation.AccountCharge,Data,50);
		}
	
		if ( m_RS.IsOpen() )
			 m_RS.Close();
	}
	catch( CDBException *e)
	{

		CString Message;
		Message.Format("CMyDatabase::GetAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
}


void CMyDatabase::GetCopier( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;


	try
	{
	
		m_Query.Format("SELECT  DEVICENAME,LOCATION,LOCKED,CURRENTCOUNT FROM DEVICES WHERE DEVICEID = %d", McrStation.DeviceID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		
		if ( !m_RS.IsEOF() )
		{
				CString Data;
				m_RS.GetFieldValue( short(0),Data);    lstrcpyn(McrStation.DeviceName,  Data,50);
				m_RS.GetFieldValue( short(1),Data);    lstrcpyn(McrStation.DeviceLocation,Data,50);
				m_RS.GetFieldValue( short(2),Data);    McrStation.DeviceLocked = atoi(Data); 
				m_RS.GetFieldValue( short(3),Data);    McrStation.InitCount = atol(Data); 
		}

		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::GetCopier(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}


}



int CMyDatabase::VerifyClient( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;
	CString          m_Count("0");

	if ( strlen(McrStation.CopyClient) == 0 )
         return 1;

	try
	{
	
		// table change to use the cc/cm view ver 6.6
		//	m_Query.Format("SELECT COUNT(*) FROM DOCUGATE_CM_VIEW WHERE CC_CODE = '%s'", McrStation.CopyClient);

		// ver 7.2 table change to use the docugate_general_cc table for client only validation
		// otherwise the cm view does not show clients with no matters
     	m_Query.Format("SELECT COUNT(*) FROM DOCUGATE_GENERAL_CC WHERE CC_CODE = '%s'", McrStation.CopyClient);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
	    m_RS.GetFieldValue( short(0),m_Count); 

		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::VerifyClient(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return atoi(m_Count);

}

int CMyDatabase::VerifyMatter( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;
	CString          m_Count("0");

	if ( strlen(McrStation.CopyMatter) == 0 )
         return 1;

	try
	{
	
	
		// table change to use the cc/cm view ver 6.6
     	m_Query.Format("SELECT COUNT(*) FROM DOCUGATE_CM_VIEW WHERE CC_CODE = '%s' AND CM_MATTER = '%s'", McrStation.CopyClient,McrStation.CopyMatter);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
	    m_RS.GetFieldValue( short(0),m_Count); 

		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::VerifyMatter(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return atoi(m_Count);

}



int CMyDatabase::GetStation( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{
	
	CRecordset       m_RS( &m_Database );
	CString          m_Query;
    int Res = 0;


	try
	{

		m_Query.Format("SELECT GLOBALS_SFBW, GLOBALS_LFBW, GLOBALS_SFCOLOR, GLOBALS_LFCOLOR, GLOBALS_SITE_MULTIPLR FROM DOCUGATE_GENERAL_GLOBAL");
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		
		if ( !m_RS.IsEOF() )
		{
				CString Data;
				McrStation.HIGHEST_COST = 0.00;

				m_RS.GetFieldValue( (short)0, Data);
				McrStation.SFBW		  = (float)atof( Data );
				if (McrStation.SFBW > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.SFBW;
		
				m_RS.GetFieldValue( (short)1, Data);
				McrStation.LFBW		  = (float)atof( Data );
				if (McrStation.LFBW > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.LFBW;
		
				m_RS.GetFieldValue( (short)2, Data);
				McrStation.SFCOLOR		  = (float)atof( Data );
				if (McrStation.SFCOLOR > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.SFCOLOR;
		
				m_RS.GetFieldValue( (short)3, Data);
				McrStation.LFCOLOR		  = (float)atof( Data );
				if (McrStation.LFCOLOR > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.LFCOLOR;
		
				m_RS.GetFieldValue( (short)4, Data); McrStation.SITE_MULTIPLR = (float)atof( Data );
		}
		
 			

		if ( m_RS.IsOpen() )
			 m_RS.Close();


		if ( McrStation.SITE_MULTIPLR > 0.00)
		{
			McrStation.HIGHEST_COST = 0.00;

			McrStation.SFBW		  = McrStation.SFBW    * McrStation.SITE_MULTIPLR;
			if (McrStation.SFBW > McrStation.HIGHEST_COST)
				McrStation.HIGHEST_COST = McrStation.SFBW;
		
			McrStation.LFBW		  = McrStation.LFBW    * McrStation.SITE_MULTIPLR;
			if (McrStation.LFBW > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.LFBW;

			McrStation.SFCOLOR	  = McrStation.SFCOLOR * McrStation.SITE_MULTIPLR;
			if (McrStation.SFCOLOR > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.SFCOLOR;
		
			McrStation.LFCOLOR	  = McrStation.LFCOLOR * McrStation.SITE_MULTIPLR;
			if (McrStation.LFCOLOR > McrStation.HIGHEST_COST)
					McrStation.HIGHEST_COST = McrStation.LFCOLOR;
		
		}

	}
	catch( CDBException *e)
	{
	    Res = 1;
		CString Message;
		Message.Format("CMyDatabase::GetStation(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}



	return Res;


}



void CMyDatabase::GetAccountID( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms )
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;



	try
	{

		if ( McrStation.RequirePin)
		    m_Query.Format("SELECT ACC_ACC_GUID FROM DOCUGATE_GENERAL_ACC WHERE ACC_COPYID = '%s' AND ACC_COPYPIN = '%s'", McrStation.CopyAccount,McrStation.CopyPassword);
		else
			m_Query.Format("SELECT ACC_ACC_GUID FROM DOCUGATE_GENERAL_ACC WHERE ACC_COPYID = '%s'", McrStation.CopyAccount);
	
		
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		
		if ( !m_RS.IsEOF() )
		{
				CString Data;
				m_RS.GetFieldValue( short(0), Data);
				sprintf(McrStation.AccountGUID,"%s",Data);
		}

		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::GetAccountID(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}


}


void CMyDatabase::GetOfflineAccountID( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{


	CRecordset       m_RS( &m_Database );
	CString          m_Query;



	try
	{

		m_Query.Format("SELECT ACCOUNTID FROM ACCOUNTS WHERE COPYID = '%s'", McrStation.CopyAccount);
			
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		
		if ( !m_RS.IsEOF() )
		{
				CString Data;
				m_RS.GetFieldValue( short(0), Data);	McrStation.AccountID = atol(Data);
		}

		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::GetOffLineAccountID(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}

void CMyDatabase::GetDeviceID( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;



	try
	{
	
		m_Query.Format("SELECT DEVICEID,USECOLOR FROM SMARTPRINT_DEVICEMAP WHERE STATIONID = '%d'", McrStation.StationID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		
		if ( !m_RS.IsEOF() )
		{
				CString Data;
				m_RS.GetFieldValue( short(0), Data);	McrStation.DeviceID     = atol(Data);
				m_RS.GetFieldValue( short(1), Data);	McrStation.UseColor     = atoi(Data);
		}

		if ( m_RS.IsOpen() )
			 m_RS.Close();

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::GetDeviceID(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}


void CMyDatabase::UpdateCopier         ( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

    return;

	CString          m_Query;

	long MyCount = McrStation.InitCount + McrStation.CurSessionCount;

	try
	{
		m_Query.Format("UPDATE DEVICES SET CURRENTCOUNT = %d WHERE DEVICEID = %d",MyCount, McrStation.DeviceID);
		m_Database.ExecuteSQL( m_Query);
	}
	catch(CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateCopier(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}

void CMyDatabase::UpdateOfflineCopier         ( _NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

	CString          m_Query;

	try
	{
		m_Query.Format("UPDATE DEVICES SET CURRENTCOUNT = CURRENTCOUNT + %d WHERE DEVICEID = %d",McrStation.OfflineCount, McrStation.DeviceID);
		m_Database.ExecuteSQL( m_Query);
	}
	catch(CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateOffLineCopier(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	m_DBLock.Unlock();
}


/* Original Code- Mike Young 12/18/11 */
void CMyDatabase::UpdateAccount        (_NetcashDevice &McrStation,CDatabase &m_Database ,int dbms)
{	

    CString          m_Query;

	try
	{
		m_Query.Format("UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = %f WHERE ACC_ACC_GUID = '%s'",McrStation.CurSessionBalance, McrStation.AccountGUID);
		m_Database.ExecuteSQL( m_Query);
	}
	catch(CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}


/* Modified UpdateAccount- Mike Young 12/18/11 This basically allows everything through.
void CMyDatabase::UpdateAccount        (_NetcashDevice &McrStation,CDatabase &m_Database ,int dbms)
{	
    
    CString          m_Query;
    
	try
	{   
        if ( UnitOUGUID[0] = NULL || strcmp(McrStation.Group,UnitOUGUID) == 0 )
        {
            m_Query.Format("UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = %f WHERE ACC_ACC_GUID = '%s'",McrStation.CurSessionBalance, McrStation.AccountGUID);
        }
        
        else
        {
            m_Query.Format("UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = '0' WHERE ACC_ACC_GUID = '%s'",McrStation.AccountGUID);
        }
        m_Database.ExecuteSQL( m_Query);
	}
	catch(CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
    
}
*/
/* Trying to set the mcr balance to zero no matter what- Mike Young 12/18/11 Acted strangely and still showed a balance until a copy was fired off. Then it adjusted the balance to $0
void CMyDatabase::UpdateAccount        (_NetcashDevice &McrStation,CDatabase &m_Database ,int dbms)
{	
    
    CString          m_Query;
    
	try
	{   
        m_Query.Format("UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = '0.00' WHERE ACC_ACC_GUID = '%s'",McrStation.AccountGUID);
        m_Database.ExecuteSQL( m_Query);
	}
	catch(CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
    
}
*/


void CMyDatabase::UpdateOfflineAccount        (_NetcashDevice &McrStation,CDatabase &m_Database ,int dbms)
{	

    CString          m_Query;

	try
	{
		switch(McrStation.Charging)
		{
			case MONEY_DEBIT:
					
					m_Query.Format("UPDATE ACCOUNTS SET BALANCE = BALANCE - %f WHERE ACCOUNTID = %d",McrStation.OfflineCost, McrStation.AccountID);
		  		    m_Database.ExecuteSQL(m_Query);
					break;

			case MONEY_CREDIT:
					
					m_Query.Format("UPDATE ACCOUNTS SET BALANCE = BALANCE + %f WHERE ACCOUNTID = %d",McrStation.OfflineCost, McrStation.AccountID);
					m_Database.ExecuteSQL( m_Query);
					break;

			case MONEY_NOCHARGE:
				    break;
		}
	}
	catch(CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateOffLineAccount(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();

	}

}


void CMyDatabase::LogCopyJob           (_NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{
	    CString          m_Query;
		m_Query.Format("INSERT INTO DOCUGATE_GENERAL_ACTIVITY (JOB_GUID,DT_REQUESTED,ACC_BADGE,ACC_GUID,OU_GUID,PAGECOUNT,JOBCOST,COPIES,COLOR,DUPLEX,DOCNAME,CTLUNIT_SERIAL_NO,COMMENTS,OU_NAME,JOBTYPE,CC_CODE,CM_MATTER) VALUES ('%s',GETDATE(),'%s','%s','%s',%d, %f,1,0,0,'COPYJOB','%s','COPYJOB','%s',0,'%s','%s')",
									McrStation.InsertGUID,
									McrStation.CopyAccount,
									McrStation.AccountGUID,
									McrStation.Group,
									McrStation.CurSessionCount,
									McrStation.CurSessionCost,
									McrStation.Location,
									McrStation.GroupName,
									McrStation.CopyClient,
									McrStation.CopyMatter);
	
		try
		{
			m_Database.ExecuteSQL( m_Query);
		}
		catch( CDBException *e)
		{
			char Message[512] = {0};
			sprintf(Message,"CMyDatabase::LogCopyJob(%s)",e->m_strError);
   		    WriteLog(Message,"");
			e->Delete();
		}
	

}


void CMyDatabase::LogJournel  (_NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{

	  CString          m_Query;
	  CString          m_desc;
	  m_desc.Format("MCR Unit %s, # of Copies = %d",McrStation.Location,McrStation.CurSessionCount);
	  
	  m_Query.Format( "INSERT INTO DOCUGATE_GENERAL_ACTIVITY_JOURNEL (J_TYPE,J_AMOUNT,J_GUID,J_DESC) VALUES ('MCR PHOTOCOPY',%.2f,'%s','%s')",		\
						McrStation.CurSessionCost,						
						McrStation.AccountGUID,
						m_desc);
	
	  try
	  {
		m_Database.ExecuteSQL( m_Query);
	  }
	  catch( CDBException *e)
	  {
			char Message[512] = {0};
			sprintf(Message,"CMyDatabase::LogJournel(%s)",e->m_strError);
   		    WriteLog(Message,"");
			e->Delete();
	  }
}



void CMyDatabase::LogCopyJobPL     (_NetcashDevice &McrStation,CDatabase &m_Database,int dbms)
{
	    CString          m_Query;
		m_Query.Format("INSERT INTO DOCUGATE_GENERAL_ACTIVITY_PL (JOB_GUID,PL1,PL2,PL3,PL4) VALUES ('%s',%d,%d,%d,%d)",
									McrStation.InsertGUID,
									McrStation.plCounter[1],
									McrStation.plCounter[2],
									McrStation.plCounter[3],
									McrStation.plCounter[4] );
	
		try
		{
			m_Database.ExecuteSQL( m_Query);
		}
		catch( CDBException *e)
		{
			char Message[512] = {0};
			sprintf(Message,"CMyDatabase::LogCopyJob(%s)",e->m_strError);
   		    WriteLog(Message,"");
			e->Delete();
		}
	

}




void CMyDatabase::Handle_ServiceDown( CDatabase &m_Database)
{
	return;
}

void CMyDatabase::Handle_ServiceUp(CDatabase &m_Database)
{

	return;
}


void CMyDatabase::RemoveAllActiveSessions(CDatabase &m_Database)
{

	try
	{
		  m_Database.ExecuteSQL ("DELETE FROM DOCUGATE_GENERAL_ACTIVE_SESSION");
	}
	catch( CDBException *e)
	{
		char Message[512] = {0};
		sprintf(Message,"CMyDatabase::RemoveActiveCopySessions(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}


void CMyDatabase::DeleteActiveSession(LPSTR pstrAccountGUID,CDatabase &m_Database)
{

	CString          m_Query;

	try
	{
		m_Query.Format("DELETE FROM DOCUGATE_GENERAL_ACTIVE_SESSION WHERE ACC_GUID = '%s'",pstrAccountGUID);
		m_Database.ExecuteSQL (m_Query);
		
	}
	catch( CDBException *e)
	{
		char Message[512] = {0};
		sprintf(Message,"CMyDatabase::DeleteActiveCopySession(%s)",e->m_strError);
		WriteLog(Message,"");
		sprintf(Message,"CMyDatabase::DeleteActiveCopySession(%s)",m_Query);
		WriteLog(Message,"");
		e->Delete();
	}

}


void CMyDatabase::AddActiveSession(LPSTR pstrAccountGUID,CDatabase &m_Database)
{

	
	try
	{
		CString          m_Query;
		m_Query.Format("INSERT INTO DOCUGATE_GENERAL_ACTIVE_SESSION (ACC_GUID) VALUES ('%s')",pstrAccountGUID);
		m_Database.ExecuteSQL (m_Query);
	}
	catch( CDBException *e)
	{
		char Message[512] = {0};
		sprintf(Message,"CMyDatabase::AddActiveCopySession(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}


}

/* Original
int CMyDatabase::IsActiveSession(LPSTR pstrAccountGUID,CDatabase &m_Database)
{


	CRecordset       m_RS( &m_Database );
	CString          m_Query;
	CString          m_Data;
    int res          = 0;

	try
	{

		m_Query.Format("SELECT count(*) as SessionCount FROM DOCUGATE_GENERAL_ACTIVE_SESSION where ACC_GUID = '%s'",pstrAccountGUID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		m_RS.GetFieldValue( short(0),m_Data);

		if ( m_RS.IsOpen() )
			 m_RS.Close();

		if ( atoi(m_Data) == 0 ) // need to insert
			res = 0;
		else				  // need to upddate	
			res = 1;

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::IsActiveSession(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
	
	return res;
	

}
*/

/* Just going to try to get a local variable that this next routine will understand */
char AccountGroup[51];

void CMyDatabase::GetAccountGroup(LPSTR pstrAccountGUID,CDatabase &m_Database)
{
    
    
	CRecordset       m_RS( &m_Database );
	CString          m_Query;
	CString          m_Data;
    
	// Get AccountGroup
    m_Query.Format("SELECT ACC_OU_GUID FROM DOCUGATE_GENERAL_ACC WHERE ACC_ACC_GUID = '%s'",pstrAccountGUID );
	m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
    m_RS.GetFieldValue( short(0),m_Data);
    
    /*We need to assign the value of m_Data to the global value AccountGroup, because we don't know what 
     the Cstring class is doing. */
    
    if( m_Data.CompareNoCase("ACC_OU_GUID") == 0 )
        strncpy(AccountGroup,m_Data,51);
    
    if ( m_RS.IsOpen() )
        m_RS.Close();
    
        
}
/* Creating a global variable and function to handle the MCR Group */
char UnitGroup[51];

/* Re-trying the GetUnitGroup function */
void CMyDatabase::GetUnitGroup(_NetcashDevice &pBuf,CDatabase &m_Database,int dbms)
{
    CString         m_Query;
    CRecordset      m_RS( &m_Database );
    CString         m_Data;
    
    m_Query.Format("SELECT CTLUNIT_OU_GUID FROM DOCUGATE_GENERAL_CTLUNIT WHERE CTLUNIT_SERIAL_NO = '%s'",pBuf.Location);
    //m_Database.ExecuteSQL (m_Query);
    m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
    m_RS.GetFieldValue( short(0),m_Data);
    
    //if( m_Data.CompareNoCase("CTLUNIT_OU_GUID") == 0 )
    strncpy(UnitGroup,m_Data,51);
    
    if ( m_RS.IsOpen() )
        m_RS.Close();
    
}

/* Trying just the ACL detection at this point */
int CMyDatabase::IsActiveSession(LPSTR pstrAccountGUID,CDatabase &m_Database)
{
    
    
	CRecordset       m_RS( &m_Database );
	CString          m_Query;
	CString          m_Data;
    int res          = 0;
    //_NetcashDevice   pBuf;
    //char             pBuf;
    
	try
	{
        GetAccountGroup(pstrAccountGUID,m_Database); //Call our new function first, so we can compare
        //GetUnitGroup(pBuf.Location,m_Database,m_Data); //Call our new GetUnitGroup function
		m_Query.Format("SELECT count(*) as SessionCount FROM DOCUGATE_GENERAL_ACTIVE_SESSION where ACC_GUID = '%s'",pstrAccountGUID);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		m_RS.GetFieldValue( short(0),m_Data);
        
		if ( m_RS.IsOpen() )
            m_RS.Close();
        
        if ( atoi(m_Data) == 0 ) // need to insert
            // ACL check is here
            //if ( UnitGroup[0] = NULL )
            //if ( strcmp(AccountGroup,UnitOUGUID) == 0 )
            if ( AccountGroup = 'ECASHIER' )
                res = 0;
            else
                res = 1;
        
         else				  // need to upddate	
            res = 1;
        
	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::IsActiveSession(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}
	
	
	return res;
	
    
}
void CMyDatabase::Handle_PingedConnection( _NetcashDevice &pBuf,CDatabase &m_Database,int dbms)
{

	CRecordset       m_RS( &m_Database );
	CString          m_Query;
	CString          m_Data;

	try
	{

		m_Query.Format("SELECT count(*) as MyCOUNTER FROM SMARTPRINT_STATIONS where SC_DEVICEID = '%s'",pBuf.Location);
		m_RS.Open(AFX_DB_USE_DEFAULT_TYPE, m_Query,CRecordset::executeDirect);
		m_RS.GetFieldValue( short(0),m_Data);

		if ( m_RS.IsOpen() )
			 m_RS.Close();

		if ( atoi(m_Data) == 0 ) // need to insert
		{
			m_Query.Format("INSERT INTO SMARTPRINT_STATIONS (SC_DEVICEID,SC_DEVICEIP,SC_DEVICEGW,SC_DEVICEMASK,SC_STATUS) VALUES ('%s','%s','%s','%s','Connection Alive')",pBuf.Location,pBuf.Address,pBuf.Gateway,pBuf.Mask);
			m_Database.ExecuteSQL (m_Query);

		}
		else				  // need to upddate	
		{
			m_Query.Format("UPDATE SMARTPRINT_STATIONS SET SC_DEVICEIP = '%s',SC_DEVICEGW= '%s',SC_DEVICEMASK= '%s',SC_STATUS = 'Connection Alive' WHERE SC_DEVICEID = '%s'",pBuf.Address,pBuf.Gateway,pBuf.Mask,pBuf.Location);
			m_Database.ExecuteSQL (m_Query);
		}

		m_Query.Format("UPDATE SMARTPRINT_STATIONS SET SC_LATEST = NOW() WHERE SC_DEVICEID = '%s'",pBuf.Location);
		m_Query.Replace("NOW()","GETDATE()");
 		m_Database.ExecuteSQL (m_Query);

	
	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::Handle_PingedConnection(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}



void CMyDatabase::Handle_DroppedConnection( _NetcashDevice &pBuf,CDatabase &m_Database,int dbms)
{

	CString          m_Query;
	
	try
	{
		m_Query.Format("UPDATE SMARTPRINT_STATIONS SET SC_STATUS = 'Connection Dropped' WHERE SC_DEVICEID = '%s'",pBuf.Location);
		m_Database.ExecuteSQL (m_Query);
	
		m_Query.Format("UPDATE SMARTPRINT_STATIONS SET SC_LATEST = NOW() WHERE SC_DEVICEID = '%s'",pBuf.Location);
		m_Query.Replace("NOW()","GETDATE()");
		m_Database.ExecuteSQL (m_Query);
	
	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::Handle_DroppedConnection(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}


void CMyDatabase::Handle_SessionActive( _NetcashDevice &pBuf,CDatabase &m_Database)
{

	CString          m_Query;
	
	try
	{
		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_STATUS = 'ACTIVE' WHERE CTLUNIT_GUID = '%s'",pBuf.UnitGUID);
		m_Database.ExecuteSQL (m_Query);
	
		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_LATEST = GETDATE() WHERE CTLUNIT_GUID = '%s'",pBuf.UnitGUID);
		m_Database.ExecuteSQL (m_Query);
		
	
	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::Handle_SessionActive(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}


void CMyDatabase::Handle_SessionClosed( _NetcashDevice &pBuf,CDatabase &m_Database)
{

	CString          m_Query;

	try
	{

		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_STATUS = 'CLOSED' WHERE CTLUNIT_GUID = '%s'",pBuf.UnitGUID);
		m_Database.ExecuteSQL (m_Query);
	
		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_LATEST = GETDATE() WHERE CTLUNIT_GUID = '%s'",pBuf.UnitGUID);
		m_Database.ExecuteSQL (m_Query);
	
		
	
	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::Handle_SessionClosed(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();

	}

}

void CMyDatabase::Handle_SessionIdle( _NetcashDevice &pBuf,CDatabase &m_Database)
{

	CString          m_Query;
	try
	{
		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_STATUS = 'IDLE' WHERE CTLUNIT_GUID = '%s'",pBuf.UnitGUID);
		m_Database.ExecuteSQL (m_Query);
		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_LATEST = GETDATE() WHERE CTLUNIT_GUID = '%s'",pBuf.UnitGUID);
		m_Database.ExecuteSQL (m_Query);

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::Handle_SessionIdle(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}



void CMyDatabase::Handle_NewConnection( _NetcashDevice &pBuf,CDatabase &m_Database ,int dbms)
{
	
	CString          m_Query;
	CRecordset       m_RS( &m_Database );
	CString          m_Data;

	try
	{
		m_Query.Format("UPDATE DOCUGATE_GENERAL_CTLUNIT SET CTLUNIT_STATUS = 'CONNECTED' WHERE CTLUNIT_SERIAL_NO = '%s'",pBuf.Location);
		m_Database.ExecuteSQL (m_Query);

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::Handle_NewConnection(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

}


int CMyDatabase::UpdateSchema( CDatabase &m_Database )
{

	CString          m_Query;
	
	try
	{
		m_Query.Format("if not exists (select * from syscolumns where id=object_id('DOCUGATE_GENERAL_CTLUNIT') and name='CTLUNIT_STATUS')  alter table DOCUGATE_GENERAL_CTLUNIT add CTLUNIT_STATUS varchar(255) NULL");
		m_Database.ExecuteSQL (m_Query);
		m_Query.Format("if not exists (select * from syscolumns where id=object_id('DOCUGATE_GENERAL_CTLUNIT') and name='CTLUNIT_LATEST')  alter table DOCUGATE_GENERAL_CTLUNIT add CTLUNIT_LATEST datetime NULL");
		m_Database.ExecuteSQL (m_Query);
		m_Query.Format("if not exists (select * from syscolumns where id=object_id('DOCUGATE_GENERAL_ACTIVITY') and name='ACC_GUID')  alter table DOCUGATE_GENERAL_ACTIVITY add ACC_GUID uniqueidentifier NULL");
		m_Database.ExecuteSQL (m_Query);
		m_Query.Format("if not exists (select * from syscolumns where id=object_id('DOCUGATE_GENERAL_ACTIVITY') and name='OU_GUID')  alter table DOCUGATE_GENERAL_ACTIVITY add OU_GUID uniqueidentifier NULL");
		m_Database.ExecuteSQL (m_Query);

	}
	catch( CDBException *e)
	{
		CString Message;
		Message.Format("CMyDatabase::UpdateSchema(%s)",e->m_strError);
		WriteLog(Message,"");
		e->Delete();
	}

	return 0;

}
