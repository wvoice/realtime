/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_UDPPORT_H_
#define _IPWORKS_UDPPORT_H_

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

#define PID_UDPPORT_ACCEPTDATA    1
#define PID_UDPPORT_ACTIVE    2
#define PID_UDPPORT_DATATOSEND    3
#define PID_UDPPORT_DONTROUTE    4
#define PID_UDPPORT_INBUFFERSIZE    5
#define PID_UDPPORT_LOCALHOST    6
#define PID_UDPPORT_LOCALPORT    7
#define PID_UDPPORT_MAXPACKETSIZE    8
#define PID_UDPPORT_OUTBUFFERSIZE    9
#define PID_UDPPORT_QOSFLAGS    10
#define PID_UDPPORT_REMOTEHOST    11
#define PID_UDPPORT_REMOTEPORT    12
#define PID_UDPPORT_SHARELOCALPORT    13
#define PID_UDPPORT_SOCKETHANDLE    14
#define PID_UDPPORT_TIMETOLIVE    15
#define PID_UDPPORT_USECONNECTION    16
#define PID_UDPPORT_WINSOCKINFO    17
#define PID_UDPPORT_WINSOCKLOADED    18
#define PID_UDPPORT_WINSOCKMAXDATAGRAMSIZE    19
#define PID_UDPPORT_WINSOCKMAXSOCKETS    20
#define PID_UDPPORT_WINSOCKPATH    21
#define PID_UDPPORT_WINSOCKSTATUS    22


#define MID_UDPPORT_DOEVENTS    1
#define MID_UDPPORT_SEND    2


#define EID_UDPPORT_DATAIN    1
#define EID_UDPPORT_ERROR    2
#define EID_UDPPORT_READYTOSEND    3


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID UDPPort_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    UDPPort_Destroy(LPVOID lpObj);
CNX_IMPORT INT    UDPPort_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID UDPPort_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    UDPPort_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    UDPPort_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  UDPPort_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    UDPPort_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   UDPPort_StaticInit(LPVOID hInst);

class UDPPortA {
  
  public: //events
  
    virtual INT FireDataIn(LPSTR &lpDatagram, USHORT &lenDatagram, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireReadyToSend() {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_UDPPORT_DATAIN: {
                        LPSTR pDatagram = (LPSTR)(INT)(*param++);
            
                        USHORT lenDatagram = (USHORT)(*cbparam++);
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((UDPPortA*)lpObj)->FireDataIn(pDatagram, lenDatagram, pSourceAddress, pSourcePort);
         }
         case EID_UDPPORT_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((UDPPortA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_UDPPORT_READYTOSEND: {
            
            return ((UDPPortA*)lpObj)->FireReadyToSend();
         }

      }
      return 0;
    }

  public:

    UDPPortA(LPCSTR lpOemKey = IPWORKS_OEMKEY_13) {
      m_pObj = UDPPort_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~UDPPortA() {
      UDPPort_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)UDPPort_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return UDPPort_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)UDPPort_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return UDPPort_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return UDPPort_Set(m_pObj, PID_UDPPORT_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline BOOL GetActive() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_ACTIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetActive(BOOL bActive) {
      int val = (int)bActive;
      return UDPPort_Set(m_pObj, PID_UDPPORT_ACTIVE, 0, (LPVOID)val, 0);
    }

    inline INT SetDataToSend(LPCSTR lpDataToSend, UINT lenDataToSend) {
      return UDPPort_Set(m_pObj, PID_UDPPORT_DATATOSEND, 0, (LPVOID)lpDataToSend, lenDataToSend);
    }

    inline BOOL GetDontRoute() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_DONTROUTE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetDontRoute(BOOL bDontRoute) {
      int val = (int)bDontRoute;
      return UDPPort_Set(m_pObj, PID_UDPPORT_DONTROUTE, 0, (LPVOID)val, 0);
    }
    inline LONG GetInBufferSize() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_INBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetInBufferSize(LONG lInBufferSize) {
      int val = (int)lInBufferSize;
      return UDPPort_Set(m_pObj, PID_UDPPORT_INBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return UDPPort_Set(m_pObj, PID_UDPPORT_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return UDPPort_Set(m_pObj, PID_UDPPORT_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxPacketSize() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_MAXPACKETSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxPacketSize(LONG lMaxPacketSize) {
      int val = (int)lMaxPacketSize;
      return UDPPort_Set(m_pObj, PID_UDPPORT_MAXPACKETSIZE, 0, (LPVOID)val, 0);
    }
    inline LONG GetOutBufferSize() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_OUTBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetOutBufferSize(LONG lOutBufferSize) {
      int val = (int)lOutBufferSize;
      return UDPPort_Set(m_pObj, PID_UDPPORT_OUTBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline USHORT GetQOSFlags() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_QOSFLAGS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetQOSFlags(USHORT usQOSFlags) {
      int val = (int)usQOSFlags;
      return UDPPort_Set(m_pObj, PID_UDPPORT_QOSFLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return UDPPort_Set(m_pObj, PID_UDPPORT_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return UDPPort_Set(m_pObj, PID_UDPPORT_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline BOOL GetShareLocalPort() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_SHARELOCALPORT, 0, 0);
      return (BOOL)val;
    }
    inline INT SetShareLocalPort(BOOL bShareLocalPort) {
      int val = (int)bShareLocalPort;
      return UDPPort_Set(m_pObj, PID_UDPPORT_SHARELOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetTimeToLive() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_TIMETOLIVE, 0, 0);
      return (LONG)val;
    }
    inline INT SetTimeToLive(LONG lTimeToLive) {
      int val = (int)lTimeToLive;
      return UDPPort_Set(m_pObj, PID_UDPPORT_TIMETOLIVE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetUseConnection() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_USECONNECTION, 0, 0);
      return (BOOL)val;
    }
    inline INT SetUseConnection(BOOL bUseConnection) {
      int val = (int)bUseConnection;
      return UDPPort_Set(m_pObj, PID_UDPPORT_USECONNECTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return UDPPort_Set(m_pObj, PID_UDPPORT_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return UDPPort_Set(m_pObj, PID_UDPPORT_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)UDPPort_Get(m_pObj, PID_UDPPORT_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return UDPPort_Do(m_pObj, MID_UDPPORT_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Send(LPSTR lpText, UINT lenText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpText, NULL};
      UINT cbparam[1+1] = {lenText, (UINT)NULL};
      return UDPPort_Do(m_pObj, MID_UDPPORT_SEND, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class UDPPort : public UDPPortA {
  
  public:
    UDPPort(LPCSTR lpOemKey = IPWORKS_OEMKEY_13):UDPPortA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDataToSend;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(UDPPortA::GetLastError());
    }

    // CFString versions of properties



    inline INT SetDataToSend(CFStringRef strDataToSend) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDataToSend);
      return UDPPortA::SetDataToSend(lp, tmp.Length());
    }


    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(UDPPortA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return UDPPortA::SetLocalHost(tmp.Deref(strLocalHost));
    }




    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(UDPPortA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return UDPPortA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }





    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(UDPPortA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(UDPPortA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return UDPPortA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(UDPPortA::GetWinsockStatus());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireDataIn(LPSTR &lpDatagram, USHORT &lenDatagram, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpDatagram(lpDatagram, lenDatagram);
      CFStringRef uval_lpDatagram = etmpDatagram.Deref();      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireDataIn(uval_lpDatagram, lenDatagram, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireDataIn(CFStringRef &lpDatagram, USHORT &lenDatagram, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
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



    inline int Send(CFStringRef pText, UINT lenText) {
      MCFStringAcc etmpText;
      LPSTR lpText = etmpText.Deref(pText);
      return UDPPortA::Send(lpText, lenText);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDataToSend;
    MUString tmpLocalHost;
    MUString tmpRemoteHost;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(UDPPortA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties



    inline INT SetDataToSend(LPWSTR lpDataToSend, UINT lenDataToSend) {
      MAString tmp(lpDataToSend, lenDataToSend);
      return UDPPortA::SetDataToSend(tmp.Deref(), tmp.Length());
    }


    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(UDPPortA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return UDPPortA::SetLocalHost(tmp.Deref());
    }




    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(UDPPortA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return UDPPortA::SetRemoteHost(tmp.Deref());
    }





    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(UDPPortA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(UDPPortA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return UDPPortA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(UDPPortA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireDataIn(LPSTR &lpDatagram, USHORT &lenDatagram, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpDatagram(lpDatagram, lenDatagram);
      LPWSTR uval_lpDatagram = etmpDatagram.Deref();      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireDataIn(uval_lpDatagram, lenDatagram, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireDataIn(LPWSTR &lpDatagram, USHORT &lenDatagram, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
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

#endif //_IPWORKS_UDPPORT_H_




