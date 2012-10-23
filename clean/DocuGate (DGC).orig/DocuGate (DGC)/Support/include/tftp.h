/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_TFTP_H_
#define _IPWORKS_TFTP_H_

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

#define tftpIdle                                           0
#define tftpGetFile                                        1
#define tftpPutFile                                        2


#define TFTP_IDLE                                          0
#define TFTP_GET_FILE                                      1
#define TFTP_PUT_FILE                                      2



#endif //_IPWORKS_INTERNAL_

#define PID_TFTP_ACTION    1
#define PID_TFTP_LOCALFILE    2
#define PID_TFTP_LOCALHOST    3
#define PID_TFTP_MAXRETRANSMITS    4
#define PID_TFTP_REMOTEFILE    5
#define PID_TFTP_RETRANSMITTIMEOUT    6
#define PID_TFTP_SOCKETHANDLE    7
#define PID_TFTP_TFTPPORT    8
#define PID_TFTP_TFTPSERVER    9
#define PID_TFTP_TIMEOUT    10
#define PID_TFTP_WINSOCKINFO    11
#define PID_TFTP_WINSOCKLOADED    12
#define PID_TFTP_WINSOCKMAXDATAGRAMSIZE    13
#define PID_TFTP_WINSOCKMAXSOCKETS    14
#define PID_TFTP_WINSOCKPATH    15
#define PID_TFTP_WINSOCKSTATUS    16


#define MID_TFTP_DOEVENTS    1
#define MID_TFTP_GETFILE    2
#define MID_TFTP_INTERRUPT    3
#define MID_TFTP_PUTFILE    4


#define EID_TFTP_ENDTRANSFER    1
#define EID_TFTP_ERROR    2
#define EID_TFTP_STARTTRANSFER    3
#define EID_TFTP_TRANSFER    4


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID TFTP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    TFTP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    TFTP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID TFTP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    TFTP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    TFTP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  TFTP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    TFTP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   TFTP_StaticInit(LPVOID hInst);

class TFTPA {
  
  public: //events
  
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_TFTP_ENDTRANSFER: {
            
            return ((TFTPA*)lpObj)->FireEndTransfer();
         }
         case EID_TFTP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((TFTPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_TFTP_STARTTRANSFER: {
            
            return ((TFTPA*)lpObj)->FireStartTransfer();
         }
         case EID_TFTP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((TFTPA*)lpObj)->FireTransfer(pBytesTransferred, pText, lenText);
         }

      }
      return 0;
    }

  public:

    TFTPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_46) {
      m_pObj = TFTP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~TFTPA() {
      TFTP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)TFTP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return TFTP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)TFTP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return TFTP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return TFTP_Set(m_pObj, PID_TFTP_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalFile() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return TFTP_Set(m_pObj, PID_TFTP_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return TFTP_Set(m_pObj, PID_TFTP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMaxRetransmits() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_MAXRETRANSMITS, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMaxRetransmits(USHORT usMaxRetransmits) {
      int val = (int)usMaxRetransmits;
      return TFTP_Set(m_pObj, PID_TFTP_MAXRETRANSMITS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteFile() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_REMOTEFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteFile(LPCSTR lpszRemoteFile) {
      int val = (int)lpszRemoteFile;
      return TFTP_Set(m_pObj, PID_TFTP_REMOTEFILE, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRetransmitTimeout() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_RETRANSMITTIMEOUT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRetransmitTimeout(USHORT usRetransmitTimeout) {
      int val = (int)usRetransmitTimeout;
      return TFTP_Set(m_pObj, PID_TFTP_RETRANSMITTIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline USHORT GetTFTPPort() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_TFTPPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetTFTPPort(USHORT usTFTPPort) {
      int val = (int)usTFTPPort;
      return TFTP_Set(m_pObj, PID_TFTP_TFTPPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetTFTPServer() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_TFTPSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetTFTPServer(LPCSTR lpszTFTPServer) {
      int val = (int)lpszTFTPServer;
      return TFTP_Set(m_pObj, PID_TFTP_TFTPSERVER, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return TFTP_Set(m_pObj, PID_TFTP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return TFTP_Set(m_pObj, PID_TFTP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return TFTP_Set(m_pObj, PID_TFTP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)TFTP_Get(m_pObj, PID_TFTP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return TFTP_Do(m_pObj, MID_TFTP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int GetFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return TFTP_Do(m_pObj, MID_TFTP_GETFILE, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return TFTP_Do(m_pObj, MID_TFTP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int PutFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return TFTP_Do(m_pObj, MID_TFTP_PUTFILE, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class TFTP : public TFTPA {
  
  public:
    TFTP(LPCSTR lpOemKey = IPWORKS_OEMKEY_46):TFTPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpLocalFile;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpRemoteFile;
    MCFStringRef tmpTFTPServer;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(TFTPA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(TFTPA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return TFTPA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(TFTPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return TFTPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetRemoteFile() {
      return tmpRemoteFile.Set(TFTPA::GetRemoteFile());
    }

    inline INT SetRemoteFile(CFStringRef strRemoteFile) {
      MCFStringAcc tmp;
      return TFTPA::SetRemoteFile(tmp.Deref(strRemoteFile));
    }



    inline CFStringRef GetTFTPServer() {
      return tmpTFTPServer.Set(TFTPA::GetTFTPServer());
    }

    inline INT SetTFTPServer(CFStringRef strTFTPServer) {
      MCFStringAcc tmp;
      return TFTPA::SetTFTPServer(tmp.Deref(strTFTPServer));
    }

    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(TFTPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(TFTPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return TFTPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(TFTPA::GetWinsockStatus());
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



    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireTransfer(lBytesTransferred, uval_lpText, lenText);
    }
    virtual INT FireTransfer(LONG &lBytesTransferred, CFStringRef &lpText, USHORT &lenText) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters











#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpLocalFile;
    MUString tmpLocalHost;
    MUString tmpRemoteFile;
    MUString tmpTFTPServer;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(TFTPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(TFTPA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return TFTPA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(TFTPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return TFTPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetRemoteFile() {
      tmpRemoteFile.Set(TFTPA::GetRemoteFile());
      return tmpRemoteFile.Deref();
    }

    inline INT SetRemoteFile(LPWSTR lpszRemoteFile) {
      MAString tmp(lpszRemoteFile);
      return TFTPA::SetRemoteFile(tmp.Deref());
    }



    inline LPWSTR GetTFTPServer() {
      tmpTFTPServer.Set(TFTPA::GetTFTPServer());
      return tmpTFTPServer.Deref();
    }

    inline INT SetTFTPServer(LPWSTR lpszTFTPServer) {
      MAString tmp(lpszTFTPServer);
      return TFTPA::SetTFTPServer(tmp.Deref());
    }

    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(TFTPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(TFTPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return TFTPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(TFTPA::GetWinsockStatus());
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



    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireTransfer(lBytesTransferred, uval_lpText, lenText);
    }
    virtual INT FireTransfer(LONG &lBytesTransferred, LPWSTR &lpText, USHORT &lenText) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_TFTP_H_




