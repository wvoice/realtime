/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_WHOIS_H_
#define _IPWORKS_WHOIS_H_

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

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_WHOIS_DEFAULTSERVER    1
#define PID_WHOIS_DOMAIN    2
#define PID_WHOIS_DOMAININFO    3
#define PID_WHOIS_FIREWALLDATA    4
#define PID_WHOIS_FIREWALLHOST    5
#define PID_WHOIS_FIREWALLPASSWORD    6
#define PID_WHOIS_FIREWALLPORT    7
#define PID_WHOIS_FIREWALLTYPE    8
#define PID_WHOIS_FIREWALLUSER    9
#define PID_WHOIS_LOCALHOST    10
#define PID_WHOIS_SERVER    11
#define PID_WHOIS_SOCKETHANDLE    12
#define PID_WHOIS_TIMEOUT    13
#define PID_WHOIS_WINSOCKINFO    14
#define PID_WHOIS_WINSOCKLOADED    15
#define PID_WHOIS_WINSOCKMAXDATAGRAMSIZE    16
#define PID_WHOIS_WINSOCKMAXSOCKETS    17
#define PID_WHOIS_WINSOCKPATH    18
#define PID_WHOIS_WINSOCKSTATUS    19


#define MID_WHOIS_DOEVENTS    1
#define MID_WHOIS_QUERY    2


#define EID_WHOIS_ERROR    1


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID Whois_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    Whois_Destroy(LPVOID lpObj);
CNX_IMPORT INT    Whois_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID Whois_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    Whois_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    Whois_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  Whois_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    Whois_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   Whois_StaticInit(LPVOID hInst);

class WhoisA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_WHOIS_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WhoisA*)lpObj)->FireError(pErrorCode, pDescription);
         }

      }
      return 0;
    }

  public:

    WhoisA(LPCSTR lpOemKey = IPWORKS_OEMKEY_53) {
      m_pObj = Whois_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~WhoisA() {
      Whois_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)Whois_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return Whois_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)Whois_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return Whois_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline LPCSTR GetDefaultServer() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_DEFAULTSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDefaultServer(LPCSTR lpszDefaultServer) {
      int val = (int)lpszDefaultServer;
      return Whois_Set(m_pObj, PID_WHOIS_DEFAULTSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDomain() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_DOMAIN, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDomain(LPCSTR lpszDomain) {
      int val = (int)lpszDomain;
      return Whois_Set(m_pObj, PID_WHOIS_DOMAIN, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDomainInfo() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_DOMAININFO, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)Whois_Get(m_pObj, PID_WHOIS_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return Whois_Set(m_pObj, PID_WHOIS_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return Whois_Set(m_pObj, PID_WHOIS_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return Whois_Set(m_pObj, PID_WHOIS_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return Whois_Set(m_pObj, PID_WHOIS_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return Whois_Set(m_pObj, PID_WHOIS_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return Whois_Set(m_pObj, PID_WHOIS_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return Whois_Set(m_pObj, PID_WHOIS_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetServer() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_SERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetServer(LPCSTR lpszServer) {
      int val = (int)lpszServer;
      return Whois_Set(m_pObj, PID_WHOIS_SERVER, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return Whois_Set(m_pObj, PID_WHOIS_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return Whois_Set(m_pObj, PID_WHOIS_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return Whois_Set(m_pObj, PID_WHOIS_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)Whois_Get(m_pObj, PID_WHOIS_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return Whois_Do(m_pObj, MID_WHOIS_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Query(LPSTR lpszDomain) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszDomain, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return Whois_Do(m_pObj, MID_WHOIS_QUERY, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class Whois : public WhoisA {
  
  public:
    Whois(LPCSTR lpOemKey = IPWORKS_OEMKEY_53):WhoisA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDefaultServer;
    MCFStringRef tmpDomain;
    MCFStringRef tmpDomainInfo;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpServer;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(WhoisA::GetLastError());
    }

    // CFString versions of properties
    inline CFStringRef GetDefaultServer() {
      return tmpDefaultServer.Set(WhoisA::GetDefaultServer());
    }

    inline INT SetDefaultServer(CFStringRef strDefaultServer) {
      MCFStringAcc tmp;
      return WhoisA::SetDefaultServer(tmp.Deref(strDefaultServer));
    }
    inline CFStringRef GetDomain() {
      return tmpDomain.Set(WhoisA::GetDomain());
    }

    inline INT SetDomain(CFStringRef strDomain) {
      MCFStringAcc tmp;
      return WhoisA::SetDomain(tmp.Deref(strDomain));
    }
    inline CFStringRef GetDomainInfo() {
      return tmpDomainInfo.Set(WhoisA::GetDomainInfo());
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = WhoisA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return WhoisA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(WhoisA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return WhoisA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(WhoisA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return WhoisA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(WhoisA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return WhoisA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(WhoisA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return WhoisA::SetLocalHost(tmp.Deref(strLocalHost));
    }
    inline CFStringRef GetServer() {
      return tmpServer.Set(WhoisA::GetServer());
    }

    inline INT SetServer(CFStringRef strServer) {
      MCFStringAcc tmp;
      return WhoisA::SetServer(tmp.Deref(strServer));
    }


    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(WhoisA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(WhoisA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return WhoisA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(WhoisA::GetWinsockStatus());
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



  public:
  
    //redeclare methods with CFString parameters



    inline int Query(CFStringRef pDomain) {
      MCFStringAcc etmpDomain;
      LPSTR lpszDomain = etmpDomain.Deref(pDomain);

      return WhoisA::Query(lpszDomain);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDefaultServer;
    MUString tmpDomain;
    MUString tmpDomainInfo;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLocalHost;
    MUString tmpServer;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(WhoisA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties
    inline LPWSTR GetDefaultServer() {
      tmpDefaultServer.Set(WhoisA::GetDefaultServer());
      return tmpDefaultServer.Deref();
    }

    inline INT SetDefaultServer(LPWSTR lpszDefaultServer) {
      MAString tmp(lpszDefaultServer);
      return WhoisA::SetDefaultServer(tmp.Deref());
    }
    inline LPWSTR GetDomain() {
      tmpDomain.Set(WhoisA::GetDomain());
      return tmpDomain.Deref();
    }

    inline INT SetDomain(LPWSTR lpszDomain) {
      MAString tmp(lpszDomain);
      return WhoisA::SetDomain(tmp.Deref());
    }
    inline LPWSTR GetDomainInfo() {
      tmpDomainInfo.Set(WhoisA::GetDomainInfo());
      return tmpDomainInfo.Deref();
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = WhoisA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return WhoisA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(WhoisA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return WhoisA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(WhoisA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return WhoisA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(WhoisA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return WhoisA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(WhoisA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return WhoisA::SetLocalHost(tmp.Deref());
    }
    inline LPWSTR GetServer() {
      tmpServer.Set(WhoisA::GetServer());
      return tmpServer.Deref();
    }

    inline INT SetServer(LPWSTR lpszServer) {
      MAString tmp(lpszServer);
      return WhoisA::SetServer(tmp.Deref());
    }


    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(WhoisA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(WhoisA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return WhoisA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(WhoisA::GetWinsockStatus());
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



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_WHOIS_H_




