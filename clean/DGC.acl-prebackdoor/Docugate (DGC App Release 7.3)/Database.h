
//////////////////////////////////////////////////////////////////////
//                                                                  //
//  Copyright(C) Network Printing Solutions,INC - Tampa,Florida     //
//  All Rights Reserved                                             //
//  no unauthorized distribution or reuse permitted                 //
//  with the consent of Network Printing Solutions,INC.             //
//  www.printstudy.com - sales@printstudy.com                       //
//  this Copyright message must not be removed from this file       //
//                                                                  //
//////////////////////////////////////////////////////////////////////


#ifndef CMyDatabase_h
#define CMyDatabase_h



class CMyDatabase
{

public:

	CMyDatabase();
	~CMyDatabase();

	void Handle_ServiceUp        ( CDatabase &m_Database );
	void Handle_ServiceDown      ( CDatabase &m_Database );
	void RemoveAllActiveSessions ( CDatabase &m_Database );

	void DeleteActiveSession     ( LPSTR pstrAccountGUID,  CDatabase &m_Database );
	void AddActiveSession        ( LPSTR pstrAccountGUID,  CDatabase &m_Database );
	int  IsActiveSession         ( LPSTR pstrAccountGUID,  CDatabase &m_Database );
    void GetInsertGuid            (_NetcashDevice   &, CDatabase &m_Database,int dbms);

	void GetDeviceID			  ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	void GetAccountID			  ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	void GetOfflineAccountID	  ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms );

	void GetCopier			      ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	void GetAccount			      ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	void GetGroup			      ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	int  VerifyClient	          ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	int  VerifyMatter	   	      ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	int	 GetStation			      ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);

	void Handle_NewConnection     ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	void Handle_SessionIdle       ( _NetcashDevice  & ,CDatabase &m_Database);
	void Handle_SessionClosed     ( _NetcashDevice  & ,CDatabase &m_Database);
	void Handle_SessionActive     ( _NetcashDevice  & ,CDatabase &m_Database); 
    int  CtlUnitACL               ( _NetcashDevice  & ,CDatabase &m_Database);
	void Handle_DroppedConnection ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);
	void Handle_PingedConnection  ( _NetcashDevice  & ,CDatabase &m_Database ,int dbms);

	void LogCopyJob               ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);
	void LogCopyJobPL             ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);
	void LogJournel				  ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);
	
	void UpdateCopier             ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);
	void UpdateAccount            ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);

	void UpdateOfflineCopier      ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);
	void UpdateOfflineAccount     ( _NetcashDevice  & ,CDatabase &m_Database,int dbms);
	
	int  CloseConnection          ( CDatabase &m_Database,int dbms );
	int  CloseConnection          ( CDatabase &m_Database);
	int  CheckHandle              ( CDatabase &m_Database,int dbms );
	int  OpenConnection			  ( CDatabase &m_Database,int dbms );
	int  OpenConnection			  ( CDatabase &m_Database,int dbms,int Index );
	int  OpenConnection			  ( CDatabase &m_Database);
	int  UpdateSchema			  ( CDatabase &m_Database);

	CString                      m_strConnect;
	CString                      m_localpath;
	CString                      m_LocationFilter;
	CString                      m_UnitValue;
	CString                      m_UnitValueEnabled;
	
	CString ReadIni		          ();
	int     ReadStationsIni       ();
	int     ReadStationsFromTable (CDatabase &m_Database);
	int		StationIndex;
    int     GetIniPath            ();
	int     GetUnitOrCurrency	  (CDatabase &m_Database);
	
	void	GetAccMaxSpend        (_NetcashDevice &, CDatabase &m_Database, int dbms);
	void	GetOUMaxSpend         (_NetcashDevice &, CDatabase &m_Database, int dbms);
	void	GetGlobalMaxSpend     (_NetcashDevice &, CDatabase &m_Database, int dbms);
	void    GetStationCustomPL    (_TagStation    &, CDatabase &m_Database, int dbms);

};

#endif	
