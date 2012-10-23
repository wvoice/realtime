/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_POP_H_
#define _IPWORKS_POP_H_

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

#define popIdle                                            0
#define popConnect                                         1
#define popDisconnect                                      2
#define popRetrieve                                        3
#define popDelete                                          4
#define popReset                                           5

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define POP_IDLE                                           0
#define POP_CONNECT                                        1
#define POP_DISCONNECT                                     2
#define POP_RETRIEVE                                       3
#define POP_DELETE                                         4
#define POP_RESET                                          5

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_POP_ACTION    1
#define PID_POP_COMMAND    2
#define PID_POP_CONNECTED    3
#define PID_POP_FIREWALLDATA    4
#define PID_POP_FIREWALLHOST    5
#define PID_POP_FIREWALLPASSWORD    6
#define PID_POP_FIREWALLPORT    7
#define PID_POP_FIREWALLTYPE    8
#define PID_POP_FIREWALLUSER    9
#define PID_POP_LASTREPLY    10
#define PID_POP_LOCALFILE    11
#define PID_POP_LOCALHOST    12
#define PID_POP_MAILPORT    13
#define PID_POP_MAILSERVER    14
#define PID_POP_MAXLINELENGTH    15
#define PID_POP_MAXLINES    16
#define PID_POP_MESSAGECOUNT    17
#define PID_POP_MESSAGEHEADERS    18
#define PID_POP_MESSAGENUMBER    19
#define PID_POP_MESSAGESIZE    20
#define PID_POP_MESSAGETEXT    21
#define PID_POP_MESSAGEUID    22
#define PID_POP_PASSWORD    23
#define PID_POP_SOCKETHANDLE    24
#define PID_POP_TIMEOUT    25
#define PID_POP_TOTALSIZE    26
#define PID_POP_USER    27
#define PID_POP_WINSOCKINFO    28
#define PID_POP_WINSOCKLOADED    29
#define PID_POP_WINSOCKMAXDATAGRAMSIZE    30
#define PID_POP_WINSOCKMAXSOCKETS    31
#define PID_POP_WINSOCKPATH    32
#define PID_POP_WINSOCKSTATUS    33


#define MID_POP_CONNECT    1
#define MID_POP_DELETE    2
#define MID_POP_DISCONNECT    3
#define MID_POP_DOEVENTS    4
#define MID_POP_INTERRUPT    5
#define MID_POP_RESET    6
#define MID_POP_RETRIEVE    7


#define EID_POP_ENDTRANSFER    1
#define EID_POP_ERROR    2
#define EID_POP_HEADER    3
#define EID_POP_PITRAIL    4
#define EID_POP_STARTTRANSFER    5
#define EID_POP_TRANSFER    6


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID POP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    POP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    POP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID POP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    POP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    POP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  POP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    POP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   POP_StaticInit(LPVOID hInst);

class POPA {
  
  public: //events
  
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_POP_ENDTRANSFER: {
            
            return ((POPA*)lpObj)->FireEndTransfer();
         }
         case EID_POP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((POPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_POP_HEADER: {
                        LPSTR pField = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((POPA*)lpObj)->FireHeader(pField, pValue);
         }
         case EID_POP_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((POPA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_POP_STARTTRANSFER: {
            
            return ((POPA*)lpObj)->FireStartTransfer();
         }
         case EID_POP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
                        BOOL pEOL = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((POPA*)lpObj)->FireTransfer(pBytesTransferred, pText, lenText, pEOL);
         }

      }
      return 0;
    }

  public:

    POPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_24) {
      m_pObj = POP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~POPA() {
      POP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)POP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return POP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)POP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return POP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)POP_Get(m_pObj, PID_POP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return POP_Set(m_pObj, PID_POP_ACTION, 0, (LPVOID)val, 0);
    }

    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return POP_Set(m_pObj, PID_POP_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)POP_Get(m_pObj, PID_POP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)POP_Get(m_pObj, PID_POP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return POP_Set(m_pObj, PID_POP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)POP_Get(m_pObj, PID_POP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return POP_Set(m_pObj, PID_POP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)POP_Get(m_pObj, PID_POP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return POP_Set(m_pObj, PID_POP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)POP_Get(m_pObj, PID_POP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return POP_Set(m_pObj, PID_POP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)POP_Get(m_pObj, PID_POP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return POP_Set(m_pObj, PID_POP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)POP_Get(m_pObj, PID_POP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return POP_Set(m_pObj, PID_POP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)POP_Get(m_pObj, PID_POP_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalFile() {
      int val = (int)POP_Get(m_pObj, PID_POP_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return POP_Set(m_pObj, PID_POP_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)POP_Get(m_pObj, PID_POP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return POP_Set(m_pObj, PID_POP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMailPort() {
      int val = (int)POP_Get(m_pObj, PID_POP_MAILPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMailPort(USHORT usMailPort) {
      int val = (int)usMailPort;
      return POP_Set(m_pObj, PID_POP_MAILPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailServer() {
      int val = (int)POP_Get(m_pObj, PID_POP_MAILSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMailServer(LPCSTR lpszMailServer) {
      int val = (int)lpszMailServer;
      return POP_Set(m_pObj, PID_POP_MAILSERVER, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMaxLineLength() {
      int val = (int)POP_Get(m_pObj, PID_POP_MAXLINELENGTH, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMaxLineLength(USHORT usMaxLineLength) {
      int val = (int)usMaxLineLength;
      return POP_Set(m_pObj, PID_POP_MAXLINELENGTH, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMaxLines() {
      int val = (int)POP_Get(m_pObj, PID_POP_MAXLINES, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMaxLines(USHORT usMaxLines) {
      int val = (int)usMaxLines;
      return POP_Set(m_pObj, PID_POP_MAXLINES, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMessageCount() {
      int val = (int)POP_Get(m_pObj, PID_POP_MESSAGECOUNT, 0, 0);
      return (USHORT)val;
    }

    inline LPCSTR GetMessageHeaders() {
      int val = (int)POP_Get(m_pObj, PID_POP_MESSAGEHEADERS, 0, 0);
      return (LPCSTR)val;
    }

    inline USHORT GetMessageNumber() {
      int val = (int)POP_Get(m_pObj, PID_POP_MESSAGENUMBER, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMessageNumber(USHORT usMessageNumber) {
      int val = (int)usMessageNumber;
      return POP_Set(m_pObj, PID_POP_MESSAGENUMBER, 0, (LPVOID)val, 0);
    }
    inline LONG GetMessageSize() {
      int val = (int)POP_Get(m_pObj, PID_POP_MESSAGESIZE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetMessageText() {
      int val = (int)POP_Get(m_pObj, PID_POP_MESSAGETEXT, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageUID() {
      int val = (int)POP_Get(m_pObj, PID_POP_MESSAGEUID, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetPassword() {
      int val = (int)POP_Get(m_pObj, PID_POP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return POP_Set(m_pObj, PID_POP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)POP_Get(m_pObj, PID_POP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline INT GetTimeout() {
      int val = (int)POP_Get(m_pObj, PID_POP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return POP_Set(m_pObj, PID_POP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LONG GetTotalSize() {
      int val = (int)POP_Get(m_pObj, PID_POP_TOTALSIZE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetUser() {
      int val = (int)POP_Get(m_pObj, PID_POP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return POP_Set(m_pObj, PID_POP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)POP_Get(m_pObj, PID_POP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)POP_Get(m_pObj, PID_POP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return POP_Set(m_pObj, PID_POP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)POP_Get(m_pObj, PID_POP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)POP_Get(m_pObj, PID_POP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)POP_Get(m_pObj, PID_POP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return POP_Set(m_pObj, PID_POP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)POP_Get(m_pObj, PID_POP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Connect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_CONNECT, 0, param, cbparam);
      
      
    }
    inline int Delete() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_DELETE, 0, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_RESET, 0, param, cbparam);
      
      
    }
    inline int Retrieve() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return POP_Do(m_pObj, MID_POP_RETRIEVE, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class POP : public POPA {
  
  public:
    POP(LPCSTR lpOemKey = IPWORKS_OEMKEY_24):POPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpCommand;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalFile;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMailServer;
    MCFStringRef tmpMessageHeaders;
    MCFStringRef tmpMessageText;
    MCFStringRef tmpMessageUID;
    MCFStringRef tmpPassword;
    MCFStringRef tmpUser;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(POPA::GetLastError());
    }

    // CFString versions of properties


    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return POPA::SetCommand(tmp.Deref(strCommand));
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = POPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return POPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(POPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return POPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(POPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return POPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(POPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return POPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(POPA::GetLastReply());
    }

    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(POPA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return POPA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(POPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return POPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetMailServer() {
      return tmpMailServer.Set(POPA::GetMailServer());
    }

    inline INT SetMailServer(CFStringRef strMailServer) {
      MCFStringAcc tmp;
      return POPA::SetMailServer(tmp.Deref(strMailServer));
    }



    inline CFStringRef GetMessageHeaders() {
      return tmpMessageHeaders.Set(POPA::GetMessageHeaders());
    }



    inline CFStringRef GetMessageText() {
      return tmpMessageText.Set(POPA::GetMessageText());
    }

    inline CFStringRef GetMessageUID() {
      return tmpMessageUID.Set(POPA::GetMessageUID());
    }

    inline CFStringRef GetPassword() {
      return tmpPassword.Set(POPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return POPA::SetPassword(tmp.Deref(strPassword));
    }



    inline CFStringRef GetUser() {
      return tmpUser.Set(POPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return POPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(POPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(POPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return POPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(POPA::GetWinsockStatus());
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

    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {
      MCFStringRef etmpMessage(lpszMessage);
      CFStringRef uval_lpszMessage = etmpMessage.Deref();

      return FirePITrail(usDirection, uval_lpszMessage);
    }
    virtual INT FirePITrail(USHORT &usDirection, CFStringRef &lpszMessage) {
      return 0;
    }



    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireTransfer(lBytesTransferred, uval_lpText, lenText, bEOL);
    }
    virtual INT FireTransfer(LONG &lBytesTransferred, CFStringRef &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters

















#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpCommand;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLastReply;
    MUString tmpLocalFile;
    MUString tmpLocalHost;
    MUString tmpMailServer;
    MUString tmpMessageHeaders;
    MUString tmpMessageText;
    MUString tmpMessageUID;
    MUString tmpPassword;
    MUString tmpUser;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(POPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties


    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return POPA::SetCommand(tmp.Deref());
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = POPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return POPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(POPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return POPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(POPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return POPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(POPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return POPA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(POPA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(POPA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return POPA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(POPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return POPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetMailServer() {
      tmpMailServer.Set(POPA::GetMailServer());
      return tmpMailServer.Deref();
    }

    inline INT SetMailServer(LPWSTR lpszMailServer) {
      MAString tmp(lpszMailServer);
      return POPA::SetMailServer(tmp.Deref());
    }



    inline LPWSTR GetMessageHeaders() {
      tmpMessageHeaders.Set(POPA::GetMessageHeaders());
      return tmpMessageHeaders.Deref();
    }



    inline LPWSTR GetMessageText() {
      tmpMessageText.Set(POPA::GetMessageText());
      return tmpMessageText.Deref();
    }

    inline LPWSTR GetMessageUID() {
      tmpMessageUID.Set(POPA::GetMessageUID());
      return tmpMessageUID.Deref();
    }

    inline LPWSTR GetPassword() {
      tmpPassword.Set(POPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return POPA::SetPassword(tmp.Deref());
    }



    inline LPWSTR GetUser() {
      tmpUser.Set(POPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return POPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(POPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(POPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return POPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(POPA::GetWinsockStatus());
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

    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {
      MUString etmpMessage(lpszMessage);
      LPWSTR uval_lpszMessage = etmpMessage.Deref();

      return FirePITrail(usDirection, uval_lpszMessage);
    }
    virtual INT FirePITrail(USHORT &usDirection, LPWSTR &lpszMessage) {
      return 0;
    }



    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireTransfer(lBytesTransferred, uval_lpText, lenText, bEOL);
    }
    virtual INT FireTransfer(LONG &lBytesTransferred, LPWSTR &lpText, USHORT &lenText, BOOL &bEOL) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_POP_H_




