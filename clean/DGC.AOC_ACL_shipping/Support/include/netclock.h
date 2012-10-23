/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_NETCLOCK_H_
#define _IPWORKS_NETCLOCK_H_

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

#define netclockIdle                                       0
#define netclockGetTime                                    1
#define netclockGetAndSetTime                              2


#define NETCLOCK_IDLE                                      0
#define NETCLOCK_GET_TIME                                  1
#define NETCLOCK_GET_AND_SET_TIME                          2



#endif //_IPWORKS_INTERNAL_

#define PID_NETCLOCK_ACTION    1
#define PID_NETCLOCK_LOCALHOST    2
#define PID_NETCLOCK_LOCALTIME    3
#define PID_NETCLOCK_SERVERTIME    4
#define PID_NETCLOCK_SOCKETHANDLE    5
#define PID_NETCLOCK_TIMEOUT    6
#define PID_NETCLOCK_TIMEPORT    7
#define PID_NETCLOCK_TIMESERVER    8
#define PID_NETCLOCK_WINSOCKINFO    9
#define PID_NETCLOCK_WINSOCKLOADED    10
#define PID_NETCLOCK_WINSOCKMAXDATAGRAMSIZE    11
#define PID_NETCLOCK_WINSOCKMAXSOCKETS    12
#define PID_NETCLOCK_WINSOCKPATH    13
#define PID_NETCLOCK_WINSOCKSTATUS    14


#define MID_NETCLOCK_DOEVENTS    1
#define MID_NETCLOCK_GETANDSETTIME    2
#define MID_NETCLOCK_GETTIME    3


#define EID_NETCLOCK_ERROR    1


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID NetClock_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    NetClock_Destroy(LPVOID lpObj);
CNX_IMPORT INT    NetClock_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID NetClock_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    NetClock_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    NetClock_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  NetClock_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    NetClock_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   NetClock_StaticInit(LPVOID hInst);

class NetClockA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_NETCLOCK_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetClockA*)lpObj)->FireError(pErrorCode, pDescription);
         }

      }
      return 0;
    }

  public:

    NetClockA(LPCSTR lpOemKey = IPWORKS_OEMKEY_43) {
      m_pObj = NetClock_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~NetClockA() {
      NetClock_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)NetClock_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return NetClock_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)NetClock_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return NetClock_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return NetClock_Set(m_pObj, PID_NETCLOCK_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return NetClock_Set(m_pObj, PID_NETCLOCK_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalTime() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_LOCALTIME, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetServerTime() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_SERVERTIME, 0, 0);
      return (LPCSTR)val;
    }

    inline LONG GetSocketHandle() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return NetClock_Set(m_pObj, PID_NETCLOCK_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline USHORT GetTimePort() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_TIMEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetTimePort(USHORT usTimePort) {
      int val = (int)usTimePort;
      return NetClock_Set(m_pObj, PID_NETCLOCK_TIMEPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetTimeServer() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_TIMESERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetTimeServer(LPCSTR lpszTimeServer) {
      int val = (int)lpszTimeServer;
      return NetClock_Set(m_pObj, PID_NETCLOCK_TIMESERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return NetClock_Set(m_pObj, PID_NETCLOCK_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return NetClock_Set(m_pObj, PID_NETCLOCK_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)NetClock_Get(m_pObj, PID_NETCLOCK_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetClock_Do(m_pObj, MID_NETCLOCK_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int GetAndSetTime() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetClock_Do(m_pObj, MID_NETCLOCK_GETANDSETTIME, 0, param, cbparam);
      
      
    }
    inline int GetTime() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetClock_Do(m_pObj, MID_NETCLOCK_GETTIME, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class NetClock : public NetClockA {
  
  public:
    NetClock(LPCSTR lpOemKey = IPWORKS_OEMKEY_43):NetClockA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpLocalTime;
    MCFStringRef tmpServerTime;
    MCFStringRef tmpTimeServer;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(NetClockA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(NetClockA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return NetClockA::SetLocalHost(tmp.Deref(strLocalHost));
    }
    inline CFStringRef GetLocalTime() {
      return tmpLocalTime.Set(NetClockA::GetLocalTime());
    }

    inline CFStringRef GetServerTime() {
      return tmpServerTime.Set(NetClockA::GetServerTime());
    }




    inline CFStringRef GetTimeServer() {
      return tmpTimeServer.Set(NetClockA::GetTimeServer());
    }

    inline INT SetTimeServer(CFStringRef strTimeServer) {
      MCFStringAcc tmp;
      return NetClockA::SetTimeServer(tmp.Deref(strTimeServer));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(NetClockA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(NetClockA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return NetClockA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(NetClockA::GetWinsockStatus());
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









#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpLocalHost;
    MUString tmpLocalTime;
    MUString tmpServerTime;
    MUString tmpTimeServer;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(NetClockA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(NetClockA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return NetClockA::SetLocalHost(tmp.Deref());
    }
    inline LPWSTR GetLocalTime() {
      tmpLocalTime.Set(NetClockA::GetLocalTime());
      return tmpLocalTime.Deref();
    }

    inline LPWSTR GetServerTime() {
      tmpServerTime.Set(NetClockA::GetServerTime());
      return tmpServerTime.Deref();
    }




    inline LPWSTR GetTimeServer() {
      tmpTimeServer.Set(NetClockA::GetTimeServer());
      return tmpTimeServer.Deref();
    }

    inline INT SetTimeServer(LPWSTR lpszTimeServer) {
      MAString tmp(lpszTimeServer);
      return NetClockA::SetTimeServer(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(NetClockA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(NetClockA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return NetClockA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(NetClockA::GetWinsockStatus());
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

#endif //_IPWORKS_NETCLOCK_H_




