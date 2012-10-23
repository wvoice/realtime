/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_PING_H_
#define _IPWORKS_PING_H_

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

#define PID_PING_LOCALHOST    1
#define PID_PING_PACKETSIZE    2
#define PID_PING_QOSFLAGS    3
#define PID_PING_REMOTEHOST    4
#define PID_PING_RESPONSESOURCE    5
#define PID_PING_RESPONSETIME    6
#define PID_PING_SOCKETHANDLE    7
#define PID_PING_TIMEOUT    8
#define PID_PING_TIMETOLIVE    9
#define PID_PING_TYPEOFSERVICE    10
#define PID_PING_WINSOCKINFO    11
#define PID_PING_WINSOCKLOADED    12
#define PID_PING_WINSOCKMAXDATAGRAMSIZE    13
#define PID_PING_WINSOCKMAXSOCKETS    14
#define PID_PING_WINSOCKPATH    15
#define PID_PING_WINSOCKSTATUS    16


#define MID_PING_DOEVENTS    1
#define MID_PING_PINGHOST    2


#define EID_PING_ERROR    1


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID Ping_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    Ping_Destroy(LPVOID lpObj);
CNX_IMPORT INT    Ping_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID Ping_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    Ping_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    Ping_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  Ping_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    Ping_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   Ping_StaticInit(LPVOID hInst);

class PingA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_PING_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((PingA*)lpObj)->FireError(pErrorCode, pDescription);
         }

      }
      return 0;
    }

  public:

    PingA(LPCSTR lpOemKey = IPWORKS_OEMKEY_44) {
      m_pObj = Ping_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~PingA() {
      Ping_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)Ping_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return Ping_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)Ping_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return Ping_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)Ping_Get(m_pObj, PID_PING_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return Ping_Set(m_pObj, PID_PING_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetPacketSize() {
      int val = (int)Ping_Get(m_pObj, PID_PING_PACKETSIZE, 0, 0);
      return (USHORT)val;
    }
    inline INT SetPacketSize(USHORT usPacketSize) {
      int val = (int)usPacketSize;
      return Ping_Set(m_pObj, PID_PING_PACKETSIZE, 0, (LPVOID)val, 0);
    }
    inline USHORT GetQOSFlags() {
      int val = (int)Ping_Get(m_pObj, PID_PING_QOSFLAGS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetQOSFlags(USHORT usQOSFlags) {
      int val = (int)usQOSFlags;
      return Ping_Set(m_pObj, PID_PING_QOSFLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)Ping_Get(m_pObj, PID_PING_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return Ping_Set(m_pObj, PID_PING_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetResponseSource() {
      int val = (int)Ping_Get(m_pObj, PID_PING_RESPONSESOURCE, 0, 0);
      return (LPCSTR)val;
    }

    inline LONG GetResponseTime() {
      int val = (int)Ping_Get(m_pObj, PID_PING_RESPONSETIME, 0, 0);
      return (LONG)val;
    }

    inline LONG GetSocketHandle() {
      int val = (int)Ping_Get(m_pObj, PID_PING_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)Ping_Get(m_pObj, PID_PING_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return Ping_Set(m_pObj, PID_PING_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline USHORT GetTimeToLive() {
      int val = (int)Ping_Get(m_pObj, PID_PING_TIMETOLIVE, 0, 0);
      return (USHORT)val;
    }
    inline INT SetTimeToLive(USHORT usTimeToLive) {
      int val = (int)usTimeToLive;
      return Ping_Set(m_pObj, PID_PING_TIMETOLIVE, 0, (LPVOID)val, 0);
    }
    inline INT GetTypeOfService() {
      int val = (int)Ping_Get(m_pObj, PID_PING_TYPEOFSERVICE, 0, 0);
      return (INT)val;
    }
    inline INT SetTypeOfService(INT iTypeOfService) {
      int val = (int)iTypeOfService;
      return Ping_Set(m_pObj, PID_PING_TYPEOFSERVICE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)Ping_Get(m_pObj, PID_PING_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)Ping_Get(m_pObj, PID_PING_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return Ping_Set(m_pObj, PID_PING_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)Ping_Get(m_pObj, PID_PING_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)Ping_Get(m_pObj, PID_PING_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)Ping_Get(m_pObj, PID_PING_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return Ping_Set(m_pObj, PID_PING_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)Ping_Get(m_pObj, PID_PING_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return Ping_Do(m_pObj, MID_PING_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int PingHost(LPSTR lpszHost) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszHost, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return Ping_Do(m_pObj, MID_PING_PINGHOST, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class Ping : public PingA {
  
  public:
    Ping(LPCSTR lpOemKey = IPWORKS_OEMKEY_44):PingA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpResponseSource;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(PingA::GetLastError());
    }

    // CFString versions of properties
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(PingA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return PingA::SetLocalHost(tmp.Deref(strLocalHost));
    }


    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(PingA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return PingA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }
    inline CFStringRef GetResponseSource() {
      return tmpResponseSource.Set(PingA::GetResponseSource());
    }






    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(PingA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(PingA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return PingA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(PingA::GetWinsockStatus());
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



    inline int PingHost(CFStringRef pHost) {
      MCFStringAcc etmpHost;
      LPSTR lpszHost = etmpHost.Deref(pHost);

      return PingA::PingHost(lpszHost);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpLocalHost;
    MUString tmpRemoteHost;
    MUString tmpResponseSource;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(PingA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(PingA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return PingA::SetLocalHost(tmp.Deref());
    }


    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(PingA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return PingA::SetRemoteHost(tmp.Deref());
    }
    inline LPWSTR GetResponseSource() {
      tmpResponseSource.Set(PingA::GetResponseSource());
      return tmpResponseSource.Deref();
    }






    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(PingA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(PingA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return PingA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(PingA::GetWinsockStatus());
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

#endif //_IPWORKS_PING_H_




