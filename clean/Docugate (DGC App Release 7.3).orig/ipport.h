/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_IPPORT_H_
#define _IPWORKS_IPPORT_H_

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

#define PID_IPPORT_ACCEPTDATA    1
#define PID_IPPORT_BYTESSENT    2
#define PID_IPPORT_CONNECTED    3
#define PID_IPPORT_DATATOSEND    4
#define PID_IPPORT_EOL    5
#define PID_IPPORT_FIREWALLDATA    6
#define PID_IPPORT_FIREWALLHOST    7
#define PID_IPPORT_FIREWALLPASSWORD    8
#define PID_IPPORT_FIREWALLPORT    9
#define PID_IPPORT_FIREWALLTYPE    10
#define PID_IPPORT_FIREWALLUSER    11
#define PID_IPPORT_INBUFFERSIZE    12
#define PID_IPPORT_KEEPALIVE    13
#define PID_IPPORT_LINGER    14
#define PID_IPPORT_LOCALHOST    15
#define PID_IPPORT_LOCALPORT    16
#define PID_IPPORT_MAXLINELENGTH    17
#define PID_IPPORT_OUTBUFFERSIZE    18
#define PID_IPPORT_REMOTEHOST    19
#define PID_IPPORT_REMOTEPORT    20
#define PID_IPPORT_SOCKETHANDLE    21
#define PID_IPPORT_TIMEOUT    22
#define PID_IPPORT_WINSOCKINFO    23
#define PID_IPPORT_WINSOCKLOADED    24
#define PID_IPPORT_WINSOCKMAXDATAGRAMSIZE    25
#define PID_IPPORT_WINSOCKMAXSOCKETS    26
#define PID_IPPORT_WINSOCKPATH    27
#define PID_IPPORT_WINSOCKSTATUS    28


#define MID_IPPORT_CONNECT    1
#define MID_IPPORT_DISCONNECT    2
#define MID_IPPORT_DOEVENTS    3
#define MID_IPPORT_SEND    4


#define EID_IPPORT_CONNECTED    1
#define EID_IPPORT_DATAIN    2
#define EID_IPPORT_DISCONNECTED    3
#define EID_IPPORT_ERROR    4
#define EID_IPPORT_READYTOSEND    5


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID IPPort_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    IPPort_Destroy(LPVOID lpObj);
CNX_IMPORT INT    IPPort_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID IPPort_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    IPPort_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    IPPort_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  IPPort_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    IPPort_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   IPPort_StaticInit(LPVOID hInst);

class IPPortA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDataIn(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireReadyToSend() {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_IPPORT_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPPortA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_IPPORT_DATAIN: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
                        BOOL pEOL = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPPortA*)lpObj)->FireDataIn(pText, lenText, pEOL);
         }
         case EID_IPPORT_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPPortA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_IPPORT_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPPortA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_IPPORT_READYTOSEND: {
            
            return ((IPPortA*)lpObj)->FireReadyToSend();
         }

      }
      return 0;
    }

  public:

    IPPortA(LPCSTR lpOemKey = IPWORKS_OEMKEY_11) {
      m_pObj = IPPort_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~IPPortA() {
      IPPort_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)IPPort_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return IPPort_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)IPPort_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return IPPort_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return IPPort_Set(m_pObj, PID_IPPORT_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline INT GetBytesSent() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_BYTESSENT, 0, 0);
      return (INT)val;
    }

    inline BOOL GetConnected() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_CONNECTED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetConnected(BOOL bConnected) {
      int val = (int)bConnected;
      return IPPort_Set(m_pObj, PID_IPPORT_CONNECTED, 0, (LPVOID)val, 0);
    }

    inline INT SetDataToSend(LPCSTR lpDataToSend, UINT lenDataToSend) {
      return IPPort_Set(m_pObj, PID_IPPORT_DATATOSEND, 0, (LPVOID)lpDataToSend, lenDataToSend);
    }

    inline INT GetEOL(LPCSTR &lpEOL, UINT &lenEOL) {
      lpEOL = (LPSTR)IPPort_Get(m_pObj, PID_IPPORT_EOL, 0, &lenEOL);
      if ( ! lpEOL) return lenEOL;
      return 0;
    }

    inline INT SetEOL(LPCSTR lpEOL, UINT lenEOL) {
      return IPPort_Set(m_pObj, PID_IPPORT_EOL, 0, (LPVOID)lpEOL, lenEOL);
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)IPPort_Get(m_pObj, PID_IPPORT_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return IPPort_Set(m_pObj, PID_IPPORT_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return IPPort_Set(m_pObj, PID_IPPORT_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return IPPort_Set(m_pObj, PID_IPPORT_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return IPPort_Set(m_pObj, PID_IPPORT_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return IPPort_Set(m_pObj, PID_IPPORT_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return IPPort_Set(m_pObj, PID_IPPORT_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LONG GetInBufferSize() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_INBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetInBufferSize(LONG lInBufferSize) {
      int val = (int)lInBufferSize;
      return IPPort_Set(m_pObj, PID_IPPORT_INBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetKeepAlive() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_KEEPALIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetKeepAlive(BOOL bKeepAlive) {
      int val = (int)bKeepAlive;
      return IPPort_Set(m_pObj, PID_IPPORT_KEEPALIVE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetLinger() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_LINGER, 0, 0);
      return (BOOL)val;
    }
    inline INT SetLinger(BOOL bLinger) {
      int val = (int)bLinger;
      return IPPort_Set(m_pObj, PID_IPPORT_LINGER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return IPPort_Set(m_pObj, PID_IPPORT_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return IPPort_Set(m_pObj, PID_IPPORT_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxLineLength() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_MAXLINELENGTH, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxLineLength(LONG lMaxLineLength) {
      int val = (int)lMaxLineLength;
      return IPPort_Set(m_pObj, PID_IPPORT_MAXLINELENGTH, 0, (LPVOID)val, 0);
    }
    inline LONG GetOutBufferSize() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_OUTBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetOutBufferSize(LONG lOutBufferSize) {
      int val = (int)lOutBufferSize;
      return IPPort_Set(m_pObj, PID_IPPORT_OUTBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return IPPort_Set(m_pObj, PID_IPPORT_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return IPPort_Set(m_pObj, PID_IPPORT_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return IPPort_Set(m_pObj, PID_IPPORT_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return IPPort_Set(m_pObj, PID_IPPORT_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return IPPort_Set(m_pObj, PID_IPPORT_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)IPPort_Get(m_pObj, PID_IPPORT_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Connect(LPSTR lpszHost, INT iPort) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszHost, (LPVOID)(INT)iPort, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return IPPort_Do(m_pObj, MID_IPPORT_CONNECT, 2, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IPPort_Do(m_pObj, MID_IPPORT_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IPPort_Do(m_pObj, MID_IPPORT_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Send(LPSTR lpText, UINT lenText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpText, NULL};
      UINT cbparam[1+1] = {lenText, (UINT)NULL};
      return IPPort_Do(m_pObj, MID_IPPORT_SEND, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class IPPort : public IPPortA {
  
  public:
    IPPort(LPCSTR lpOemKey = IPWORKS_OEMKEY_11):IPPortA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDataToSend;
    MCFStringRef tmpEOL;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(IPPortA::GetLastError());
    }

    // CFString versions of properties




    inline INT SetDataToSend(CFStringRef strDataToSend) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDataToSend);
      return IPPortA::SetDataToSend(lp, tmp.Length());
    }
    inline CFStringRef GetEOL() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = IPPortA::GetEOL(tmp, len);
      if (ret_code) return NULL;
      return tmpEOL.Set(tmp, len);
    }

    inline INT SetEOL(CFStringRef strEOL) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strEOL);
      return IPPortA::SetEOL(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = IPPortA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return IPPortA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(IPPortA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return IPPortA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(IPPortA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return IPPortA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(IPPortA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return IPPortA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }



    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(IPPortA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return IPPortA::SetLocalHost(tmp.Deref(strLocalHost));
    }



    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(IPPortA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return IPPortA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(IPPortA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(IPPortA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return IPPortA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(IPPortA::GetWinsockStatus());
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

    virtual INT FireDataIn(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireDataIn(uval_lpText, lenText, bEOL);
    }
    virtual INT FireDataIn(CFStringRef &lpText, USHORT &lenText, BOOL &bEOL) {
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

    inline int Connect(CFStringRef pHost, USHORT iPort) {
      MCFStringAcc etmpHost;
      LPSTR lpszHost = etmpHost.Deref(pHost);

      return IPPortA::Connect(lpszHost, iPort);
    }





    inline int Send(CFStringRef pText, UINT lenText) {
      MCFStringAcc etmpText;
      LPSTR lpText = etmpText.Deref(pText);
      return IPPortA::Send(lpText, lenText);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDataToSend;
    MUString tmpEOL;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLocalHost;
    MUString tmpRemoteHost;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(IPPortA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties




    inline INT SetDataToSend(LPWSTR lpDataToSend, UINT lenDataToSend) {
      MAString tmp(lpDataToSend, lenDataToSend);
      return IPPortA::SetDataToSend(tmp.Deref(), tmp.Length());
    }
    inline INT GetEOL(LPWSTR &lpEOL, UINT &lenEOL) {
      LPSTR tmp = NULL;
      INT ret_code = IPPortA::GetEOL(tmp, lenEOL);
      if (ret_code) return ret_code;
      tmpEOL.Set(tmp, lenEOL);
      lpEOL = tmpEOL.Deref();
      return 0;
    }

    inline INT SetEOL(LPWSTR lpEOL, UINT lenEOL) {
      MAString tmp(lpEOL, lenEOL);
      return IPPortA::SetEOL(tmp.Deref(), tmp.Length());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = IPPortA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return IPPortA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(IPPortA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return IPPortA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(IPPortA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return IPPortA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(IPPortA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return IPPortA::SetFirewallUser(tmp.Deref());
    }



    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(IPPortA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return IPPortA::SetLocalHost(tmp.Deref());
    }



    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(IPPortA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return IPPortA::SetRemoteHost(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(IPPortA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(IPPortA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return IPPortA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(IPPortA::GetWinsockStatus());
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

    virtual INT FireDataIn(LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireDataIn(uval_lpText, lenText, bEOL);
    }
    virtual INT FireDataIn(LPWSTR &lpText, USHORT &lenText, BOOL &bEOL) {
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

#endif //_IPWORKS_IPPORT_H_




