/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_MX_H_
#define _IPWORKS_MX_H_

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




#endif //_IPWORKS_INTERNAL_

#define PID_MX_DNSPORT    1
#define PID_MX_DNSSERVER    2
#define PID_MX_EMAILADDRESS    3
#define PID_MX_LOCALHOST    4
#define PID_MX_MAILSERVER    5
#define PID_MX_REQUESTID    6
#define PID_MX_SOCKETHANDLE    7
#define PID_MX_STATUS    8
#define PID_MX_TIMEOUT    9
#define PID_MX_WINSOCKINFO    10
#define PID_MX_WINSOCKLOADED    11
#define PID_MX_WINSOCKMAXDATAGRAMSIZE    12
#define PID_MX_WINSOCKMAXSOCKETS    13
#define PID_MX_WINSOCKPATH    14
#define PID_MX_WINSOCKSTATUS    15


#define MID_MX_DOEVENTS    1
#define MID_MX_RESOLVE    2


#define EID_MX_ERROR    1
#define EID_MX_RESPONSE    2


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID MX_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    MX_Destroy(LPVOID lpObj);
CNX_IMPORT INT    MX_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID MX_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    MX_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    MX_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  MX_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    MX_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   MX_StaticInit(LPVOID hInst);

class MXA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireResponse(USHORT &usRequestId, LPSTR &lpszDomain, LPSTR &lpszMailServer, USHORT &usPrecedence, LONG &lTimeToLive, USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_MX_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((MXA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_MX_RESPONSE: {
                        USHORT pRequestId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDomain = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMailServer = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pPrecedence = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pTimeToLive = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((MXA*)lpObj)->FireResponse(pRequestId, pDomain, pMailServer, pPrecedence, pTimeToLive, pStatusCode, pDescription);
         }

      }
      return 0;
    }

  public:

    MXA(LPCSTR lpOemKey = IPWORKS_OEMKEY_29) {
      m_pObj = MX_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~MXA() {
      MX_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)MX_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return MX_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)MX_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return MX_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline USHORT GetDNSPort() {
      int val = (int)MX_Get(m_pObj, PID_MX_DNSPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetDNSPort(USHORT usDNSPort) {
      int val = (int)usDNSPort;
      return MX_Set(m_pObj, PID_MX_DNSPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDNSServer() {
      int val = (int)MX_Get(m_pObj, PID_MX_DNSSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDNSServer(LPCSTR lpszDNSServer) {
      int val = (int)lpszDNSServer;
      return MX_Set(m_pObj, PID_MX_DNSSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEmailAddress() {
      int val = (int)MX_Get(m_pObj, PID_MX_EMAILADDRESS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEmailAddress(LPCSTR lpszEmailAddress) {
      int val = (int)lpszEmailAddress;
      return MX_Set(m_pObj, PID_MX_EMAILADDRESS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)MX_Get(m_pObj, PID_MX_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return MX_Set(m_pObj, PID_MX_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailServer() {
      int val = (int)MX_Get(m_pObj, PID_MX_MAILSERVER, 0, 0);
      return (LPCSTR)val;
    }

    inline USHORT GetRequestId() {
      int val = (int)MX_Get(m_pObj, PID_MX_REQUESTID, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRequestId(USHORT usRequestId) {
      int val = (int)usRequestId;
      return MX_Set(m_pObj, PID_MX_REQUESTID, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)MX_Get(m_pObj, PID_MX_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetStatus() {
      int val = (int)MX_Get(m_pObj, PID_MX_STATUS, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetTimeout() {
      int val = (int)MX_Get(m_pObj, PID_MX_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return MX_Set(m_pObj, PID_MX_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)MX_Get(m_pObj, PID_MX_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)MX_Get(m_pObj, PID_MX_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return MX_Set(m_pObj, PID_MX_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)MX_Get(m_pObj, PID_MX_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)MX_Get(m_pObj, PID_MX_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)MX_Get(m_pObj, PID_MX_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return MX_Set(m_pObj, PID_MX_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)MX_Get(m_pObj, PID_MX_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MX_Do(m_pObj, MID_MX_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Resolve(LPSTR lpszEmailAddress) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszEmailAddress, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return MX_Do(m_pObj, MID_MX_RESOLVE, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class MX : public MXA {
  
  public:
    MX(LPCSTR lpOemKey = IPWORKS_OEMKEY_29):MXA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDNSServer;
    MCFStringRef tmpEmailAddress;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMailServer;
    MCFStringRef tmpStatus;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(MXA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetDNSServer() {
      return tmpDNSServer.Set(MXA::GetDNSServer());
    }

    inline INT SetDNSServer(CFStringRef strDNSServer) {
      MCFStringAcc tmp;
      return MXA::SetDNSServer(tmp.Deref(strDNSServer));
    }
    inline CFStringRef GetEmailAddress() {
      return tmpEmailAddress.Set(MXA::GetEmailAddress());
    }

    inline INT SetEmailAddress(CFStringRef strEmailAddress) {
      MCFStringAcc tmp;
      return MXA::SetEmailAddress(tmp.Deref(strEmailAddress));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(MXA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return MXA::SetLocalHost(tmp.Deref(strLocalHost));
    }
    inline CFStringRef GetMailServer() {
      return tmpMailServer.Set(MXA::GetMailServer());
    }



    inline CFStringRef GetStatus() {
      return tmpStatus.Set(MXA::GetStatus());
    }


    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(MXA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(MXA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return MXA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(MXA::GetWinsockStatus());
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

    virtual INT FireResponse(USHORT &usRequestId, LPSTR &lpszDomain, LPSTR &lpszMailServer, USHORT &usPrecedence, LONG &lTimeToLive, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDomain(lpszDomain);
      CFStringRef uval_lpszDomain = etmpDomain.Deref();
      MCFStringRef etmpMailServer(lpszMailServer);
      CFStringRef uval_lpszMailServer = etmpMailServer.Deref();
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireResponse(usRequestId, uval_lpszDomain, uval_lpszMailServer, usPrecedence, lTimeToLive, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireResponse(USHORT &usRequestId, CFStringRef &lpszDomain, CFStringRef &lpszMailServer, USHORT &usPrecedence, LONG &lTimeToLive, USHORT &usStatusCode, CFStringRef &lpszDescription) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters



    inline int Resolve(CFStringRef pEmailAddress) {
      MCFStringAcc etmpEmailAddress;
      LPSTR lpszEmailAddress = etmpEmailAddress.Deref(pEmailAddress);

      return MXA::Resolve(lpszEmailAddress);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDNSServer;
    MUString tmpEmailAddress;
    MUString tmpLocalHost;
    MUString tmpMailServer;
    MUString tmpStatus;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(MXA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetDNSServer() {
      tmpDNSServer.Set(MXA::GetDNSServer());
      return tmpDNSServer.Deref();
    }

    inline INT SetDNSServer(LPWSTR lpszDNSServer) {
      MAString tmp(lpszDNSServer);
      return MXA::SetDNSServer(tmp.Deref());
    }
    inline LPWSTR GetEmailAddress() {
      tmpEmailAddress.Set(MXA::GetEmailAddress());
      return tmpEmailAddress.Deref();
    }

    inline INT SetEmailAddress(LPWSTR lpszEmailAddress) {
      MAString tmp(lpszEmailAddress);
      return MXA::SetEmailAddress(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(MXA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return MXA::SetLocalHost(tmp.Deref());
    }
    inline LPWSTR GetMailServer() {
      tmpMailServer.Set(MXA::GetMailServer());
      return tmpMailServer.Deref();
    }



    inline LPWSTR GetStatus() {
      tmpStatus.Set(MXA::GetStatus());
      return tmpStatus.Deref();
    }


    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(MXA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(MXA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return MXA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(MXA::GetWinsockStatus());
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

    virtual INT FireResponse(USHORT &usRequestId, LPSTR &lpszDomain, LPSTR &lpszMailServer, USHORT &usPrecedence, LONG &lTimeToLive, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MUString etmpDomain(lpszDomain);
      LPWSTR uval_lpszDomain = etmpDomain.Deref();
      MUString etmpMailServer(lpszMailServer);
      LPWSTR uval_lpszMailServer = etmpMailServer.Deref();
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireResponse(usRequestId, uval_lpszDomain, uval_lpszMailServer, usPrecedence, lTimeToLive, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireResponse(USHORT &usRequestId, LPWSTR &lpszDomain, LPWSTR &lpszMailServer, USHORT &usPrecedence, LONG &lTimeToLive, USHORT &usStatusCode, LPWSTR &lpszDescription) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_MX_H_




