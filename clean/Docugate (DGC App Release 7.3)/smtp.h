/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_SMTP_H_
#define _IPWORKS_SMTP_H_

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

#define smtpIdle                                           0
#define smtpConnect                                        1
#define smtpDisconnect                                     2
#define smtpSend                                           3
#define smtpResetHeaders                                   4
#define smtpExpand                                         5
#define smtpVerify                                         6
#define smtpSendToTerminalAndEmail                         7
#define smtpSendToTerminalOrEmail                          8
#define smtpSendToTerminalOnly                             9

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define SMTP_IDLE                                          0
#define SMTP_CONNECT                                       1
#define SMTP_DISCONNECT                                    2
#define SMTP_SEND                                          3
#define SMTP_RESET_HEADERS                                 4
#define SMTP_EXPAND                                        5
#define SMTP_VERIFY                                        6
#define SMTP_SEND_TO_TERMINAL_AND_EMAIL                    7
#define SMTP_SEND_TO_TERMINAL_OR_EMAIL                     8
#define SMTP_SEND_TO_TERMINAL_ONLY                         9

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_SMTP_ACTION    1
#define PID_SMTP_ALLOWEXTENSIONS    2
#define PID_SMTP_ATTACHEDFILE    3
#define PID_SMTP_BCC    4
#define PID_SMTP_CC    5
#define PID_SMTP_COMMAND    6
#define PID_SMTP_CONNECTED    7
#define PID_SMTP_DATE    8
#define PID_SMTP_FIREWALLDATA    9
#define PID_SMTP_FIREWALLHOST    10
#define PID_SMTP_FIREWALLPASSWORD    11
#define PID_SMTP_FIREWALLPORT    12
#define PID_SMTP_FIREWALLTYPE    13
#define PID_SMTP_FIREWALLUSER    14
#define PID_SMTP_FROM    15
#define PID_SMTP_HELLO    16
#define PID_SMTP_LASTREPLY    17
#define PID_SMTP_LOCALHOST    18
#define PID_SMTP_MAILPORT    19
#define PID_SMTP_MAILSERVER    20
#define PID_SMTP_MAXHEADERLENGTH    21
#define PID_SMTP_MESSAGEDATE    22
#define PID_SMTP_MESSAGETEXT    23
#define PID_SMTP_OTHERHEADERS    24
#define PID_SMTP_PASSWORD    25
#define PID_SMTP_REPLYTO    26
#define PID_SMTP_SENDTO    27
#define PID_SMTP_SOCKETHANDLE    28
#define PID_SMTP_SUBJECT    29
#define PID_SMTP_TIMEOUT    30
#define PID_SMTP_USER    31
#define PID_SMTP_WINSOCKINFO    32
#define PID_SMTP_WINSOCKLOADED    33
#define PID_SMTP_WINSOCKMAXDATAGRAMSIZE    34
#define PID_SMTP_WINSOCKMAXSOCKETS    35
#define PID_SMTP_WINSOCKPATH    36
#define PID_SMTP_WINSOCKSTATUS    37


#define MID_SMTP_CONNECT    1
#define MID_SMTP_DISCONNECT    2
#define MID_SMTP_DOEVENTS    3
#define MID_SMTP_EXPAND    4
#define MID_SMTP_INTERRUPT    5
#define MID_SMTP_RESETHEADERS    6
#define MID_SMTP_SEND    7
#define MID_SMTP_SENDTOTERMINALANDEMAIL    8
#define MID_SMTP_SENDTOTERMINALONLY    9
#define MID_SMTP_SENDTOTERMINALOREMAIL    10
#define MID_SMTP_VERIFY    11


#define EID_SMTP_ENDTRANSFER    1
#define EID_SMTP_ERROR    2
#define EID_SMTP_EXPAND    3
#define EID_SMTP_PITRAIL    4
#define EID_SMTP_STARTTRANSFER    5
#define EID_SMTP_TRANSFER    6


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID SMTP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    SMTP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    SMTP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID SMTP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    SMTP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    SMTP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  SMTP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    SMTP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   SMTP_StaticInit(LPVOID hInst);

class SMTPA {
  
  public: //events
  
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireExpand(LPSTR &lpszAddress) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_SMTP_ENDTRANSFER: {
            
            return ((SMTPA*)lpObj)->FireEndTransfer();
         }
         case EID_SMTP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SMTPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_SMTP_EXPAND: {
                        LPSTR pAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SMTPA*)lpObj)->FireExpand(pAddress);
         }
         case EID_SMTP_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SMTPA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_SMTP_STARTTRANSFER: {
            
            return ((SMTPA*)lpObj)->FireStartTransfer();
         }
         case EID_SMTP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SMTPA*)lpObj)->FireTransfer(pBytesTransferred);
         }

      }
      return 0;
    }

  public:

    SMTPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_23) {
      m_pObj = SMTP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~SMTPA() {
      SMTP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)SMTP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return SMTP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)SMTP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return SMTP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return SMTP_Set(m_pObj, PID_SMTP_ACTION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetAllowExtensions() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_ALLOWEXTENSIONS, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAllowExtensions(BOOL bAllowExtensions) {
      int val = (int)bAllowExtensions;
      return SMTP_Set(m_pObj, PID_SMTP_ALLOWEXTENSIONS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAttachedFile() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_ATTACHEDFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAttachedFile(LPCSTR lpszAttachedFile) {
      int val = (int)lpszAttachedFile;
      return SMTP_Set(m_pObj, PID_SMTP_ATTACHEDFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetBCc() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_BCC, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetBCc(LPCSTR lpszBCc) {
      int val = (int)lpszBCc;
      return SMTP_Set(m_pObj, PID_SMTP_BCC, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCc() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_CC, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCc(LPCSTR lpszCc) {
      int val = (int)lpszCc;
      return SMTP_Set(m_pObj, PID_SMTP_CC, 0, (LPVOID)val, 0);
    }

    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return SMTP_Set(m_pObj, PID_SMTP_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline LPCSTR GetDate() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_DATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDate(LPCSTR lpszDate) {
      int val = (int)lpszDate;
      return SMTP_Set(m_pObj, PID_SMTP_DATE, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)SMTP_Get(m_pObj, PID_SMTP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return SMTP_Set(m_pObj, PID_SMTP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return SMTP_Set(m_pObj, PID_SMTP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return SMTP_Set(m_pObj, PID_SMTP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return SMTP_Set(m_pObj, PID_SMTP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return SMTP_Set(m_pObj, PID_SMTP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return SMTP_Set(m_pObj, PID_SMTP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFrom() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return SMTP_Set(m_pObj, PID_SMTP_FROM, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetHello() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_HELLO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetHello(LPCSTR lpszHello) {
      int val = (int)lpszHello;
      return SMTP_Set(m_pObj, PID_SMTP_HELLO, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return SMTP_Set(m_pObj, PID_SMTP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMailPort() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_MAILPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMailPort(USHORT usMailPort) {
      int val = (int)usMailPort;
      return SMTP_Set(m_pObj, PID_SMTP_MAILPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailServer() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_MAILSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMailServer(LPCSTR lpszMailServer) {
      int val = (int)lpszMailServer;
      return SMTP_Set(m_pObj, PID_SMTP_MAILSERVER, 0, (LPVOID)val, 0);
    }
    inline INT GetMaxHeaderLength() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_MAXHEADERLENGTH, 0, 0);
      return (INT)val;
    }
    inline INT SetMaxHeaderLength(INT iMaxHeaderLength) {
      int val = (int)iMaxHeaderLength;
      return SMTP_Set(m_pObj, PID_SMTP_MAXHEADERLENGTH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageDate() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_MESSAGEDATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageDate(LPCSTR lpszMessageDate) {
      int val = (int)lpszMessageDate;
      return SMTP_Set(m_pObj, PID_SMTP_MESSAGEDATE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageText() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_MESSAGETEXT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageText(LPCSTR lpszMessageText) {
      int val = (int)lpszMessageText;
      return SMTP_Set(m_pObj, PID_SMTP_MESSAGETEXT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return SMTP_Set(m_pObj, PID_SMTP_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return SMTP_Set(m_pObj, PID_SMTP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReplyTo() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_REPLYTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReplyTo(LPCSTR lpszReplyTo) {
      int val = (int)lpszReplyTo;
      return SMTP_Set(m_pObj, PID_SMTP_REPLYTO, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSendTo() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_SENDTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSendTo(LPCSTR lpszSendTo) {
      int val = (int)lpszSendTo;
      return SMTP_Set(m_pObj, PID_SMTP_SENDTO, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetSubject() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_SUBJECT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSubject(LPCSTR lpszSubject) {
      int val = (int)lpszSubject;
      return SMTP_Set(m_pObj, PID_SMTP_SUBJECT, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return SMTP_Set(m_pObj, PID_SMTP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return SMTP_Set(m_pObj, PID_SMTP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return SMTP_Set(m_pObj, PID_SMTP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return SMTP_Set(m_pObj, PID_SMTP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)SMTP_Get(m_pObj, PID_SMTP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Connect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_CONNECT, 0, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Expand(LPSTR lpszEmailAddress) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszEmailAddress, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_EXPAND, 1, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int ResetHeaders() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_RESETHEADERS, 0, param, cbparam);
      
      
    }
    inline int Send() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_SEND, 0, param, cbparam);
      
      
    }
    inline int SendToTerminalAndEmail() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_SENDTOTERMINALANDEMAIL, 0, param, cbparam);
      
      
    }
    inline int SendToTerminalOnly() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_SENDTOTERMINALONLY, 0, param, cbparam);
      
      
    }
    inline int SendToTerminalOrEmail() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_SENDTOTERMINALOREMAIL, 0, param, cbparam);
      
      
    }
    inline int Verify(LPSTR lpszEmailAddress) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszEmailAddress, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return SMTP_Do(m_pObj, MID_SMTP_VERIFY, 1, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class SMTP : public SMTPA {
  
  public:
    SMTP(LPCSTR lpOemKey = IPWORKS_OEMKEY_23):SMTPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAttachedFile;
    MCFStringRef tmpBCc;
    MCFStringRef tmpCc;
    MCFStringRef tmpCommand;
    MCFStringRef tmpDate;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFrom;
    MCFStringRef tmpHello;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMailServer;
    MCFStringRef tmpMessageDate;
    MCFStringRef tmpMessageText;
    MCFStringRef tmpOtherHeaders;
    MCFStringRef tmpPassword;
    MCFStringRef tmpReplyTo;
    MCFStringRef tmpSendTo;
    MCFStringRef tmpSubject;
    MCFStringRef tmpUser;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(SMTPA::GetLastError());
    }

    // CFString versions of properties


    inline CFStringRef GetAttachedFile() {
      return tmpAttachedFile.Set(SMTPA::GetAttachedFile());
    }

    inline INT SetAttachedFile(CFStringRef strAttachedFile) {
      MCFStringAcc tmp;
      return SMTPA::SetAttachedFile(tmp.Deref(strAttachedFile));
    }
    inline CFStringRef GetBCc() {
      return tmpBCc.Set(SMTPA::GetBCc());
    }

    inline INT SetBCc(CFStringRef strBCc) {
      MCFStringAcc tmp;
      return SMTPA::SetBCc(tmp.Deref(strBCc));
    }
    inline CFStringRef GetCc() {
      return tmpCc.Set(SMTPA::GetCc());
    }

    inline INT SetCc(CFStringRef strCc) {
      MCFStringAcc tmp;
      return SMTPA::SetCc(tmp.Deref(strCc));
    }

    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return SMTPA::SetCommand(tmp.Deref(strCommand));
    }

    inline CFStringRef GetDate() {
      return tmpDate.Set(SMTPA::GetDate());
    }

    inline INT SetDate(CFStringRef strDate) {
      MCFStringAcc tmp;
      return SMTPA::SetDate(tmp.Deref(strDate));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = SMTPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return SMTPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(SMTPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return SMTPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(SMTPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return SMTPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(SMTPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return SMTPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetFrom() {
      return tmpFrom.Set(SMTPA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return SMTPA::SetFrom(tmp.Deref(strFrom));
    }
    inline CFStringRef GetHello() {
      return tmpHello.Set(SMTPA::GetHello());
    }

    inline INT SetHello(CFStringRef strHello) {
      MCFStringAcc tmp;
      return SMTPA::SetHello(tmp.Deref(strHello));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(SMTPA::GetLastReply());
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(SMTPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return SMTPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetMailServer() {
      return tmpMailServer.Set(SMTPA::GetMailServer());
    }

    inline INT SetMailServer(CFStringRef strMailServer) {
      MCFStringAcc tmp;
      return SMTPA::SetMailServer(tmp.Deref(strMailServer));
    }

    inline CFStringRef GetMessageDate() {
      return tmpMessageDate.Set(SMTPA::GetMessageDate());
    }

    inline INT SetMessageDate(CFStringRef strMessageDate) {
      MCFStringAcc tmp;
      return SMTPA::SetMessageDate(tmp.Deref(strMessageDate));
    }
    inline CFStringRef GetMessageText() {
      return tmpMessageText.Set(SMTPA::GetMessageText());
    }

    inline INT SetMessageText(CFStringRef strMessageText) {
      MCFStringAcc tmp;
      return SMTPA::SetMessageText(tmp.Deref(strMessageText));
    }
    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(SMTPA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return SMTPA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(SMTPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return SMTPA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetReplyTo() {
      return tmpReplyTo.Set(SMTPA::GetReplyTo());
    }

    inline INT SetReplyTo(CFStringRef strReplyTo) {
      MCFStringAcc tmp;
      return SMTPA::SetReplyTo(tmp.Deref(strReplyTo));
    }
    inline CFStringRef GetSendTo() {
      return tmpSendTo.Set(SMTPA::GetSendTo());
    }

    inline INT SetSendTo(CFStringRef strSendTo) {
      MCFStringAcc tmp;
      return SMTPA::SetSendTo(tmp.Deref(strSendTo));
    }

    inline CFStringRef GetSubject() {
      return tmpSubject.Set(SMTPA::GetSubject());
    }

    inline INT SetSubject(CFStringRef strSubject) {
      MCFStringAcc tmp;
      return SMTPA::SetSubject(tmp.Deref(strSubject));
    }

    inline CFStringRef GetUser() {
      return tmpUser.Set(SMTPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return SMTPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(SMTPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(SMTPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return SMTPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(SMTPA::GetWinsockStatus());
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

    virtual INT FireExpand(LPSTR &lpszAddress) {
      MCFStringRef etmpAddress(lpszAddress);
      CFStringRef uval_lpszAddress = etmpAddress.Deref();

      return FireExpand(uval_lpszAddress);
    }
    virtual INT FireExpand(CFStringRef &lpszAddress) {
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







  public:
  
    //redeclare methods with CFString parameters







    inline int Expand(CFStringRef pEmailAddress) {
      MCFStringAcc etmpEmailAddress;
      LPSTR lpszEmailAddress = etmpEmailAddress.Deref(pEmailAddress);

      return SMTPA::Expand(lpszEmailAddress);
    }













    inline int Verify(CFStringRef pEmailAddress) {
      MCFStringAcc etmpEmailAddress;
      LPSTR lpszEmailAddress = etmpEmailAddress.Deref(pEmailAddress);

      return SMTPA::Verify(lpszEmailAddress);
    }



#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAttachedFile;
    MUString tmpBCc;
    MUString tmpCc;
    MUString tmpCommand;
    MUString tmpDate;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFrom;
    MUString tmpHello;
    MUString tmpLastReply;
    MUString tmpLocalHost;
    MUString tmpMailServer;
    MUString tmpMessageDate;
    MUString tmpMessageText;
    MUString tmpOtherHeaders;
    MUString tmpPassword;
    MUString tmpReplyTo;
    MUString tmpSendTo;
    MUString tmpSubject;
    MUString tmpUser;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(SMTPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties


    inline LPWSTR GetAttachedFile() {
      tmpAttachedFile.Set(SMTPA::GetAttachedFile());
      return tmpAttachedFile.Deref();
    }

    inline INT SetAttachedFile(LPWSTR lpszAttachedFile) {
      MAString tmp(lpszAttachedFile);
      return SMTPA::SetAttachedFile(tmp.Deref());
    }
    inline LPWSTR GetBCc() {
      tmpBCc.Set(SMTPA::GetBCc());
      return tmpBCc.Deref();
    }

    inline INT SetBCc(LPWSTR lpszBCc) {
      MAString tmp(lpszBCc);
      return SMTPA::SetBCc(tmp.Deref());
    }
    inline LPWSTR GetCc() {
      tmpCc.Set(SMTPA::GetCc());
      return tmpCc.Deref();
    }

    inline INT SetCc(LPWSTR lpszCc) {
      MAString tmp(lpszCc);
      return SMTPA::SetCc(tmp.Deref());
    }

    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return SMTPA::SetCommand(tmp.Deref());
    }

    inline LPWSTR GetDate() {
      tmpDate.Set(SMTPA::GetDate());
      return tmpDate.Deref();
    }

    inline INT SetDate(LPWSTR lpszDate) {
      MAString tmp(lpszDate);
      return SMTPA::SetDate(tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = SMTPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return SMTPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(SMTPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return SMTPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(SMTPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return SMTPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(SMTPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return SMTPA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetFrom() {
      tmpFrom.Set(SMTPA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return SMTPA::SetFrom(tmp.Deref());
    }
    inline LPWSTR GetHello() {
      tmpHello.Set(SMTPA::GetHello());
      return tmpHello.Deref();
    }

    inline INT SetHello(LPWSTR lpszHello) {
      MAString tmp(lpszHello);
      return SMTPA::SetHello(tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(SMTPA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(SMTPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return SMTPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetMailServer() {
      tmpMailServer.Set(SMTPA::GetMailServer());
      return tmpMailServer.Deref();
    }

    inline INT SetMailServer(LPWSTR lpszMailServer) {
      MAString tmp(lpszMailServer);
      return SMTPA::SetMailServer(tmp.Deref());
    }

    inline LPWSTR GetMessageDate() {
      tmpMessageDate.Set(SMTPA::GetMessageDate());
      return tmpMessageDate.Deref();
    }

    inline INT SetMessageDate(LPWSTR lpszMessageDate) {
      MAString tmp(lpszMessageDate);
      return SMTPA::SetMessageDate(tmp.Deref());
    }
    inline LPWSTR GetMessageText() {
      tmpMessageText.Set(SMTPA::GetMessageText());
      return tmpMessageText.Deref();
    }

    inline INT SetMessageText(LPWSTR lpszMessageText) {
      MAString tmp(lpszMessageText);
      return SMTPA::SetMessageText(tmp.Deref());
    }
    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(SMTPA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return SMTPA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(SMTPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return SMTPA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetReplyTo() {
      tmpReplyTo.Set(SMTPA::GetReplyTo());
      return tmpReplyTo.Deref();
    }

    inline INT SetReplyTo(LPWSTR lpszReplyTo) {
      MAString tmp(lpszReplyTo);
      return SMTPA::SetReplyTo(tmp.Deref());
    }
    inline LPWSTR GetSendTo() {
      tmpSendTo.Set(SMTPA::GetSendTo());
      return tmpSendTo.Deref();
    }

    inline INT SetSendTo(LPWSTR lpszSendTo) {
      MAString tmp(lpszSendTo);
      return SMTPA::SetSendTo(tmp.Deref());
    }

    inline LPWSTR GetSubject() {
      tmpSubject.Set(SMTPA::GetSubject());
      return tmpSubject.Deref();
    }

    inline INT SetSubject(LPWSTR lpszSubject) {
      MAString tmp(lpszSubject);
      return SMTPA::SetSubject(tmp.Deref());
    }

    inline LPWSTR GetUser() {
      tmpUser.Set(SMTPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return SMTPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(SMTPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(SMTPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return SMTPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(SMTPA::GetWinsockStatus());
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

    virtual INT FireExpand(LPSTR &lpszAddress) {
      MUString etmpAddress(lpszAddress);
      LPWSTR uval_lpszAddress = etmpAddress.Deref();

      return FireExpand(uval_lpszAddress);
    }
    virtual INT FireExpand(LPWSTR &lpszAddress) {
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







#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_SMTP_H_




