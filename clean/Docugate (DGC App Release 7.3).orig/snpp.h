/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_SNPP_H_
#define _IPWORKS_SNPP_H_

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

#define snppIdle                                           0
#define snppConnect                                        1
#define snppDisconnect                                     2
#define snppSend                                           3
#define snppReset                                          4

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define SNPP_IDLE                                          0
#define SNPP_CONNECT                                       1
#define SNPP_DISCONNECT                                    2
#define SNPP_SEND                                          3
#define SNPP_RESET                                         4

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_SNPP_ACTION    1
#define PID_SNPP_CALLERID    2
#define PID_SNPP_COMMAND    3
#define PID_SNPP_CONNECTED    4
#define PID_SNPP_FIREWALLDATA    5
#define PID_SNPP_FIREWALLHOST    6
#define PID_SNPP_FIREWALLPASSWORD    7
#define PID_SNPP_FIREWALLPORT    8
#define PID_SNPP_FIREWALLTYPE    9
#define PID_SNPP_FIREWALLUSER    10
#define PID_SNPP_LASTREPLY    11
#define PID_SNPP_LOCALHOST    12
#define PID_SNPP_MESSAGE    13
#define PID_SNPP_PAGERID    14
#define PID_SNPP_SERVERNAME    15
#define PID_SNPP_SERVERPORT    16
#define PID_SNPP_SOCKETHANDLE    17
#define PID_SNPP_TIMEOUT    18
#define PID_SNPP_WINSOCKINFO    19
#define PID_SNPP_WINSOCKLOADED    20
#define PID_SNPP_WINSOCKMAXDATAGRAMSIZE    21
#define PID_SNPP_WINSOCKMAXSOCKETS    22
#define PID_SNPP_WINSOCKPATH    23
#define PID_SNPP_WINSOCKSTATUS    24


#define MID_SNPP_CONNECT    1
#define MID_SNPP_DISCONNECT    2
#define MID_SNPP_DOEVENTS    3
#define MID_SNPP_RESET    4
#define MID_SNPP_SEND    5


#define EID_SNPP_ERROR    1
#define EID_SNPP_PITRAIL    2


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID SNPP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    SNPP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    SNPP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID SNPP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    SNPP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    SNPP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  SNPP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    SNPP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   SNPP_StaticInit(LPVOID hInst);

class SNPPA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_SNPP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNPPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_SNPP_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNPPA*)lpObj)->FirePITrail(pDirection, pMessage);
         }

      }
      return 0;
    }

  public:

    SNPPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_32) {
      m_pObj = SNPP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~SNPPA() {
      SNPP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)SNPP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return SNPP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)SNPP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return SNPP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return SNPP_Set(m_pObj, PID_SNPP_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCallerId() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_CALLERID, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCallerId(LPCSTR lpszCallerId) {
      int val = (int)lpszCallerId;
      return SNPP_Set(m_pObj, PID_SNPP_CALLERID, 0, (LPVOID)val, 0);
    }

    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return SNPP_Set(m_pObj, PID_SNPP_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)SNPP_Get(m_pObj, PID_SNPP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return SNPP_Set(m_pObj, PID_SNPP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return SNPP_Set(m_pObj, PID_SNPP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return SNPP_Set(m_pObj, PID_SNPP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return SNPP_Set(m_pObj, PID_SNPP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return SNPP_Set(m_pObj, PID_SNPP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return SNPP_Set(m_pObj, PID_SNPP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return SNPP_Set(m_pObj, PID_SNPP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessage() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_MESSAGE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessage(LPCSTR lpszMessage) {
      int val = (int)lpszMessage;
      return SNPP_Set(m_pObj, PID_SNPP_MESSAGE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPagerId() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_PAGERID, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPagerId(LPCSTR lpszPagerId) {
      int val = (int)lpszPagerId;
      return SNPP_Set(m_pObj, PID_SNPP_PAGERID, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetServerName() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_SERVERNAME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetServerName(LPCSTR lpszServerName) {
      int val = (int)lpszServerName;
      return SNPP_Set(m_pObj, PID_SNPP_SERVERNAME, 0, (LPVOID)val, 0);
    }
    inline USHORT GetServerPort() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_SERVERPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetServerPort(USHORT usServerPort) {
      int val = (int)usServerPort;
      return SNPP_Set(m_pObj, PID_SNPP_SERVERPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return SNPP_Set(m_pObj, PID_SNPP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return SNPP_Set(m_pObj, PID_SNPP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return SNPP_Set(m_pObj, PID_SNPP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)SNPP_Get(m_pObj, PID_SNPP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Connect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNPP_Do(m_pObj, MID_SNPP_CONNECT, 0, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNPP_Do(m_pObj, MID_SNPP_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNPP_Do(m_pObj, MID_SNPP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNPP_Do(m_pObj, MID_SNPP_RESET, 0, param, cbparam);
      
      
    }
    inline int Send() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNPP_Do(m_pObj, MID_SNPP_SEND, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class SNPP : public SNPPA {
  
  public:
    SNPP(LPCSTR lpOemKey = IPWORKS_OEMKEY_32):SNPPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpCallerId;
    MCFStringRef tmpCommand;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMessage;
    MCFStringRef tmpPagerId;
    MCFStringRef tmpServerName;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(SNPPA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetCallerId() {
      return tmpCallerId.Set(SNPPA::GetCallerId());
    }

    inline INT SetCallerId(CFStringRef strCallerId) {
      MCFStringAcc tmp;
      return SNPPA::SetCallerId(tmp.Deref(strCallerId));
    }

    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return SNPPA::SetCommand(tmp.Deref(strCommand));
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = SNPPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return SNPPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(SNPPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return SNPPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(SNPPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return SNPPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(SNPPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return SNPPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(SNPPA::GetLastReply());
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(SNPPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return SNPPA::SetLocalHost(tmp.Deref(strLocalHost));
    }
    inline CFStringRef GetMessage() {
      return tmpMessage.Set(SNPPA::GetMessage());
    }

    inline INT SetMessage(CFStringRef strMessage) {
      MCFStringAcc tmp;
      return SNPPA::SetMessage(tmp.Deref(strMessage));
    }
    inline CFStringRef GetPagerId() {
      return tmpPagerId.Set(SNPPA::GetPagerId());
    }

    inline INT SetPagerId(CFStringRef strPagerId) {
      MCFStringAcc tmp;
      return SNPPA::SetPagerId(tmp.Deref(strPagerId));
    }
    inline CFStringRef GetServerName() {
      return tmpServerName.Set(SNPPA::GetServerName());
    }

    inline INT SetServerName(CFStringRef strServerName) {
      MCFStringAcc tmp;
      return SNPPA::SetServerName(tmp.Deref(strServerName));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(SNPPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(SNPPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return SNPPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(SNPPA::GetWinsockStatus());
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

    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {
      MCFStringRef etmpMessage(lpszMessage);
      CFStringRef uval_lpszMessage = etmpMessage.Deref();

      return FirePITrail(usDirection, uval_lpszMessage);
    }
    virtual INT FirePITrail(USHORT &usDirection, CFStringRef &lpszMessage) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters













#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpCallerId;
    MUString tmpCommand;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLastReply;
    MUString tmpLocalHost;
    MUString tmpMessage;
    MUString tmpPagerId;
    MUString tmpServerName;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(SNPPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetCallerId() {
      tmpCallerId.Set(SNPPA::GetCallerId());
      return tmpCallerId.Deref();
    }

    inline INT SetCallerId(LPWSTR lpszCallerId) {
      MAString tmp(lpszCallerId);
      return SNPPA::SetCallerId(tmp.Deref());
    }

    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return SNPPA::SetCommand(tmp.Deref());
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = SNPPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return SNPPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(SNPPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return SNPPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(SNPPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return SNPPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(SNPPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return SNPPA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(SNPPA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(SNPPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return SNPPA::SetLocalHost(tmp.Deref());
    }
    inline LPWSTR GetMessage() {
      tmpMessage.Set(SNPPA::GetMessage());
      return tmpMessage.Deref();
    }

    inline INT SetMessage(LPWSTR lpszMessage) {
      MAString tmp(lpszMessage);
      return SNPPA::SetMessage(tmp.Deref());
    }
    inline LPWSTR GetPagerId() {
      tmpPagerId.Set(SNPPA::GetPagerId());
      return tmpPagerId.Deref();
    }

    inline INT SetPagerId(LPWSTR lpszPagerId) {
      MAString tmp(lpszPagerId);
      return SNPPA::SetPagerId(tmp.Deref());
    }
    inline LPWSTR GetServerName() {
      tmpServerName.Set(SNPPA::GetServerName());
      return tmpServerName.Deref();
    }

    inline INT SetServerName(LPWSTR lpszServerName) {
      MAString tmp(lpszServerName);
      return SNPPA::SetServerName(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(SNPPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(SNPPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return SNPPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(SNPPA::GetWinsockStatus());
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

    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {
      MUString etmpMessage(lpszMessage);
      LPWSTR uval_lpszMessage = etmpMessage.Deref();

      return FirePITrail(usDirection, uval_lpszMessage);
    }
    virtual INT FirePITrail(USHORT &usDirection, LPWSTR &lpszMessage) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_SNPP_H_




