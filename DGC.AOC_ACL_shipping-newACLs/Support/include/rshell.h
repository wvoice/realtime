/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_RSHELL_H_
#define _IPWORKS_RSHELL_H_

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

#define PID_RSHELL_BYTESSENT    1
#define PID_RSHELL_COMMAND    2
#define PID_RSHELL_CONNECTED    3
#define PID_RSHELL_ENABLESTDERR    4
#define PID_RSHELL_EOL    5
#define PID_RSHELL_ERREOL    6
#define PID_RSHELL_ERRORMESSAGE    7
#define PID_RSHELL_FIREWALLDATA    8
#define PID_RSHELL_FIREWALLHOST    9
#define PID_RSHELL_FIREWALLPASSWORD    10
#define PID_RSHELL_FIREWALLPORT    11
#define PID_RSHELL_FIREWALLTYPE    12
#define PID_RSHELL_FIREWALLUSER    13
#define PID_RSHELL_LOCALHOST    14
#define PID_RSHELL_LOCALPORT    15
#define PID_RSHELL_LOCALUSER    16
#define PID_RSHELL_MAXLINELENGTH    17
#define PID_RSHELL_REMOTEHOST    18
#define PID_RSHELL_REMOTEPORT    19
#define PID_RSHELL_REMOTEUSER    20
#define PID_RSHELL_SOCKETHANDLE    21
#define PID_RSHELL_STDERRPORT    22
#define PID_RSHELL_STDIN    23
#define PID_RSHELL_TIMEOUT    24
#define PID_RSHELL_WINSOCKINFO    25
#define PID_RSHELL_WINSOCKLOADED    26
#define PID_RSHELL_WINSOCKMAXDATAGRAMSIZE    27
#define PID_RSHELL_WINSOCKMAXSOCKETS    28
#define PID_RSHELL_WINSOCKPATH    29
#define PID_RSHELL_WINSOCKSTATUS    30


#define MID_RSHELL_DISCONNECT    1
#define MID_RSHELL_DOEVENTS    2
#define MID_RSHELL_EXECUTE    3
#define MID_RSHELL_SEND    4


#define EID_RSHELL_CONNECTED    1
#define EID_RSHELL_DISCONNECTED    2
#define EID_RSHELL_ERROR    3
#define EID_RSHELL_STDERR    4
#define EID_RSHELL_STDOUT    5


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID Rshell_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    Rshell_Destroy(LPVOID lpObj);
CNX_IMPORT INT    Rshell_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID Rshell_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    Rshell_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    Rshell_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  Rshell_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    Rshell_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   Rshell_StaticInit(LPVOID hInst);

class RshellA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireStderr(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {return 0;}
    virtual INT FireStdout(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_RSHELL_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RshellA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_RSHELL_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RshellA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_RSHELL_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RshellA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_RSHELL_STDERR: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
                        BOOL pEOL = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RshellA*)lpObj)->FireStderr(pText, lenText, pEOL);
         }
         case EID_RSHELL_STDOUT: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
                        BOOL pEOL = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((RshellA*)lpObj)->FireStdout(pText, lenText, pEOL);
         }

      }
      return 0;
    }

  public:

    RshellA(LPCSTR lpOemKey = IPWORKS_OEMKEY_21) {
      m_pObj = Rshell_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~RshellA() {
      Rshell_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)Rshell_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return Rshell_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)Rshell_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return Rshell_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetBytesSent() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_BYTESSENT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetCommand() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_COMMAND, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return Rshell_Set(m_pObj, PID_RSHELL_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline BOOL GetEnableStderr() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_ENABLESTDERR, 0, 0);
      return (BOOL)val;
    }
    inline INT SetEnableStderr(BOOL bEnableStderr) {
      int val = (int)bEnableStderr;
      return Rshell_Set(m_pObj, PID_RSHELL_ENABLESTDERR, 0, (LPVOID)val, 0);
    }
    inline INT GetEOL(LPCSTR &lpEOL, UINT &lenEOL) {
      lpEOL = (LPSTR)Rshell_Get(m_pObj, PID_RSHELL_EOL, 0, &lenEOL);
      if ( ! lpEOL) return lenEOL;
      return 0;
    }

    inline INT SetEOL(LPCSTR lpEOL, UINT lenEOL) {
      return Rshell_Set(m_pObj, PID_RSHELL_EOL, 0, (LPVOID)lpEOL, lenEOL);
    }

    inline INT GetErrEOL(LPCSTR &lpErrEOL, UINT &lenErrEOL) {
      lpErrEOL = (LPSTR)Rshell_Get(m_pObj, PID_RSHELL_ERREOL, 0, &lenErrEOL);
      if ( ! lpErrEOL) return lenErrEOL;
      return 0;
    }

    inline INT SetErrEOL(LPCSTR lpErrEOL, UINT lenErrEOL) {
      return Rshell_Set(m_pObj, PID_RSHELL_ERREOL, 0, (LPVOID)lpErrEOL, lenErrEOL);
    }

    inline LPCSTR GetErrorMessage() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_ERRORMESSAGE, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)Rshell_Get(m_pObj, PID_RSHELL_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return Rshell_Set(m_pObj, PID_RSHELL_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return Rshell_Set(m_pObj, PID_RSHELL_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return Rshell_Set(m_pObj, PID_RSHELL_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return Rshell_Set(m_pObj, PID_RSHELL_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return Rshell_Set(m_pObj, PID_RSHELL_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return Rshell_Set(m_pObj, PID_RSHELL_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return Rshell_Set(m_pObj, PID_RSHELL_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return Rshell_Set(m_pObj, PID_RSHELL_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalUser() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_LOCALUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalUser(LPCSTR lpszLocalUser) {
      int val = (int)lpszLocalUser;
      return Rshell_Set(m_pObj, PID_RSHELL_LOCALUSER, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxLineLength() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_MAXLINELENGTH, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxLineLength(LONG lMaxLineLength) {
      int val = (int)lMaxLineLength;
      return Rshell_Set(m_pObj, PID_RSHELL_MAXLINELENGTH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return Rshell_Set(m_pObj, PID_RSHELL_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return Rshell_Set(m_pObj, PID_RSHELL_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteUser() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_REMOTEUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteUser(LPCSTR lpszRemoteUser) {
      int val = (int)lpszRemoteUser;
      return Rshell_Set(m_pObj, PID_RSHELL_REMOTEUSER, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline USHORT GetStderrPort() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_STDERRPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetStderrPort(USHORT usStderrPort) {
      int val = (int)usStderrPort;
      return Rshell_Set(m_pObj, PID_RSHELL_STDERRPORT, 0, (LPVOID)val, 0);
    }

    inline INT SetStdin(LPCSTR lpStdin, UINT lenStdin) {
      return Rshell_Set(m_pObj, PID_RSHELL_STDIN, 0, (LPVOID)lpStdin, lenStdin);
    }

    inline INT GetTimeout() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return Rshell_Set(m_pObj, PID_RSHELL_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return Rshell_Set(m_pObj, PID_RSHELL_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return Rshell_Set(m_pObj, PID_RSHELL_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)Rshell_Get(m_pObj, PID_RSHELL_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return Rshell_Do(m_pObj, MID_RSHELL_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return Rshell_Do(m_pObj, MID_RSHELL_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Execute(LPSTR lpszCommand) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszCommand, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return Rshell_Do(m_pObj, MID_RSHELL_EXECUTE, 1, param, cbparam);
      
      
    }
    inline int Send(LPSTR lpText, UINT lenText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpText, NULL};
      UINT cbparam[1+1] = {lenText, (UINT)NULL};
      return Rshell_Do(m_pObj, MID_RSHELL_SEND, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class Rshell : public RshellA {
  
  public:
    Rshell(LPCSTR lpOemKey = IPWORKS_OEMKEY_21):RshellA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpCommand;
    MCFStringRef tmpEOL;
    MCFStringRef tmpErrEOL;
    MCFStringRef tmpErrorMessage;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpLocalUser;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpRemoteUser;
    MCFStringRef tmpStdin;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(RshellA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetCommand() {
      return tmpCommand.Set(RshellA::GetCommand());
    }

    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return RshellA::SetCommand(tmp.Deref(strCommand));
    }


    inline CFStringRef GetEOL() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = RshellA::GetEOL(tmp, len);
      if (ret_code) return NULL;
      return tmpEOL.Set(tmp, len);
    }

    inline INT SetEOL(CFStringRef strEOL) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strEOL);
      return RshellA::SetEOL(lp, tmp.Length());
    }
    inline CFStringRef GetErrEOL() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = RshellA::GetErrEOL(tmp, len);
      if (ret_code) return NULL;
      return tmpErrEOL.Set(tmp, len);
    }

    inline INT SetErrEOL(CFStringRef strErrEOL) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strErrEOL);
      return RshellA::SetErrEOL(lp, tmp.Length());
    }
    inline CFStringRef GetErrorMessage() {
      return tmpErrorMessage.Set(RshellA::GetErrorMessage());
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = RshellA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return RshellA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(RshellA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return RshellA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(RshellA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return RshellA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(RshellA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return RshellA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(RshellA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return RshellA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetLocalUser() {
      return tmpLocalUser.Set(RshellA::GetLocalUser());
    }

    inline INT SetLocalUser(CFStringRef strLocalUser) {
      MCFStringAcc tmp;
      return RshellA::SetLocalUser(tmp.Deref(strLocalUser));
    }

    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(RshellA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return RshellA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }

    inline CFStringRef GetRemoteUser() {
      return tmpRemoteUser.Set(RshellA::GetRemoteUser());
    }

    inline INT SetRemoteUser(CFStringRef strRemoteUser) {
      MCFStringAcc tmp;
      return RshellA::SetRemoteUser(tmp.Deref(strRemoteUser));
    }



    inline INT SetStdin(CFStringRef strStdin) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strStdin);
      return RshellA::SetStdin(lp, tmp.Length());
    }

    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(RshellA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(RshellA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return RshellA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(RshellA::GetWinsockStatus());
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

    virtual INT FireStderr(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireStderr(uval_lpText, lenText, bEOL);
    }
    virtual INT FireStderr(CFStringRef &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }

    virtual INT FireStdout(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireStdout(uval_lpText, lenText, bEOL);
    }
    virtual INT FireStdout(CFStringRef &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters





    inline int Execute(CFStringRef pCommand) {
      MCFStringAcc etmpCommand;
      LPSTR lpszCommand = etmpCommand.Deref(pCommand);

      return RshellA::Execute(lpszCommand);
    }

    inline int Send(CFStringRef pText, UINT lenText) {
      MCFStringAcc etmpText;
      LPSTR lpText = etmpText.Deref(pText);
      return RshellA::Send(lpText, lenText);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpCommand;
    MUString tmpEOL;
    MUString tmpErrEOL;
    MUString tmpErrorMessage;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLocalHost;
    MUString tmpLocalUser;
    MUString tmpRemoteHost;
    MUString tmpRemoteUser;
    MUString tmpStdin;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(RshellA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetCommand() {
      tmpCommand.Set(RshellA::GetCommand());
      return tmpCommand.Deref();
    }

    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return RshellA::SetCommand(tmp.Deref());
    }


    inline INT GetEOL(LPWSTR &lpEOL, UINT &lenEOL) {
      LPSTR tmp = NULL;
      INT ret_code = RshellA::GetEOL(tmp, lenEOL);
      if (ret_code) return ret_code;
      tmpEOL.Set(tmp, lenEOL);
      lpEOL = tmpEOL.Deref();
      return 0;
    }

    inline INT SetEOL(LPWSTR lpEOL, UINT lenEOL) {
      MAString tmp(lpEOL, lenEOL);
      return RshellA::SetEOL(tmp.Deref(), tmp.Length());
    }
    inline INT GetErrEOL(LPWSTR &lpErrEOL, UINT &lenErrEOL) {
      LPSTR tmp = NULL;
      INT ret_code = RshellA::GetErrEOL(tmp, lenErrEOL);
      if (ret_code) return ret_code;
      tmpErrEOL.Set(tmp, lenErrEOL);
      lpErrEOL = tmpErrEOL.Deref();
      return 0;
    }

    inline INT SetErrEOL(LPWSTR lpErrEOL, UINT lenErrEOL) {
      MAString tmp(lpErrEOL, lenErrEOL);
      return RshellA::SetErrEOL(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetErrorMessage() {
      tmpErrorMessage.Set(RshellA::GetErrorMessage());
      return tmpErrorMessage.Deref();
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = RshellA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return RshellA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(RshellA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return RshellA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(RshellA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return RshellA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(RshellA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return RshellA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(RshellA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return RshellA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetLocalUser() {
      tmpLocalUser.Set(RshellA::GetLocalUser());
      return tmpLocalUser.Deref();
    }

    inline INT SetLocalUser(LPWSTR lpszLocalUser) {
      MAString tmp(lpszLocalUser);
      return RshellA::SetLocalUser(tmp.Deref());
    }

    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(RshellA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return RshellA::SetRemoteHost(tmp.Deref());
    }

    inline LPWSTR GetRemoteUser() {
      tmpRemoteUser.Set(RshellA::GetRemoteUser());
      return tmpRemoteUser.Deref();
    }

    inline INT SetRemoteUser(LPWSTR lpszRemoteUser) {
      MAString tmp(lpszRemoteUser);
      return RshellA::SetRemoteUser(tmp.Deref());
    }



    inline INT SetStdin(LPWSTR lpStdin, UINT lenStdin) {
      MAString tmp(lpStdin, lenStdin);
      return RshellA::SetStdin(tmp.Deref(), tmp.Length());
    }

    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(RshellA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(RshellA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return RshellA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(RshellA::GetWinsockStatus());
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

    virtual INT FireStderr(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireStderr(uval_lpText, lenText, bEOL);
    }
    virtual INT FireStderr(LPWSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }

    virtual INT FireStdout(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireStdout(uval_lpText, lenText, bEOL);
    }
    virtual INT FireStdout(LPWSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_RSHELL_H_




