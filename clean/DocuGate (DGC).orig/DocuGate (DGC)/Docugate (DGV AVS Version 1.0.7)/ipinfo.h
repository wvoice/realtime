/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_IPINFO_H_
#define _IPWORKS_IPINFO_H_

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

#define PID_IPINFO_HOSTADDRESS    1
#define PID_IPINFO_HOSTALIASES    2
#define PID_IPINFO_HOSTNAME    3
#define PID_IPINFO_LOCALHOST    4
#define PID_IPINFO_OTHERADDRESSES    5
#define PID_IPINFO_PENDINGREQUESTS    6
#define PID_IPINFO_REQUESTID    7
#define PID_IPINFO_SERVICEALIASES    8
#define PID_IPINFO_SERVICENAME    9
#define PID_IPINFO_SERVICEPORT    10
#define PID_IPINFO_SERVICEPROTOCOL    11
#define PID_IPINFO_WINSOCKINFO    12
#define PID_IPINFO_WINSOCKLOADED    13
#define PID_IPINFO_WINSOCKMAXDATAGRAMSIZE    14
#define PID_IPINFO_WINSOCKMAXSOCKETS    15
#define PID_IPINFO_WINSOCKPATH    16
#define PID_IPINFO_WINSOCKSTATUS    17


#define MID_IPINFO_DOEVENTS    1
#define MID_IPINFO_RESOLVEADDRESS    2
#define MID_IPINFO_RESOLVENAME    3


#define EID_IPINFO_ERROR    1
#define EID_IPINFO_REQUESTCOMPLETE    2


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID IPInfo_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    IPInfo_Destroy(LPVOID lpObj);
CNX_IMPORT INT    IPInfo_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID IPInfo_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    IPInfo_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    IPInfo_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  IPInfo_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    IPInfo_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   IPInfo_StaticInit(LPVOID hInst);

class IPInfoA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireRequestComplete(LONG &lRequestId, USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_IPINFO_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPInfoA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_IPINFO_REQUESTCOMPLETE: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPInfoA*)lpObj)->FireRequestComplete(pRequestId, pStatusCode, pDescription);
         }

      }
      return 0;
    }

  public:

    IPInfoA(LPCSTR lpOemKey = IPWORKS_OEMKEY_15) {
      m_pObj = IPInfo_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~IPInfoA() {
      IPInfo_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)IPInfo_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return IPInfo_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)IPInfo_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return IPInfo_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline LPCSTR GetHostAddress() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_HOSTADDRESS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetHostAddress(LPCSTR lpszHostAddress) {
      int val = (int)lpszHostAddress;
      return IPInfo_Set(m_pObj, PID_IPINFO_HOSTADDRESS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetHostAliases() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_HOSTALIASES, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetHostName() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_HOSTNAME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetHostName(LPCSTR lpszHostName) {
      int val = (int)lpszHostName;
      return IPInfo_Set(m_pObj, PID_IPINFO_HOSTNAME, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetOtherAddresses() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_OTHERADDRESSES, 0, 0);
      return (LPCSTR)val;
    }

    inline USHORT GetPendingRequests() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_PENDINGREQUESTS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetPendingRequests(USHORT usPendingRequests) {
      int val = (int)usPendingRequests;
      return IPInfo_Set(m_pObj, PID_IPINFO_PENDINGREQUESTS, 0, (LPVOID)val, 0);
    }
    inline LONG GetRequestId() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_REQUESTID, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetServiceAliases() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_SERVICEALIASES, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetServiceName() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_SERVICENAME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetServiceName(LPCSTR lpszServiceName) {
      int val = (int)lpszServiceName;
      return IPInfo_Set(m_pObj, PID_IPINFO_SERVICENAME, 0, (LPVOID)val, 0);
    }
    inline USHORT GetServicePort() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_SERVICEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetServicePort(USHORT usServicePort) {
      int val = (int)usServicePort;
      return IPInfo_Set(m_pObj, PID_IPINFO_SERVICEPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetServiceProtocol() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_SERVICEPROTOCOL, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetServiceProtocol(LPCSTR lpszServiceProtocol) {
      int val = (int)lpszServiceProtocol;
      return IPInfo_Set(m_pObj, PID_IPINFO_SERVICEPROTOCOL, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return IPInfo_Set(m_pObj, PID_IPINFO_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return IPInfo_Set(m_pObj, PID_IPINFO_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)IPInfo_Get(m_pObj, PID_IPINFO_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IPInfo_Do(m_pObj, MID_IPINFO_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline LPSTR ResolveAddress(LPSTR lpszHostAddress) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszHostAddress, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      IPInfo_Do(m_pObj, MID_IPINFO_RESOLVEADDRESS, 1, param, cbparam);
      
      return (LPSTR)param[1];
    }
    inline LPSTR ResolveName(LPSTR lpszHostName) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszHostName, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      IPInfo_Do(m_pObj, MID_IPINFO_RESOLVENAME, 1, param, cbparam);
      
      return (LPSTR)param[1];
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class IPInfo : public IPInfoA {
  
  public:
    IPInfo(LPCSTR lpOemKey = IPWORKS_OEMKEY_15):IPInfoA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpHostAddress;
    MCFStringRef tmpHostAliases;
    MCFStringRef tmpHostName;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpOtherAddresses;
    MCFStringRef tmpServiceAliases;
    MCFStringRef tmpServiceName;
    MCFStringRef tmpServiceProtocol;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(IPInfoA::GetLastError());
    }

    // CFString versions of properties
    inline CFStringRef GetHostAddress() {
      return tmpHostAddress.Set(IPInfoA::GetHostAddress());
    }

    inline INT SetHostAddress(CFStringRef strHostAddress) {
      MCFStringAcc tmp;
      return IPInfoA::SetHostAddress(tmp.Deref(strHostAddress));
    }
    inline CFStringRef GetHostAliases() {
      return tmpHostAliases.Set(IPInfoA::GetHostAliases());
    }

    inline CFStringRef GetHostName() {
      return tmpHostName.Set(IPInfoA::GetHostName());
    }

    inline INT SetHostName(CFStringRef strHostName) {
      MCFStringAcc tmp;
      return IPInfoA::SetHostName(tmp.Deref(strHostName));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(IPInfoA::GetLocalHost());
    }

    inline CFStringRef GetOtherAddresses() {
      return tmpOtherAddresses.Set(IPInfoA::GetOtherAddresses());
    }



    inline CFStringRef GetServiceAliases() {
      return tmpServiceAliases.Set(IPInfoA::GetServiceAliases());
    }

    inline CFStringRef GetServiceName() {
      return tmpServiceName.Set(IPInfoA::GetServiceName());
    }

    inline INT SetServiceName(CFStringRef strServiceName) {
      MCFStringAcc tmp;
      return IPInfoA::SetServiceName(tmp.Deref(strServiceName));
    }

    inline CFStringRef GetServiceProtocol() {
      return tmpServiceProtocol.Set(IPInfoA::GetServiceProtocol());
    }

    inline INT SetServiceProtocol(CFStringRef strServiceProtocol) {
      MCFStringAcc tmp;
      return IPInfoA::SetServiceProtocol(tmp.Deref(strServiceProtocol));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(IPInfoA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(IPInfoA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return IPInfoA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(IPInfoA::GetWinsockStatus());
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

    virtual INT FireRequestComplete(LONG &lRequestId, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireRequestComplete(lRequestId, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireRequestComplete(LONG &lRequestId, USHORT &usStatusCode, CFStringRef &lpszDescription) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters



    inline LPSTR ResolveAddress(CFStringRef pHostAddress) {
      MCFStringAcc etmpHostAddress;
      LPSTR lpszHostAddress = etmpHostAddress.Deref(pHostAddress);

      return IPInfoA::ResolveAddress(lpszHostAddress);
    }

    inline LPSTR ResolveName(CFStringRef pHostName) {
      MCFStringAcc etmpHostName;
      LPSTR lpszHostName = etmpHostName.Deref(pHostName);

      return IPInfoA::ResolveName(lpszHostName);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpHostAddress;
    MUString tmpHostAliases;
    MUString tmpHostName;
    MUString tmpLocalHost;
    MUString tmpOtherAddresses;
    MUString tmpServiceAliases;
    MUString tmpServiceName;
    MUString tmpServiceProtocol;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(IPInfoA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties
    inline LPWSTR GetHostAddress() {
      tmpHostAddress.Set(IPInfoA::GetHostAddress());
      return tmpHostAddress.Deref();
    }

    inline INT SetHostAddress(LPWSTR lpszHostAddress) {
      MAString tmp(lpszHostAddress);
      return IPInfoA::SetHostAddress(tmp.Deref());
    }
    inline LPWSTR GetHostAliases() {
      tmpHostAliases.Set(IPInfoA::GetHostAliases());
      return tmpHostAliases.Deref();
    }

    inline LPWSTR GetHostName() {
      tmpHostName.Set(IPInfoA::GetHostName());
      return tmpHostName.Deref();
    }

    inline INT SetHostName(LPWSTR lpszHostName) {
      MAString tmp(lpszHostName);
      return IPInfoA::SetHostName(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(IPInfoA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline LPWSTR GetOtherAddresses() {
      tmpOtherAddresses.Set(IPInfoA::GetOtherAddresses());
      return tmpOtherAddresses.Deref();
    }



    inline LPWSTR GetServiceAliases() {
      tmpServiceAliases.Set(IPInfoA::GetServiceAliases());
      return tmpServiceAliases.Deref();
    }

    inline LPWSTR GetServiceName() {
      tmpServiceName.Set(IPInfoA::GetServiceName());
      return tmpServiceName.Deref();
    }

    inline INT SetServiceName(LPWSTR lpszServiceName) {
      MAString tmp(lpszServiceName);
      return IPInfoA::SetServiceName(tmp.Deref());
    }

    inline LPWSTR GetServiceProtocol() {
      tmpServiceProtocol.Set(IPInfoA::GetServiceProtocol());
      return tmpServiceProtocol.Deref();
    }

    inline INT SetServiceProtocol(LPWSTR lpszServiceProtocol) {
      MAString tmp(lpszServiceProtocol);
      return IPInfoA::SetServiceProtocol(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(IPInfoA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(IPInfoA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return IPInfoA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(IPInfoA::GetWinsockStatus());
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

    virtual INT FireRequestComplete(LONG &lRequestId, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireRequestComplete(lRequestId, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireRequestComplete(LONG &lRequestId, USHORT &usStatusCode, LPWSTR &lpszDescription) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_IPINFO_H_




