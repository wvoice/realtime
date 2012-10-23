/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_RCP_H_
#define _IPWORKS_RCP_H_

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

#define rcpIdle                                            0
#define rcpGetFile                                         1
#define rcpPutFile                                         2

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3

#define protRexec                                          0
#define protRshell                                         1


#define RCP_IDLE                                           0
#define RCP_GET_FILE                                       1
#define RCP_PUT_FILE                                       2

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3

#define PROT_REXEC                                         0
#define PROT_RSHELL                                        1



#endif //_IPWORKS_INTERNAL_

#define PID_RCP_ACTION    1
#define PID_RCP_ENABLESTDERR    2
#define PID_RCP_FILEMODE    3
#define PID_RCP_FIREWALLDATA    4
#define PID_RCP_FIREWALLHOST    5
#define PID_RCP_FIREWALLPASSWORD    6
#define PID_RCP_FIREWALLPORT    7
#define PID_RCP_FIREWALLTYPE    8
#define PID_RCP_FIREWALLUSER    9
#define PID_RCP_LOCALFILE    10
#define PID_RCP_LOCALHOST    11
#define PID_RCP_LOCALPORT    12
#define PID_RCP_PASSWORD    13
#define PID_RCP_PROTOCOL    14
#define PID_RCP_REMOTEFILE    15
#define PID_RCP_REMOTEHOST    16
#define PID_RCP_REMOTEPORT    17
#define PID_RCP_SOCKETHANDLE    18
#define PID_RCP_STDERRPORT    19
#define PID_RCP_TIMEOUT    20
#define PID_RCP_USER    21
#define PID_RCP_WINSOCKINFO    22
#define PID_RCP_WINSOCKLOADED    23
#define PID_RCP_WINSOCKMAXDATAGRAMSIZE    24
#define PID_RCP_WINSOCKMAXSOCKETS    25
#define PID_RCP_WINSOCKPATH    26
#define PID_RCP_WINSOCKSTATUS    27


#define MID_RCP_DOEVENTS    1
#define MID_RCP_GETFILE    2
#define MID_RCP_INTERRUPT    3
#define MID_RCP_PUTFILE    4


#define EID_RCP_CONNECTED    1
#define EID_RCP_DISCONNECTED    2
#define EID_RCP_ERROR    3
#define EID_RCP_PROGRESS    4


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID RCP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    RCP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    RCP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID RCP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    RCP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    RCP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  RCP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    RCP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   RCP_StaticInit(LPVOID hInst);

class RCPA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireProgress(USHORT &usPercentDone) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_RCP_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RCPA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_RCP_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RCPA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_RCP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RCPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_RCP_PROGRESS: {
                        USHORT pPercentDone = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RCPA*)lpObj)->FireProgress(pPercentDone);
         }

      }
      return 0;
    }

  public:

    RCPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_45) {
      m_pObj = RCP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~RCPA() {
      RCP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)RCP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return RCP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)RCP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return RCP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return RCP_Set(m_pObj, PID_RCP_ACTION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetEnableStderr() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_ENABLESTDERR, 0, 0);
      return (BOOL)val;
    }
    inline INT SetEnableStderr(BOOL bEnableStderr) {
      int val = (int)bEnableStderr;
      return RCP_Set(m_pObj, PID_RCP_ENABLESTDERR, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFileMode() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_FILEMODE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFileMode(LPCSTR lpszFileMode) {
      int val = (int)lpszFileMode;
      return RCP_Set(m_pObj, PID_RCP_FILEMODE, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)RCP_Get(m_pObj, PID_RCP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return RCP_Set(m_pObj, PID_RCP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return RCP_Set(m_pObj, PID_RCP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return RCP_Set(m_pObj, PID_RCP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return RCP_Set(m_pObj, PID_RCP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return RCP_Set(m_pObj, PID_RCP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return RCP_Set(m_pObj, PID_RCP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalFile() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return RCP_Set(m_pObj, PID_RCP_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return RCP_Set(m_pObj, PID_RCP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return RCP_Set(m_pObj, PID_RCP_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return RCP_Set(m_pObj, PID_RCP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline INT GetProtocol() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_PROTOCOL, 0, 0);
      return (INT)val;
    }
    inline INT SetProtocol(INT iProtocol) {
      int val = (int)iProtocol;
      return RCP_Set(m_pObj, PID_RCP_PROTOCOL, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteFile() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_REMOTEFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteFile(LPCSTR lpszRemoteFile) {
      int val = (int)lpszRemoteFile;
      return RCP_Set(m_pObj, PID_RCP_REMOTEFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return RCP_Set(m_pObj, PID_RCP_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return RCP_Set(m_pObj, PID_RCP_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline USHORT GetStderrPort() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_STDERRPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetStderrPort(USHORT usStderrPort) {
      int val = (int)usStderrPort;
      return RCP_Set(m_pObj, PID_RCP_STDERRPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return RCP_Set(m_pObj, PID_RCP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return RCP_Set(m_pObj, PID_RCP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return RCP_Set(m_pObj, PID_RCP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return RCP_Set(m_pObj, PID_RCP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)RCP_Get(m_pObj, PID_RCP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return RCP_Do(m_pObj, MID_RCP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int GetFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return RCP_Do(m_pObj, MID_RCP_GETFILE, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return RCP_Do(m_pObj, MID_RCP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int PutFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return RCP_Do(m_pObj, MID_RCP_PUTFILE, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class RCP : public RCPA {
  
  public:
    RCP(LPCSTR lpOemKey = IPWORKS_OEMKEY_45):RCPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpFileMode;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLocalFile;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpPassword;
    MCFStringRef tmpRemoteFile;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpUser;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(RCPA::GetLastError());
    }

    // CFString versions of properties


    inline CFStringRef GetFileMode() {
      return tmpFileMode.Set(RCPA::GetFileMode());
    }

    inline INT SetFileMode(CFStringRef strFileMode) {
      MCFStringAcc tmp;
      return RCPA::SetFileMode(tmp.Deref(strFileMode));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = RCPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return RCPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(RCPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return RCPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(RCPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return RCPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(RCPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return RCPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(RCPA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return RCPA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(RCPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return RCPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetPassword() {
      return tmpPassword.Set(RCPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return RCPA::SetPassword(tmp.Deref(strPassword));
    }

    inline CFStringRef GetRemoteFile() {
      return tmpRemoteFile.Set(RCPA::GetRemoteFile());
    }

    inline INT SetRemoteFile(CFStringRef strRemoteFile) {
      MCFStringAcc tmp;
      return RCPA::SetRemoteFile(tmp.Deref(strRemoteFile));
    }
    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(RCPA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return RCPA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }




    inline CFStringRef GetUser() {
      return tmpUser.Set(RCPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return RCPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(RCPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(RCPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return RCPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(RCPA::GetWinsockStatus());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireConnected(usStatusCode, uval_lpszDescription);
    }
    virtual INT FireConnected(USHORT &usStatusCode, CFStringRef &lpszDescription) {
      return 0;
    }

    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireDisconnected(usStatusCode, uval_lpszDescription);
    }
    virtual INT FireDisconnected(USHORT &usStatusCode, CFStringRef &lpszDescription) {
      return 0;
    }

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
    MUString tmpFileMode;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLocalFile;
    MUString tmpLocalHost;
    MUString tmpPassword;
    MUString tmpRemoteFile;
    MUString tmpRemoteHost;
    MUString tmpUser;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(RCPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties


    inline LPWSTR GetFileMode() {
      tmpFileMode.Set(RCPA::GetFileMode());
      return tmpFileMode.Deref();
    }

    inline INT SetFileMode(LPWSTR lpszFileMode) {
      MAString tmp(lpszFileMode);
      return RCPA::SetFileMode(tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = RCPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return RCPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(RCPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return RCPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(RCPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return RCPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(RCPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return RCPA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(RCPA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return RCPA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(RCPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return RCPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetPassword() {
      tmpPassword.Set(RCPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return RCPA::SetPassword(tmp.Deref());
    }

    inline LPWSTR GetRemoteFile() {
      tmpRemoteFile.Set(RCPA::GetRemoteFile());
      return tmpRemoteFile.Deref();
    }

    inline INT SetRemoteFile(LPWSTR lpszRemoteFile) {
      MAString tmp(lpszRemoteFile);
      return RCPA::SetRemoteFile(tmp.Deref());
    }
    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(RCPA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return RCPA::SetRemoteHost(tmp.Deref());
    }




    inline LPWSTR GetUser() {
      tmpUser.Set(RCPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return RCPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(RCPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(RCPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return RCPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(RCPA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireConnected(usStatusCode, uval_lpszDescription);
    }
    virtual INT FireConnected(USHORT &usStatusCode, LPWSTR &lpszDescription) {
      return 0;
    }

    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireDisconnected(usStatusCode, uval_lpszDescription);
    }
    virtual INT FireDisconnected(USHORT &usStatusCode, LPWSTR &lpszDescription) {
      return 0;
    }

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

#endif //_IPWORKS_RCP_H_




