/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_ICMPPORT_H_
#define _IPWORKS_ICMPPORT_H_

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

#define PID_ICMPPORT_ACCEPTDATA    1
#define PID_ICMPPORT_ACTIVE    2
#define PID_ICMPPORT_DATATOSEND    3
#define PID_ICMPPORT_DONTROUTE    4
#define PID_ICMPPORT_INBUFFERSIZE    5
#define PID_ICMPPORT_LOCALHOST    6
#define PID_ICMPPORT_MAXMESSAGESIZE    7
#define PID_ICMPPORT_MESSAGESUBTYPE    8
#define PID_ICMPPORT_MESSAGETYPE    9
#define PID_ICMPPORT_OUTBUFFERSIZE    10
#define PID_ICMPPORT_QOSFLAGS    11
#define PID_ICMPPORT_REMOTEHOST    12
#define PID_ICMPPORT_SOCKETHANDLE    13
#define PID_ICMPPORT_TIMETOLIVE    14
#define PID_ICMPPORT_USECONNECTION    15
#define PID_ICMPPORT_WINSOCKINFO    16
#define PID_ICMPPORT_WINSOCKLOADED    17
#define PID_ICMPPORT_WINSOCKMAXDATAGRAMSIZE    18
#define PID_ICMPPORT_WINSOCKMAXSOCKETS    19
#define PID_ICMPPORT_WINSOCKPATH    20
#define PID_ICMPPORT_WINSOCKSTATUS    21


#define MID_ICMPPORT_DOEVENTS    1
#define MID_ICMPPORT_SEND    2


#define EID_ICMPPORT_DATAIN    1
#define EID_ICMPPORT_ERROR    2
#define EID_ICMPPORT_READYTOSEND    3


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID ICMPPort_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    ICMPPort_Destroy(LPVOID lpObj);
CNX_IMPORT INT    ICMPPort_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID ICMPPort_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    ICMPPort_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    ICMPPort_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  ICMPPort_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    ICMPPort_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   ICMPPort_StaticInit(LPVOID hInst);

class ICMPPortA {
  
  public: //events
  
    virtual INT FireDataIn(USHORT &usMessageType, USHORT &usMessageSubType, LPSTR &lpMessageData, USHORT &lenMessageData, USHORT &usChecksum, LPSTR &lpszSourceAddress) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireReadyToSend() {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_ICMPPORT_DATAIN: {
                        USHORT pMessageType = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pMessageSubType = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessageData = (LPSTR)(INT)(*param++);
            
                        USHORT lenMessageData = (USHORT)(*cbparam++);
            
                        USHORT pChecksum = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((ICMPPortA*)lpObj)->FireDataIn(pMessageType, pMessageSubType, pMessageData, lenMessageData, pChecksum, pSourceAddress);
         }
         case EID_ICMPPORT_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((ICMPPortA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_ICMPPORT_READYTOSEND: {
            
            return ((ICMPPortA*)lpObj)->FireReadyToSend();
         }

      }
      return 0;
    }

  public:

    ICMPPortA(LPCSTR lpOemKey = IPWORKS_OEMKEY_16) {
      m_pObj = ICMPPort_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~ICMPPortA() {
      ICMPPort_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)ICMPPort_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return ICMPPort_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)ICMPPort_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return ICMPPort_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline BOOL GetActive() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_ACTIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetActive(BOOL bActive) {
      int val = (int)bActive;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_ACTIVE, 0, (LPVOID)val, 0);
    }

    inline INT SetDataToSend(LPCSTR lpDataToSend, UINT lenDataToSend) {
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_DATATOSEND, 0, (LPVOID)lpDataToSend, lenDataToSend);
    }

    inline BOOL GetDontRoute() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_DONTROUTE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetDontRoute(BOOL bDontRoute) {
      int val = (int)bDontRoute;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_DONTROUTE, 0, (LPVOID)val, 0);
    }
    inline LONG GetInBufferSize() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_INBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetInBufferSize(LONG lInBufferSize) {
      int val = (int)lInBufferSize;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_INBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxMessageSize() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_MAXMESSAGESIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxMessageSize(LONG lMaxMessageSize) {
      int val = (int)lMaxMessageSize;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_MAXMESSAGESIZE, 0, (LPVOID)val, 0);
    }
    inline INT GetMessageSubType() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_MESSAGESUBTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetMessageSubType(INT iMessageSubType) {
      int val = (int)iMessageSubType;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_MESSAGESUBTYPE, 0, (LPVOID)val, 0);
    }
    inline INT GetMessageType() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_MESSAGETYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetMessageType(INT iMessageType) {
      int val = (int)iMessageType;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_MESSAGETYPE, 0, (LPVOID)val, 0);
    }
    inline LONG GetOutBufferSize() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_OUTBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetOutBufferSize(LONG lOutBufferSize) {
      int val = (int)lOutBufferSize;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_OUTBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline USHORT GetQOSFlags() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_QOSFLAGS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetQOSFlags(USHORT usQOSFlags) {
      int val = (int)usQOSFlags;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_QOSFLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline USHORT GetTimeToLive() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_TIMETOLIVE, 0, 0);
      return (USHORT)val;
    }
    inline INT SetTimeToLive(USHORT usTimeToLive) {
      int val = (int)usTimeToLive;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_TIMETOLIVE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetUseConnection() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_USECONNECTION, 0, 0);
      return (BOOL)val;
    }
    inline INT SetUseConnection(BOOL bUseConnection) {
      int val = (int)bUseConnection;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_USECONNECTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return ICMPPort_Set(m_pObj, PID_ICMPPORT_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)ICMPPort_Get(m_pObj, PID_ICMPPORT_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return ICMPPort_Do(m_pObj, MID_ICMPPORT_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Send(LPSTR lpText, UINT lenText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpText, NULL};
      UINT cbparam[1+1] = {lenText, (UINT)NULL};
      return ICMPPort_Do(m_pObj, MID_ICMPPORT_SEND, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class ICMPPort : public ICMPPortA {
  
  public:
    ICMPPort(LPCSTR lpOemKey = IPWORKS_OEMKEY_16):ICMPPortA(lpOemKey) {}

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
      return tmpLastError.Set(ICMPPortA::GetLastError());
    }

    // CFString versions of properties



    inline INT SetDataToSend(CFStringRef strDataToSend) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDataToSend);
      return ICMPPortA::SetDataToSend(lp, tmp.Length());
    }


    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(ICMPPortA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return ICMPPortA::SetLocalHost(tmp.Deref(strLocalHost));
    }





    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(ICMPPortA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return ICMPPortA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(ICMPPortA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(ICMPPortA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return ICMPPortA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(ICMPPortA::GetWinsockStatus());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireDataIn(USHORT &usMessageType, USHORT &usMessageSubType, LPSTR &lpMessageData, USHORT &lenMessageData, USHORT &usChecksum, LPSTR &lpszSourceAddress) {
      MCFStringRef etmpMessageData(lpMessageData, lenMessageData);
      CFStringRef uval_lpMessageData = etmpMessageData.Deref();      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireDataIn(usMessageType, usMessageSubType, uval_lpMessageData, lenMessageData, usChecksum, uval_lpszSourceAddress);
    }
    virtual INT FireDataIn(USHORT &usMessageType, USHORT &usMessageSubType, CFStringRef &lpMessageData, USHORT &lenMessageData, USHORT &usChecksum, CFStringRef &lpszSourceAddress) {
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
      return ICMPPortA::Send(lpText, lenText);
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
      tmpLastError.Set(ICMPPortA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties



    inline INT SetDataToSend(LPWSTR lpDataToSend, UINT lenDataToSend) {
      MAString tmp(lpDataToSend, lenDataToSend);
      return ICMPPortA::SetDataToSend(tmp.Deref(), tmp.Length());
    }


    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(ICMPPortA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return ICMPPortA::SetLocalHost(tmp.Deref());
    }





    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(ICMPPortA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return ICMPPortA::SetRemoteHost(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(ICMPPortA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(ICMPPortA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return ICMPPortA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(ICMPPortA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireDataIn(USHORT &usMessageType, USHORT &usMessageSubType, LPSTR &lpMessageData, USHORT &lenMessageData, USHORT &usChecksum, LPSTR &lpszSourceAddress) {
      MUString etmpMessageData(lpMessageData, lenMessageData);
      LPWSTR uval_lpMessageData = etmpMessageData.Deref();      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireDataIn(usMessageType, usMessageSubType, uval_lpMessageData, lenMessageData, usChecksum, uval_lpszSourceAddress);
    }
    virtual INT FireDataIn(USHORT &usMessageType, USHORT &usMessageSubType, LPWSTR &lpMessageData, USHORT &lenMessageData, USHORT &usChecksum, LPWSTR &lpszSourceAddress) {
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

#endif //_IPWORKS_ICMPPORT_H_




