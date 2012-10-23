/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_LDAP_H_
#define _IPWORKS_LDAP_H_

#include "ipworks.h"

#ifdef _WIN32_WCE
#ifndef WIN32
#define WIN32
#endif
#include "ipworksce.key"
#else
#include "ipworks.key"
#endif

#ifndef _IPWORKS_INTERNAL_

#define ldapIdle                                           0
#define ldapBind                                           1
#define ldapUnbind                                         2
#define ldapSearch                                         3
#define ldapModify                                         4
#define ldapModifyRDN                                      5
#define ldapAdd                                            6
#define ldapDelete                                         7
#define ldapCompare                                        8
#define ldapAbandon                                        9

#define amoAdd                                             0
#define amoDelete                                          1
#define amoReplace                                         2

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3

#define sdaNever                                           0
#define sdaInSearching                                     1
#define sdaFindingBaseObject                               2
#define sdaAlways                                          3

#define ssBaseObject                                       0
#define ssSingleLevel                                      1
#define ssWholeSubtree                                     2


#define LDAP_IDLE                                          0
#define LDAP_BIND                                          1
#define LDAP_UNBIND                                        2
#define LDAP_SEARCH                                        3
#define LDAP_MODIFY                                        4
#define LDAP_MODIFY_RDN                                    5
#define LDAP_ADD                                           6
#define LDAP_DELETE                                        7
#define LDAP_COMPARE                                       8
#define LDAP_ABANDON                                       9

#define AMO_ADD                                            0
#define AMO_DELETE                                         1
#define AMO_REPLACE                                        2

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3

#define SDA_NEVER                                          0
#define SDA_IN_SEARCHING                                   1
#define SDA_FINDING_BASE_OBJECT                            2
#define SDA_ALWAYS                                         3

#define SS_BASE_OBJECT                                     0
#define SS_SINGLE_LEVEL                                    1
#define SS_WHOLE_SUBTREE                                   2



#endif //_IPWORKS_INTERNAL_

#define PID_LDAP_ABANDONMESSAGEID    1
#define PID_LDAP_ACCEPTDATA    2
#define PID_LDAP_ACTION    3
#define PID_LDAP_ATTRCOUNT    4
#define PID_LDAP_ATTRMODOP    5
#define PID_LDAP_ATTRTYPE    6
#define PID_LDAP_ATTRVALUE    7
#define PID_LDAP_CONNECTED    8
#define PID_LDAP_DELETEOLDRDN    9
#define PID_LDAP_DN    10
#define PID_LDAP_FIREWALLDATA    11
#define PID_LDAP_FIREWALLHOST    12
#define PID_LDAP_FIREWALLPASSWORD    13
#define PID_LDAP_FIREWALLPORT    14
#define PID_LDAP_FIREWALLTYPE    15
#define PID_LDAP_FIREWALLUSER    16
#define PID_LDAP_LDAPVERSION    17
#define PID_LDAP_LOCALHOST    18
#define PID_LDAP_MESSAGEID    19
#define PID_LDAP_NEWRDN    20
#define PID_LDAP_PASSWORD    21
#define PID_LDAP_RESULTCODE    22
#define PID_LDAP_RESULTDESCRIPTION    23
#define PID_LDAP_RESULTDN    24
#define PID_LDAP_SEARCHDEREFALIASES    25
#define PID_LDAP_SEARCHFILTER    26
#define PID_LDAP_SEARCHRETURNVALUES    27
#define PID_LDAP_SEARCHSCOPE    28
#define PID_LDAP_SEARCHSIZELIMIT    29
#define PID_LDAP_SEARCHTIMELIMIT    30
#define PID_LDAP_SERVERNAME    31
#define PID_LDAP_SERVERPORT    32
#define PID_LDAP_SOCKETHANDLE    33
#define PID_LDAP_TIMEOUT    34
#define PID_LDAP_WINSOCKINFO    35
#define PID_LDAP_WINSOCKLOADED    36
#define PID_LDAP_WINSOCKMAXDATAGRAMSIZE    37
#define PID_LDAP_WINSOCKMAXSOCKETS    38
#define PID_LDAP_WINSOCKPATH    39
#define PID_LDAP_WINSOCKSTATUS    40


#define MID_LDAP_ABANDON    1
#define MID_LDAP_ADD    2
#define MID_LDAP_BIND    3
#define MID_LDAP_COMPARE    4
#define MID_LDAP_DELETE    5
#define MID_LDAP_DOEVENTS    6
#define MID_LDAP_MODIFY    7
#define MID_LDAP_MODIFYRDN    8
#define MID_LDAP_SEARCH    9
#define MID_LDAP_UNBIND    10


#define EID_LDAP_ERROR    1
#define EID_LDAP_RESULT    2
#define EID_LDAP_SEARCHCOMPLETE    3
#define EID_LDAP_SEARCHRESULT    4


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID LDAP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    LDAP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    LDAP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID LDAP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    LDAP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    LDAP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  LDAP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    LDAP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   LDAP_StaticInit(LPVOID hInst);

class LDAPA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireResult(USHORT &usMessageId, LPSTR &lpszDN, USHORT &usResultCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireSearchComplete(USHORT &usMessageId, LPSTR &lpszDN, USHORT &usResultCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireSearchResult(USHORT &usMessageId, LPSTR &lpszDN) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_LDAP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((LDAPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_LDAP_RESULT: {
                        USHORT pMessageId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDN = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pResultCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((LDAPA*)lpObj)->FireResult(pMessageId, pDN, pResultCode, pDescription);
         }
         case EID_LDAP_SEARCHCOMPLETE: {
                        USHORT pMessageId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDN = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pResultCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((LDAPA*)lpObj)->FireSearchComplete(pMessageId, pDN, pResultCode, pDescription);
         }
         case EID_LDAP_SEARCHRESULT: {
                        USHORT pMessageId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDN = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((LDAPA*)lpObj)->FireSearchResult(pMessageId, pDN);
         }

      }
      return 0;
    }

  public:

    LDAPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_33) {
      m_pObj = LDAP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~LDAPA() {
      LDAP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)LDAP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return LDAP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)LDAP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return LDAP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAbandonMessageId() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_ABANDONMESSAGEID, 0, 0);
      return (INT)val;
    }
    inline INT SetAbandonMessageId(INT iAbandonMessageId) {
      int val = (int)iAbandonMessageId;
      return LDAP_Set(m_pObj, PID_LDAP_ABANDONMESSAGEID, 0, (LPVOID)val, 0);
    }
    inline BOOL GetAcceptData() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return LDAP_Set(m_pObj, PID_LDAP_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline INT GetAction() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return LDAP_Set(m_pObj, PID_LDAP_ACTION, 0, (LPVOID)val, 0);
    }
    inline INT GetAttrCount() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_ATTRCOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetAttrCount(INT iAttrCount) {
      int val = (int)iAttrCount;
      return LDAP_Set(m_pObj, PID_LDAP_ATTRCOUNT, 0, (LPVOID)val, 0);
    }
    inline INT GetAttrModOp(USHORT usAttrIndex) {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_ATTRMODOP, usAttrIndex, 0);
      return (INT)val;
    }
    inline INT SetAttrModOp(USHORT usAttrIndex, INT iAttrModOp) {
      int val = (int)iAttrModOp;
      return LDAP_Set(m_pObj, PID_LDAP_ATTRMODOP, usAttrIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetAttrType(USHORT usAttrIndex) {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_ATTRTYPE, usAttrIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetAttrType(USHORT usAttrIndex, LPCSTR lpszAttrType) {
      int val = (int)lpszAttrType;
      return LDAP_Set(m_pObj, PID_LDAP_ATTRTYPE, usAttrIndex, (LPVOID)val, 0);
    }
    inline INT GetAttrValue(USHORT usAttrIndex, LPCSTR &lpAttrValue, UINT &lenAttrValue) {
      lpAttrValue = (LPSTR)LDAP_Get(m_pObj, PID_LDAP_ATTRVALUE, usAttrIndex, &lenAttrValue);
      if ( ! lpAttrValue) return lenAttrValue;
      return 0;
    }

    inline INT SetAttrValue(USHORT usAttrIndex, LPCSTR lpAttrValue, UINT lenAttrValue) {
      return LDAP_Set(m_pObj, PID_LDAP_ATTRVALUE, usAttrIndex, (LPVOID)lpAttrValue, lenAttrValue);
    }

    inline BOOL GetConnected() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline BOOL GetDeleteOldRDN() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_DELETEOLDRDN, 0, 0);
      return (BOOL)val;
    }
    inline INT SetDeleteOldRDN(BOOL bDeleteOldRDN) {
      int val = (int)bDeleteOldRDN;
      return LDAP_Set(m_pObj, PID_LDAP_DELETEOLDRDN, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDN() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_DN, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDN(LPCSTR lpszDN) {
      int val = (int)lpszDN;
      return LDAP_Set(m_pObj, PID_LDAP_DN, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)LDAP_Get(m_pObj, PID_LDAP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return LDAP_Set(m_pObj, PID_LDAP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return LDAP_Set(m_pObj, PID_LDAP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return LDAP_Set(m_pObj, PID_LDAP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return LDAP_Set(m_pObj, PID_LDAP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return LDAP_Set(m_pObj, PID_LDAP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return LDAP_Set(m_pObj, PID_LDAP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline INT GetLDAPVersion() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_LDAPVERSION, 0, 0);
      return (INT)val;
    }
    inline INT SetLDAPVersion(INT iLDAPVersion) {
      int val = (int)iLDAPVersion;
      return LDAP_Set(m_pObj, PID_LDAP_LDAPVERSION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return LDAP_Set(m_pObj, PID_LDAP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline INT GetMessageId() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_MESSAGEID, 0, 0);
      return (INT)val;
    }
    inline INT SetMessageId(INT iMessageId) {
      int val = (int)iMessageId;
      return LDAP_Set(m_pObj, PID_LDAP_MESSAGEID, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetNewRDN() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_NEWRDN, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetNewRDN(LPCSTR lpszNewRDN) {
      int val = (int)lpszNewRDN;
      return LDAP_Set(m_pObj, PID_LDAP_NEWRDN, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return LDAP_Set(m_pObj, PID_LDAP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline INT GetResultCode() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_RESULTCODE, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetResultDescription() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_RESULTDESCRIPTION, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetResultDN() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_RESULTDN, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetSearchDerefAliases() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SEARCHDEREFALIASES, 0, 0);
      return (INT)val;
    }
    inline INT SetSearchDerefAliases(INT iSearchDerefAliases) {
      int val = (int)iSearchDerefAliases;
      return LDAP_Set(m_pObj, PID_LDAP_SEARCHDEREFALIASES, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSearchFilter() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SEARCHFILTER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSearchFilter(LPCSTR lpszSearchFilter) {
      int val = (int)lpszSearchFilter;
      return LDAP_Set(m_pObj, PID_LDAP_SEARCHFILTER, 0, (LPVOID)val, 0);
    }
    inline BOOL GetSearchReturnValues() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SEARCHRETURNVALUES, 0, 0);
      return (BOOL)val;
    }
    inline INT SetSearchReturnValues(BOOL bSearchReturnValues) {
      int val = (int)bSearchReturnValues;
      return LDAP_Set(m_pObj, PID_LDAP_SEARCHRETURNVALUES, 0, (LPVOID)val, 0);
    }
    inline INT GetSearchScope() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SEARCHSCOPE, 0, 0);
      return (INT)val;
    }
    inline INT SetSearchScope(INT iSearchScope) {
      int val = (int)iSearchScope;
      return LDAP_Set(m_pObj, PID_LDAP_SEARCHSCOPE, 0, (LPVOID)val, 0);
    }
    inline INT GetSearchSizeLimit() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SEARCHSIZELIMIT, 0, 0);
      return (INT)val;
    }
    inline INT SetSearchSizeLimit(INT iSearchSizeLimit) {
      int val = (int)iSearchSizeLimit;
      return LDAP_Set(m_pObj, PID_LDAP_SEARCHSIZELIMIT, 0, (LPVOID)val, 0);
    }
    inline INT GetSearchTimeLimit() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SEARCHTIMELIMIT, 0, 0);
      return (INT)val;
    }
    inline INT SetSearchTimeLimit(INT iSearchTimeLimit) {
      int val = (int)iSearchTimeLimit;
      return LDAP_Set(m_pObj, PID_LDAP_SEARCHTIMELIMIT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetServerName() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SERVERNAME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetServerName(LPCSTR lpszServerName) {
      int val = (int)lpszServerName;
      return LDAP_Set(m_pObj, PID_LDAP_SERVERNAME, 0, (LPVOID)val, 0);
    }
    inline USHORT GetServerPort() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SERVERPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetServerPort(USHORT usServerPort) {
      int val = (int)usServerPort;
      return LDAP_Set(m_pObj, PID_LDAP_SERVERPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return LDAP_Set(m_pObj, PID_LDAP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return LDAP_Set(m_pObj, PID_LDAP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return LDAP_Set(m_pObj, PID_LDAP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)LDAP_Get(m_pObj, PID_LDAP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Abandon() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_ABANDON, 0, param, cbparam);
      
      
    }
    inline int Add() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_ADD, 0, param, cbparam);
      
      
    }
    inline int Bind() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_BIND, 0, param, cbparam);
      
      
    }
    inline int Compare() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_COMPARE, 0, param, cbparam);
      
      
    }
    inline int Delete() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_DELETE, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Modify() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_MODIFY, 0, param, cbparam);
      
      
    }
    inline int ModifyRDN() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_MODIFYRDN, 0, param, cbparam);
      
      
    }
    inline int Search() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_SEARCH, 0, param, cbparam);
      
      
    }
    inline int Unbind() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return LDAP_Do(m_pObj, MID_LDAP_UNBIND, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class LDAP : public LDAPA {
  
  public:
    LDAP(LPCSTR lpOemKey = IPWORKS_OEMKEY_33):LDAPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAttrType;
    MCFStringRef tmpAttrValue;
    MCFStringRef tmpDN;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpNewRDN;
    MCFStringRef tmpPassword;
    MCFStringRef tmpResultDescription;
    MCFStringRef tmpResultDN;
    MCFStringRef tmpSearchFilter;
    MCFStringRef tmpServerName;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(LDAPA::GetLastError());
    }

    // CFString versions of properties





    inline CFStringRef GetAttrType(USHORT usAttrIndex) {
      return tmpAttrType.Set(LDAPA::GetAttrType(usAttrIndex));
    }

    inline INT SetAttrType(USHORT usAttrIndex, CFStringRef strAttrType) {
      MCFStringAcc tmp;
      return LDAPA::SetAttrType(usAttrIndex, tmp.Deref(strAttrType));
    }
    inline CFStringRef GetAttrValue(USHORT usAttrIndex) {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = LDAPA::GetAttrValue(usAttrIndex, tmp, len);
      if (ret_code) return NULL;
      return tmpAttrValue.Set(tmp, len);
    }

    inline INT SetAttrValue(USHORT usAttrIndex, CFStringRef strAttrValue) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strAttrValue);
      return LDAPA::SetAttrValue(usAttrIndex, lp, tmp.Length());
    }


    inline CFStringRef GetDN() {
      return tmpDN.Set(LDAPA::GetDN());
    }

    inline INT SetDN(CFStringRef strDN) {
      MCFStringAcc tmp;
      return LDAPA::SetDN(tmp.Deref(strDN));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = LDAPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return LDAPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(LDAPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return LDAPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(LDAPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return LDAPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(LDAPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return LDAPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(LDAPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return LDAPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetNewRDN() {
      return tmpNewRDN.Set(LDAPA::GetNewRDN());
    }

    inline INT SetNewRDN(CFStringRef strNewRDN) {
      MCFStringAcc tmp;
      return LDAPA::SetNewRDN(tmp.Deref(strNewRDN));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(LDAPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return LDAPA::SetPassword(tmp.Deref(strPassword));
    }

    inline CFStringRef GetResultDescription() {
      return tmpResultDescription.Set(LDAPA::GetResultDescription());
    }

    inline CFStringRef GetResultDN() {
      return tmpResultDN.Set(LDAPA::GetResultDN());
    }


    inline CFStringRef GetSearchFilter() {
      return tmpSearchFilter.Set(LDAPA::GetSearchFilter());
    }

    inline INT SetSearchFilter(CFStringRef strSearchFilter) {
      MCFStringAcc tmp;
      return LDAPA::SetSearchFilter(tmp.Deref(strSearchFilter));
    }




    inline CFStringRef GetServerName() {
      return tmpServerName.Set(LDAPA::GetServerName());
    }

    inline INT SetServerName(CFStringRef strServerName) {
      MCFStringAcc tmp;
      return LDAPA::SetServerName(tmp.Deref(strServerName));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(LDAPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(LDAPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return LDAPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(LDAPA::GetWinsockStatus());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireError(usErrorCode, uval_lpszDescription);
    }
    virtual INT FireError(USHORT &usErrorCode, CFStringRef &lpszDescription) {
      return 0;
    }

    virtual INT FireResult(USHORT &usMessageId, LPSTR &lpszDN, USHORT &usResultCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDN(lpszDN);
      CFStringRef uval_lpszDN = etmpDN.Deref();
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireResult(usMessageId, uval_lpszDN, usResultCode, uval_lpszDescription);
    }
    virtual INT FireResult(USHORT &usMessageId, CFStringRef &lpszDN, USHORT &usResultCode, CFStringRef &lpszDescription) {
      return 0;
    }

    virtual INT FireSearchComplete(USHORT &usMessageId, LPSTR &lpszDN, USHORT &usResultCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDN(lpszDN);
      CFStringRef uval_lpszDN = etmpDN.Deref();
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireSearchComplete(usMessageId, uval_lpszDN, usResultCode, uval_lpszDescription);
    }
    virtual INT FireSearchComplete(USHORT &usMessageId, CFStringRef &lpszDN, USHORT &usResultCode, CFStringRef &lpszDescription) {
      return 0;
    }

    virtual INT FireSearchResult(USHORT &usMessageId, LPSTR &lpszDN) {
      MCFStringRef etmpDN(lpszDN);
      CFStringRef uval_lpszDN = etmpDN.Deref();

      return FireSearchResult(usMessageId, uval_lpszDN);
    }
    virtual INT FireSearchResult(USHORT &usMessageId, CFStringRef &lpszDN) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters























#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAttrType;
    MUString tmpAttrValue;
    MUString tmpDN;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLocalHost;
    MUString tmpNewRDN;
    MUString tmpPassword;
    MUString tmpResultDescription;
    MUString tmpResultDN;
    MUString tmpSearchFilter;
    MUString tmpServerName;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(LDAPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties





    inline LPWSTR GetAttrType(USHORT usAttrIndex) {
      tmpAttrType.Set(LDAPA::GetAttrType(usAttrIndex));
      return tmpAttrType.Deref();
    }

    inline INT SetAttrType(USHORT usAttrIndex, LPWSTR lpszAttrType) {
      MAString tmp(lpszAttrType);
      return LDAPA::SetAttrType(usAttrIndex, tmp.Deref());
    }
    inline INT GetAttrValue(USHORT usAttrIndex, LPWSTR &lpAttrValue, UINT &lenAttrValue) {
      LPSTR tmp = NULL;
      INT ret_code = LDAPA::GetAttrValue(usAttrIndex, tmp, lenAttrValue);
      if (ret_code) return ret_code;
      tmpAttrValue.Set(tmp, lenAttrValue);
      lpAttrValue = tmpAttrValue.Deref();
      return 0;
    }

    inline INT SetAttrValue(USHORT usAttrIndex, LPWSTR lpAttrValue, UINT lenAttrValue) {
      MAString tmp(lpAttrValue, lenAttrValue);
      return LDAPA::SetAttrValue(usAttrIndex, tmp.Deref(), tmp.Length());
    }


    inline LPWSTR GetDN() {
      tmpDN.Set(LDAPA::GetDN());
      return tmpDN.Deref();
    }

    inline INT SetDN(LPWSTR lpszDN) {
      MAString tmp(lpszDN);
      return LDAPA::SetDN(tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = LDAPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return LDAPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(LDAPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return LDAPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(LDAPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return LDAPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(LDAPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return LDAPA::SetFirewallUser(tmp.Deref());
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(LDAPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return LDAPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetNewRDN() {
      tmpNewRDN.Set(LDAPA::GetNewRDN());
      return tmpNewRDN.Deref();
    }

    inline INT SetNewRDN(LPWSTR lpszNewRDN) {
      MAString tmp(lpszNewRDN);
      return LDAPA::SetNewRDN(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(LDAPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return LDAPA::SetPassword(tmp.Deref());
    }

    inline LPWSTR GetResultDescription() {
      tmpResultDescription.Set(LDAPA::GetResultDescription());
      return tmpResultDescription.Deref();
    }

    inline LPWSTR GetResultDN() {
      tmpResultDN.Set(LDAPA::GetResultDN());
      return tmpResultDN.Deref();
    }


    inline LPWSTR GetSearchFilter() {
      tmpSearchFilter.Set(LDAPA::GetSearchFilter());
      return tmpSearchFilter.Deref();
    }

    inline INT SetSearchFilter(LPWSTR lpszSearchFilter) {
      MAString tmp(lpszSearchFilter);
      return LDAPA::SetSearchFilter(tmp.Deref());
    }




    inline LPWSTR GetServerName() {
      tmpServerName.Set(LDAPA::GetServerName());
      return tmpServerName.Deref();
    }

    inline INT SetServerName(LPWSTR lpszServerName) {
      MAString tmp(lpszServerName);
      return LDAPA::SetServerName(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(LDAPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(LDAPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return LDAPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(LDAPA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireError(usErrorCode, uval_lpszDescription);
    }
    virtual INT FireError(USHORT &usErrorCode, LPWSTR &lpszDescription) {
      return 0;
    }

    virtual INT FireResult(USHORT &usMessageId, LPSTR &lpszDN, USHORT &usResultCode, LPSTR &lpszDescription) {
      MUString etmpDN(lpszDN);
      LPWSTR uval_lpszDN = etmpDN.Deref();
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireResult(usMessageId, uval_lpszDN, usResultCode, uval_lpszDescription);
    }
    virtual INT FireResult(USHORT &usMessageId, LPWSTR &lpszDN, USHORT &usResultCode, LPWSTR &lpszDescription) {
      return 0;
    }

    virtual INT FireSearchComplete(USHORT &usMessageId, LPSTR &lpszDN, USHORT &usResultCode, LPSTR &lpszDescription) {
      MUString etmpDN(lpszDN);
      LPWSTR uval_lpszDN = etmpDN.Deref();
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireSearchComplete(usMessageId, uval_lpszDN, usResultCode, uval_lpszDescription);
    }
    virtual INT FireSearchComplete(USHORT &usMessageId, LPWSTR &lpszDN, USHORT &usResultCode, LPWSTR &lpszDescription) {
      return 0;
    }

    virtual INT FireSearchResult(USHORT &usMessageId, LPSTR &lpszDN) {
      MUString etmpDN(lpszDN);
      LPWSTR uval_lpszDN = etmpDN.Deref();

      return FireSearchResult(usMessageId, uval_lpszDN);
    }
    virtual INT FireSearchResult(USHORT &usMessageId, LPWSTR &lpszDN) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_LDAP_H_




