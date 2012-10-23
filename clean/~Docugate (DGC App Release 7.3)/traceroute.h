/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_TRACEROUTE_H_
#define _IPWORKS_TRACEROUTE_H_

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

#define PID_TRACEROUTE_HOPCOUNT    1
#define PID_TRACEROUTE_HOPHOSTADDRESS    2
#define PID_TRACEROUTE_HOPHOSTNAME    3
#define PID_TRACEROUTE_HOPLIMIT    4
#define PID_TRACEROUTE_HOPTIME    5
#define PID_TRACEROUTE_HOPTIMEOUT    6
#define PID_TRACEROUTE_LOCALHOST    7
#define PID_TRACEROUTE_QOSFLAGS    8
#define PID_TRACEROUTE_REMOTEHOST    9
#define PID_TRACEROUTE_RESOLVENAMES    10
#define PID_TRACEROUTE_SOCKETHANDLE    11
#define PID_TRACEROUTE_TIMEOUT    12
#define PID_TRACEROUTE_WINSOCKINFO    13
#define PID_TRACEROUTE_WINSOCKLOADED    14
#define PID_TRACEROUTE_WINSOCKMAXDATAGRAMSIZE    15
#define PID_TRACEROUTE_WINSOCKMAXSOCKETS    16
#define PID_TRACEROUTE_WINSOCKPATH    17
#define PID_TRACEROUTE_WINSOCKSTATUS    18


#define MID_TRACEROUTE_DOEVENTS    1
#define MID_TRACEROUTE_TRACETO    2


#define EID_TRACEROUTE_ERROR    1
#define EID_TRACEROUTE_HOP    2
#define EID_TRACEROUTE_HOPRESOLVED    3


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID TraceRoute_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    TraceRoute_Destroy(LPVOID lpObj);
CNX_IMPORT INT    TraceRoute_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID TraceRoute_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    TraceRoute_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    TraceRoute_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  TraceRoute_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    TraceRoute_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   TraceRoute_StaticInit(LPVOID hInst);

class TraceRouteA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireHop(USHORT &usHopNumber, LPSTR &lpszHostAddress, LONG &lDuration) {return 0;}
    virtual INT FireHopResolved(USHORT &usHopNumber, USHORT &usStatusCode, LPSTR &lpszHopHostName) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_TRACEROUTE_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TraceRouteA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_TRACEROUTE_HOP: {
                        USHORT pHopNumber = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pHostAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pDuration = (LONG)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TraceRouteA*)lpObj)->FireHop(pHopNumber, pHostAddress, pDuration);
         }
         case EID_TRACEROUTE_HOPRESOLVED: {
                        USHORT pHopNumber = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pHopHostName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TraceRouteA*)lpObj)->FireHopResolved(pHopNumber, pStatusCode, pHopHostName);
         }

      }
      return 0;
    }

  public:

    TraceRouteA(LPCSTR lpOemKey = IPWORKS_OEMKEY_48) {
      m_pObj = TraceRoute_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~TraceRouteA() {
      TraceRoute_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)TraceRoute_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return TraceRoute_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)TraceRoute_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return TraceRoute_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetHopCount() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_HOPCOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetHopHostAddress(USHORT usHopIndex) {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_HOPHOSTADDRESS, usHopIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetHopHostName(USHORT usHopIndex) {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_HOPHOSTNAME, usHopIndex, 0);
      return (LPCSTR)val;
    }

    inline INT GetHopLimit() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_HOPLIMIT, 0, 0);
      return (INT)val;
    }
    inline INT SetHopLimit(INT iHopLimit) {
      int val = (int)iHopLimit;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_HOPLIMIT, 0, (LPVOID)val, 0);
    }
    inline LONG GetHopTime(USHORT usHopIndex) {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_HOPTIME, usHopIndex, 0);
      return (LONG)val;
    }

    inline INT GetHopTimeout() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_HOPTIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetHopTimeout(INT iHopTimeout) {
      int val = (int)iHopTimeout;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_HOPTIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetQOSFlags() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_QOSFLAGS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetQOSFlags(USHORT usQOSFlags) {
      int val = (int)usQOSFlags;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_QOSFLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline BOOL GetResolveNames() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_RESOLVENAMES, 0, 0);
      return (BOOL)val;
    }
    inline INT SetResolveNames(BOOL bResolveNames) {
      int val = (int)bResolveNames;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_RESOLVENAMES, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return TraceRoute_Set(m_pObj, PID_TRACEROUTE_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)TraceRoute_Get(m_pObj, PID_TRACEROUTE_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return TraceRoute_Do(m_pObj, MID_TRACEROUTE_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int TraceTo(LPSTR lpszHost) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszHost, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return TraceRoute_Do(m_pObj, MID_TRACEROUTE_TRACETO, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class TraceRoute : public TraceRouteA {
  
  public:
    TraceRoute(LPCSTR lpOemKey = IPWORKS_OEMKEY_48):TraceRouteA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpHopHostAddress;
    MCFStringRef tmpHopHostName;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(TraceRouteA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetHopHostAddress(USHORT usHopIndex) {
      return tmpHopHostAddress.Set(TraceRouteA::GetHopHostAddress(usHopIndex));
    }

    inline CFStringRef GetHopHostName(USHORT usHopIndex) {
      return tmpHopHostName.Set(TraceRouteA::GetHopHostName(usHopIndex));
    }




    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(TraceRouteA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return TraceRouteA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(TraceRouteA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return TraceRouteA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(TraceRouteA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(TraceRouteA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return TraceRouteA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(TraceRouteA::GetWinsockStatus());
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

    virtual INT FireHop(USHORT &usHopNumber, LPSTR &lpszHostAddress, LONG &lDuration) {
      MCFStringRef etmpHostAddress(lpszHostAddress);
      CFStringRef uval_lpszHostAddress = etmpHostAddress.Deref();

      return FireHop(usHopNumber, uval_lpszHostAddress, lDuration);
    }
    virtual INT FireHop(USHORT &usHopNumber, CFStringRef &lpszHostAddress, LONG &lDuration) {
      return 0;
    }

    virtual INT FireHopResolved(USHORT &usHopNumber, USHORT &usStatusCode, LPSTR &lpszHopHostName) {
      MCFStringRef etmpHopHostName(lpszHopHostName);
      CFStringRef uval_lpszHopHostName = etmpHopHostName.Deref();

      return FireHopResolved(usHopNumber, usStatusCode, uval_lpszHopHostName);
    }
    virtual INT FireHopResolved(USHORT &usHopNumber, USHORT &usStatusCode, CFStringRef &lpszHopHostName) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters



    inline int TraceTo(CFStringRef pHost) {
      MCFStringAcc etmpHost;
      LPSTR lpszHost = etmpHost.Deref(pHost);

      return TraceRouteA::TraceTo(lpszHost);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpHopHostAddress;
    MUString tmpHopHostName;
    MUString tmpLocalHost;
    MUString tmpRemoteHost;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(TraceRouteA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetHopHostAddress(USHORT usHopIndex) {
      tmpHopHostAddress.Set(TraceRouteA::GetHopHostAddress(usHopIndex));
      return tmpHopHostAddress.Deref();
    }

    inline LPWSTR GetHopHostName(USHORT usHopIndex) {
      tmpHopHostName.Set(TraceRouteA::GetHopHostName(usHopIndex));
      return tmpHopHostName.Deref();
    }




    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(TraceRouteA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return TraceRouteA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(TraceRouteA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return TraceRouteA::SetRemoteHost(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(TraceRouteA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(TraceRouteA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return TraceRouteA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(TraceRouteA::GetWinsockStatus());
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

    virtual INT FireHop(USHORT &usHopNumber, LPSTR &lpszHostAddress, LONG &lDuration) {
      MUString etmpHostAddress(lpszHostAddress);
      LPWSTR uval_lpszHostAddress = etmpHostAddress.Deref();

      return FireHop(usHopNumber, uval_lpszHostAddress, lDuration);
    }
    virtual INT FireHop(USHORT &usHopNumber, LPWSTR &lpszHostAddress, LONG &lDuration) {
      return 0;
    }

    virtual INT FireHopResolved(USHORT &usHopNumber, USHORT &usStatusCode, LPSTR &lpszHopHostName) {
      MUString etmpHopHostName(lpszHopHostName);
      LPWSTR uval_lpszHopHostName = etmpHopHostName.Deref();

      return FireHopResolved(usHopNumber, usStatusCode, uval_lpszHopHostName);
    }
    virtual INT FireHopResolved(USHORT &usHopNumber, USHORT &usStatusCode, LPWSTR &lpszHopHostName) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_TRACEROUTE_H_




