/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_MCAST_H_
#define _IPWORKS_MCAST_H_

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

#define PID_MCAST_ACCEPTDATA    1
#define PID_MCAST_ACTIVE    2
#define PID_MCAST_DATATOSEND    3
#define PID_MCAST_INBUFFERSIZE    4
#define PID_MCAST_LOCALHOST    5
#define PID_MCAST_LOCALPORT    6
#define PID_MCAST_LOOPBACK    7
#define PID_MCAST_MAXPACKETSIZE    8
#define PID_MCAST_MULTICASTGROUP    9
#define PID_MCAST_OUTBUFFERSIZE    10
#define PID_MCAST_QOSFLAGS    11
#define PID_MCAST_RECEIVEINTERFACE    12
#define PID_MCAST_REMOTEHOST    13
#define PID_MCAST_REMOTEPORT    14
#define PID_MCAST_SENDINTERFACE    15
#define PID_MCAST_SHARELOCALPORT    16
#define PID_MCAST_SOCKETHANDLE    17
#define PID_MCAST_TIMETOLIVE    18
#define PID_MCAST_WINSOCKINFO    19
#define PID_MCAST_WINSOCKLOADED    20
#define PID_MCAST_WINSOCKMAXDATAGRAMSIZE    21
#define PID_MCAST_WINSOCKMAXSOCKETS    22
#define PID_MCAST_WINSOCKPATH    23
#define PID_MCAST_WINSOCKSTATUS    24


#define MID_MCAST_DOEVENTS    1
#define MID_MCAST_SEND    2


#define EID_MCAST_DATAIN    1
#define EID_MCAST_ERROR    2
#define EID_MCAST_READYTOSEND    3


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID MCast_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    MCast_Destroy(LPVOID lpObj);
CNX_IMPORT INT    MCast_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID MCast_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    MCast_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    MCast_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  MCast_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    MCast_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   MCast_StaticInit(LPVOID hInst);

class MCastA {
  
  public: //events
  
    virtual INT FireDataIn(LPSTR &lpDatagram, USHORT &lenDatagram, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireReadyToSend() {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_MCAST_DATAIN: {
                        LPSTR pDatagram = (LPSTR)(INT)(*param++);
            
                        USHORT lenDatagram = (USHORT)(*cbparam++);
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((MCastA*)lpObj)->FireDataIn(pDatagram, lenDatagram, pSourceAddress, pSourcePort);
         }
         case EID_MCAST_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((MCastA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_MCAST_READYTOSEND: {
            
            return ((MCastA*)lpObj)->FireReadyToSend();
         }

      }
      return 0;
    }

  public:

    MCastA(LPCSTR lpOemKey = IPWORKS_OEMKEY_26) {
      m_pObj = MCast_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~MCastA() {
      MCast_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)MCast_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return MCast_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)MCast_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return MCast_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return MCast_Set(m_pObj, PID_MCAST_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline BOOL GetActive() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_ACTIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetActive(BOOL bActive) {
      int val = (int)bActive;
      return MCast_Set(m_pObj, PID_MCAST_ACTIVE, 0, (LPVOID)val, 0);
    }

    inline INT SetDataToSend(LPCSTR lpDataToSend, UINT lenDataToSend) {
      return MCast_Set(m_pObj, PID_MCAST_DATATOSEND, 0, (LPVOID)lpDataToSend, lenDataToSend);
    }

    inline LONG GetInBufferSize() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_INBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetInBufferSize(LONG lInBufferSize) {
      int val = (int)lInBufferSize;
      return MCast_Set(m_pObj, PID_MCAST_INBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return MCast_Set(m_pObj, PID_MCAST_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return MCast_Set(m_pObj, PID_MCAST_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline BOOL GetLoopback() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_LOOPBACK, 0, 0);
      return (BOOL)val;
    }
    inline INT SetLoopback(BOOL bLoopback) {
      int val = (int)bLoopback;
      return MCast_Set(m_pObj, PID_MCAST_LOOPBACK, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxPacketSize() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_MAXPACKETSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxPacketSize(LONG lMaxPacketSize) {
      int val = (int)lMaxPacketSize;
      return MCast_Set(m_pObj, PID_MCAST_MAXPACKETSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMulticastGroup() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_MULTICASTGROUP, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMulticastGroup(LPCSTR lpszMulticastGroup) {
      int val = (int)lpszMulticastGroup;
      return MCast_Set(m_pObj, PID_MCAST_MULTICASTGROUP, 0, (LPVOID)val, 0);
    }
    inline LONG GetOutBufferSize() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_OUTBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetOutBufferSize(LONG lOutBufferSize) {
      int val = (int)lOutBufferSize;
      return MCast_Set(m_pObj, PID_MCAST_OUTBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline USHORT GetQOSFlags() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_QOSFLAGS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetQOSFlags(USHORT usQOSFlags) {
      int val = (int)usQOSFlags;
      return MCast_Set(m_pObj, PID_MCAST_QOSFLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReceiveInterface() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_RECEIVEINTERFACE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReceiveInterface(LPCSTR lpszReceiveInterface) {
      int val = (int)lpszReceiveInterface;
      return MCast_Set(m_pObj, PID_MCAST_RECEIVEINTERFACE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return MCast_Set(m_pObj, PID_MCAST_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return MCast_Set(m_pObj, PID_MCAST_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSendInterface() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_SENDINTERFACE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSendInterface(LPCSTR lpszSendInterface) {
      int val = (int)lpszSendInterface;
      return MCast_Set(m_pObj, PID_MCAST_SENDINTERFACE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetShareLocalPort() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_SHARELOCALPORT, 0, 0);
      return (BOOL)val;
    }
    inline INT SetShareLocalPort(BOOL bShareLocalPort) {
      int val = (int)bShareLocalPort;
      return MCast_Set(m_pObj, PID_MCAST_SHARELOCALPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetTimeToLive() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_TIMETOLIVE, 0, 0);
      return (LONG)val;
    }
    inline INT SetTimeToLive(LONG lTimeToLive) {
      int val = (int)lTimeToLive;
      return MCast_Set(m_pObj, PID_MCAST_TIMETOLIVE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return MCast_Set(m_pObj, PID_MCAST_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return MCast_Set(m_pObj, PID_MCAST_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)MCast_Get(m_pObj, PID_MCAST_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MCast_Do(m_pObj, MID_MCAST_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Send(LPSTR lpText, UINT lenText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpText, NULL};
      UINT cbparam[1+1] = {lenText, (UINT)NULL};
      return MCast_Do(m_pObj, MID_MCAST_SEND, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class MCast : public MCastA {
  
  public:
    MCast(LPCSTR lpOemKey = IPWORKS_OEMKEY_26):MCastA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDataToSend;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMulticastGroup;
    MCFStringRef tmpReceiveInterface;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpSendInterface;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(MCastA::GetLastError());
    }

    // CFString versions of properties



    inline INT SetDataToSend(CFStringRef strDataToSend) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDataToSend);
      return MCastA::SetDataToSend(lp, tmp.Length());
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(MCastA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return MCastA::SetLocalHost(tmp.Deref(strLocalHost));
    }



    inline CFStringRef GetMulticastGroup() {
      return tmpMulticastGroup.Set(MCastA::GetMulticastGroup());
    }

    inline INT SetMulticastGroup(CFStringRef strMulticastGroup) {
      MCFStringAcc tmp;
      return MCastA::SetMulticastGroup(tmp.Deref(strMulticastGroup));
    }


    inline CFStringRef GetReceiveInterface() {
      return tmpReceiveInterface.Set(MCastA::GetReceiveInterface());
    }

    inline INT SetReceiveInterface(CFStringRef strReceiveInterface) {
      MCFStringAcc tmp;
      return MCastA::SetReceiveInterface(tmp.Deref(strReceiveInterface));
    }
    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(MCastA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return MCastA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }

    inline CFStringRef GetSendInterface() {
      return tmpSendInterface.Set(MCastA::GetSendInterface());
    }

    inline INT SetSendInterface(CFStringRef strSendInterface) {
      MCFStringAcc tmp;
      return MCastA::SetSendInterface(tmp.Deref(strSendInterface));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(MCastA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(MCastA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return MCastA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(MCastA::GetWinsockStatus());
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
      return MCastA::Send(lpText, lenText);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDataToSend;
    MUString tmpLocalHost;
    MUString tmpMulticastGroup;
    MUString tmpReceiveInterface;
    MUString tmpRemoteHost;
    MUString tmpSendInterface;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(MCastA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties



    inline INT SetDataToSend(LPWSTR lpDataToSend, UINT lenDataToSend) {
      MAString tmp(lpDataToSend, lenDataToSend);
      return MCastA::SetDataToSend(tmp.Deref(), tmp.Length());
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(MCastA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return MCastA::SetLocalHost(tmp.Deref());
    }



    inline LPWSTR GetMulticastGroup() {
      tmpMulticastGroup.Set(MCastA::GetMulticastGroup());
      return tmpMulticastGroup.Deref();
    }

    inline INT SetMulticastGroup(LPWSTR lpszMulticastGroup) {
      MAString tmp(lpszMulticastGroup);
      return MCastA::SetMulticastGroup(tmp.Deref());
    }


    inline LPWSTR GetReceiveInterface() {
      tmpReceiveInterface.Set(MCastA::GetReceiveInterface());
      return tmpReceiveInterface.Deref();
    }

    inline INT SetReceiveInterface(LPWSTR lpszReceiveInterface) {
      MAString tmp(lpszReceiveInterface);
      return MCastA::SetReceiveInterface(tmp.Deref());
    }
    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(MCastA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return MCastA::SetRemoteHost(tmp.Deref());
    }

    inline LPWSTR GetSendInterface() {
      tmpSendInterface.Set(MCastA::GetSendInterface());
      return tmpSendInterface.Deref();
    }

    inline INT SetSendInterface(LPWSTR lpszSendInterface) {
      MAString tmp(lpszSendInterface);
      return MCastA::SetSendInterface(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(MCastA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(MCastA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return MCastA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(MCastA::GetWinsockStatus());
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

#endif //_IPWORKS_MCAST_H_




