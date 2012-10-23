/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_WEBUPLOAD_H_
#define _IPWORKS_WEBUPLOAD_H_

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

#define webuploadIdle                                      0
#define webuploadUpload                                    1
#define webuploadReset                                     2

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define WEBUPLOAD_IDLE                                     0
#define WEBUPLOAD_UPLOAD                                   1
#define WEBUPLOAD_RESET                                    2

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_WEBUPLOAD_ACTION    1
#define PID_WEBUPLOAD_AUTHORIZATION    2
#define PID_WEBUPLOAD_CONNECTED    3
#define PID_WEBUPLOAD_COOKIECOUNT    4
#define PID_WEBUPLOAD_COOKIENAME    5
#define PID_WEBUPLOAD_COOKIEVALUE    6
#define PID_WEBUPLOAD_FILECOUNT    7
#define PID_WEBUPLOAD_FILENAMES    8
#define PID_WEBUPLOAD_FILEVARNAMES    9
#define PID_WEBUPLOAD_FIREWALLDATA    10
#define PID_WEBUPLOAD_FIREWALLHOST    11
#define PID_WEBUPLOAD_FIREWALLPASSWORD    12
#define PID_WEBUPLOAD_FIREWALLPORT    13
#define PID_WEBUPLOAD_FIREWALLTYPE    14
#define PID_WEBUPLOAD_FIREWALLUSER    15
#define PID_WEBUPLOAD_FORMVARCOUNT    16
#define PID_WEBUPLOAD_FORMVARNAMES    17
#define PID_WEBUPLOAD_FORMVARVALUES    18
#define PID_WEBUPLOAD_FROM    19
#define PID_WEBUPLOAD_LOCALHOST    20
#define PID_WEBUPLOAD_MAXTRANSFERREDDATA    21
#define PID_WEBUPLOAD_OTHERHEADERS    22
#define PID_WEBUPLOAD_PASSWORD    23
#define PID_WEBUPLOAD_PROXYAUTHORIZATION    24
#define PID_WEBUPLOAD_PROXYPASSWORD    25
#define PID_WEBUPLOAD_PROXYPORT    26
#define PID_WEBUPLOAD_PROXYSERVER    27
#define PID_WEBUPLOAD_PROXYUSER    28
#define PID_WEBUPLOAD_REFERER    29
#define PID_WEBUPLOAD_SOCKETHANDLE    30
#define PID_WEBUPLOAD_STATUSLINE    31
#define PID_WEBUPLOAD_TIMEOUT    32
#define PID_WEBUPLOAD_TRANSFERREDDATA    33
#define PID_WEBUPLOAD_TRANSFERREDHEADERS    34
#define PID_WEBUPLOAD_URL    35
#define PID_WEBUPLOAD_USER    36
#define PID_WEBUPLOAD_USERAGENT    37
#define PID_WEBUPLOAD_WINSOCKINFO    38
#define PID_WEBUPLOAD_WINSOCKLOADED    39
#define PID_WEBUPLOAD_WINSOCKMAXDATAGRAMSIZE    40
#define PID_WEBUPLOAD_WINSOCKMAXSOCKETS    41
#define PID_WEBUPLOAD_WINSOCKPATH    42
#define PID_WEBUPLOAD_WINSOCKSTATUS    43


#define MID_WEBUPLOAD_ADDCOOKIE    1
#define MID_WEBUPLOAD_ADDFILEVAR    2
#define MID_WEBUPLOAD_ADDFORMVAR    3
#define MID_WEBUPLOAD_DOEVENTS    4
#define MID_WEBUPLOAD_INTERRUPT    5
#define MID_WEBUPLOAD_RESET    6
#define MID_WEBUPLOAD_UPLOAD    7
#define MID_WEBUPLOAD_UPLOADTO    8


#define EID_WEBUPLOAD_CONNECTED    1
#define EID_WEBUPLOAD_DISCONNECTED    2
#define EID_WEBUPLOAD_ENDTRANSFER    3
#define EID_WEBUPLOAD_ERROR    4
#define EID_WEBUPLOAD_HEADER    5
#define EID_WEBUPLOAD_SETCOOKIE    6
#define EID_WEBUPLOAD_STARTTRANSFER    7
#define EID_WEBUPLOAD_TRANSFER    8
#define EID_WEBUPLOAD_UPLOADPROGRESS    9


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID WebUpload_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    WebUpload_Destroy(LPVOID lpObj);
CNX_IMPORT INT    WebUpload_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID WebUpload_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    WebUpload_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    WebUpload_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  WebUpload_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    WebUpload_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   WebUpload_StaticInit(LPVOID hInst);

class WebUploadA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {return 0;}
    virtual INT FireSetCookie(LPSTR &lpszName, LPSTR &lpszValue, LPSTR &lpszExpires, LPSTR &lpszDomain, LPSTR &lpszPath, BOOL &bSecure) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {return 0;}
    virtual INT FireUploadProgress(USHORT &usPercentDone) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_WEBUPLOAD_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebUploadA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_WEBUPLOAD_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebUploadA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_WEBUPLOAD_ENDTRANSFER: {
            
            return ((WebUploadA*)lpObj)->FireEndTransfer();
         }
         case EID_WEBUPLOAD_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebUploadA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_WEBUPLOAD_HEADER: {
                        LPSTR pField = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebUploadA*)lpObj)->FireHeader(pField, pValue);
         }
         case EID_WEBUPLOAD_SETCOOKIE: {
                        LPSTR pName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pExpires = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDomain = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pPath = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        BOOL pSecure = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebUploadA*)lpObj)->FireSetCookie(pName, pValue, pExpires, pDomain, pPath, pSecure);
         }
         case EID_WEBUPLOAD_STARTTRANSFER: {
            
            return ((WebUploadA*)lpObj)->FireStartTransfer();
         }
         case EID_WEBUPLOAD_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((WebUploadA*)lpObj)->FireTransfer(pBytesTransferred, pText, lenText);
         }
         case EID_WEBUPLOAD_UPLOADPROGRESS: {
                        USHORT pPercentDone = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebUploadA*)lpObj)->FireUploadProgress(pPercentDone);
         }

      }
      return 0;
    }

  public:

    WebUploadA(LPCSTR lpOemKey = IPWORKS_OEMKEY_51) {
      m_pObj = WebUpload_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~WebUploadA() {
      WebUpload_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)WebUpload_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return WebUpload_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)WebUpload_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return WebUpload_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAuthorization() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_AUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAuthorization(LPCSTR lpszAuthorization) {
      int val = (int)lpszAuthorization;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_AUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline INT GetCookieCount() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_COOKIECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetCookieCount(INT iCookieCount) {
      int val = (int)iCookieCount;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_COOKIECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieName(USHORT usCookieIndex) {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_COOKIENAME, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieName(USHORT usCookieIndex, LPCSTR lpszCookieName) {
      int val = (int)lpszCookieName;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_COOKIENAME, usCookieIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieValue(USHORT usCookieIndex) {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_COOKIEVALUE, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieValue(USHORT usCookieIndex, LPCSTR lpszCookieValue) {
      int val = (int)lpszCookieValue;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_COOKIEVALUE, usCookieIndex, (LPVOID)val, 0);
    }
    inline INT GetFileCount() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FILECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetFileCount(INT iFileCount) {
      int val = (int)iFileCount;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FILECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFileNames(USHORT usFileIndex) {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FILENAMES, usFileIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetFileNames(USHORT usFileIndex, LPCSTR lpszFileNames) {
      int val = (int)lpszFileNames;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FILENAMES, usFileIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetFileVarNames(USHORT usFileIndex) {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FILEVARNAMES, usFileIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetFileVarNames(USHORT usFileIndex, LPCSTR lpszFileVarNames) {
      int val = (int)lpszFileVarNames;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FILEVARNAMES, usFileIndex, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline INT GetFormVarCount() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FORMVARCOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetFormVarCount(INT iFormVarCount) {
      int val = (int)iFormVarCount;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FORMVARCOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFormVarNames(USHORT usVarIndex) {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FORMVARNAMES, usVarIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetFormVarNames(USHORT usVarIndex, LPCSTR lpszFormVarNames) {
      int val = (int)lpszFormVarNames;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FORMVARNAMES, usVarIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetFormVarValues(USHORT usVarIndex) {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FORMVARVALUES, usVarIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetFormVarValues(USHORT usVarIndex, LPCSTR lpszFormVarValues) {
      int val = (int)lpszFormVarValues;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FORMVARVALUES, usVarIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetFrom() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_FROM, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxTransferredData() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_MAXTRANSFERREDDATA, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxTransferredData(LONG lMaxTransferredData) {
      int val = (int)lMaxTransferredData;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_MAXTRANSFERREDDATA, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyAuthorization() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_PROXYAUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyAuthorization(LPCSTR lpszProxyAuthorization) {
      int val = (int)lpszProxyAuthorization;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_PROXYAUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyPassword() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_PROXYPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyPassword(LPCSTR lpszProxyPassword) {
      int val = (int)lpszProxyPassword;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_PROXYPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetProxyPort() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_PROXYPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetProxyPort(USHORT usProxyPort) {
      int val = (int)usProxyPort;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_PROXYPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyServer() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_PROXYSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyServer(LPCSTR lpszProxyServer) {
      int val = (int)lpszProxyServer;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_PROXYSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyUser() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_PROXYUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyUser(LPCSTR lpszProxyUser) {
      int val = (int)lpszProxyUser;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_PROXYUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReferer() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_REFERER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReferer(LPCSTR lpszReferer) {
      int val = (int)lpszReferer;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_REFERER, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetStatusLine() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_STATUSLINE, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetTimeout() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline INT GetTransferredData(LPCSTR &lpTransferredData, UINT &lenTransferredData) {
      lpTransferredData = (LPSTR)WebUpload_Get(m_pObj, PID_WEBUPLOAD_TRANSFERREDDATA, 0, &lenTransferredData);
      if ( ! lpTransferredData) return lenTransferredData;
      return 0;
    }


    inline LPCSTR GetTransferredHeaders() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_TRANSFERREDHEADERS, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetURL() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_URL, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURL(LPCSTR lpszURL) {
      int val = (int)lpszURL;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_URL, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUserAgent() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_USERAGENT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUserAgent(LPCSTR lpszUserAgent) {
      int val = (int)lpszUserAgent;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_USERAGENT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return WebUpload_Set(m_pObj, PID_WEBUPLOAD_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)WebUpload_Get(m_pObj, PID_WEBUPLOAD_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int AddCookie(LPSTR lpszCookieName, LPSTR lpszCookieValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszCookieName, (LPVOID)(INT)lpszCookieValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_ADDCOOKIE, 2, param, cbparam);
      
      
    }
    inline int AddFileVar(LPSTR lpszFileVar, LPSTR lpszFileName) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszFileVar, (LPVOID)(INT)lpszFileName, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_ADDFILEVAR, 2, param, cbparam);
      
      
    }
    inline int AddFormVar(LPSTR lpszVarName, LPSTR lpszVarValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszVarName, (LPVOID)(INT)lpszVarValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_ADDFORMVAR, 2, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_RESET, 0, param, cbparam);
      
      
    }
    inline int Upload() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_UPLOAD, 0, param, cbparam);
      
      
    }
    inline int UploadTo(LPSTR lpszURL) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszURL, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return WebUpload_Do(m_pObj, MID_WEBUPLOAD_UPLOADTO, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class WebUpload : public WebUploadA {
  
  public:
    WebUpload(LPCSTR lpOemKey = IPWORKS_OEMKEY_51):WebUploadA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAuthorization;
    MCFStringRef tmpCookieName;
    MCFStringRef tmpCookieValue;
    MCFStringRef tmpFileNames;
    MCFStringRef tmpFileVarNames;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFormVarNames;
    MCFStringRef tmpFormVarValues;
    MCFStringRef tmpFrom;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpOtherHeaders;
    MCFStringRef tmpPassword;
    MCFStringRef tmpProxyAuthorization;
    MCFStringRef tmpProxyPassword;
    MCFStringRef tmpProxyServer;
    MCFStringRef tmpProxyUser;
    MCFStringRef tmpReferer;
    MCFStringRef tmpStatusLine;
    MCFStringRef tmpTransferredData;
    MCFStringRef tmpTransferredHeaders;
    MCFStringRef tmpURL;
    MCFStringRef tmpUser;
    MCFStringRef tmpUserAgent;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(WebUploadA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetAuthorization() {
      return tmpAuthorization.Set(WebUploadA::GetAuthorization());
    }

    inline INT SetAuthorization(CFStringRef strAuthorization) {
      MCFStringAcc tmp;
      return WebUploadA::SetAuthorization(tmp.Deref(strAuthorization));
    }


    inline CFStringRef GetCookieName(USHORT usCookieIndex) {
      return tmpCookieName.Set(WebUploadA::GetCookieName(usCookieIndex));
    }

    inline INT SetCookieName(USHORT usCookieIndex, CFStringRef strCookieName) {
      MCFStringAcc tmp;
      return WebUploadA::SetCookieName(usCookieIndex, tmp.Deref(strCookieName));
    }
    inline CFStringRef GetCookieValue(USHORT usCookieIndex) {
      return tmpCookieValue.Set(WebUploadA::GetCookieValue(usCookieIndex));
    }

    inline INT SetCookieValue(USHORT usCookieIndex, CFStringRef strCookieValue) {
      MCFStringAcc tmp;
      return WebUploadA::SetCookieValue(usCookieIndex, tmp.Deref(strCookieValue));
    }

    inline CFStringRef GetFileNames(USHORT usFileIndex) {
      return tmpFileNames.Set(WebUploadA::GetFileNames(usFileIndex));
    }

    inline INT SetFileNames(USHORT usFileIndex, CFStringRef strFileNames) {
      MCFStringAcc tmp;
      return WebUploadA::SetFileNames(usFileIndex, tmp.Deref(strFileNames));
    }
    inline CFStringRef GetFileVarNames(USHORT usFileIndex) {
      return tmpFileVarNames.Set(WebUploadA::GetFileVarNames(usFileIndex));
    }

    inline INT SetFileVarNames(USHORT usFileIndex, CFStringRef strFileVarNames) {
      MCFStringAcc tmp;
      return WebUploadA::SetFileVarNames(usFileIndex, tmp.Deref(strFileVarNames));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = WebUploadA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return WebUploadA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(WebUploadA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return WebUploadA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(WebUploadA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return WebUploadA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(WebUploadA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return WebUploadA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }

    inline CFStringRef GetFormVarNames(USHORT usVarIndex) {
      return tmpFormVarNames.Set(WebUploadA::GetFormVarNames(usVarIndex));
    }

    inline INT SetFormVarNames(USHORT usVarIndex, CFStringRef strFormVarNames) {
      MCFStringAcc tmp;
      return WebUploadA::SetFormVarNames(usVarIndex, tmp.Deref(strFormVarNames));
    }
    inline CFStringRef GetFormVarValues(USHORT usVarIndex) {
      return tmpFormVarValues.Set(WebUploadA::GetFormVarValues(usVarIndex));
    }

    inline INT SetFormVarValues(USHORT usVarIndex, CFStringRef strFormVarValues) {
      MCFStringAcc tmp;
      return WebUploadA::SetFormVarValues(usVarIndex, tmp.Deref(strFormVarValues));
    }
    inline CFStringRef GetFrom() {
      return tmpFrom.Set(WebUploadA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return WebUploadA::SetFrom(tmp.Deref(strFrom));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(WebUploadA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return WebUploadA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(WebUploadA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return WebUploadA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(WebUploadA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return WebUploadA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetProxyAuthorization() {
      return tmpProxyAuthorization.Set(WebUploadA::GetProxyAuthorization());
    }

    inline INT SetProxyAuthorization(CFStringRef strProxyAuthorization) {
      MCFStringAcc tmp;
      return WebUploadA::SetProxyAuthorization(tmp.Deref(strProxyAuthorization));
    }
    inline CFStringRef GetProxyPassword() {
      return tmpProxyPassword.Set(WebUploadA::GetProxyPassword());
    }

    inline INT SetProxyPassword(CFStringRef strProxyPassword) {
      MCFStringAcc tmp;
      return WebUploadA::SetProxyPassword(tmp.Deref(strProxyPassword));
    }

    inline CFStringRef GetProxyServer() {
      return tmpProxyServer.Set(WebUploadA::GetProxyServer());
    }

    inline INT SetProxyServer(CFStringRef strProxyServer) {
      MCFStringAcc tmp;
      return WebUploadA::SetProxyServer(tmp.Deref(strProxyServer));
    }
    inline CFStringRef GetProxyUser() {
      return tmpProxyUser.Set(WebUploadA::GetProxyUser());
    }

    inline INT SetProxyUser(CFStringRef strProxyUser) {
      MCFStringAcc tmp;
      return WebUploadA::SetProxyUser(tmp.Deref(strProxyUser));
    }
    inline CFStringRef GetReferer() {
      return tmpReferer.Set(WebUploadA::GetReferer());
    }

    inline INT SetReferer(CFStringRef strReferer) {
      MCFStringAcc tmp;
      return WebUploadA::SetReferer(tmp.Deref(strReferer));
    }

    inline CFStringRef GetStatusLine() {
      return tmpStatusLine.Set(WebUploadA::GetStatusLine());
    }


    inline CFStringRef GetTransferredData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = WebUploadA::GetTransferredData(tmp, len);
      if (ret_code) return NULL;
      return tmpTransferredData.Set(tmp, len);
    }

    inline CFStringRef GetTransferredHeaders() {
      return tmpTransferredHeaders.Set(WebUploadA::GetTransferredHeaders());
    }

    inline CFStringRef GetURL() {
      return tmpURL.Set(WebUploadA::GetURL());
    }

    inline INT SetURL(CFStringRef strURL) {
      MCFStringAcc tmp;
      return WebUploadA::SetURL(tmp.Deref(strURL));
    }
    inline CFStringRef GetUser() {
      return tmpUser.Set(WebUploadA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return WebUploadA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetUserAgent() {
      return tmpUserAgent.Set(WebUploadA::GetUserAgent());
    }

    inline INT SetUserAgent(CFStringRef strUserAgent) {
      MCFStringAcc tmp;
      return WebUploadA::SetUserAgent(tmp.Deref(strUserAgent));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(WebUploadA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(WebUploadA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return WebUploadA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(WebUploadA::GetWinsockStatus());
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

    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {
      MCFStringRef etmpField(lpszField);
      CFStringRef uval_lpszField = etmpField.Deref();
      MCFStringRef etmpValue(lpszValue);
      CFStringRef uval_lpszValue = etmpValue.Deref();

      return FireHeader(uval_lpszField, uval_lpszValue);
    }
    virtual INT FireHeader(CFStringRef &lpszField, CFStringRef &lpszValue) {
      return 0;
    }

    virtual INT FireSetCookie(LPSTR &lpszName, LPSTR &lpszValue, LPSTR &lpszExpires, LPSTR &lpszDomain, LPSTR &lpszPath, BOOL &bSecure) {
      MCFStringRef etmpName(lpszName);
      CFStringRef uval_lpszName = etmpName.Deref();
      MCFStringRef etmpValue(lpszValue);
      CFStringRef uval_lpszValue = etmpValue.Deref();
      MCFStringRef etmpExpires(lpszExpires);
      CFStringRef uval_lpszExpires = etmpExpires.Deref();
      MCFStringRef etmpDomain(lpszDomain);
      CFStringRef uval_lpszDomain = etmpDomain.Deref();
      MCFStringRef etmpPath(lpszPath);
      CFStringRef uval_lpszPath = etmpPath.Deref();

      return FireSetCookie(uval_lpszName, uval_lpszValue, uval_lpszExpires, uval_lpszDomain, uval_lpszPath, bSecure);
    }
    virtual INT FireSetCookie(CFStringRef &lpszName, CFStringRef &lpszValue, CFStringRef &lpszExpires, CFStringRef &lpszDomain, CFStringRef &lpszPath, BOOL &bSecure) {
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

    inline int AddCookie(CFStringRef pCookieName, CFStringRef pCookieValue) {
      MCFStringAcc etmpCookieName;
      LPSTR lpszCookieName = etmpCookieName.Deref(pCookieName);
      MCFStringAcc etmpCookieValue;
      LPSTR lpszCookieValue = etmpCookieValue.Deref(pCookieValue);

      return WebUploadA::AddCookie(lpszCookieName, lpszCookieValue);
    }

    inline int AddFileVar(CFStringRef pFileVar, CFStringRef pFileName) {
      MCFStringAcc etmpFileVar;
      LPSTR lpszFileVar = etmpFileVar.Deref(pFileVar);
      MCFStringAcc etmpFileName;
      LPSTR lpszFileName = etmpFileName.Deref(pFileName);

      return WebUploadA::AddFileVar(lpszFileVar, lpszFileName);
    }

    inline int AddFormVar(CFStringRef pVarName, CFStringRef pVarValue) {
      MCFStringAcc etmpVarName;
      LPSTR lpszVarName = etmpVarName.Deref(pVarName);
      MCFStringAcc etmpVarValue;
      LPSTR lpszVarValue = etmpVarValue.Deref(pVarValue);

      return WebUploadA::AddFormVar(lpszVarName, lpszVarValue);
    }









    inline int UploadTo(CFStringRef pURL) {
      MCFStringAcc etmpURL;
      LPSTR lpszURL = etmpURL.Deref(pURL);

      return WebUploadA::UploadTo(lpszURL);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAuthorization;
    MUString tmpCookieName;
    MUString tmpCookieValue;
    MUString tmpFileNames;
    MUString tmpFileVarNames;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFormVarNames;
    MUString tmpFormVarValues;
    MUString tmpFrom;
    MUString tmpLocalHost;
    MUString tmpOtherHeaders;
    MUString tmpPassword;
    MUString tmpProxyAuthorization;
    MUString tmpProxyPassword;
    MUString tmpProxyServer;
    MUString tmpProxyUser;
    MUString tmpReferer;
    MUString tmpStatusLine;
    MUString tmpTransferredData;
    MUString tmpTransferredHeaders;
    MUString tmpURL;
    MUString tmpUser;
    MUString tmpUserAgent;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(WebUploadA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetAuthorization() {
      tmpAuthorization.Set(WebUploadA::GetAuthorization());
      return tmpAuthorization.Deref();
    }

    inline INT SetAuthorization(LPWSTR lpszAuthorization) {
      MAString tmp(lpszAuthorization);
      return WebUploadA::SetAuthorization(tmp.Deref());
    }


    inline LPWSTR GetCookieName(USHORT usCookieIndex) {
      tmpCookieName.Set(WebUploadA::GetCookieName(usCookieIndex));
      return tmpCookieName.Deref();
    }

    inline INT SetCookieName(USHORT usCookieIndex, LPWSTR lpszCookieName) {
      MAString tmp(lpszCookieName);
      return WebUploadA::SetCookieName(usCookieIndex, tmp.Deref());
    }
    inline LPWSTR GetCookieValue(USHORT usCookieIndex) {
      tmpCookieValue.Set(WebUploadA::GetCookieValue(usCookieIndex));
      return tmpCookieValue.Deref();
    }

    inline INT SetCookieValue(USHORT usCookieIndex, LPWSTR lpszCookieValue) {
      MAString tmp(lpszCookieValue);
      return WebUploadA::SetCookieValue(usCookieIndex, tmp.Deref());
    }

    inline LPWSTR GetFileNames(USHORT usFileIndex) {
      tmpFileNames.Set(WebUploadA::GetFileNames(usFileIndex));
      return tmpFileNames.Deref();
    }

    inline INT SetFileNames(USHORT usFileIndex, LPWSTR lpszFileNames) {
      MAString tmp(lpszFileNames);
      return WebUploadA::SetFileNames(usFileIndex, tmp.Deref());
    }
    inline LPWSTR GetFileVarNames(USHORT usFileIndex) {
      tmpFileVarNames.Set(WebUploadA::GetFileVarNames(usFileIndex));
      return tmpFileVarNames.Deref();
    }

    inline INT SetFileVarNames(USHORT usFileIndex, LPWSTR lpszFileVarNames) {
      MAString tmp(lpszFileVarNames);
      return WebUploadA::SetFileVarNames(usFileIndex, tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = WebUploadA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return WebUploadA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(WebUploadA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return WebUploadA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(WebUploadA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return WebUploadA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(WebUploadA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return WebUploadA::SetFirewallUser(tmp.Deref());
    }

    inline LPWSTR GetFormVarNames(USHORT usVarIndex) {
      tmpFormVarNames.Set(WebUploadA::GetFormVarNames(usVarIndex));
      return tmpFormVarNames.Deref();
    }

    inline INT SetFormVarNames(USHORT usVarIndex, LPWSTR lpszFormVarNames) {
      MAString tmp(lpszFormVarNames);
      return WebUploadA::SetFormVarNames(usVarIndex, tmp.Deref());
    }
    inline LPWSTR GetFormVarValues(USHORT usVarIndex) {
      tmpFormVarValues.Set(WebUploadA::GetFormVarValues(usVarIndex));
      return tmpFormVarValues.Deref();
    }

    inline INT SetFormVarValues(USHORT usVarIndex, LPWSTR lpszFormVarValues) {
      MAString tmp(lpszFormVarValues);
      return WebUploadA::SetFormVarValues(usVarIndex, tmp.Deref());
    }
    inline LPWSTR GetFrom() {
      tmpFrom.Set(WebUploadA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return WebUploadA::SetFrom(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(WebUploadA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return WebUploadA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(WebUploadA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return WebUploadA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(WebUploadA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return WebUploadA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetProxyAuthorization() {
      tmpProxyAuthorization.Set(WebUploadA::GetProxyAuthorization());
      return tmpProxyAuthorization.Deref();
    }

    inline INT SetProxyAuthorization(LPWSTR lpszProxyAuthorization) {
      MAString tmp(lpszProxyAuthorization);
      return WebUploadA::SetProxyAuthorization(tmp.Deref());
    }
    inline LPWSTR GetProxyPassword() {
      tmpProxyPassword.Set(WebUploadA::GetProxyPassword());
      return tmpProxyPassword.Deref();
    }

    inline INT SetProxyPassword(LPWSTR lpszProxyPassword) {
      MAString tmp(lpszProxyPassword);
      return WebUploadA::SetProxyPassword(tmp.Deref());
    }

    inline LPWSTR GetProxyServer() {
      tmpProxyServer.Set(WebUploadA::GetProxyServer());
      return tmpProxyServer.Deref();
    }

    inline INT SetProxyServer(LPWSTR lpszProxyServer) {
      MAString tmp(lpszProxyServer);
      return WebUploadA::SetProxyServer(tmp.Deref());
    }
    inline LPWSTR GetProxyUser() {
      tmpProxyUser.Set(WebUploadA::GetProxyUser());
      return tmpProxyUser.Deref();
    }

    inline INT SetProxyUser(LPWSTR lpszProxyUser) {
      MAString tmp(lpszProxyUser);
      return WebUploadA::SetProxyUser(tmp.Deref());
    }
    inline LPWSTR GetReferer() {
      tmpReferer.Set(WebUploadA::GetReferer());
      return tmpReferer.Deref();
    }

    inline INT SetReferer(LPWSTR lpszReferer) {
      MAString tmp(lpszReferer);
      return WebUploadA::SetReferer(tmp.Deref());
    }

    inline LPWSTR GetStatusLine() {
      tmpStatusLine.Set(WebUploadA::GetStatusLine());
      return tmpStatusLine.Deref();
    }


    inline INT GetTransferredData(LPWSTR &lpTransferredData, UINT &lenTransferredData) {
      LPSTR tmp = NULL;
      INT ret_code = WebUploadA::GetTransferredData(tmp, lenTransferredData);
      if (ret_code) return ret_code;
      tmpTransferredData.Set(tmp, lenTransferredData);
      lpTransferredData = tmpTransferredData.Deref();
      return 0;
    }

    inline LPWSTR GetTransferredHeaders() {
      tmpTransferredHeaders.Set(WebUploadA::GetTransferredHeaders());
      return tmpTransferredHeaders.Deref();
    }

    inline LPWSTR GetURL() {
      tmpURL.Set(WebUploadA::GetURL());
      return tmpURL.Deref();
    }

    inline INT SetURL(LPWSTR lpszURL) {
      MAString tmp(lpszURL);
      return WebUploadA::SetURL(tmp.Deref());
    }
    inline LPWSTR GetUser() {
      tmpUser.Set(WebUploadA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return WebUploadA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetUserAgent() {
      tmpUserAgent.Set(WebUploadA::GetUserAgent());
      return tmpUserAgent.Deref();
    }

    inline INT SetUserAgent(LPWSTR lpszUserAgent) {
      MAString tmp(lpszUserAgent);
      return WebUploadA::SetUserAgent(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(WebUploadA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(WebUploadA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return WebUploadA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(WebUploadA::GetWinsockStatus());
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

    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {
      MUString etmpField(lpszField);
      LPWSTR uval_lpszField = etmpField.Deref();
      MUString etmpValue(lpszValue);
      LPWSTR uval_lpszValue = etmpValue.Deref();

      return FireHeader(uval_lpszField, uval_lpszValue);
    }
    virtual INT FireHeader(LPWSTR &lpszField, LPWSTR &lpszValue) {
      return 0;
    }

    virtual INT FireSetCookie(LPSTR &lpszName, LPSTR &lpszValue, LPSTR &lpszExpires, LPSTR &lpszDomain, LPSTR &lpszPath, BOOL &bSecure) {
      MUString etmpName(lpszName);
      LPWSTR uval_lpszName = etmpName.Deref();
      MUString etmpValue(lpszValue);
      LPWSTR uval_lpszValue = etmpValue.Deref();
      MUString etmpExpires(lpszExpires);
      LPWSTR uval_lpszExpires = etmpExpires.Deref();
      MUString etmpDomain(lpszDomain);
      LPWSTR uval_lpszDomain = etmpDomain.Deref();
      MUString etmpPath(lpszPath);
      LPWSTR uval_lpszPath = etmpPath.Deref();

      return FireSetCookie(uval_lpszName, uval_lpszValue, uval_lpszExpires, uval_lpszDomain, uval_lpszPath, bSecure);
    }
    virtual INT FireSetCookie(LPWSTR &lpszName, LPWSTR &lpszValue, LPWSTR &lpszExpires, LPWSTR &lpszDomain, LPWSTR &lpszPath, BOOL &bSecure) {
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

#endif //_IPWORKS_WEBUPLOAD_H_




