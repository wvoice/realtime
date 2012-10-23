/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_HTMLMAILER_H_
#define _IPWORKS_HTMLMAILER_H_

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

#define htmlmailerIdle                                     0
#define htmlmailerSend                                     1

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define HTMLMAILER_IDLE                                    0
#define HTMLMAILER_SEND                                    1

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_HTMLMAILER_ACTION    1
#define PID_HTMLMAILER_BCC    2
#define PID_HTMLMAILER_CC    3
#define PID_HTMLMAILER_DATE    4
#define PID_HTMLMAILER_FIREWALLDATA    5
#define PID_HTMLMAILER_FIREWALLHOST    6
#define PID_HTMLMAILER_FIREWALLPASSWORD    7
#define PID_HTMLMAILER_FIREWALLPORT    8
#define PID_HTMLMAILER_FIREWALLTYPE    9
#define PID_HTMLMAILER_FIREWALLUSER    10
#define PID_HTMLMAILER_FROM    11
#define PID_HTMLMAILER_IMAGECOUNT    12
#define PID_HTMLMAILER_IMAGEIDS    13
#define PID_HTMLMAILER_IMAGES    14
#define PID_HTMLMAILER_LASTREPLY    15
#define PID_HTMLMAILER_LOCALHOST    16
#define PID_HTMLMAILER_MAILPORT    17
#define PID_HTMLMAILER_MAILSERVER    18
#define PID_HTMLMAILER_MAXHEADERLENGTH    19
#define PID_HTMLMAILER_MESSAGEDATE    20
#define PID_HTMLMAILER_MESSAGEHTML    21
#define PID_HTMLMAILER_MESSAGETEXT    22
#define PID_HTMLMAILER_OTHERHEADERS    23
#define PID_HTMLMAILER_PARSEHTML    24
#define PID_HTMLMAILER_REPLYTO    25
#define PID_HTMLMAILER_SENDTO    26
#define PID_HTMLMAILER_SOCKETHANDLE    27
#define PID_HTMLMAILER_SUBJECT    28
#define PID_HTMLMAILER_TIMEOUT    29
#define PID_HTMLMAILER_WINSOCKINFO    30
#define PID_HTMLMAILER_WINSOCKLOADED    31
#define PID_HTMLMAILER_WINSOCKMAXDATAGRAMSIZE    32
#define PID_HTMLMAILER_WINSOCKMAXSOCKETS    33
#define PID_HTMLMAILER_WINSOCKPATH    34
#define PID_HTMLMAILER_WINSOCKSTATUS    35


#define MID_HTMLMAILER_DOEVENTS    1
#define MID_HTMLMAILER_INTERRUPT    2
#define MID_HTMLMAILER_SEND    3


#define EID_HTMLMAILER_ENDTRANSFER    1
#define EID_HTMLMAILER_ERROR    2
#define EID_HTMLMAILER_PITRAIL    3
#define EID_HTMLMAILER_STARTTRANSFER    4
#define EID_HTMLMAILER_TRANSFER    5


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID HTMLMailer_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    HTMLMailer_Destroy(LPVOID lpObj);
CNX_IMPORT INT    HTMLMailer_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID HTMLMailer_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    HTMLMailer_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    HTMLMailer_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  HTMLMailer_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    HTMLMailer_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   HTMLMailer_StaticInit(LPVOID hInst);

class HTMLMailerA {
  
  public: //events
  
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_HTMLMAILER_ENDTRANSFER: {
            
            return ((HTMLMailerA*)lpObj)->FireEndTransfer();
         }
         case EID_HTMLMAILER_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTMLMailerA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_HTMLMAILER_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTMLMailerA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_HTMLMAILER_STARTTRANSFER: {
            
            return ((HTMLMailerA*)lpObj)->FireStartTransfer();
         }
         case EID_HTMLMAILER_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((HTMLMailerA*)lpObj)->FireTransfer(pBytesTransferred);
         }

      }
      return 0;
    }

  public:

    HTMLMailerA(LPCSTR lpOemKey = IPWORKS_OEMKEY_42) {
      m_pObj = HTMLMailer_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~HTMLMailerA() {
      HTMLMailer_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)HTMLMailer_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return HTMLMailer_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)HTMLMailer_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return HTMLMailer_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetBCc() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_BCC, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetBCc(LPCSTR lpszBCc) {
      int val = (int)lpszBCc;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_BCC, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCc() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_CC, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCc(LPCSTR lpszCc) {
      int val = (int)lpszCc;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_CC, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDate() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_DATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDate(LPCSTR lpszDate) {
      int val = (int)lpszDate;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_DATE, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFrom() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_FROM, 0, (LPVOID)val, 0);
    }
    inline INT GetImageCount() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_IMAGECOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetImageCount(INT iImageCount) {
      int val = (int)iImageCount;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_IMAGECOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetImageIds(USHORT usImageIndex) {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_IMAGEIDS, usImageIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetImageIds(USHORT usImageIndex, LPCSTR lpszImageIds) {
      int val = (int)lpszImageIds;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_IMAGEIDS, usImageIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetImages(USHORT usImageIndex) {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_IMAGES, usImageIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetImages(USHORT usImageIndex, LPCSTR lpszImages) {
      int val = (int)lpszImages;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_IMAGES, usImageIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMailPort() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_MAILPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMailPort(USHORT usMailPort) {
      int val = (int)usMailPort;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_MAILPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailServer() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_MAILSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMailServer(LPCSTR lpszMailServer) {
      int val = (int)lpszMailServer;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_MAILSERVER, 0, (LPVOID)val, 0);
    }
    inline INT GetMaxHeaderLength() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_MAXHEADERLENGTH, 0, 0);
      return (INT)val;
    }
    inline INT SetMaxHeaderLength(INT iMaxHeaderLength) {
      int val = (int)iMaxHeaderLength;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_MAXHEADERLENGTH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageDate() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_MESSAGEDATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageDate(LPCSTR lpszMessageDate) {
      int val = (int)lpszMessageDate;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_MESSAGEDATE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageHTML() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_MESSAGEHTML, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageHTML(LPCSTR lpszMessageHTML) {
      int val = (int)lpszMessageHTML;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_MESSAGEHTML, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageText() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_MESSAGETEXT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageText(LPCSTR lpszMessageText) {
      int val = (int)lpszMessageText;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_MESSAGETEXT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline BOOL GetParseHTML() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_PARSEHTML, 0, 0);
      return (BOOL)val;
    }
    inline INT SetParseHTML(BOOL bParseHTML) {
      int val = (int)bParseHTML;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_PARSEHTML, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReplyTo() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_REPLYTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReplyTo(LPCSTR lpszReplyTo) {
      int val = (int)lpszReplyTo;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_REPLYTO, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSendTo() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_SENDTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSendTo(LPCSTR lpszSendTo) {
      int val = (int)lpszSendTo;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_SENDTO, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetSubject() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_SUBJECT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSubject(LPCSTR lpszSubject) {
      int val = (int)lpszSubject;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_SUBJECT, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return HTMLMailer_Set(m_pObj, PID_HTMLMAILER_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)HTMLMailer_Get(m_pObj, PID_HTMLMAILER_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return HTMLMailer_Do(m_pObj, MID_HTMLMAILER_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return HTMLMailer_Do(m_pObj, MID_HTMLMAILER_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Send() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return HTMLMailer_Do(m_pObj, MID_HTMLMAILER_SEND, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class HTMLMailer : public HTMLMailerA {
  
  public:
    HTMLMailer(LPCSTR lpOemKey = IPWORKS_OEMKEY_42):HTMLMailerA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpBCc;
    MCFStringRef tmpCc;
    MCFStringRef tmpDate;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFrom;
    MCFStringRef tmpImageIds;
    MCFStringRef tmpImages;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMailServer;
    MCFStringRef tmpMessageDate;
    MCFStringRef tmpMessageHTML;
    MCFStringRef tmpMessageText;
    MCFStringRef tmpOtherHeaders;
    MCFStringRef tmpReplyTo;
    MCFStringRef tmpSendTo;
    MCFStringRef tmpSubject;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(HTMLMailerA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetBCc() {
      return tmpBCc.Set(HTMLMailerA::GetBCc());
    }

    inline INT SetBCc(CFStringRef strBCc) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetBCc(tmp.Deref(strBCc));
    }
    inline CFStringRef GetCc() {
      return tmpCc.Set(HTMLMailerA::GetCc());
    }

    inline INT SetCc(CFStringRef strCc) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetCc(tmp.Deref(strCc));
    }
    inline CFStringRef GetDate() {
      return tmpDate.Set(HTMLMailerA::GetDate());
    }

    inline INT SetDate(CFStringRef strDate) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetDate(tmp.Deref(strDate));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = HTMLMailerA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return HTMLMailerA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(HTMLMailerA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(HTMLMailerA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(HTMLMailerA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetFrom() {
      return tmpFrom.Set(HTMLMailerA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetFrom(tmp.Deref(strFrom));
    }

    inline CFStringRef GetImageIds(USHORT usImageIndex) {
      return tmpImageIds.Set(HTMLMailerA::GetImageIds(usImageIndex));
    }

    inline INT SetImageIds(USHORT usImageIndex, CFStringRef strImageIds) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetImageIds(usImageIndex, tmp.Deref(strImageIds));
    }
    inline CFStringRef GetImages(USHORT usImageIndex) {
      return tmpImages.Set(HTMLMailerA::GetImages(usImageIndex));
    }

    inline INT SetImages(USHORT usImageIndex, CFStringRef strImages) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetImages(usImageIndex, tmp.Deref(strImages));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(HTMLMailerA::GetLastReply());
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(HTMLMailerA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetMailServer() {
      return tmpMailServer.Set(HTMLMailerA::GetMailServer());
    }

    inline INT SetMailServer(CFStringRef strMailServer) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetMailServer(tmp.Deref(strMailServer));
    }

    inline CFStringRef GetMessageDate() {
      return tmpMessageDate.Set(HTMLMailerA::GetMessageDate());
    }

    inline INT SetMessageDate(CFStringRef strMessageDate) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetMessageDate(tmp.Deref(strMessageDate));
    }
    inline CFStringRef GetMessageHTML() {
      return tmpMessageHTML.Set(HTMLMailerA::GetMessageHTML());
    }

    inline INT SetMessageHTML(CFStringRef strMessageHTML) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetMessageHTML(tmp.Deref(strMessageHTML));
    }
    inline CFStringRef GetMessageText() {
      return tmpMessageText.Set(HTMLMailerA::GetMessageText());
    }

    inline INT SetMessageText(CFStringRef strMessageText) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetMessageText(tmp.Deref(strMessageText));
    }
    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(HTMLMailerA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }

    inline CFStringRef GetReplyTo() {
      return tmpReplyTo.Set(HTMLMailerA::GetReplyTo());
    }

    inline INT SetReplyTo(CFStringRef strReplyTo) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetReplyTo(tmp.Deref(strReplyTo));
    }
    inline CFStringRef GetSendTo() {
      return tmpSendTo.Set(HTMLMailerA::GetSendTo());
    }

    inline INT SetSendTo(CFStringRef strSendTo) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetSendTo(tmp.Deref(strSendTo));
    }

    inline CFStringRef GetSubject() {
      return tmpSubject.Set(HTMLMailerA::GetSubject());
    }

    inline INT SetSubject(CFStringRef strSubject) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetSubject(tmp.Deref(strSubject));
    }

    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(HTMLMailerA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(HTMLMailerA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return HTMLMailerA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(HTMLMailerA::GetWinsockStatus());
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









#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpBCc;
    MUString tmpCc;
    MUString tmpDate;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFrom;
    MUString tmpImageIds;
    MUString tmpImages;
    MUString tmpLastReply;
    MUString tmpLocalHost;
    MUString tmpMailServer;
    MUString tmpMessageDate;
    MUString tmpMessageHTML;
    MUString tmpMessageText;
    MUString tmpOtherHeaders;
    MUString tmpReplyTo;
    MUString tmpSendTo;
    MUString tmpSubject;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(HTMLMailerA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetBCc() {
      tmpBCc.Set(HTMLMailerA::GetBCc());
      return tmpBCc.Deref();
    }

    inline INT SetBCc(LPWSTR lpszBCc) {
      MAString tmp(lpszBCc);
      return HTMLMailerA::SetBCc(tmp.Deref());
    }
    inline LPWSTR GetCc() {
      tmpCc.Set(HTMLMailerA::GetCc());
      return tmpCc.Deref();
    }

    inline INT SetCc(LPWSTR lpszCc) {
      MAString tmp(lpszCc);
      return HTMLMailerA::SetCc(tmp.Deref());
    }
    inline LPWSTR GetDate() {
      tmpDate.Set(HTMLMailerA::GetDate());
      return tmpDate.Deref();
    }

    inline INT SetDate(LPWSTR lpszDate) {
      MAString tmp(lpszDate);
      return HTMLMailerA::SetDate(tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = HTMLMailerA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return HTMLMailerA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(HTMLMailerA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return HTMLMailerA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(HTMLMailerA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return HTMLMailerA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(HTMLMailerA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return HTMLMailerA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetFrom() {
      tmpFrom.Set(HTMLMailerA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return HTMLMailerA::SetFrom(tmp.Deref());
    }

    inline LPWSTR GetImageIds(USHORT usImageIndex) {
      tmpImageIds.Set(HTMLMailerA::GetImageIds(usImageIndex));
      return tmpImageIds.Deref();
    }

    inline INT SetImageIds(USHORT usImageIndex, LPWSTR lpszImageIds) {
      MAString tmp(lpszImageIds);
      return HTMLMailerA::SetImageIds(usImageIndex, tmp.Deref());
    }
    inline LPWSTR GetImages(USHORT usImageIndex) {
      tmpImages.Set(HTMLMailerA::GetImages(usImageIndex));
      return tmpImages.Deref();
    }

    inline INT SetImages(USHORT usImageIndex, LPWSTR lpszImages) {
      MAString tmp(lpszImages);
      return HTMLMailerA::SetImages(usImageIndex, tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(HTMLMailerA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(HTMLMailerA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return HTMLMailerA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetMailServer() {
      tmpMailServer.Set(HTMLMailerA::GetMailServer());
      return tmpMailServer.Deref();
    }

    inline INT SetMailServer(LPWSTR lpszMailServer) {
      MAString tmp(lpszMailServer);
      return HTMLMailerA::SetMailServer(tmp.Deref());
    }

    inline LPWSTR GetMessageDate() {
      tmpMessageDate.Set(HTMLMailerA::GetMessageDate());
      return tmpMessageDate.Deref();
    }

    inline INT SetMessageDate(LPWSTR lpszMessageDate) {
      MAString tmp(lpszMessageDate);
      return HTMLMailerA::SetMessageDate(tmp.Deref());
    }
    inline LPWSTR GetMessageHTML() {
      tmpMessageHTML.Set(HTMLMailerA::GetMessageHTML());
      return tmpMessageHTML.Deref();
    }

    inline INT SetMessageHTML(LPWSTR lpszMessageHTML) {
      MAString tmp(lpszMessageHTML);
      return HTMLMailerA::SetMessageHTML(tmp.Deref());
    }
    inline LPWSTR GetMessageText() {
      tmpMessageText.Set(HTMLMailerA::GetMessageText());
      return tmpMessageText.Deref();
    }

    inline INT SetMessageText(LPWSTR lpszMessageText) {
      MAString tmp(lpszMessageText);
      return HTMLMailerA::SetMessageText(tmp.Deref());
    }
    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(HTMLMailerA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return HTMLMailerA::SetOtherHeaders(tmp.Deref());
    }

    inline LPWSTR GetReplyTo() {
      tmpReplyTo.Set(HTMLMailerA::GetReplyTo());
      return tmpReplyTo.Deref();
    }

    inline INT SetReplyTo(LPWSTR lpszReplyTo) {
      MAString tmp(lpszReplyTo);
      return HTMLMailerA::SetReplyTo(tmp.Deref());
    }
    inline LPWSTR GetSendTo() {
      tmpSendTo.Set(HTMLMailerA::GetSendTo());
      return tmpSendTo.Deref();
    }

    inline INT SetSendTo(LPWSTR lpszSendTo) {
      MAString tmp(lpszSendTo);
      return HTMLMailerA::SetSendTo(tmp.Deref());
    }

    inline LPWSTR GetSubject() {
      tmpSubject.Set(HTMLMailerA::GetSubject());
      return tmpSubject.Deref();
    }

    inline INT SetSubject(LPWSTR lpszSubject) {
      MAString tmp(lpszSubject);
      return HTMLMailerA::SetSubject(tmp.Deref());
    }

    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(HTMLMailerA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(HTMLMailerA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return HTMLMailerA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(HTMLMailerA::GetWinsockStatus());
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

#endif //_IPWORKS_HTMLMAILER_H_




