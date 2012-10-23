/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_IPDAEMON_H_
#define _IPWORKS_IPDAEMON_H_

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

#define PID_IPDAEMON_ACCEPTDATA    1
#define PID_IPDAEMON_BYTESSENT    2
#define PID_IPDAEMON_CLIENTSOCKETHANDLE    3
#define PID_IPDAEMON_CONNECTED    4
#define PID_IPDAEMON_CONNECTIONBACKLOG    5
#define PID_IPDAEMON_CONNECTIONCOUNT    6
#define PID_IPDAEMON_DATATOSEND    7
#define PID_IPDAEMON_EOL    8
#define PID_IPDAEMON_INBUFFERSIZE    9
#define PID_IPDAEMON_KEEPALIVE    10
#define PID_IPDAEMON_LINGER    11
#define PID_IPDAEMON_LISTENING    12
#define PID_IPDAEMON_LOCALADDRESS    13
#define PID_IPDAEMON_LOCALHOST    14
#define PID_IPDAEMON_LOCALPORT    15
#define PID_IPDAEMON_MAXLINELENGTH    16
#define PID_IPDAEMON_OUTBUFFERSIZE    17
#define PID_IPDAEMON_REMOTEHOST    18
#define PID_IPDAEMON_REMOTEPORT    19
#define PID_IPDAEMON_SOCKETHANDLE    20
#define PID_IPDAEMON_WINSOCKINFO    21
#define PID_IPDAEMON_WINSOCKLOADED    22
#define PID_IPDAEMON_WINSOCKMAXDATAGRAMSIZE    23
#define PID_IPDAEMON_WINSOCKMAXSOCKETS    24
#define PID_IPDAEMON_WINSOCKPATH    25
#define PID_IPDAEMON_WINSOCKSTATUS    26


#define MID_IPDAEMON_DISCONNECT    1
#define MID_IPDAEMON_DOEVENTS    2
#define MID_IPDAEMON_SEND    3


#define EID_IPDAEMON_CONNECTED    1
#define EID_IPDAEMON_CONNECTIONREQUEST    2
#define EID_IPDAEMON_DATAIN    3
#define EID_IPDAEMON_DISCONNECTED    4
#define EID_IPDAEMON_ERROR    5
#define EID_IPDAEMON_READYTOSEND    6


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID IPDaemon_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    IPDaemon_Destroy(LPVOID lpObj);
CNX_IMPORT INT    IPDaemon_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID IPDaemon_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    IPDaemon_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    IPDaemon_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  IPDaemon_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    IPDaemon_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   IPDaemon_StaticInit(LPVOID hInst);

class IPDaemonA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usConnectionId, USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireConnectionRequest(BOOL &bAccept) {return 0;}
    virtual INT FireDataIn(USHORT &usConnectionId, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {return 0;}
    virtual INT FireDisconnected(USHORT &usConnectionId, USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireReadyToSend(USHORT &usConnectionId) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_IPDAEMON_CONNECTED: {
                        USHORT pConnectionId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPDaemonA*)lpObj)->FireConnected(pConnectionId, pStatusCode, pDescription);
         }
         case EID_IPDAEMON_CONNECTIONREQUEST: {
                        BOOL *pAccept = (BOOL*)(INT)param++;
                 
                        cbparam++;
            
            
            return ((IPDaemonA*)lpObj)->FireConnectionRequest(*pAccept);
         }
         case EID_IPDAEMON_DATAIN: {
                        USHORT pConnectionId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
                        BOOL pEOL = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPDaemonA*)lpObj)->FireDataIn(pConnectionId, pText, lenText, pEOL);
         }
         case EID_IPDAEMON_DISCONNECTED: {
                        USHORT pConnectionId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPDaemonA*)lpObj)->FireDisconnected(pConnectionId, pStatusCode, pDescription);
         }
         case EID_IPDAEMON_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPDaemonA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_IPDAEMON_READYTOSEND: {
                        USHORT pConnectionId = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IPDaemonA*)lpObj)->FireReadyToSend(pConnectionId);
         }

      }
      return 0;
    }

  public:

    IPDaemonA(LPCSTR lpOemKey = IPWORKS_OEMKEY_12) {
      m_pObj = IPDaemon_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~IPDaemonA() {
      IPDaemon_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)IPDaemon_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return IPDaemon_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)IPDaemon_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return IPDaemon_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData(USHORT usConnectionId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_ACCEPTDATA, usConnectionId, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(USHORT usConnectionId, BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_ACCEPTDATA, usConnectionId, (LPVOID)val, 0);
    }
    inline INT GetBytesSent(USHORT usConnectionId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_BYTESSENT, usConnectionId, 0);
      return (INT)val;
    }

    inline LONG GetClientSocketHandle(USHORT usConnectionId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_CLIENTSOCKETHANDLE, usConnectionId, 0);
      return (LONG)val;
    }

    inline BOOL GetConnected(USHORT usConnId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_CONNECTED, usConnId, 0);
      return (BOOL)val;
    }
    inline INT SetConnected(USHORT usConnId, BOOL bConnected) {
      int val = (int)bConnected;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_CONNECTED, usConnId, (LPVOID)val, 0);
    }
    inline USHORT GetConnectionBacklog() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_CONNECTIONBACKLOG, 0, 0);
      return (USHORT)val;
    }
    inline INT SetConnectionBacklog(USHORT usConnectionBacklog) {
      int val = (int)usConnectionBacklog;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_CONNECTIONBACKLOG, 0, (LPVOID)val, 0);
    }
    inline INT GetConnectionCount() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_CONNECTIONCOUNT, 0, 0);
      return (INT)val;
    }


    inline INT SetDataToSend(USHORT usConnectionId, LPCSTR lpDataToSend, UINT lenDataToSend) {
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_DATATOSEND, usConnectionId, (LPVOID)lpDataToSend, lenDataToSend);
    }

    inline INT GetEOL(USHORT usConnectionId, LPCSTR &lpEOL, UINT &lenEOL) {
      lpEOL = (LPSTR)IPDaemon_Get(m_pObj, PID_IPDAEMON_EOL, usConnectionId, &lenEOL);
      if ( ! lpEOL) return lenEOL;
      return 0;
    }

    inline INT SetEOL(USHORT usConnectionId, LPCSTR lpEOL, UINT lenEOL) {
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_EOL, usConnectionId, (LPVOID)lpEOL, lenEOL);
    }

    inline LONG GetInBufferSize() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_INBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetInBufferSize(LONG lInBufferSize) {
      int val = (int)lInBufferSize;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_INBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetKeepAlive() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_KEEPALIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetKeepAlive(BOOL bKeepAlive) {
      int val = (int)bKeepAlive;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_KEEPALIVE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetLinger() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_LINGER, 0, 0);
      return (BOOL)val;
    }
    inline INT SetLinger(BOOL bLinger) {
      int val = (int)bLinger;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_LINGER, 0, (LPVOID)val, 0);
    }
    inline BOOL GetListening() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_LISTENING, 0, 0);
      return (BOOL)val;
    }
    inline INT SetListening(BOOL bListening) {
      int val = (int)bListening;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_LISTENING, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalAddress(USHORT usConnectionId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_LOCALADDRESS, usConnectionId, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxLineLength() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_MAXLINELENGTH, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxLineLength(LONG lMaxLineLength) {
      int val = (int)lMaxLineLength;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_MAXLINELENGTH, 0, (LPVOID)val, 0);
    }
    inline LONG GetOutBufferSize() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_OUTBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetOutBufferSize(LONG lOutBufferSize) {
      int val = (int)lOutBufferSize;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_OUTBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost(USHORT usConnectionId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_REMOTEHOST, usConnectionId, 0);
      return (LPCSTR)val;
    }

    inline USHORT GetRemotePort(USHORT usConnectionId) {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_REMOTEPORT, usConnectionId, 0);
      return (USHORT)val;
    }

    inline LONG GetSocketHandle() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockInfo() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return IPDaemon_Set(m_pObj, PID_IPDAEMON_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)IPDaemon_Get(m_pObj, PID_IPDAEMON_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Disconnect(LONG lConnectionId) {
      LPVOID param[1+1] = {(LPVOID)(INT)lConnectionId, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return IPDaemon_Do(m_pObj, MID_IPDAEMON_DISCONNECT, 1, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IPDaemon_Do(m_pObj, MID_IPDAEMON_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Send(LONG lConnectionId, LPSTR lpText, UINT lenText) {
      LPVOID param[2+1] = {(LPVOID)(INT)lConnectionId, (LPVOID)(INT)lpText, NULL};
      UINT cbparam[2+1] = {0, lenText, (UINT)NULL};
      return IPDaemon_Do(m_pObj, MID_IPDAEMON_SEND, 2, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class IPDaemon : public IPDaemonA {
  
  public:
    IPDaemon(LPCSTR lpOemKey = IPWORKS_OEMKEY_12):IPDaemonA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDataToSend;
    MCFStringRef tmpEOL;
    MCFStringRef tmpLocalAddress;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(IPDaemonA::GetLastError());
    }

    // CFString versions of properties







    inline INT SetDataToSend(USHORT usConnectionId, CFStringRef strDataToSend) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDataToSend);
      return IPDaemonA::SetDataToSend(usConnectionId, lp, tmp.Length());
    }
    inline CFStringRef GetEOL(USHORT usConnectionId) {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = IPDaemonA::GetEOL(usConnectionId, tmp, len);
      if (ret_code) return NULL;
      return tmpEOL.Set(tmp, len);
    }

    inline INT SetEOL(USHORT usConnectionId, CFStringRef strEOL) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strEOL);
      return IPDaemonA::SetEOL(usConnectionId, lp, tmp.Length());
    }




    inline CFStringRef GetLocalAddress(USHORT usConnectionId) {
      return tmpLocalAddress.Set(IPDaemonA::GetLocalAddress(usConnectionId));
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(IPDaemonA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return IPDaemonA::SetLocalHost(tmp.Deref(strLocalHost));
    }



    inline CFStringRef GetRemoteHost(USHORT usConnectionId) {
      return tmpRemoteHost.Set(IPDaemonA::GetRemoteHost(usConnectionId));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(IPDaemonA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(IPDaemonA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return IPDaemonA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(IPDaemonA::GetWinsockStatus());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireConnected(USHORT &usConnectionId, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireConnected(usConnectionId, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireConnected(USHORT &usConnectionId, USHORT &usStatusCode, CFStringRef &lpszDescription) {
      return 0;
    }



    virtual INT FireDataIn(USHORT &usConnectionId, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireDataIn(usConnectionId, uval_lpText, lenText, bEOL);
    }
    virtual INT FireDataIn(USHORT &usConnectionId, CFStringRef &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }

    virtual INT FireDisconnected(USHORT &usConnectionId, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MCFStringRef etmpDescription(lpszDescription);
      CFStringRef uval_lpszDescription = etmpDescription.Deref();

      return FireDisconnected(usConnectionId, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireDisconnected(USHORT &usConnectionId, USHORT &usStatusCode, CFStringRef &lpszDescription) {
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





    inline int Send(LONG lConnectionId, CFStringRef pText, UINT lenText) {
      MCFStringAcc etmpText;
      LPSTR lpText = etmpText.Deref(pText);
      return IPDaemonA::Send(lConnectionId, lpText, lenText);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDataToSend;
    MUString tmpEOL;
    MUString tmpLocalAddress;
    MUString tmpLocalHost;
    MUString tmpRemoteHost;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(IPDaemonA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties







    inline INT SetDataToSend(USHORT usConnectionId, LPWSTR lpDataToSend, UINT lenDataToSend) {
      MAString tmp(lpDataToSend, lenDataToSend);
      return IPDaemonA::SetDataToSend(usConnectionId, tmp.Deref(), tmp.Length());
    }
    inline INT GetEOL(USHORT usConnectionId, LPWSTR &lpEOL, UINT &lenEOL) {
      LPSTR tmp = NULL;
      INT ret_code = IPDaemonA::GetEOL(usConnectionId, tmp, lenEOL);
      if (ret_code) return ret_code;
      tmpEOL.Set(tmp, lenEOL);
      lpEOL = tmpEOL.Deref();
      return 0;
    }

    inline INT SetEOL(USHORT usConnectionId, LPWSTR lpEOL, UINT lenEOL) {
      MAString tmp(lpEOL, lenEOL);
      return IPDaemonA::SetEOL(usConnectionId, tmp.Deref(), tmp.Length());
    }




    inline LPWSTR GetLocalAddress(USHORT usConnectionId) {
      tmpLocalAddress.Set(IPDaemonA::GetLocalAddress(usConnectionId));
      return tmpLocalAddress.Deref();
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(IPDaemonA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return IPDaemonA::SetLocalHost(tmp.Deref());
    }



    inline LPWSTR GetRemoteHost(USHORT usConnectionId) {
      tmpRemoteHost.Set(IPDaemonA::GetRemoteHost(usConnectionId));
      return tmpRemoteHost.Deref();
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(IPDaemonA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(IPDaemonA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return IPDaemonA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(IPDaemonA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireConnected(USHORT &usConnectionId, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireConnected(usConnectionId, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireConnected(USHORT &usConnectionId, USHORT &usStatusCode, LPWSTR &lpszDescription) {
      return 0;
    }



    virtual INT FireDataIn(USHORT &usConnectionId, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireDataIn(usConnectionId, uval_lpText, lenText, bEOL);
    }
    virtual INT FireDataIn(USHORT &usConnectionId, LPWSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }

    virtual INT FireDisconnected(USHORT &usConnectionId, USHORT &usStatusCode, LPSTR &lpszDescription) {
      MUString etmpDescription(lpszDescription);
      LPWSTR uval_lpszDescription = etmpDescription.Deref();

      return FireDisconnected(usConnectionId, usStatusCode, uval_lpszDescription);
    }
    virtual INT FireDisconnected(USHORT &usConnectionId, USHORT &usStatusCode, LPWSTR &lpszDescription) {
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

#endif //_IPWORKS_IPDAEMON_H_




