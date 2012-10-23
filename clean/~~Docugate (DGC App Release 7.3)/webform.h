/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_WEBFORM_H_
#define _IPWORKS_WEBFORM_H_

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

#define webformIdle                                        0
#define webformSubmit                                      1
#define webformReset                                       2

#define encURLEncoding                                     0
#define encMultipartFormData                               1
#define encQueryString                                     2

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define WEBFORM_IDLE                                       0
#define WEBFORM_SUBMIT                                     1
#define WEBFORM_RESET                                      2

#define ENC_URLENCODING                                    0
#define ENC_MULTIPART_FORM_DATA                            1
#define ENC_QUERY_STRING                                   2

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_WEBFORM_ACTION    1
#define PID_WEBFORM_AUTHORIZATION    2
#define PID_WEBFORM_CONNECTED    3
#define PID_WEBFORM_CONTENTTYPE    4
#define PID_WEBFORM_COOKIECOUNT    5
#define PID_WEBFORM_COOKIENAME    6
#define PID_WEBFORM_COOKIEVALUE    7
#define PID_WEBFORM_ENCODING    8
#define PID_WEBFORM_FIREWALLDATA    9
#define PID_WEBFORM_FIREWALLHOST    10
#define PID_WEBFORM_FIREWALLPASSWORD    11
#define PID_WEBFORM_FIREWALLPORT    12
#define PID_WEBFORM_FIREWALLTYPE    13
#define PID_WEBFORM_FIREWALLUSER    14
#define PID_WEBFORM_FORMVARCOUNT    15
#define PID_WEBFORM_FORMVARNAMES    16
#define PID_WEBFORM_FORMVARVALUES    17
#define PID_WEBFORM_FROM    18
#define PID_WEBFORM_LOCALFILE    19
#define PID_WEBFORM_LOCALHOST    20
#define PID_WEBFORM_MAXTRANSFERREDDATA    21
#define PID_WEBFORM_OTHERHEADERS    22
#define PID_WEBFORM_PASSWORD    23
#define PID_WEBFORM_PROXYAUTHORIZATION    24
#define PID_WEBFORM_PROXYPASSWORD    25
#define PID_WEBFORM_PROXYPORT    26
#define PID_WEBFORM_PROXYSERVER    27
#define PID_WEBFORM_PROXYUSER    28
#define PID_WEBFORM_REFERER    29
#define PID_WEBFORM_SOCKETHANDLE    30
#define PID_WEBFORM_STATUSLINE    31
#define PID_WEBFORM_TIMEOUT    32
#define PID_WEBFORM_TRANSFERREDDATA    33
#define PID_WEBFORM_TRANSFERREDHEADERS    34
#define PID_WEBFORM_URL    35
#define PID_WEBFORM_USER    36
#define PID_WEBFORM_USERAGENT    37
#define PID_WEBFORM_WINSOCKINFO    38
#define PID_WEBFORM_WINSOCKLOADED    39
#define PID_WEBFORM_WINSOCKMAXDATAGRAMSIZE    40
#define PID_WEBFORM_WINSOCKMAXSOCKETS    41
#define PID_WEBFORM_WINSOCKPATH    42
#define PID_WEBFORM_WINSOCKSTATUS    43


#define MID_WEBFORM_ADDCOOKIE    1
#define MID_WEBFORM_ADDFORMVAR    2
#define MID_WEBFORM_DOEVENTS    3
#define MID_WEBFORM_INTERRUPT    4
#define MID_WEBFORM_RESET    5
#define MID_WEBFORM_SUBMIT    6
#define MID_WEBFORM_SUBMITTO    7


#define EID_WEBFORM_CONNECTED    1
#define EID_WEBFORM_DISCONNECTED    2
#define EID_WEBFORM_ENDTRANSFER    3
#define EID_WEBFORM_ERROR    4
#define EID_WEBFORM_HEADER    5
#define EID_WEBFORM_SETCOOKIE    6
#define EID_WEBFORM_STARTTRANSFER    7
#define EID_WEBFORM_TRANSFER    8


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID WebForm_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    WebForm_Destroy(LPVOID lpObj);
CNX_IMPORT INT    WebForm_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID WebForm_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    WebForm_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    WebForm_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  WebForm_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    WebForm_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   WebForm_StaticInit(LPVOID hInst);

class WebFormA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {return 0;}
    virtual INT FireSetCookie(LPSTR &lpszName, LPSTR &lpszValue, LPSTR &lpszExpires, LPSTR &lpszDomain, LPSTR &lpszPath, BOOL &bSecure) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_WEBFORM_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebFormA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_WEBFORM_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebFormA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_WEBFORM_ENDTRANSFER: {
            
            return ((WebFormA*)lpObj)->FireEndTransfer();
         }
         case EID_WEBFORM_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebFormA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_WEBFORM_HEADER: {
                        LPSTR pField = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((WebFormA*)lpObj)->FireHeader(pField, pValue);
         }
         case EID_WEBFORM_SETCOOKIE: {
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
            
            
            return ((WebFormA*)lpObj)->FireSetCookie(pName, pValue, pExpires, pDomain, pPath, pSecure);
         }
         case EID_WEBFORM_STARTTRANSFER: {
            
            return ((WebFormA*)lpObj)->FireStartTransfer();
         }
         case EID_WEBFORM_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((WebFormA*)lpObj)->FireTransfer(pBytesTransferred, pText, lenText);
         }

      }
      return 0;
    }

  public:

    WebFormA(LPCSTR lpOemKey = IPWORKS_OEMKEY_49) {
      m_pObj = WebForm_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~WebFormA() {
      WebForm_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)WebForm_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return WebForm_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)WebForm_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return WebForm_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return WebForm_Set(m_pObj, PID_WEBFORM_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAuthorization() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_AUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAuthorization(LPCSTR lpszAuthorization) {
      int val = (int)lpszAuthorization;
      return WebForm_Set(m_pObj, PID_WEBFORM_AUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline LPCSTR GetContentType() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_CONTENTTYPE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetContentType(LPCSTR lpszContentType) {
      int val = (int)lpszContentType;
      return WebForm_Set(m_pObj, PID_WEBFORM_CONTENTTYPE, 0, (LPVOID)val, 0);
    }
    inline INT GetCookieCount() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_COOKIECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetCookieCount(INT iCookieCount) {
      int val = (int)iCookieCount;
      return WebForm_Set(m_pObj, PID_WEBFORM_COOKIECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieName(USHORT usCookieIndex) {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_COOKIENAME, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieName(USHORT usCookieIndex, LPCSTR lpszCookieName) {
      int val = (int)lpszCookieName;
      return WebForm_Set(m_pObj, PID_WEBFORM_COOKIENAME, usCookieIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieValue(USHORT usCookieIndex) {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_COOKIEVALUE, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieValue(USHORT usCookieIndex, LPCSTR lpszCookieValue) {
      int val = (int)lpszCookieValue;
      return WebForm_Set(m_pObj, PID_WEBFORM_COOKIEVALUE, usCookieIndex, (LPVOID)val, 0);
    }
    inline INT GetEncoding() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_ENCODING, 0, 0);
      return (INT)val;
    }
    inline INT SetEncoding(INT iEncoding) {
      int val = (int)iEncoding;
      return WebForm_Set(m_pObj, PID_WEBFORM_ENCODING, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)WebForm_Get(m_pObj, PID_WEBFORM_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return WebForm_Set(m_pObj, PID_WEBFORM_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return WebForm_Set(m_pObj, PID_WEBFORM_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return WebForm_Set(m_pObj, PID_WEBFORM_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return WebForm_Set(m_pObj, PID_WEBFORM_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return WebForm_Set(m_pObj, PID_WEBFORM_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return WebForm_Set(m_pObj, PID_WEBFORM_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline INT GetFormVarCount() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FORMVARCOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetFormVarCount(INT iFormVarCount) {
      int val = (int)iFormVarCount;
      return WebForm_Set(m_pObj, PID_WEBFORM_FORMVARCOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFormVarNames(USHORT usVarIndex) {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FORMVARNAMES, usVarIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetFormVarNames(USHORT usVarIndex, LPCSTR lpszFormVarNames) {
      int val = (int)lpszFormVarNames;
      return WebForm_Set(m_pObj, PID_WEBFORM_FORMVARNAMES, usVarIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetFormVarValues(USHORT usVarIndex) {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FORMVARVALUES, usVarIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetFormVarValues(USHORT usVarIndex, LPCSTR lpszFormVarValues) {
      int val = (int)lpszFormVarValues;
      return WebForm_Set(m_pObj, PID_WEBFORM_FORMVARVALUES, usVarIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetFrom() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return WebForm_Set(m_pObj, PID_WEBFORM_FROM, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalFile() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return WebForm_Set(m_pObj, PID_WEBFORM_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return WebForm_Set(m_pObj, PID_WEBFORM_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxTransferredData() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_MAXTRANSFERREDDATA, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxTransferredData(LONG lMaxTransferredData) {
      int val = (int)lMaxTransferredData;
      return WebForm_Set(m_pObj, PID_WEBFORM_MAXTRANSFERREDDATA, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return WebForm_Set(m_pObj, PID_WEBFORM_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return WebForm_Set(m_pObj, PID_WEBFORM_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyAuthorization() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_PROXYAUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyAuthorization(LPCSTR lpszProxyAuthorization) {
      int val = (int)lpszProxyAuthorization;
      return WebForm_Set(m_pObj, PID_WEBFORM_PROXYAUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyPassword() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_PROXYPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyPassword(LPCSTR lpszProxyPassword) {
      int val = (int)lpszProxyPassword;
      return WebForm_Set(m_pObj, PID_WEBFORM_PROXYPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetProxyPort() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_PROXYPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetProxyPort(USHORT usProxyPort) {
      int val = (int)usProxyPort;
      return WebForm_Set(m_pObj, PID_WEBFORM_PROXYPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyServer() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_PROXYSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyServer(LPCSTR lpszProxyServer) {
      int val = (int)lpszProxyServer;
      return WebForm_Set(m_pObj, PID_WEBFORM_PROXYSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyUser() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_PROXYUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyUser(LPCSTR lpszProxyUser) {
      int val = (int)lpszProxyUser;
      return WebForm_Set(m_pObj, PID_WEBFORM_PROXYUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReferer() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_REFERER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReferer(LPCSTR lpszReferer) {
      int val = (int)lpszReferer;
      return WebForm_Set(m_pObj, PID_WEBFORM_REFERER, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetStatusLine() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_STATUSLINE, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetTimeout() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return WebForm_Set(m_pObj, PID_WEBFORM_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline INT GetTransferredData(LPCSTR &lpTransferredData, UINT &lenTransferredData) {
      lpTransferredData = (LPSTR)WebForm_Get(m_pObj, PID_WEBFORM_TRANSFERREDDATA, 0, &lenTransferredData);
      if ( ! lpTransferredData) return lenTransferredData;
      return 0;
    }


    inline LPCSTR GetTransferredHeaders() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_TRANSFERREDHEADERS, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetURL() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_URL, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURL(LPCSTR lpszURL) {
      int val = (int)lpszURL;
      return WebForm_Set(m_pObj, PID_WEBFORM_URL, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return WebForm_Set(m_pObj, PID_WEBFORM_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUserAgent() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_USERAGENT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUserAgent(LPCSTR lpszUserAgent) {
      int val = (int)lpszUserAgent;
      return WebForm_Set(m_pObj, PID_WEBFORM_USERAGENT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return WebForm_Set(m_pObj, PID_WEBFORM_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return WebForm_Set(m_pObj, PID_WEBFORM_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)WebForm_Get(m_pObj, PID_WEBFORM_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int AddCookie(LPSTR lpszCookieName, LPSTR lpszCookieValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszCookieName, (LPVOID)(INT)lpszCookieValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_ADDCOOKIE, 2, param, cbparam);
      
      
    }
    inline int AddFormVar(LPSTR lpszVarName, LPSTR lpszVarValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszVarName, (LPVOID)(INT)lpszVarValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_ADDFORMVAR, 2, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_RESET, 0, param, cbparam);
      
      
    }
    inline int Submit() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_SUBMIT, 0, param, cbparam);
      
      
    }
    inline int SubmitTo(LPSTR lpszURL) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszURL, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return WebForm_Do(m_pObj, MID_WEBFORM_SUBMITTO, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class WebForm : public WebFormA {
  
  public:
    WebForm(LPCSTR lpOemKey = IPWORKS_OEMKEY_49):WebFormA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAuthorization;
    MCFStringRef tmpContentType;
    MCFStringRef tmpCookieName;
    MCFStringRef tmpCookieValue;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFormVarNames;
    MCFStringRef tmpFormVarValues;
    MCFStringRef tmpFrom;
    MCFStringRef tmpLocalFile;
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
      return tmpLastError.Set(WebFormA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetAuthorization() {
      return tmpAuthorization.Set(WebFormA::GetAuthorization());
    }

    inline INT SetAuthorization(CFStringRef strAuthorization) {
      MCFStringAcc tmp;
      return WebFormA::SetAuthorization(tmp.Deref(strAuthorization));
    }

    inline CFStringRef GetContentType() {
      return tmpContentType.Set(WebFormA::GetContentType());
    }

    inline INT SetContentType(CFStringRef strContentType) {
      MCFStringAcc tmp;
      return WebFormA::SetContentType(tmp.Deref(strContentType));
    }

    inline CFStringRef GetCookieName(USHORT usCookieIndex) {
      return tmpCookieName.Set(WebFormA::GetCookieName(usCookieIndex));
    }

    inline INT SetCookieName(USHORT usCookieIndex, CFStringRef strCookieName) {
      MCFStringAcc tmp;
      return WebFormA::SetCookieName(usCookieIndex, tmp.Deref(strCookieName));
    }
    inline CFStringRef GetCookieValue(USHORT usCookieIndex) {
      return tmpCookieValue.Set(WebFormA::GetCookieValue(usCookieIndex));
    }

    inline INT SetCookieValue(USHORT usCookieIndex, CFStringRef strCookieValue) {
      MCFStringAcc tmp;
      return WebFormA::SetCookieValue(usCookieIndex, tmp.Deref(strCookieValue));
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = WebFormA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return WebFormA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(WebFormA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return WebFormA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(WebFormA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return WebFormA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(WebFormA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return WebFormA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }

    inline CFStringRef GetFormVarNames(USHORT usVarIndex) {
      return tmpFormVarNames.Set(WebFormA::GetFormVarNames(usVarIndex));
    }

    inline INT SetFormVarNames(USHORT usVarIndex, CFStringRef strFormVarNames) {
      MCFStringAcc tmp;
      return WebFormA::SetFormVarNames(usVarIndex, tmp.Deref(strFormVarNames));
    }
    inline CFStringRef GetFormVarValues(USHORT usVarIndex) {
      return tmpFormVarValues.Set(WebFormA::GetFormVarValues(usVarIndex));
    }

    inline INT SetFormVarValues(USHORT usVarIndex, CFStringRef strFormVarValues) {
      MCFStringAcc tmp;
      return WebFormA::SetFormVarValues(usVarIndex, tmp.Deref(strFormVarValues));
    }
    inline CFStringRef GetFrom() {
      return tmpFrom.Set(WebFormA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return WebFormA::SetFrom(tmp.Deref(strFrom));
    }
    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(WebFormA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return WebFormA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(WebFormA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return WebFormA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(WebFormA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return WebFormA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(WebFormA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return WebFormA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetProxyAuthorization() {
      return tmpProxyAuthorization.Set(WebFormA::GetProxyAuthorization());
    }

    inline INT SetProxyAuthorization(CFStringRef strProxyAuthorization) {
      MCFStringAcc tmp;
      return WebFormA::SetProxyAuthorization(tmp.Deref(strProxyAuthorization));
    }
    inline CFStringRef GetProxyPassword() {
      return tmpProxyPassword.Set(WebFormA::GetProxyPassword());
    }

    inline INT SetProxyPassword(CFStringRef strProxyPassword) {
      MCFStringAcc tmp;
      return WebFormA::SetProxyPassword(tmp.Deref(strProxyPassword));
    }

    inline CFStringRef GetProxyServer() {
      return tmpProxyServer.Set(WebFormA::GetProxyServer());
    }

    inline INT SetProxyServer(CFStringRef strProxyServer) {
      MCFStringAcc tmp;
      return WebFormA::SetProxyServer(tmp.Deref(strProxyServer));
    }
    inline CFStringRef GetProxyUser() {
      return tmpProxyUser.Set(WebFormA::GetProxyUser());
    }

    inline INT SetProxyUser(CFStringRef strProxyUser) {
      MCFStringAcc tmp;
      return WebFormA::SetProxyUser(tmp.Deref(strProxyUser));
    }
    inline CFStringRef GetReferer() {
      return tmpReferer.Set(WebFormA::GetReferer());
    }

    inline INT SetReferer(CFStringRef strReferer) {
      MCFStringAcc tmp;
      return WebFormA::SetReferer(tmp.Deref(strReferer));
    }

    inline CFStringRef GetStatusLine() {
      return tmpStatusLine.Set(WebFormA::GetStatusLine());
    }


    inline CFStringRef GetTransferredData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = WebFormA::GetTransferredData(tmp, len);
      if (ret_code) return NULL;
      return tmpTransferredData.Set(tmp, len);
    }

    inline CFStringRef GetTransferredHeaders() {
      return tmpTransferredHeaders.Set(WebFormA::GetTransferredHeaders());
    }

    inline CFStringRef GetURL() {
      return tmpURL.Set(WebFormA::GetURL());
    }

    inline INT SetURL(CFStringRef strURL) {
      MCFStringAcc tmp;
      return WebFormA::SetURL(tmp.Deref(strURL));
    }
    inline CFStringRef GetUser() {
      return tmpUser.Set(WebFormA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return WebFormA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetUserAgent() {
      return tmpUserAgent.Set(WebFormA::GetUserAgent());
    }

    inline INT SetUserAgent(CFStringRef strUserAgent) {
      MCFStringAcc tmp;
      return WebFormA::SetUserAgent(tmp.Deref(strUserAgent));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(WebFormA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(WebFormA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return WebFormA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(WebFormA::GetWinsockStatus());
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

      return WebFormA::AddCookie(lpszCookieName, lpszCookieValue);
    }

    inline int AddFormVar(CFStringRef pVarName, CFStringRef pVarValue) {
      MCFStringAcc etmpVarName;
      LPSTR lpszVarName = etmpVarName.Deref(pVarName);
      MCFStringAcc etmpVarValue;
      LPSTR lpszVarValue = etmpVarValue.Deref(pVarValue);

      return WebFormA::AddFormVar(lpszVarName, lpszVarValue);
    }









    inline int SubmitTo(CFStringRef pURL) {
      MCFStringAcc etmpURL;
      LPSTR lpszURL = etmpURL.Deref(pURL);

      return WebFormA::SubmitTo(lpszURL);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAuthorization;
    MUString tmpContentType;
    MUString tmpCookieName;
    MUString tmpCookieValue;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFormVarNames;
    MUString tmpFormVarValues;
    MUString tmpFrom;
    MUString tmpLocalFile;
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
      tmpLastError.Set(WebFormA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetAuthorization() {
      tmpAuthorization.Set(WebFormA::GetAuthorization());
      return tmpAuthorization.Deref();
    }

    inline INT SetAuthorization(LPWSTR lpszAuthorization) {
      MAString tmp(lpszAuthorization);
      return WebFormA::SetAuthorization(tmp.Deref());
    }

    inline LPWSTR GetContentType() {
      tmpContentType.Set(WebFormA::GetContentType());
      return tmpContentType.Deref();
    }

    inline INT SetContentType(LPWSTR lpszContentType) {
      MAString tmp(lpszContentType);
      return WebFormA::SetContentType(tmp.Deref());
    }

    inline LPWSTR GetCookieName(USHORT usCookieIndex) {
      tmpCookieName.Set(WebFormA::GetCookieName(usCookieIndex));
      return tmpCookieName.Deref();
    }

    inline INT SetCookieName(USHORT usCookieIndex, LPWSTR lpszCookieName) {
      MAString tmp(lpszCookieName);
      return WebFormA::SetCookieName(usCookieIndex, tmp.Deref());
    }
    inline LPWSTR GetCookieValue(USHORT usCookieIndex) {
      tmpCookieValue.Set(WebFormA::GetCookieValue(usCookieIndex));
      return tmpCookieValue.Deref();
    }

    inline INT SetCookieValue(USHORT usCookieIndex, LPWSTR lpszCookieValue) {
      MAString tmp(lpszCookieValue);
      return WebFormA::SetCookieValue(usCookieIndex, tmp.Deref());
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = WebFormA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return WebFormA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(WebFormA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return WebFormA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(WebFormA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return WebFormA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(WebFormA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return WebFormA::SetFirewallUser(tmp.Deref());
    }

    inline LPWSTR GetFormVarNames(USHORT usVarIndex) {
      tmpFormVarNames.Set(WebFormA::GetFormVarNames(usVarIndex));
      return tmpFormVarNames.Deref();
    }

    inline INT SetFormVarNames(USHORT usVarIndex, LPWSTR lpszFormVarNames) {
      MAString tmp(lpszFormVarNames);
      return WebFormA::SetFormVarNames(usVarIndex, tmp.Deref());
    }
    inline LPWSTR GetFormVarValues(USHORT usVarIndex) {
      tmpFormVarValues.Set(WebFormA::GetFormVarValues(usVarIndex));
      return tmpFormVarValues.Deref();
    }

    inline INT SetFormVarValues(USHORT usVarIndex, LPWSTR lpszFormVarValues) {
      MAString tmp(lpszFormVarValues);
      return WebFormA::SetFormVarValues(usVarIndex, tmp.Deref());
    }
    inline LPWSTR GetFrom() {
      tmpFrom.Set(WebFormA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return WebFormA::SetFrom(tmp.Deref());
    }
    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(WebFormA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return WebFormA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(WebFormA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return WebFormA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(WebFormA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return WebFormA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(WebFormA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return WebFormA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetProxyAuthorization() {
      tmpProxyAuthorization.Set(WebFormA::GetProxyAuthorization());
      return tmpProxyAuthorization.Deref();
    }

    inline INT SetProxyAuthorization(LPWSTR lpszProxyAuthorization) {
      MAString tmp(lpszProxyAuthorization);
      return WebFormA::SetProxyAuthorization(tmp.Deref());
    }
    inline LPWSTR GetProxyPassword() {
      tmpProxyPassword.Set(WebFormA::GetProxyPassword());
      return tmpProxyPassword.Deref();
    }

    inline INT SetProxyPassword(LPWSTR lpszProxyPassword) {
      MAString tmp(lpszProxyPassword);
      return WebFormA::SetProxyPassword(tmp.Deref());
    }

    inline LPWSTR GetProxyServer() {
      tmpProxyServer.Set(WebFormA::GetProxyServer());
      return tmpProxyServer.Deref();
    }

    inline INT SetProxyServer(LPWSTR lpszProxyServer) {
      MAString tmp(lpszProxyServer);
      return WebFormA::SetProxyServer(tmp.Deref());
    }
    inline LPWSTR GetProxyUser() {
      tmpProxyUser.Set(WebFormA::GetProxyUser());
      return tmpProxyUser.Deref();
    }

    inline INT SetProxyUser(LPWSTR lpszProxyUser) {
      MAString tmp(lpszProxyUser);
      return WebFormA::SetProxyUser(tmp.Deref());
    }
    inline LPWSTR GetReferer() {
      tmpReferer.Set(WebFormA::GetReferer());
      return tmpReferer.Deref();
    }

    inline INT SetReferer(LPWSTR lpszReferer) {
      MAString tmp(lpszReferer);
      return WebFormA::SetReferer(tmp.Deref());
    }

    inline LPWSTR GetStatusLine() {
      tmpStatusLine.Set(WebFormA::GetStatusLine());
      return tmpStatusLine.Deref();
    }


    inline INT GetTransferredData(LPWSTR &lpTransferredData, UINT &lenTransferredData) {
      LPSTR tmp = NULL;
      INT ret_code = WebFormA::GetTransferredData(tmp, lenTransferredData);
      if (ret_code) return ret_code;
      tmpTransferredData.Set(tmp, lenTransferredData);
      lpTransferredData = tmpTransferredData.Deref();
      return 0;
    }

    inline LPWSTR GetTransferredHeaders() {
      tmpTransferredHeaders.Set(WebFormA::GetTransferredHeaders());
      return tmpTransferredHeaders.Deref();
    }

    inline LPWSTR GetURL() {
      tmpURL.Set(WebFormA::GetURL());
      return tmpURL.Deref();
    }

    inline INT SetURL(LPWSTR lpszURL) {
      MAString tmp(lpszURL);
      return WebFormA::SetURL(tmp.Deref());
    }
    inline LPWSTR GetUser() {
      tmpUser.Set(WebFormA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return WebFormA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetUserAgent() {
      tmpUserAgent.Set(WebFormA::GetUserAgent());
      return tmpUserAgent.Deref();
    }

    inline INT SetUserAgent(LPWSTR lpszUserAgent) {
      MAString tmp(lpszUserAgent);
      return WebFormA::SetUserAgent(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(WebFormA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(WebFormA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return WebFormA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(WebFormA::GetWinsockStatus());
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

#endif //_IPWORKS_WEBFORM_H_




