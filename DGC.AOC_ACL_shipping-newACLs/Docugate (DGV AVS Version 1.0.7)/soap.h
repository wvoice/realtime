/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_SOAP_H_
#define _IPWORKS_SOAP_H_

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

#define soapIdle                                           0
#define soapSendRequest                                    1
#define soapReset                                          2
#define soapBuildPacket                                    3
#define soapSendPacket                                     4
#define soapEvalPacket                                     5

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3

#define vfText                                             0
#define vfXML                                              1
#define vfFullXML                                          2


#define SOAP_IDLE                                          0
#define SOAP_SEND_REQUEST                                  1
#define SOAP_RESET                                         2
#define SOAP_BUILD_PACKET                                  3
#define SOAP_SEND_PACKET                                   4
#define SOAP_EVAL_PACKET                                   5

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3

#define VF_TEXT                                            0
#define VF_XML                                             1
#define VF_FULL_XML                                        2



#endif //_IPWORKS_INTERNAL_

#define PID_SOAP_ACTION    1
#define PID_SOAP_ACTIONURI    2
#define PID_SOAP_AUTHORIZATION    3
#define PID_SOAP_CONNECTED    4
#define PID_SOAP_CONTENTTYPE    5
#define PID_SOAP_COOKIECOUNT    6
#define PID_SOAP_COOKIENAME    7
#define PID_SOAP_COOKIEVALUE    8
#define PID_SOAP_FAULTACTOR    9
#define PID_SOAP_FAULTCODE    10
#define PID_SOAP_FAULTSTRING    11
#define PID_SOAP_FIREWALLDATA    12
#define PID_SOAP_FIREWALLHOST    13
#define PID_SOAP_FIREWALLPASSWORD    14
#define PID_SOAP_FIREWALLPORT    15
#define PID_SOAP_FIREWALLTYPE    16
#define PID_SOAP_FIREWALLUSER    17
#define PID_SOAP_FLAGS    18
#define PID_SOAP_OTHERHEADERS    19
#define PID_SOAP_LOCALHOST    20
#define PID_SOAP_METHOD    21
#define PID_SOAP_METHODURI    22
#define PID_SOAP_NAMESPACECOUNT    23
#define PID_SOAP_NAMESPACES    24
#define PID_SOAP_PARAMATTR    25
#define PID_SOAP_PARAMCOUNT    26
#define PID_SOAP_PARAMNAME    27
#define PID_SOAP_PARAMVALUE    28
#define PID_SOAP_PASSWORD    29
#define PID_SOAP_PREFIXES    30
#define PID_SOAP_PROXYAUTHORIZATION    31
#define PID_SOAP_PROXYPORT    32
#define PID_SOAP_PROXYSERVER    33
#define PID_SOAP_RETURNVALUE    34
#define PID_SOAP_SOAPENCODING    35
#define PID_SOAP_SOAPHEADER    36
#define PID_SOAP_SOAPPACKET    37
#define PID_SOAP_SOCKETHANDLE    38
#define PID_SOAP_STATUSLINE    39
#define PID_SOAP_TIMEOUT    40
#define PID_SOAP_URL    41
#define PID_SOAP_USER    42
#define PID_SOAP_USERAGENT    43
#define PID_SOAP_VALUEFORMAT    44
#define PID_SOAP_WINSOCKINFO    45
#define PID_SOAP_WINSOCKLOADED    46
#define PID_SOAP_WINSOCKMAXDATAGRAMSIZE    47
#define PID_SOAP_WINSOCKMAXSOCKETS    48
#define PID_SOAP_WINSOCKPATH    49
#define PID_SOAP_WINSOCKSTATUS    50
#define PID_SOAP_XATTRCOUNT    51
#define PID_SOAP_XATTRNAME    52
#define PID_SOAP_XATTRNAMESPACE    53
#define PID_SOAP_XATTRPREFIX    54
#define PID_SOAP_XATTRVALUE    55
#define PID_SOAP_XCHILDREN    56
#define PID_SOAP_XELEMENT    57
#define PID_SOAP_XNAMESPACE    58
#define PID_SOAP_XPARENT    59
#define PID_SOAP_XPATH    60
#define PID_SOAP_XPREFIX    61
#define PID_SOAP_XTEXT    62


#define MID_SOAP_ADDCOOKIE    1
#define MID_SOAP_ADDPARAM    2
#define MID_SOAP_BUILDPACKET    3
#define MID_SOAP_DOEVENTS    4
#define MID_SOAP_EVALPACKET    5
#define MID_SOAP_INTERRUPT    6
#define MID_SOAP_RESET    7
#define MID_SOAP_SENDPACKET    8
#define MID_SOAP_SENDREQUEST    9


#define EID_SOAP_CONNECTED    1
#define EID_SOAP_DISCONNECTED    2
#define EID_SOAP_ENDTRANSFER    3
#define EID_SOAP_ERROR    4
#define EID_SOAP_HEADER    5
#define EID_SOAP_SETCOOKIE    6
#define EID_SOAP_STARTTRANSFER    7
#define EID_SOAP_TRANSFER    8


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID SOAP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    SOAP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    SOAP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID SOAP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    SOAP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    SOAP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  SOAP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    SOAP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   SOAP_StaticInit(LPVOID hInst);

class SOAPA {
  
  public: //events
  
    virtual INT FireConnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireDisconnected(USHORT &usStatusCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {return 0;}
    virtual INT FireSetCookie(LPSTR &lpszName, LPSTR &lpszValue, LPSTR &lpszExpires, LPSTR &lpszDomain, LPSTR &lpszPath, BOOL &bSecure) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_SOAP_CONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SOAPA*)lpObj)->FireConnected(pStatusCode, pDescription);
         }
         case EID_SOAP_DISCONNECTED: {
                        USHORT pStatusCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SOAPA*)lpObj)->FireDisconnected(pStatusCode, pDescription);
         }
         case EID_SOAP_ENDTRANSFER: {
            
            return ((SOAPA*)lpObj)->FireEndTransfer();
         }
         case EID_SOAP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SOAPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_SOAP_HEADER: {
                        LPSTR pField = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SOAPA*)lpObj)->FireHeader(pField, pValue);
         }
         case EID_SOAP_SETCOOKIE: {
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
            
            
            return ((SOAPA*)lpObj)->FireSetCookie(pName, pValue, pExpires, pDomain, pPath, pSecure);
         }
         case EID_SOAP_STARTTRANSFER: {
            
            return ((SOAPA*)lpObj)->FireStartTransfer();
         }
         case EID_SOAP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SOAPA*)lpObj)->FireTransfer(pBytesTransferred);
         }

      }
      return 0;
    }

  public:

    SOAPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_55) {
      m_pObj = SOAP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~SOAPA() {
      SOAP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)SOAP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return SOAP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)SOAP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return SOAP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return SOAP_Set(m_pObj, PID_SOAP_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetActionURI() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_ACTIONURI, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetActionURI(LPCSTR lpszActionURI) {
      int val = (int)lpszActionURI;
      return SOAP_Set(m_pObj, PID_SOAP_ACTIONURI, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAuthorization() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_AUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAuthorization(LPCSTR lpszAuthorization) {
      int val = (int)lpszAuthorization;
      return SOAP_Set(m_pObj, PID_SOAP_AUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline LPCSTR GetContentType() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_CONTENTTYPE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetContentType(LPCSTR lpszContentType) {
      int val = (int)lpszContentType;
      return SOAP_Set(m_pObj, PID_SOAP_CONTENTTYPE, 0, (LPVOID)val, 0);
    }
    inline INT GetCookieCount() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_COOKIECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetCookieCount(INT iCookieCount) {
      int val = (int)iCookieCount;
      return SOAP_Set(m_pObj, PID_SOAP_COOKIECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieName(USHORT usCookieIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_COOKIENAME, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieName(USHORT usCookieIndex, LPCSTR lpszCookieName) {
      int val = (int)lpszCookieName;
      return SOAP_Set(m_pObj, PID_SOAP_COOKIENAME, usCookieIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetCookieValue(USHORT usCookieIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_COOKIEVALUE, usCookieIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetCookieValue(USHORT usCookieIndex, LPCSTR lpszCookieValue) {
      int val = (int)lpszCookieValue;
      return SOAP_Set(m_pObj, PID_SOAP_COOKIEVALUE, usCookieIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetFaultActor() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FAULTACTOR, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetFaultCode() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FAULTCODE, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetFaultString() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FAULTSTRING, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)SOAP_Get(m_pObj, PID_SOAP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return SOAP_Set(m_pObj, PID_SOAP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return SOAP_Set(m_pObj, PID_SOAP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return SOAP_Set(m_pObj, PID_SOAP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return SOAP_Set(m_pObj, PID_SOAP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return SOAP_Set(m_pObj, PID_SOAP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return SOAP_Set(m_pObj, PID_SOAP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LONG GetFlags() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_FLAGS, 0, 0);
      return (LONG)val;
    }
    inline INT SetFlags(LONG lFlags) {
      int val = (int)lFlags;
      return SOAP_Set(m_pObj, PID_SOAP_FLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return SOAP_Set(m_pObj, PID_SOAP_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return SOAP_Set(m_pObj, PID_SOAP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMethod() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_METHOD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMethod(LPCSTR lpszMethod) {
      int val = (int)lpszMethod;
      return SOAP_Set(m_pObj, PID_SOAP_METHOD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMethodURI() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_METHODURI, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMethodURI(LPCSTR lpszMethodURI) {
      int val = (int)lpszMethodURI;
      return SOAP_Set(m_pObj, PID_SOAP_METHODURI, 0, (LPVOID)val, 0);
    }
    inline INT GetNamespaceCount() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_NAMESPACECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetNamespaceCount(INT iNamespaceCount) {
      int val = (int)iNamespaceCount;
      return SOAP_Set(m_pObj, PID_SOAP_NAMESPACECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetNamespaces(USHORT usNamespaceIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_NAMESPACES, usNamespaceIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetNamespaces(USHORT usNamespaceIndex, LPCSTR lpszNamespaces) {
      int val = (int)lpszNamespaces;
      return SOAP_Set(m_pObj, PID_SOAP_NAMESPACES, usNamespaceIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetParamAttr(USHORT usParamIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PARAMATTR, usParamIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetParamAttr(USHORT usParamIndex, LPCSTR lpszParamAttr) {
      int val = (int)lpszParamAttr;
      return SOAP_Set(m_pObj, PID_SOAP_PARAMATTR, usParamIndex, (LPVOID)val, 0);
    }
    inline INT GetParamCount() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PARAMCOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetParamCount(INT iParamCount) {
      int val = (int)iParamCount;
      return SOAP_Set(m_pObj, PID_SOAP_PARAMCOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetParamName(USHORT usParamIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PARAMNAME, usParamIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetParamName(USHORT usParamIndex, LPCSTR lpszParamName) {
      int val = (int)lpszParamName;
      return SOAP_Set(m_pObj, PID_SOAP_PARAMNAME, usParamIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetParamValue(USHORT usParamIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PARAMVALUE, usParamIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetParamValue(USHORT usParamIndex, LPCSTR lpszParamValue) {
      int val = (int)lpszParamValue;
      return SOAP_Set(m_pObj, PID_SOAP_PARAMVALUE, usParamIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return SOAP_Set(m_pObj, PID_SOAP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPrefixes(USHORT usNamespaceIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PREFIXES, usNamespaceIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetPrefixes(USHORT usNamespaceIndex, LPCSTR lpszPrefixes) {
      int val = (int)lpszPrefixes;
      return SOAP_Set(m_pObj, PID_SOAP_PREFIXES, usNamespaceIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyAuthorization() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PROXYAUTHORIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyAuthorization(LPCSTR lpszProxyAuthorization) {
      int val = (int)lpszProxyAuthorization;
      return SOAP_Set(m_pObj, PID_SOAP_PROXYAUTHORIZATION, 0, (LPVOID)val, 0);
    }
    inline USHORT GetProxyPort() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PROXYPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetProxyPort(USHORT usProxyPort) {
      int val = (int)usProxyPort;
      return SOAP_Set(m_pObj, PID_SOAP_PROXYPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetProxyServer() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_PROXYSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetProxyServer(LPCSTR lpszProxyServer) {
      int val = (int)lpszProxyServer;
      return SOAP_Set(m_pObj, PID_SOAP_PROXYSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReturnValue() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_RETURNVALUE, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetSOAPEncoding() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_SOAPENCODING, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSOAPEncoding(LPCSTR lpszSOAPEncoding) {
      int val = (int)lpszSOAPEncoding;
      return SOAP_Set(m_pObj, PID_SOAP_SOAPENCODING, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSOAPHeader() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_SOAPHEADER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSOAPHeader(LPCSTR lpszSOAPHeader) {
      int val = (int)lpszSOAPHeader;
      return SOAP_Set(m_pObj, PID_SOAP_SOAPHEADER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSOAPPacket() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_SOAPPACKET, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSOAPPacket(LPCSTR lpszSOAPPacket) {
      int val = (int)lpszSOAPPacket;
      return SOAP_Set(m_pObj, PID_SOAP_SOAPPACKET, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetStatusLine() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_STATUSLINE, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetTimeout() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return SOAP_Set(m_pObj, PID_SOAP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetURL() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_URL, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetURL(LPCSTR lpszURL) {
      int val = (int)lpszURL;
      return SOAP_Set(m_pObj, PID_SOAP_URL, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return SOAP_Set(m_pObj, PID_SOAP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUserAgent() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_USERAGENT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUserAgent(LPCSTR lpszUserAgent) {
      int val = (int)lpszUserAgent;
      return SOAP_Set(m_pObj, PID_SOAP_USERAGENT, 0, (LPVOID)val, 0);
    }
    inline INT GetValueFormat() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_VALUEFORMAT, 0, 0);
      return (INT)val;
    }
    inline INT SetValueFormat(INT iValueFormat) {
      int val = (int)iValueFormat;
      return SOAP_Set(m_pObj, PID_SOAP_VALUEFORMAT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return SOAP_Set(m_pObj, PID_SOAP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return SOAP_Set(m_pObj, PID_SOAP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetXAttrCount() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XATTRCOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetXAttrName(USHORT usAttrIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XATTRNAME, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXAttrNamespace(USHORT usAttrIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XATTRNAMESPACE, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXAttrPrefix(USHORT usAttrIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XATTRPREFIX, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXAttrValue(USHORT usAttrIndex) {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XATTRVALUE, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline INT GetXChildren() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XCHILDREN, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetXElement() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XELEMENT, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXNamespace() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XNAMESPACE, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXParent() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XPARENT, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXPath() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetXPath(LPCSTR lpszXPath) {
      int val = (int)lpszXPath;
      return SOAP_Set(m_pObj, PID_SOAP_XPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetXPrefix() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XPREFIX, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXText() {
      int val = (int)SOAP_Get(m_pObj, PID_SOAP_XTEXT, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int AddCookie(LPSTR lpszCookieName, LPSTR lpszCookieValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszCookieName, (LPVOID)(INT)lpszCookieValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_ADDCOOKIE, 2, param, cbparam);
      
      
    }
    inline int AddParam(LPSTR lpszParamName, LPSTR lpszParamValue) {
      LPVOID param[2+1] = {(LPVOID)(INT)lpszParamName, (LPVOID)(INT)lpszParamValue, NULL};
      UINT cbparam[2+1] = {0, 0, (UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_ADDPARAM, 2, param, cbparam);
      
      
    }
    inline int BuildPacket() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_BUILDPACKET, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int EvalPacket() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_EVALPACKET, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_RESET, 0, param, cbparam);
      
      
    }
    inline int SendPacket() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_SENDPACKET, 0, param, cbparam);
      
      
    }
    inline int SendRequest() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SOAP_Do(m_pObj, MID_SOAP_SENDREQUEST, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class SOAP : public SOAPA {
  
  public:
    SOAP(LPCSTR lpOemKey = IPWORKS_OEMKEY_55):SOAPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpActionURI;
    MCFStringRef tmpAuthorization;
    MCFStringRef tmpContentType;
    MCFStringRef tmpCookieName;
    MCFStringRef tmpCookieValue;
    MCFStringRef tmpFaultActor;
    MCFStringRef tmpFaultCode;
    MCFStringRef tmpFaultString;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpOtherHeaders;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMethod;
    MCFStringRef tmpMethodURI;
    MCFStringRef tmpNamespaces;
    MCFStringRef tmpParamAttr;
    MCFStringRef tmpParamName;
    MCFStringRef tmpParamValue;
    MCFStringRef tmpPassword;
    MCFStringRef tmpPrefixes;
    MCFStringRef tmpProxyAuthorization;
    MCFStringRef tmpProxyServer;
    MCFStringRef tmpReturnValue;
    MCFStringRef tmpSOAPEncoding;
    MCFStringRef tmpSOAPHeader;
    MCFStringRef tmpSOAPPacket;
    MCFStringRef tmpStatusLine;
    MCFStringRef tmpURL;
    MCFStringRef tmpUser;
    MCFStringRef tmpUserAgent;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;
    MCFStringRef tmpXAttrName;
    MCFStringRef tmpXAttrNamespace;
    MCFStringRef tmpXAttrPrefix;
    MCFStringRef tmpXAttrValue;
    MCFStringRef tmpXElement;
    MCFStringRef tmpXNamespace;
    MCFStringRef tmpXParent;
    MCFStringRef tmpXPath;
    MCFStringRef tmpXPrefix;
    MCFStringRef tmpXText;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(SOAPA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetActionURI() {
      return tmpActionURI.Set(SOAPA::GetActionURI());
    }

    inline INT SetActionURI(CFStringRef strActionURI) {
      MCFStringAcc tmp;
      return SOAPA::SetActionURI(tmp.Deref(strActionURI));
    }
    inline CFStringRef GetAuthorization() {
      return tmpAuthorization.Set(SOAPA::GetAuthorization());
    }

    inline INT SetAuthorization(CFStringRef strAuthorization) {
      MCFStringAcc tmp;
      return SOAPA::SetAuthorization(tmp.Deref(strAuthorization));
    }

    inline CFStringRef GetContentType() {
      return tmpContentType.Set(SOAPA::GetContentType());
    }

    inline INT SetContentType(CFStringRef strContentType) {
      MCFStringAcc tmp;
      return SOAPA::SetContentType(tmp.Deref(strContentType));
    }

    inline CFStringRef GetCookieName(USHORT usCookieIndex) {
      return tmpCookieName.Set(SOAPA::GetCookieName(usCookieIndex));
    }

    inline INT SetCookieName(USHORT usCookieIndex, CFStringRef strCookieName) {
      MCFStringAcc tmp;
      return SOAPA::SetCookieName(usCookieIndex, tmp.Deref(strCookieName));
    }
    inline CFStringRef GetCookieValue(USHORT usCookieIndex) {
      return tmpCookieValue.Set(SOAPA::GetCookieValue(usCookieIndex));
    }

    inline INT SetCookieValue(USHORT usCookieIndex, CFStringRef strCookieValue) {
      MCFStringAcc tmp;
      return SOAPA::SetCookieValue(usCookieIndex, tmp.Deref(strCookieValue));
    }
    inline CFStringRef GetFaultActor() {
      return tmpFaultActor.Set(SOAPA::GetFaultActor());
    }

    inline CFStringRef GetFaultCode() {
      return tmpFaultCode.Set(SOAPA::GetFaultCode());
    }

    inline CFStringRef GetFaultString() {
      return tmpFaultString.Set(SOAPA::GetFaultString());
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = SOAPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return SOAPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(SOAPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return SOAPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(SOAPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return SOAPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(SOAPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return SOAPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }

    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(SOAPA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return SOAPA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(SOAPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return SOAPA::SetLocalHost(tmp.Deref(strLocalHost));
    }
    inline CFStringRef GetMethod() {
      return tmpMethod.Set(SOAPA::GetMethod());
    }

    inline INT SetMethod(CFStringRef strMethod) {
      MCFStringAcc tmp;
      return SOAPA::SetMethod(tmp.Deref(strMethod));
    }
    inline CFStringRef GetMethodURI() {
      return tmpMethodURI.Set(SOAPA::GetMethodURI());
    }

    inline INT SetMethodURI(CFStringRef strMethodURI) {
      MCFStringAcc tmp;
      return SOAPA::SetMethodURI(tmp.Deref(strMethodURI));
    }

    inline CFStringRef GetNamespaces(USHORT usNamespaceIndex) {
      return tmpNamespaces.Set(SOAPA::GetNamespaces(usNamespaceIndex));
    }

    inline INT SetNamespaces(USHORT usNamespaceIndex, CFStringRef strNamespaces) {
      MCFStringAcc tmp;
      return SOAPA::SetNamespaces(usNamespaceIndex, tmp.Deref(strNamespaces));
    }
    inline CFStringRef GetParamAttr(USHORT usParamIndex) {
      return tmpParamAttr.Set(SOAPA::GetParamAttr(usParamIndex));
    }

    inline INT SetParamAttr(USHORT usParamIndex, CFStringRef strParamAttr) {
      MCFStringAcc tmp;
      return SOAPA::SetParamAttr(usParamIndex, tmp.Deref(strParamAttr));
    }

    inline CFStringRef GetParamName(USHORT usParamIndex) {
      return tmpParamName.Set(SOAPA::GetParamName(usParamIndex));
    }

    inline INT SetParamName(USHORT usParamIndex, CFStringRef strParamName) {
      MCFStringAcc tmp;
      return SOAPA::SetParamName(usParamIndex, tmp.Deref(strParamName));
    }
    inline CFStringRef GetParamValue(USHORT usParamIndex) {
      return tmpParamValue.Set(SOAPA::GetParamValue(usParamIndex));
    }

    inline INT SetParamValue(USHORT usParamIndex, CFStringRef strParamValue) {
      MCFStringAcc tmp;
      return SOAPA::SetParamValue(usParamIndex, tmp.Deref(strParamValue));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(SOAPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return SOAPA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetPrefixes(USHORT usNamespaceIndex) {
      return tmpPrefixes.Set(SOAPA::GetPrefixes(usNamespaceIndex));
    }

    inline INT SetPrefixes(USHORT usNamespaceIndex, CFStringRef strPrefixes) {
      MCFStringAcc tmp;
      return SOAPA::SetPrefixes(usNamespaceIndex, tmp.Deref(strPrefixes));
    }
    inline CFStringRef GetProxyAuthorization() {
      return tmpProxyAuthorization.Set(SOAPA::GetProxyAuthorization());
    }

    inline INT SetProxyAuthorization(CFStringRef strProxyAuthorization) {
      MCFStringAcc tmp;
      return SOAPA::SetProxyAuthorization(tmp.Deref(strProxyAuthorization));
    }

    inline CFStringRef GetProxyServer() {
      return tmpProxyServer.Set(SOAPA::GetProxyServer());
    }

    inline INT SetProxyServer(CFStringRef strProxyServer) {
      MCFStringAcc tmp;
      return SOAPA::SetProxyServer(tmp.Deref(strProxyServer));
    }
    inline CFStringRef GetReturnValue() {
      return tmpReturnValue.Set(SOAPA::GetReturnValue());
    }

    inline CFStringRef GetSOAPEncoding() {
      return tmpSOAPEncoding.Set(SOAPA::GetSOAPEncoding());
    }

    inline INT SetSOAPEncoding(CFStringRef strSOAPEncoding) {
      MCFStringAcc tmp;
      return SOAPA::SetSOAPEncoding(tmp.Deref(strSOAPEncoding));
    }
    inline CFStringRef GetSOAPHeader() {
      return tmpSOAPHeader.Set(SOAPA::GetSOAPHeader());
    }

    inline INT SetSOAPHeader(CFStringRef strSOAPHeader) {
      MCFStringAcc tmp;
      return SOAPA::SetSOAPHeader(tmp.Deref(strSOAPHeader));
    }
    inline CFStringRef GetSOAPPacket() {
      return tmpSOAPPacket.Set(SOAPA::GetSOAPPacket());
    }

    inline INT SetSOAPPacket(CFStringRef strSOAPPacket) {
      MCFStringAcc tmp;
      return SOAPA::SetSOAPPacket(tmp.Deref(strSOAPPacket));
    }

    inline CFStringRef GetStatusLine() {
      return tmpStatusLine.Set(SOAPA::GetStatusLine());
    }


    inline CFStringRef GetURL() {
      return tmpURL.Set(SOAPA::GetURL());
    }

    inline INT SetURL(CFStringRef strURL) {
      MCFStringAcc tmp;
      return SOAPA::SetURL(tmp.Deref(strURL));
    }
    inline CFStringRef GetUser() {
      return tmpUser.Set(SOAPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return SOAPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetUserAgent() {
      return tmpUserAgent.Set(SOAPA::GetUserAgent());
    }

    inline INT SetUserAgent(CFStringRef strUserAgent) {
      MCFStringAcc tmp;
      return SOAPA::SetUserAgent(tmp.Deref(strUserAgent));
    }

    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(SOAPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(SOAPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return SOAPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(SOAPA::GetWinsockStatus());
    }


    inline CFStringRef GetXAttrName(USHORT usAttrIndex) {
      return tmpXAttrName.Set(SOAPA::GetXAttrName(usAttrIndex));
    }

    inline CFStringRef GetXAttrNamespace(USHORT usAttrIndex) {
      return tmpXAttrNamespace.Set(SOAPA::GetXAttrNamespace(usAttrIndex));
    }

    inline CFStringRef GetXAttrPrefix(USHORT usAttrIndex) {
      return tmpXAttrPrefix.Set(SOAPA::GetXAttrPrefix(usAttrIndex));
    }

    inline CFStringRef GetXAttrValue(USHORT usAttrIndex) {
      return tmpXAttrValue.Set(SOAPA::GetXAttrValue(usAttrIndex));
    }


    inline CFStringRef GetXElement() {
      return tmpXElement.Set(SOAPA::GetXElement());
    }

    inline CFStringRef GetXNamespace() {
      return tmpXNamespace.Set(SOAPA::GetXNamespace());
    }

    inline CFStringRef GetXParent() {
      return tmpXParent.Set(SOAPA::GetXParent());
    }

    inline CFStringRef GetXPath() {
      return tmpXPath.Set(SOAPA::GetXPath());
    }

    inline INT SetXPath(CFStringRef strXPath) {
      MCFStringAcc tmp;
      return SOAPA::SetXPath(tmp.Deref(strXPath));
    }
    inline CFStringRef GetXPrefix() {
      return tmpXPrefix.Set(SOAPA::GetXPrefix());
    }

    inline CFStringRef GetXText() {
      return tmpXText.Set(SOAPA::GetXText());
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







  public:
  
    //redeclare methods with CFString parameters

    inline int AddCookie(CFStringRef pCookieName, CFStringRef pCookieValue) {
      MCFStringAcc etmpCookieName;
      LPSTR lpszCookieName = etmpCookieName.Deref(pCookieName);
      MCFStringAcc etmpCookieValue;
      LPSTR lpszCookieValue = etmpCookieValue.Deref(pCookieValue);

      return SOAPA::AddCookie(lpszCookieName, lpszCookieValue);
    }

    inline int AddParam(CFStringRef pParamName, CFStringRef pParamValue) {
      MCFStringAcc etmpParamName;
      LPSTR lpszParamName = etmpParamName.Deref(pParamName);
      MCFStringAcc etmpParamValue;
      LPSTR lpszParamValue = etmpParamValue.Deref(pParamValue);

      return SOAPA::AddParam(lpszParamName, lpszParamValue);
    }

















#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpActionURI;
    MUString tmpAuthorization;
    MUString tmpContentType;
    MUString tmpCookieName;
    MUString tmpCookieValue;
    MUString tmpFaultActor;
    MUString tmpFaultCode;
    MUString tmpFaultString;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpOtherHeaders;
    MUString tmpLocalHost;
    MUString tmpMethod;
    MUString tmpMethodURI;
    MUString tmpNamespaces;
    MUString tmpParamAttr;
    MUString tmpParamName;
    MUString tmpParamValue;
    MUString tmpPassword;
    MUString tmpPrefixes;
    MUString tmpProxyAuthorization;
    MUString tmpProxyServer;
    MUString tmpReturnValue;
    MUString tmpSOAPEncoding;
    MUString tmpSOAPHeader;
    MUString tmpSOAPPacket;
    MUString tmpStatusLine;
    MUString tmpURL;
    MUString tmpUser;
    MUString tmpUserAgent;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;
    MUString tmpXAttrName;
    MUString tmpXAttrNamespace;
    MUString tmpXAttrPrefix;
    MUString tmpXAttrValue;
    MUString tmpXElement;
    MUString tmpXNamespace;
    MUString tmpXParent;
    MUString tmpXPath;
    MUString tmpXPrefix;
    MUString tmpXText;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(SOAPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetActionURI() {
      tmpActionURI.Set(SOAPA::GetActionURI());
      return tmpActionURI.Deref();
    }

    inline INT SetActionURI(LPWSTR lpszActionURI) {
      MAString tmp(lpszActionURI);
      return SOAPA::SetActionURI(tmp.Deref());
    }
    inline LPWSTR GetAuthorization() {
      tmpAuthorization.Set(SOAPA::GetAuthorization());
      return tmpAuthorization.Deref();
    }

    inline INT SetAuthorization(LPWSTR lpszAuthorization) {
      MAString tmp(lpszAuthorization);
      return SOAPA::SetAuthorization(tmp.Deref());
    }

    inline LPWSTR GetContentType() {
      tmpContentType.Set(SOAPA::GetContentType());
      return tmpContentType.Deref();
    }

    inline INT SetContentType(LPWSTR lpszContentType) {
      MAString tmp(lpszContentType);
      return SOAPA::SetContentType(tmp.Deref());
    }

    inline LPWSTR GetCookieName(USHORT usCookieIndex) {
      tmpCookieName.Set(SOAPA::GetCookieName(usCookieIndex));
      return tmpCookieName.Deref();
    }

    inline INT SetCookieName(USHORT usCookieIndex, LPWSTR lpszCookieName) {
      MAString tmp(lpszCookieName);
      return SOAPA::SetCookieName(usCookieIndex, tmp.Deref());
    }
    inline LPWSTR GetCookieValue(USHORT usCookieIndex) {
      tmpCookieValue.Set(SOAPA::GetCookieValue(usCookieIndex));
      return tmpCookieValue.Deref();
    }

    inline INT SetCookieValue(USHORT usCookieIndex, LPWSTR lpszCookieValue) {
      MAString tmp(lpszCookieValue);
      return SOAPA::SetCookieValue(usCookieIndex, tmp.Deref());
    }
    inline LPWSTR GetFaultActor() {
      tmpFaultActor.Set(SOAPA::GetFaultActor());
      return tmpFaultActor.Deref();
    }

    inline LPWSTR GetFaultCode() {
      tmpFaultCode.Set(SOAPA::GetFaultCode());
      return tmpFaultCode.Deref();
    }

    inline LPWSTR GetFaultString() {
      tmpFaultString.Set(SOAPA::GetFaultString());
      return tmpFaultString.Deref();
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = SOAPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return SOAPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(SOAPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return SOAPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(SOAPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return SOAPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(SOAPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return SOAPA::SetFirewallUser(tmp.Deref());
    }

    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(SOAPA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return SOAPA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(SOAPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return SOAPA::SetLocalHost(tmp.Deref());
    }
    inline LPWSTR GetMethod() {
      tmpMethod.Set(SOAPA::GetMethod());
      return tmpMethod.Deref();
    }

    inline INT SetMethod(LPWSTR lpszMethod) {
      MAString tmp(lpszMethod);
      return SOAPA::SetMethod(tmp.Deref());
    }
    inline LPWSTR GetMethodURI() {
      tmpMethodURI.Set(SOAPA::GetMethodURI());
      return tmpMethodURI.Deref();
    }

    inline INT SetMethodURI(LPWSTR lpszMethodURI) {
      MAString tmp(lpszMethodURI);
      return SOAPA::SetMethodURI(tmp.Deref());
    }

    inline LPWSTR GetNamespaces(USHORT usNamespaceIndex) {
      tmpNamespaces.Set(SOAPA::GetNamespaces(usNamespaceIndex));
      return tmpNamespaces.Deref();
    }

    inline INT SetNamespaces(USHORT usNamespaceIndex, LPWSTR lpszNamespaces) {
      MAString tmp(lpszNamespaces);
      return SOAPA::SetNamespaces(usNamespaceIndex, tmp.Deref());
    }
    inline LPWSTR GetParamAttr(USHORT usParamIndex) {
      tmpParamAttr.Set(SOAPA::GetParamAttr(usParamIndex));
      return tmpParamAttr.Deref();
    }

    inline INT SetParamAttr(USHORT usParamIndex, LPWSTR lpszParamAttr) {
      MAString tmp(lpszParamAttr);
      return SOAPA::SetParamAttr(usParamIndex, tmp.Deref());
    }

    inline LPWSTR GetParamName(USHORT usParamIndex) {
      tmpParamName.Set(SOAPA::GetParamName(usParamIndex));
      return tmpParamName.Deref();
    }

    inline INT SetParamName(USHORT usParamIndex, LPWSTR lpszParamName) {
      MAString tmp(lpszParamName);
      return SOAPA::SetParamName(usParamIndex, tmp.Deref());
    }
    inline LPWSTR GetParamValue(USHORT usParamIndex) {
      tmpParamValue.Set(SOAPA::GetParamValue(usParamIndex));
      return tmpParamValue.Deref();
    }

    inline INT SetParamValue(USHORT usParamIndex, LPWSTR lpszParamValue) {
      MAString tmp(lpszParamValue);
      return SOAPA::SetParamValue(usParamIndex, tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(SOAPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return SOAPA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetPrefixes(USHORT usNamespaceIndex) {
      tmpPrefixes.Set(SOAPA::GetPrefixes(usNamespaceIndex));
      return tmpPrefixes.Deref();
    }

    inline INT SetPrefixes(USHORT usNamespaceIndex, LPWSTR lpszPrefixes) {
      MAString tmp(lpszPrefixes);
      return SOAPA::SetPrefixes(usNamespaceIndex, tmp.Deref());
    }
    inline LPWSTR GetProxyAuthorization() {
      tmpProxyAuthorization.Set(SOAPA::GetProxyAuthorization());
      return tmpProxyAuthorization.Deref();
    }

    inline INT SetProxyAuthorization(LPWSTR lpszProxyAuthorization) {
      MAString tmp(lpszProxyAuthorization);
      return SOAPA::SetProxyAuthorization(tmp.Deref());
    }

    inline LPWSTR GetProxyServer() {
      tmpProxyServer.Set(SOAPA::GetProxyServer());
      return tmpProxyServer.Deref();
    }

    inline INT SetProxyServer(LPWSTR lpszProxyServer) {
      MAString tmp(lpszProxyServer);
      return SOAPA::SetProxyServer(tmp.Deref());
    }
    inline LPWSTR GetReturnValue() {
      tmpReturnValue.Set(SOAPA::GetReturnValue());
      return tmpReturnValue.Deref();
    }

    inline LPWSTR GetSOAPEncoding() {
      tmpSOAPEncoding.Set(SOAPA::GetSOAPEncoding());
      return tmpSOAPEncoding.Deref();
    }

    inline INT SetSOAPEncoding(LPWSTR lpszSOAPEncoding) {
      MAString tmp(lpszSOAPEncoding);
      return SOAPA::SetSOAPEncoding(tmp.Deref());
    }
    inline LPWSTR GetSOAPHeader() {
      tmpSOAPHeader.Set(SOAPA::GetSOAPHeader());
      return tmpSOAPHeader.Deref();
    }

    inline INT SetSOAPHeader(LPWSTR lpszSOAPHeader) {
      MAString tmp(lpszSOAPHeader);
      return SOAPA::SetSOAPHeader(tmp.Deref());
    }
    inline LPWSTR GetSOAPPacket() {
      tmpSOAPPacket.Set(SOAPA::GetSOAPPacket());
      return tmpSOAPPacket.Deref();
    }

    inline INT SetSOAPPacket(LPWSTR lpszSOAPPacket) {
      MAString tmp(lpszSOAPPacket);
      return SOAPA::SetSOAPPacket(tmp.Deref());
    }

    inline LPWSTR GetStatusLine() {
      tmpStatusLine.Set(SOAPA::GetStatusLine());
      return tmpStatusLine.Deref();
    }


    inline LPWSTR GetURL() {
      tmpURL.Set(SOAPA::GetURL());
      return tmpURL.Deref();
    }

    inline INT SetURL(LPWSTR lpszURL) {
      MAString tmp(lpszURL);
      return SOAPA::SetURL(tmp.Deref());
    }
    inline LPWSTR GetUser() {
      tmpUser.Set(SOAPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return SOAPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetUserAgent() {
      tmpUserAgent.Set(SOAPA::GetUserAgent());
      return tmpUserAgent.Deref();
    }

    inline INT SetUserAgent(LPWSTR lpszUserAgent) {
      MAString tmp(lpszUserAgent);
      return SOAPA::SetUserAgent(tmp.Deref());
    }

    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(SOAPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(SOAPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return SOAPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(SOAPA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }


    inline LPWSTR GetXAttrName(USHORT usAttrIndex) {
      tmpXAttrName.Set(SOAPA::GetXAttrName(usAttrIndex));
      return tmpXAttrName.Deref();
    }

    inline LPWSTR GetXAttrNamespace(USHORT usAttrIndex) {
      tmpXAttrNamespace.Set(SOAPA::GetXAttrNamespace(usAttrIndex));
      return tmpXAttrNamespace.Deref();
    }

    inline LPWSTR GetXAttrPrefix(USHORT usAttrIndex) {
      tmpXAttrPrefix.Set(SOAPA::GetXAttrPrefix(usAttrIndex));
      return tmpXAttrPrefix.Deref();
    }

    inline LPWSTR GetXAttrValue(USHORT usAttrIndex) {
      tmpXAttrValue.Set(SOAPA::GetXAttrValue(usAttrIndex));
      return tmpXAttrValue.Deref();
    }


    inline LPWSTR GetXElement() {
      tmpXElement.Set(SOAPA::GetXElement());
      return tmpXElement.Deref();
    }

    inline LPWSTR GetXNamespace() {
      tmpXNamespace.Set(SOAPA::GetXNamespace());
      return tmpXNamespace.Deref();
    }

    inline LPWSTR GetXParent() {
      tmpXParent.Set(SOAPA::GetXParent());
      return tmpXParent.Deref();
    }

    inline LPWSTR GetXPath() {
      tmpXPath.Set(SOAPA::GetXPath());
      return tmpXPath.Deref();
    }

    inline INT SetXPath(LPWSTR lpszXPath) {
      MAString tmp(lpszXPath);
      return SOAPA::SetXPath(tmp.Deref());
    }
    inline LPWSTR GetXPrefix() {
      tmpXPrefix.Set(SOAPA::GetXPrefix());
      return tmpXPrefix.Deref();
    }

    inline LPWSTR GetXText() {
      tmpXText.Set(SOAPA::GetXText());
      return tmpXText.Deref();
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







#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_SOAP_H_




