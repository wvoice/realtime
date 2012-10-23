/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_TELNET_H_
#define _IPWORKS_TELNET_H_

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

#define PID_TELNET_ACCEPTDATA    1
#define PID_TELNET_BYTESSENT    2
#define PID_TELNET_COMMAND    3
#define PID_TELNET_CONNECTED    4
#define PID_TELNET_DATATOSEND    5
#define PID_TELNET_DONTOPTION    6
#define PID_TELNET_DOOPTION    7
#define PID_TELNET_DOSUBOPTION    8
#define PID_TELNET_FIREWALLDATA    9
#define PID_TELNET_FIREWALLHOST    10
#define PID_TELNET_FIREWALLPASSWORD    11
#define PID_TELNET_FIREWALLPORT    12
#define PID_TELNET_FIREWALLTYPE    13
#define PID_TELNET_FIREWALLUSER    14
#define PID_TELNET_KEEPALIVE    15
#define PID_TELNET_LINGER    16
#define PID_TELNET_LOCALHOST    17
#define PID_TELNET_LOCALPORT    18
#define PID_TELNET_REMOTEHOST    19
#define PID_TELNET_REMOTEPORT    20
#define PID_TELNET_SOCKETHANDLE    21
#define PID_TELNET_TIMEOUT    22
#define PID_TELNET_TRANSPARENT    23
#define PID_TELNET_URGENTDATA    24
#define PID_TELNET_WILLOPTION    25
#define PID_TELNET_WINSOCKINFO    26
#define PID_TELNET_WINSOCKLOADED    27
#define PID_TELNET_WINSOCKMAXDATAGRAMSIZE    28
#define PID_TELNET_WINSOCKMAXSOCKETS    29
#define PID_TELNET_WINSOCKPATH    30
#define PID_TELNET_WINSOCKSTATUS    31
#define PID_TELNET_WONTOPTION    32


#define MID_TELNET_CONNECT    1
#define MID_TELNET_DISCONNECT    2
#define MID_TELNET_DOEVENTS    3
#define MID_TELNET_SEND    4


#define EID_TELNET_COMMAND    1
#define EID_TELNET_CONNECTED    2
#define EID_TELNET_DATAIN    3
#define EID_TELNET_DISCONNECTED    4
#define EID_TELNET_DO    5
#define EID_TELNET_DONT    6
#define EID_TELNET_ERROR    7
#define EID_TELNET_READYTOSEND    8
#define EID_TELNET_SUBOPTION    9
#define EID_TELNET_WILL    10
#define EID_TELNET_WONT    11


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID Telnet_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    Telnet_Destroy(LPVOID lpObj);
CNX_IMPORT INT    Telnet_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID Telnet_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    Telnet_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    Telnet_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  Telnet_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    Telnet_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   Telnet_StaticInit(LPVOID hInst);

class TelnetA {
  
  public: //events
  
    virtual INT FireCommand(USHORT &usCommandCode) {return 0;}
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDataIn(LPSTR &lpText, USHORT &lenText) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDo(USHORT &usOptionCode) {return 0;}
    virtual INT FireDont(USHORT &usOptionCode) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireReadyToSend() {return 0;}
    virtual INT FireSubOption(LPSTR &lpSubOption, USHORT &lenSubOption) {return 0;}
    virtual INT FireWill(USHORT &usOptionCode) {return 0;}
    virtual INT FireWont(USHORT &usOptionCode) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_TELNET_COMMAND: {
                        USHORT pCommandCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireCommand(pCommandCode);
         }
         case EID_TELNET_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_TELNET_DATAIN: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((TelnetA*)lpObj)->FireDataIn(pText, lenText);
         }
         case EID_TELNET_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_TELNET_DO: {
                        USHORT pOptionCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireDo(pOptionCode);
         }
         case EID_TELNET_DONT: {
                        USHORT pOptionCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireDont(pOptionCode);
         }
         case EID_TELNET_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_TELNET_READYTOSEND: {
            
            return ((TelnetA*)lpObj)->FireReadyToSend();
         }
         case EID_TELNET_SUBOPTION: {
                        LPSTR pSubOption = (LPSTR)(INT)(*param++);
            
                        USHORT lenSubOption = (USHORT)(*cbparam++);
            
            
            return ((TelnetA*)lpObj)->FireSubOption(pSubOption, lenSubOption);
         }
         case EID_TELNET_WILL: {
                        USHORT pOptionCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireWill(pOptionCode);
         }
         case EID_TELNET_WONT: {
                        USHORT pOptionCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TelnetA*)lpObj)->FireWont(pOptionCode);
         }

      }
      return 0;
    }

  public:

    TelnetA(LPCSTR lpOemKey = IPWORKS_OEMKEY_19) {
      m_pObj = Telnet_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~TelnetA() {
      Telnet_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)Telnet_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return Telnet_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)Telnet_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return Telnet_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return Telnet_Set(m_pObj, PID_TELNET_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline INT GetBytesSent() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_BYTESSENT, 0, 0);
      return (INT)val;
    }


    inline INT SetCommand(INT iCommand) {
      int val = (int)iCommand;
      return Telnet_Set(m_pObj, PID_TELNET_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_CONNECTED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetConnected(BOOL bConnected) {
      int val = (int)bConnected;
      return Telnet_Set(m_pObj, PID_TELNET_CONNECTED, 0, (LPVOID)val, 0);
    }

    inline INT SetDataToSend(LPCSTR lpDataToSend, UINT lenDataToSend) {
      return Telnet_Set(m_pObj, PID_TELNET_DATATOSEND, 0, (LPVOID)lpDataToSend, lenDataToSend);
    }


    inline INT SetDontOption(INT iDontOption) {
      int val = (int)iDontOption;
      return Telnet_Set(m_pObj, PID_TELNET_DONTOPTION, 0, (LPVOID)val, 0);
    }

    inline INT SetDoOption(INT iDoOption) {
      int val = (int)iDoOption;
      return Telnet_Set(m_pObj, PID_TELNET_DOOPTION, 0, (LPVOID)val, 0);
    }

    inline INT SetDoSubOption(LPCSTR lpDoSubOption, UINT lenDoSubOption) {
      return Telnet_Set(m_pObj, PID_TELNET_DOSUBOPTION, 0, (LPVOID)lpDoSubOption, lenDoSubOption);
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)Telnet_Get(m_pObj, PID_TELNET_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return Telnet_Set(m_pObj, PID_TELNET_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return Telnet_Set(m_pObj, PID_TELNET_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return Telnet_Set(m_pObj, PID_TELNET_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return Telnet_Set(m_pObj, PID_TELNET_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return Telnet_Set(m_pObj, PID_TELNET_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return Telnet_Set(m_pObj, PID_TELNET_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline BOOL GetKeepAlive() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_KEEPALIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetKeepAlive(BOOL bKeepAlive) {
      int val = (int)bKeepAlive;
      return Telnet_Set(m_pObj, PID_TELNET_KEEPALIVE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetLinger() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_LINGER, 0, 0);
      return (BOOL)val;
    }
    inline INT SetLinger(BOOL bLinger) {
      int val = (int)bLinger;
      return Telnet_Set(m_pObj, PID_TELNET_LINGER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return Telnet_Set(m_pObj, PID_TELNET_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return Telnet_Set(m_pObj, PID_TELNET_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return Telnet_Set(m_pObj, PID_TELNET_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return Telnet_Set(m_pObj, PID_TELNET_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return Telnet_Set(m_pObj, PID_TELNET_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline BOOL GetTransparent() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_TRANSPARENT, 0, 0);
      return (BOOL)val;
    }
    inline INT SetTransparent(BOOL bTransparent) {
      int val = (int)bTransparent;
      return Telnet_Set(m_pObj, PID_TELNET_TRANSPARENT, 0, (LPVOID)val, 0);
    }

    inline INT SetUrgentData(LPCSTR lpUrgentData, UINT lenUrgentData) {
      return Telnet_Set(m_pObj, PID_TELNET_URGENTDATA, 0, (LPVOID)lpUrgentData, lenUrgentData);
    }


    inline INT SetWillOption(INT iWillOption) {
      int val = (int)iWillOption;
      return Telnet_Set(m_pObj, PID_TELNET_WILLOPTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return Telnet_Set(m_pObj, PID_TELNET_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return Telnet_Set(m_pObj, PID_TELNET_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)Telnet_Get(m_pObj, PID_TELNET_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


    inline INT SetWontOption(INT iWontOption) {
      int val = (int)iWontOption;
      return Telnet_Set(m_pObj, PID_TELNET_WONTOPTION, 0, (LPVOID)val, 0);
    }

  public: //methods

    inline int Connect(LPSTR lpszHost) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszHost, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return Telnet_Do(m_pObj, MID_TELNET_CONNECT, 1, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return Telnet_Do(m_pObj, MID_TELNET_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return Telnet_Do(m_pObj, MID_TELNET_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Send(LPSTR lpText, UINT lenText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpText, NULL};
      UINT cbparam[1+1] = {lenText, (UINT)NULL};
      return Telnet_Do(m_pObj, MID_TELNET_SEND, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class Telnet : public TelnetA {
  
  public:
    Telnet(LPCSTR lpOemKey = IPWORKS_OEMKEY_19):TelnetA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDataToSend;
    MCFStringRef tmpDoSubOption;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpUrgentData;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(TelnetA::GetLastError());
    }

    // CFString versions of properties





    inline INT SetDataToSend(CFStringRef strDataToSend) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDataToSend);
      return TelnetA::SetDataToSend(lp, tmp.Length());
    }



    inline INT SetDoSubOption(CFStringRef strDoSubOption) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDoSubOption);
      return TelnetA::SetDoSubOption(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = TelnetA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return TelnetA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(TelnetA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return TelnetA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(TelnetA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return TelnetA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(TelnetA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return TelnetA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }


    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(TelnetA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return TelnetA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(TelnetA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return TelnetA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }





    inline INT SetUrgentData(CFStringRef strUrgentData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strUrgentData);
      return TelnetA::SetUrgentData(lp, tmp.Length());
    }

    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(TelnetA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(TelnetA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return TelnetA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(TelnetA::GetWinsockStatus());
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

    virtual INT FireDataIn(LPSTR &lpText, USHORT &lenText) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireDataIn(uval_lpText, lenText);
    }
    virtual INT FireDataIn(CFStringRef &lpText, USHORT &lenText) {
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



    virtual INT FireSubOption(LPSTR &lpSubOption, USHORT &lenSubOption) {
      MCFStringRef etmpSubOption(lpSubOption, lenSubOption);
      CFStringRef uval_lpSubOption = etmpSubOption.Deref();
      return FireSubOption(uval_lpSubOption, lenSubOption);
    }
    virtual INT FireSubOption(CFStringRef &lpSubOption, USHORT &lenSubOption) {
      return 0;
    }







  public:
  
    //redeclare methods with CFString parameters

    inline int Connect(CFStringRef pHost) {
      MCFStringAcc etmpHost;
      LPSTR lpszHost = etmpHost.Deref(pHost);

      return TelnetA::Connect(lpszHost);
    }





    inline int Send(CFStringRef pText, UINT lenText) {
      MCFStringAcc etmpText;
      LPSTR lpText = etmpText.Deref(pText);
      return TelnetA::Send(lpText, lenText);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDataToSend;
    MUString tmpDoSubOption;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLocalHost;
    MUString tmpRemoteHost;
    MUString tmpUrgentData;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(TelnetA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties





    inline INT SetDataToSend(LPWSTR lpDataToSend, UINT lenDataToSend) {
      MAString tmp(lpDataToSend, lenDataToSend);
      return TelnetA::SetDataToSend(tmp.Deref(), tmp.Length());
    }



    inline INT SetDoSubOption(LPWSTR lpDoSubOption, UINT lenDoSubOption) {
      MAString tmp(lpDoSubOption, lenDoSubOption);
      return TelnetA::SetDoSubOption(tmp.Deref(), tmp.Length());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = TelnetA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return TelnetA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(TelnetA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return TelnetA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(TelnetA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return TelnetA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(TelnetA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return TelnetA::SetFirewallUser(tmp.Deref());
    }


    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(TelnetA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return TelnetA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(TelnetA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return TelnetA::SetRemoteHost(tmp.Deref());
    }





    inline INT SetUrgentData(LPWSTR lpUrgentData, UINT lenUrgentData) {
      MAString tmp(lpUrgentData, lenUrgentData);
      return TelnetA::SetUrgentData(tmp.Deref(), tmp.Length());
    }

    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(TelnetA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(TelnetA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return TelnetA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(TelnetA::GetWinsockStatus());
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

    virtual INT FireDataIn(LPSTR &lpText, USHORT &lenText) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireDataIn(uval_lpText, lenText);
    }
    virtual INT FireDataIn(LPWSTR &lpText, USHORT &lenText) {
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



    virtual INT FireSubOption(LPSTR &lpSubOption, USHORT &lenSubOption) {
      MUString etmpSubOption(lpSubOption, lenSubOption);
      LPWSTR uval_lpSubOption = etmpSubOption.Deref();
      return FireSubOption(uval_lpSubOption, lenSubOption);
    }
    virtual INT FireSubOption(LPWSTR &lpSubOption, USHORT &lenSubOption) {
      return 0;
    }







#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_TELNET_H_




