/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_HTTP_H_
#define _IPWORKS_HTTP_H_

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

#define httpIdle                                           0
#define httpGet                                            1
#define httpPost                                           2
#define httpHead                                           3
#define httpResetHeaders                                   4
#define httpPut                                            5

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3

#define frNever                                            0
#define frAlways                                           1
#define frSameScheme                                       2


#define HTTP_IDLE                                          0
#define HTTP_GET                                           1
#define HTTP_POST                                          2
#define HTTP_HEAD                                          3
#define HTTP_RESET_HEADERS                                 4
#define HTTP_PUT                                           5

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3

#define FR_NEVER                                           0
#define FR_ALWAYS                                          1
#define FR_SAME_SCHEME                                     2



#endif //_IPWORKS_INTERNAL_

#define PID_HTTP_ACCEPT    1
#define PID_HTTP_ACTION    2
#define PID_HTTP_ATTACHEDFILE    3
#define PID_HTTP_AUTHORIZATION    4
#define PID_HTTP_CONNECTED    5
#define PID_HTTP_CONTENTTYPE    6
#define PID_HTTP_COOKIECOUNT    7
#define PID_HTTP_COOKIENAME    8
#define PID_HTTP_COOKIEVALUE    9
#define PID_HTTP_FIREWALLDATA    10
#define PID_HTTP_FIREWALLHOST    11
#define PID_HTTP_FIREWALLPASSWORD    12
#define PID_HTTP_FIREWALLPORT    13
#define PID_HTTP_FIREWALLTYPE    14
#define PID_HTTP_FIREWALLUSER    15
#define PID_HTTP_FOLLOWREDIRECTS    16
#define PID_HTTP_FROM    17
#define PID_HTTP_HTTPMETHOD    18
#define PID_HTTP_HTTPVERSION    19
#define PID_HTTP_IFMODIFIEDSINCE    20
#define PID_HTTP_LOCALFILE    21
#define PID_HTTP_LOCALHOST    22
#define PID_HTTP_MAXTRANSFERREDDATA    23
#define PID_HTTP_OTHERHEADERS    24
#define PID_HTTP_PASSWORD    25
#define PID_HTTP_POSTDATA    26
#define PID_HTTP_PRAGMA    27
#define PID_HTTP_PROXYAUTHORIZATION    28
#define PID_HTTP_PROXYPASSWORD    29
#define PID_HTTP_PROXYPORT    30
#define PID_HTTP_PROXYSERVER    31
#define PID_HTTP_PROXYUSER    32
#define PID_HTTP_REFERER    33
#define PID_HTTP_SOCKETHANDLE    34
#define PID_HTTP_STATUSLINE    35
#define PID_HTTP_TIMEOUT    36
#define PID_HTTP_TRANSFERREDDATA    37
#define PID_HTTP_TRANSFERREDHEADERS    38
#define PID_HTTP_URL    39
#define PID_HTTP_URLPATH    40
#define PID_HTTP_URLPORT    41
#define PID_HTTP_URLSCHEME    42
#define PID_HTTP_URLSERVER    43
#define PID_HTTP_USER    44
#define PID_HTTP_USERAGENT    45
#define PID_HTTP_WINSOCKINFO    46
#define PID_HTTP_WINSOCKLOADED    47
#define PID_HTTP_WINSOCKMAXDATAGRAMSIZE    48
#define PID_HTTP_WINSOCKMAXSOCKETS    49
#define PID_HTTP_WINSOCKPATH    50
#define PID_HTTP_WINSOCKSTATUS    51


#define MID_HTTP_ADDCOOKIE    1
#define MID_HTTP_DOEVENTS    2
#define MID_HTTP_GET    3
#define MID_HTTP_HEAD    4
#define MID_HTTP_INTERRUPT    5
#define MID_HTTP_POST    6
#define MID_HTTP_PUT    7
#define MID_HTTP_RESETHEADERS    8


#define EID_HTTP_CONNECTED    1
#define EID_HTTP_DISCONNECTED    2
#define EID_HTTP_ENDTRANSFER    3
#define EID_HTTP_ERROR    4
#define EID_HTTP_HEADER    5
#define EID_HTTP_SETCOOKIE    6
#define EID_HTTP_STARTTRANSFER    7
#define EID_HTTP_TRANSFER    8


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID HTTP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    HTTP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    HTTP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID HTTP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    HTTP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    HTTP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  HTTP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    HTTP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   HTTP_StaticInit(LPVOID hInst);

class HTTPA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireEndTransfer(USHORT &usDirection) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {return 0;}
    virtual INT FireSetCookie(LPSTR &lpszName, LPSTR &lpszValue, LPSTR &lpszExpires, LPSTR &lpszDomain, LPSTR &lpszPath, BOOL &bSecure) {return 0;}
    virtual INT FireStartTransfer(USHORT &usDirection) {return 0;}
    virtual INT FireTransfer(USHORT &usDirection, LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_HTTP_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTTPA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_HTTP_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTTPA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_HTTP_ENDTRANSFER: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTTPA*)lpObj)->FireEndTransfer(pDirection);
         }
         case EID_HTTP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTTPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_HTTP_HEADER: {
                        LPSTR pField = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTTPA*)lpObj)->FireHeader(pField, pValue);
         }
         case EID_HTTP_SETCOOKIE: {
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
            
            
            return ((HTTPA*)lpObj)->FireSetCookie(pName, pValue, pExpires, pDomain, pPath, pSecure);
         }
         case EID_HTTP_STARTTRANSFER: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTTPA*)lpObj)->FireStartTransfer(pDirection);
         }
         case EID_HTTP_TRANSFER: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((HTTPA*)lpObj)->FireTransfer(pDirection, pBytesTransferred, pText, lenText);
         }

      }
      return 0;
    }

  public:

    HTTPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_18) {
      m_pObj = HTTP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~HTTPA() {
      HTTP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)HTTP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return HTTP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)HTTP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return HTTP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline LPCSTR GetAccept() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_ACCEPT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAccept(LPCSTR lpszAccept) {
      int val = (int)lpszAccept;
      return HTTP_Set(m_pObj, PID_HTTP_ACCEPT, 0, (LPVOID)val, 0);
    }
    inline INT GetAction() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return HTTP_Set(m_pObj, PID_HTTP_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAttachedFile() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_ATTACHEDFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAttachedFile(LPCSTR lpszAttachedFile) {
      int val = (int)lpszAttachedFile;
      return HTTP_Set(m_pObj, PID_HTTP_ATTACHEDFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAuthorization() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_AUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAuthorization(LPCSTR lpszAuthorization) {
      int val = (int)lpszAuthorization;
      return HTTP_Set(m_pObj, PID_HTTP_AUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline LPCSTR GetContentType() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_CONTENTTYPE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetContentType(LPCSTR lpszContentType) {
      int val = (int)lpszContentType;
      return HTTP_Set(m_pObj, PID_HTTP_CONTENTTYPE, 0, (LPVOID)val, 0);
    }
    inline INT GetCookieCount() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_COOKIECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetCookieCount(INT iCookieCount) {
      int val = (int)iCookieCount;
      return HTTP_Set(m_pObj, PID_HTTP_COOKIECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieName(USHORT usCookieIndex) {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_COOKIENAME, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieName(USHORT usCookieIndex, LPCSTR lpszCookieName) {
      int val = (int)lpszCookieName;
      return HTTP_Set(m_pObj, PID_HTTP_COOKIENAME, usCookieIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieValue(USHORT usCookieIndex) {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_COOKIEVALUE, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieValue(USHORT usCookieIndex, LPCSTR lpszCookieValue) {
      int val = (int)lpszCookieValue;
      return HTTP_Set(m_pObj, PID_HTTP_COOKIEVALUE, usCookieIndex, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)HTTP_Get(m_pObj, PID_HTTP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return HTTP_Set(m_pObj, PID_HTTP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return HTTP_Set(m_pObj, PID_HTTP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return HTTP_Set(m_pObj, PID_HTTP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return HTTP_Set(m_pObj, PID_HTTP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return HTTP_Set(m_pObj, PID_HTTP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return HTTP_Set(m_pObj, PID_HTTP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline INT GetFollowRedirects() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FOLLOWREDIRECTS, 0, 0);
      return (INT)val;
    }
    inline INT SetFollowRedirects(INT iFollowRedirects) {
      int val = (int)iFollowRedirects;
      return HTTP_Set(m_pObj, PID_HTTP_FOLLOWREDIRECTS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFrom() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return HTTP_Set(m_pObj, PID_HTTP_FROM, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetHTTPMethod() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_HTTPMETHOD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetHTTPMethod(LPCSTR lpszHTTPMethod) {
      int val = (int)lpszHTTPMethod;
      return HTTP_Set(m_pObj, PID_HTTP_HTTPMETHOD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetHTTPVersion() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_HTTPVERSION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetHTTPVersion(LPCSTR lpszHTTPVersion) {
      int val = (int)lpszHTTPVersion;
      return HTTP_Set(m_pObj, PID_HTTP_HTTPVERSION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetIfModifiedSince() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_IFMODIFIEDSINCE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetIfModifiedSince(LPCSTR lpszIfModifiedSince) {
      int val = (int)lpszIfModifiedSince;
      return HTTP_Set(m_pObj, PID_HTTP_IFMODIFIEDSINCE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalFile() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return HTTP_Set(m_pObj, PID_HTTP_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return HTTP_Set(m_pObj, PID_HTTP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxTransferredData() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_MAXTRANSFERREDDATA, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxTransferredData(LONG lMaxTransferredData) {
      int val = (int)lMaxTransferredData;
      return HTTP_Set(m_pObj, PID_HTTP_MAXTRANSFERREDDATA, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return HTTP_Set(m_pObj, PID_HTTP_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return HTTP_Set(m_pObj, PID_HTTP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline INT GetPostData(LPCSTR &lpPostData, UINT &lenPostData) {
      lpPostData = (LPSTR)HTTP_Get(m_pObj, PID_HTTP_POSTDATA, 0, &lenPostData);
      if ( ! lpPostData) return lenPostData;
      return 0;
    }

    inline INT SetPostData(LPCSTR lpPostData, UINT lenPostData) {
      return HTTP_Set(m_pObj, PID_HTTP_POSTDATA, 0, (LPVOID)lpPostData, lenPostData);
    }

    inline LPCSTR GetPragma() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PRAGMA, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPragma(LPCSTR lpszPragma) {
      int val = (int)lpszPragma;
      return HTTP_Set(m_pObj, PID_HTTP_PRAGMA, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyAuthorization() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PROXYAUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyAuthorization(LPCSTR lpszProxyAuthorization) {
      int val = (int)lpszProxyAuthorization;
      return HTTP_Set(m_pObj, PID_HTTP_PROXYAUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyPassword() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PROXYPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyPassword(LPCSTR lpszProxyPassword) {
      int val = (int)lpszProxyPassword;
      return HTTP_Set(m_pObj, PID_HTTP_PROXYPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetProxyPort() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PROXYPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetProxyPort(USHORT usProxyPort) {
      int val = (int)usProxyPort;
      return HTTP_Set(m_pObj, PID_HTTP_PROXYPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyServer() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PROXYSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyServer(LPCSTR lpszProxyServer) {
      int val = (int)lpszProxyServer;
      return HTTP_Set(m_pObj, PID_HTTP_PROXYSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyUser() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_PROXYUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyUser(LPCSTR lpszProxyUser) {
      int val = (int)lpszProxyUser;
      return HTTP_Set(m_pObj, PID_HTTP_PROXYUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReferer() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_REFERER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReferer(LPCSTR lpszReferer) {
      int val = (int)lpszReferer;
      return HTTP_Set(m_pObj, PID_HTTP_REFERER, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetStatusLine() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_STATUSLINE, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetTimeout() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return HTTP_Set(m_pObj, PID_HTTP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline INT GetTransferredData(LPCSTR &lpTransferredData, UINT &lenTransferredData) {
      lpTransferredData = (LPSTR)HTTP_Get(m_pObj, PID_HTTP_TRANSFERREDDATA, 0, &lenTransferredData);
      if ( ! lpTransferredData) return lenTransferredData;
      return 0;
    }


    inline LPCSTR GetTransferredHeaders() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_TRANSFERREDHEADERS, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetURL() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_URL, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURL(LPCSTR lpszURL) {
      int val = (int)lpszURL;
      return HTTP_Set(m_pObj, PID_HTTP_URL, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetURLPath() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_URLPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURLPath(LPCSTR lpszURLPath) {
      int val = (int)lpszURLPath;
      return HTTP_Set(m_pObj, PID_HTTP_URLPATH, 0, (LPVOID)val, 0);
    }
    inline USHORT GetURLPort() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_URLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetURLPort(USHORT usURLPort) {
      int val = (int)usURLPort;
      return HTTP_Set(m_pObj, PID_HTTP_URLPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetURLScheme() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_URLSCHEME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURLScheme(LPCSTR lpszURLScheme) {
      int val = (int)lpszURLScheme;
      return HTTP_Set(m_pObj, PID_HTTP_URLSCHEME, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetURLServer() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_URLSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURLServer(LPCSTR lpszURLServer) {
      int val = (int)lpszURLServer;
      return HTTP_Set(m_pObj, PID_HTTP_URLSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return HTTP_Set(m_pObj, PID_HTTP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUserAgent() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_USERAGENT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUserAgent(LPCSTR lpszUserAgent) {
      int val = (int)lpszUserAgent;
      return HTTP_Set(m_pObj, PID_HTTP_USERAGENT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return HTTP_Set(m_pObj, PID_HTTP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return HTTP_Set(m_pObj, PID_HTTP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)HTTP_Get(m_pObj, PID_HTTP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int AddCookie(LPSTR lpszCookieName, LPSTR lpszCookieValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszCookieName, (LPVOID)(INT)lpszCookieValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_ADDCOOKIE, 2, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Get(LPSTR lpszURL) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszURL, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_GET, 1, param, cbparam);
      
      
    }
    inline int Head(LPSTR lpszURL) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszURL, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_HEAD, 1, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Post(LPSTR lpszURL) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszURL, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_POST, 1, param, cbparam);
      
      
    }
    inline int Put(LPSTR lpszURL) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszURL, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_PUT, 1, param, cbparam);
      
      
    }
    inline int ResetHeaders() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return HTTP_Do(m_pObj, MID_HTTP_RESETHEADERS, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class HTTP : public HTTPA {
  
  public:
    HTTP(LPCSTR lpOemKey = IPWORKS_OEMKEY_18):HTTPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAccept;
    MCFStringRef tmpAttachedFile;
    MCFStringRef tmpAuthorization;
    MCFStringRef tmpContentType;
    MCFStringRef tmpCookieName;
    MCFStringRef tmpCookieValue;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFrom;
    MCFStringRef tmpHTTPMethod;
    MCFStringRef tmpHTTPVersion;
    MCFStringRef tmpIfModifiedSince;
    MCFStringRef tmpLocalFile;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpOtherHeaders;
    MCFStringRef tmpPassword;
    MCFStringRef tmpPostData;
    MCFStringRef tmpPragma;
    MCFStringRef tmpProxyAuthorization;
    MCFStringRef tmpProxyPassword;
    MCFStringRef tmpProxyServer;
    MCFStringRef tmpProxyUser;
    MCFStringRef tmpReferer;
    MCFStringRef tmpStatusLine;
    MCFStringRef tmpTransferredData;
    MCFStringRef tmpTransferredHeaders;
    MCFStringRef tmpURL;
    MCFStringRef tmpURLPath;
    MCFStringRef tmpURLScheme;
    MCFStringRef tmpURLServer;
    MCFStringRef tmpUser;
    MCFStringRef tmpUserAgent;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(HTTPA::GetLastError());
    }

    // CFString versions of properties
    inline CFStringRef GetAccept() {
      return tmpAccept.Set(HTTPA::GetAccept());
    }

    inline INT SetAccept(CFStringRef strAccept) {
      MCFStringAcc tmp;
      return HTTPA::SetAccept(tmp.Deref(strAccept));
    }

    inline CFStringRef GetAttachedFile() {
      return tmpAttachedFile.Set(HTTPA::GetAttachedFile());
    }

    inline INT SetAttachedFile(CFStringRef strAttachedFile) {
      MCFStringAcc tmp;
      return HTTPA::SetAttachedFile(tmp.Deref(strAttachedFile));
    }
    inline CFStringRef GetAuthorization() {
      return tmpAuthorization.Set(HTTPA::GetAuthorization());
    }

    inline INT SetAuthorization(CFStringRef strAuthorization) {
      MCFStringAcc tmp;
      return HTTPA::SetAuthorization(tmp.Deref(strAuthorization));
    }

    inline CFStringRef GetContentType() {
      return tmpContentType.Set(HTTPA::GetContentType());
    }

    inline INT SetContentType(CFStringRef strContentType) {
      MCFStringAcc tmp;
      return HTTPA::SetContentType(tmp.Deref(strContentType));
    }

    inline CFStringRef GetCookieName(USHORT usCookieIndex) {
      return tmpCookieName.Set(HTTPA::GetCookieName(usCookieIndex));
    }

    inline INT SetCookieName(USHORT usCookieIndex, CFStringRef strCookieName) {
      MCFStringAcc tmp;
      return HTTPA::SetCookieName(usCookieIndex, tmp.Deref(strCookieName));
    }
    inline CFStringRef GetCookieValue(USHORT usCookieIndex) {
      return tmpCookieValue.Set(HTTPA::GetCookieValue(usCookieIndex));
    }

    inline INT SetCookieValue(USHORT usCookieIndex, CFStringRef strCookieValue) {
      MCFStringAcc tmp;
      return HTTPA::SetCookieValue(usCookieIndex, tmp.Deref(strCookieValue));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = HTTPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return HTTPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(HTTPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return HTTPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(HTTPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return HTTPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(HTTPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return HTTPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }

    inline CFStringRef GetFrom() {
      return tmpFrom.Set(HTTPA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return HTTPA::SetFrom(tmp.Deref(strFrom));
    }
    inline CFStringRef GetHTTPMethod() {
      return tmpHTTPMethod.Set(HTTPA::GetHTTPMethod());
    }

    inline INT SetHTTPMethod(CFStringRef strHTTPMethod) {
      MCFStringAcc tmp;
      return HTTPA::SetHTTPMethod(tmp.Deref(strHTTPMethod));
    }
    inline CFStringRef GetHTTPVersion() {
      return tmpHTTPVersion.Set(HTTPA::GetHTTPVersion());
    }

    inline INT SetHTTPVersion(CFStringRef strHTTPVersion) {
      MCFStringAcc tmp;
      return HTTPA::SetHTTPVersion(tmp.Deref(strHTTPVersion));
    }
    inline CFStringRef GetIfModifiedSince() {
      return tmpIfModifiedSince.Set(HTTPA::GetIfModifiedSince());
    }

    inline INT SetIfModifiedSince(CFStringRef strIfModifiedSince) {
      MCFStringAcc tmp;
      return HTTPA::SetIfModifiedSince(tmp.Deref(strIfModifiedSince));
    }
    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(HTTPA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return HTTPA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(HTTPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return HTTPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(HTTPA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return HTTPA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(HTTPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return HTTPA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetPostData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = HTTPA::GetPostData(tmp, len);
      if (ret_code) return NULL;
      return tmpPostData.Set(tmp, len);
    }

    inline INT SetPostData(CFStringRef strPostData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strPostData);
      return HTTPA::SetPostData(lp, tmp.Length());
    }
    inline CFStringRef GetPragma() {
      return tmpPragma.Set(HTTPA::GetPragma());
    }

    inline INT SetPragma(CFStringRef strPragma) {
      MCFStringAcc tmp;
      return HTTPA::SetPragma(tmp.Deref(strPragma));
    }
    inline CFStringRef GetProxyAuthorization() {
      return tmpProxyAuthorization.Set(HTTPA::GetProxyAuthorization());
    }

    inline INT SetProxyAuthorization(CFStringRef strProxyAuthorization) {
      MCFStringAcc tmp;
      return HTTPA::SetProxyAuthorization(tmp.Deref(strProxyAuthorization));
    }
    inline CFStringRef GetProxyPassword() {
      return tmpProxyPassword.Set(HTTPA::GetProxyPassword());
    }

    inline INT SetProxyPassword(CFStringRef strProxyPassword) {
      MCFStringAcc tmp;
      return HTTPA::SetProxyPassword(tmp.Deref(strProxyPassword));
    }

    inline CFStringRef GetProxyServer() {
      return tmpProxyServer.Set(HTTPA::GetProxyServer());
    }

    inline INT SetProxyServer(CFStringRef strProxyServer) {
      MCFStringAcc tmp;
      return HTTPA::SetProxyServer(tmp.Deref(strProxyServer));
    }
    inline CFStringRef GetProxyUser() {
      return tmpProxyUser.Set(HTTPA::GetProxyUser());
    }

    inline INT SetProxyUser(CFStringRef strProxyUser) {
      MCFStringAcc tmp;
      return HTTPA::SetProxyUser(tmp.Deref(strProxyUser));
    }
    inline CFStringRef GetReferer() {
      return tmpReferer.Set(HTTPA::GetReferer());
    }

    inline INT SetReferer(CFStringRef strReferer) {
      MCFStringAcc tmp;
      return HTTPA::SetReferer(tmp.Deref(strReferer));
    }

    inline CFStringRef GetStatusLine() {
      return tmpStatusLine.Set(HTTPA::GetStatusLine());
    }


    inline CFStringRef GetTransferredData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = HTTPA::GetTransferredData(tmp, len);
      if (ret_code) return NULL;
      return tmpTransferredData.Set(tmp, len);
    }

    inline CFStringRef GetTransferredHeaders() {
      return tmpTransferredHeaders.Set(HTTPA::GetTransferredHeaders());
    }

    inline CFStringRef GetURL() {
      return tmpURL.Set(HTTPA::GetURL());
    }

    inline INT SetURL(CFStringRef strURL) {
      MCFStringAcc tmp;
      return HTTPA::SetURL(tmp.Deref(strURL));
    }
    inline CFStringRef GetURLPath() {
      return tmpURLPath.Set(HTTPA::GetURLPath());
    }

    inline INT SetURLPath(CFStringRef strURLPath) {
      MCFStringAcc tmp;
      return HTTPA::SetURLPath(tmp.Deref(strURLPath));
    }

    inline CFStringRef GetURLScheme() {
      return tmpURLScheme.Set(HTTPA::GetURLScheme());
    }

    inline INT SetURLScheme(CFStringRef strURLScheme) {
      MCFStringAcc tmp;
      return HTTPA::SetURLScheme(tmp.Deref(strURLScheme));
    }
    inline CFStringRef GetURLServer() {
      return tmpURLServer.Set(HTTPA::GetURLServer());
    }

    inline INT SetURLServer(CFStringRef strURLServer) {
      MCFStringAcc tmp;
      return HTTPA::SetURLServer(tmp.Deref(strURLServer));
    }
    inline CFStringRef GetUser() {
      return tmpUser.Set(HTTPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return HTTPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetUserAgent() {
      return tmpUserAgent.Set(HTTPA::GetUserAgent());
    }

    inline INT SetUserAgent(CFStringRef strUserAgent) {
      MCFStringAcc tmp;
      return HTTPA::SetUserAgent(tmp.Deref(strUserAgent));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(HTTPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(HTTPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return HTTPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(HTTPA::GetWinsockStatus());
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



    virtual INT FireTransfer(USHORT &usDirection, LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireTransfer(usDirection, lBytesTransferred, uval_lpText, lenText);
    }
    virtual INT FireTransfer(USHORT &usDirection, LONG &lBytesTransferred, CFStringRef &lpText, USHORT &lenText) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters

    inline int AddCookie(CFStringRef pCookieName, CFStringRef pCookieValue) {
      MCFStringAcc etmpCookieName;
      LPSTR lpszCookieName = etmpCookieName.Deref(pCookieName);
      MCFStringAcc etmpCookieValue;
      LPSTR lpszCookieValue = etmpCookieValue.Deref(pCookieValue);

      return HTTPA::AddCookie(lpszCookieName, lpszCookieValue);
    }



    inline int Get(CFStringRef pURL) {
      MCFStringAcc etmpURL;
      LPSTR lpszURL = etmpURL.Deref(pURL);

      return HTTPA::Get(lpszURL);
    }

    inline int Head(CFStringRef pURL) {
      MCFStringAcc etmpURL;
      LPSTR lpszURL = etmpURL.Deref(pURL);

      return HTTPA::Head(lpszURL);
    }



    inline int Post(CFStringRef pURL) {
      MCFStringAcc etmpURL;
      LPSTR lpszURL = etmpURL.Deref(pURL);

      return HTTPA::Post(lpszURL);
    }

    inline int Put(CFStringRef pURL) {
      MCFStringAcc etmpURL;
      LPSTR lpszURL = etmpURL.Deref(pURL);

      return HTTPA::Put(lpszURL);
    }





#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAccept;
    MUString tmpAttachedFile;
    MUString tmpAuthorization;
    MUString tmpContentType;
    MUString tmpCookieName;
    MUString tmpCookieValue;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFrom;
    MUString tmpHTTPMethod;
    MUString tmpHTTPVersion;
    MUString tmpIfModifiedSince;
    MUString tmpLocalFile;
    MUString tmpLocalHost;
    MUString tmpOtherHeaders;
    MUString tmpPassword;
    MUString tmpPostData;
    MUString tmpPragma;
    MUString tmpProxyAuthorization;
    MUString tmpProxyPassword;
    MUString tmpProxyServer;
    MUString tmpProxyUser;
    MUString tmpReferer;
    MUString tmpStatusLine;
    MUString tmpTransferredData;
    MUString tmpTransferredHeaders;
    MUString tmpURL;
    MUString tmpURLPath;
    MUString tmpURLScheme;
    MUString tmpURLServer;
    MUString tmpUser;
    MUString tmpUserAgent;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(HTTPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties
    inline LPWSTR GetAccept() {
      tmpAccept.Set(HTTPA::GetAccept());
      return tmpAccept.Deref();
    }

    inline INT SetAccept(LPWSTR lpszAccept) {
      MAString tmp(lpszAccept);
      return HTTPA::SetAccept(tmp.Deref());
    }

    inline LPWSTR GetAttachedFile() {
      tmpAttachedFile.Set(HTTPA::GetAttachedFile());
      return tmpAttachedFile.Deref();
    }

    inline INT SetAttachedFile(LPWSTR lpszAttachedFile) {
      MAString tmp(lpszAttachedFile);
      return HTTPA::SetAttachedFile(tmp.Deref());
    }
    inline LPWSTR GetAuthorization() {
      tmpAuthorization.Set(HTTPA::GetAuthorization());
      return tmpAuthorization.Deref();
    }

    inline INT SetAuthorization(LPWSTR lpszAuthorization) {
      MAString tmp(lpszAuthorization);
      return HTTPA::SetAuthorization(tmp.Deref());
    }

    inline LPWSTR GetContentType() {
      tmpContentType.Set(HTTPA::GetContentType());
      return tmpContentType.Deref();
    }

    inline INT SetContentType(LPWSTR lpszContentType) {
      MAString tmp(lpszContentType);
      return HTTPA::SetContentType(tmp.Deref());
    }

    inline LPWSTR GetCookieName(USHORT usCookieIndex) {
      tmpCookieName.Set(HTTPA::GetCookieName(usCookieIndex));
      return tmpCookieName.Deref();
    }

    inline INT SetCookieName(USHORT usCookieIndex, LPWSTR lpszCookieName) {
      MAString tmp(lpszCookieName);
      return HTTPA::SetCookieName(usCookieIndex, tmp.Deref());
    }
    inline LPWSTR GetCookieValue(USHORT usCookieIndex) {
      tmpCookieValue.Set(HTTPA::GetCookieValue(usCookieIndex));
      return tmpCookieValue.Deref();
    }

    inline INT SetCookieValue(USHORT usCookieIndex, LPWSTR lpszCookieValue) {
      MAString tmp(lpszCookieValue);
      return HTTPA::SetCookieValue(usCookieIndex, tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = HTTPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return HTTPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(HTTPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return HTTPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(HTTPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return HTTPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(HTTPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return HTTPA::SetFirewallUser(tmp.Deref());
    }

    inline LPWSTR GetFrom() {
      tmpFrom.Set(HTTPA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return HTTPA::SetFrom(tmp.Deref());
    }
    inline LPWSTR GetHTTPMethod() {
      tmpHTTPMethod.Set(HTTPA::GetHTTPMethod());
      return tmpHTTPMethod.Deref();
    }

    inline INT SetHTTPMethod(LPWSTR lpszHTTPMethod) {
      MAString tmp(lpszHTTPMethod);
      return HTTPA::SetHTTPMethod(tmp.Deref());
    }
    inline LPWSTR GetHTTPVersion() {
      tmpHTTPVersion.Set(HTTPA::GetHTTPVersion());
      return tmpHTTPVersion.Deref();
    }

    inline INT SetHTTPVersion(LPWSTR lpszHTTPVersion) {
      MAString tmp(lpszHTTPVersion);
      return HTTPA::SetHTTPVersion(tmp.Deref());
    }
    inline LPWSTR GetIfModifiedSince() {
      tmpIfModifiedSince.Set(HTTPA::GetIfModifiedSince());
      return tmpIfModifiedSince.Deref();
    }

    inline INT SetIfModifiedSince(LPWSTR lpszIfModifiedSince) {
      MAString tmp(lpszIfModifiedSince);
      return HTTPA::SetIfModifiedSince(tmp.Deref());
    }
    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(HTTPA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return HTTPA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(HTTPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return HTTPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(HTTPA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return HTTPA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(HTTPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return HTTPA::SetPassword(tmp.Deref());
    }
    inline INT GetPostData(LPWSTR &lpPostData, UINT &lenPostData) {
      LPSTR tmp = NULL;
      INT ret_code = HTTPA::GetPostData(tmp, lenPostData);
      if (ret_code) return ret_code;
      tmpPostData.Set(tmp, lenPostData);
      lpPostData = tmpPostData.Deref();
      return 0;
    }

    inline INT SetPostData(LPWSTR lpPostData, UINT lenPostData) {
      MAString tmp(lpPostData, lenPostData);
      return HTTPA::SetPostData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetPragma() {
      tmpPragma.Set(HTTPA::GetPragma());
      return tmpPragma.Deref();
    }

    inline INT SetPragma(LPWSTR lpszPragma) {
      MAString tmp(lpszPragma);
      return HTTPA::SetPragma(tmp.Deref());
    }
    inline LPWSTR GetProxyAuthorization() {
      tmpProxyAuthorization.Set(HTTPA::GetProxyAuthorization());
      return tmpProxyAuthorization.Deref();
    }

    inline INT SetProxyAuthorization(LPWSTR lpszProxyAuthorization) {
      MAString tmp(lpszProxyAuthorization);
      return HTTPA::SetProxyAuthorization(tmp.Deref());
    }
    inline LPWSTR GetProxyPassword() {
      tmpProxyPassword.Set(HTTPA::GetProxyPassword());
      return tmpProxyPassword.Deref();
    }

    inline INT SetProxyPassword(LPWSTR lpszProxyPassword) {
      MAString tmp(lpszProxyPassword);
      return HTTPA::SetProxyPassword(tmp.Deref());
    }

    inline LPWSTR GetProxyServer() {
      tmpProxyServer.Set(HTTPA::GetProxyServer());
      return tmpProxyServer.Deref();
    }

    inline INT SetProxyServer(LPWSTR lpszProxyServer) {
      MAString tmp(lpszProxyServer);
      return HTTPA::SetProxyServer(tmp.Deref());
    }
    inline LPWSTR GetProxyUser() {
      tmpProxyUser.Set(HTTPA::GetProxyUser());
      return tmpProxyUser.Deref();
    }

    inline INT SetProxyUser(LPWSTR lpszProxyUser) {
      MAString tmp(lpszProxyUser);
      return HTTPA::SetProxyUser(tmp.Deref());
    }
    inline LPWSTR GetReferer() {
      tmpReferer.Set(HTTPA::GetReferer());
      return tmpReferer.Deref();
    }

    inline INT SetReferer(LPWSTR lpszReferer) {
      MAString tmp(lpszReferer);
      return HTTPA::SetReferer(tmp.Deref());
    }

    inline LPWSTR GetStatusLine() {
      tmpStatusLine.Set(HTTPA::GetStatusLine());
      return tmpStatusLine.Deref();
    }


    inline INT GetTransferredData(LPWSTR &lpTransferredData, UINT &lenTransferredData) {
      LPSTR tmp = NULL;
      INT ret_code = HTTPA::GetTransferredData(tmp, lenTransferredData);
      if (ret_code) return ret_code;
      tmpTransferredData.Set(tmp, lenTransferredData);
      lpTransferredData = tmpTransferredData.Deref();
      return 0;
    }

    inline LPWSTR GetTransferredHeaders() {
      tmpTransferredHeaders.Set(HTTPA::GetTransferredHeaders());
      return tmpTransferredHeaders.Deref();
    }

    inline LPWSTR GetURL() {
      tmpURL.Set(HTTPA::GetURL());
      return tmpURL.Deref();
    }

    inline INT SetURL(LPWSTR lpszURL) {
      MAString tmp(lpszURL);
      return HTTPA::SetURL(tmp.Deref());
    }
    inline LPWSTR GetURLPath() {
      tmpURLPath.Set(HTTPA::GetURLPath());
      return tmpURLPath.Deref();
    }

    inline INT SetURLPath(LPWSTR lpszURLPath) {
      MAString tmp(lpszURLPath);
      return HTTPA::SetURLPath(tmp.Deref());
    }

    inline LPWSTR GetURLScheme() {
      tmpURLScheme.Set(HTTPA::GetURLScheme());
      return tmpURLScheme.Deref();
    }

    inline INT SetURLScheme(LPWSTR lpszURLScheme) {
      MAString tmp(lpszURLScheme);
      return HTTPA::SetURLScheme(tmp.Deref());
    }
    inline LPWSTR GetURLServer() {
      tmpURLServer.Set(HTTPA::GetURLServer());
      return tmpURLServer.Deref();
    }

    inline INT SetURLServer(LPWSTR lpszURLServer) {
      MAString tmp(lpszURLServer);
      return HTTPA::SetURLServer(tmp.Deref());
    }
    inline LPWSTR GetUser() {
      tmpUser.Set(HTTPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return HTTPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetUserAgent() {
      tmpUserAgent.Set(HTTPA::GetUserAgent());
      return tmpUserAgent.Deref();
    }

    inline INT SetUserAgent(LPWSTR lpszUserAgent) {
      MAString tmp(lpszUserAgent);
      return HTTPA::SetUserAgent(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(HTTPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(HTTPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return HTTPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(HTTPA::GetWinsockStatus());
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



    virtual INT FireTransfer(USHORT &usDirection, LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireTransfer(usDirection, lBytesTransferred, uval_lpText, lenText);
    }
    virtual INT FireTransfer(USHORT &usDirection, LONG &lBytesTransferred, LPWSTR &lpText, USHORT &lenText) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_HTTP_H_




