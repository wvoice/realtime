/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_FILEMAILER_H_
#define _IPWORKS_FILEMAILER_H_

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

#define filemailerIdle                                     0
#define filemailerSend                                     1

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define FILEMAILER_IDLE                                    0
#define FILEMAILER_SEND                                    1

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_FILEMAILER_ACTION    1
#define PID_FILEMAILER_ATTACHMENTCOUNT    2
#define PID_FILEMAILER_ATTACHMENTS    3
#define PID_FILEMAILER_BCC    4
#define PID_FILEMAILER_CC    5
#define PID_FILEMAILER_DATE    6
#define PID_FILEMAILER_FIREWALLDATA    7
#define PID_FILEMAILER_FIREWALLHOST    8
#define PID_FILEMAILER_FIREWALLPASSWORD    9
#define PID_FILEMAILER_FIREWALLPORT    10
#define PID_FILEMAILER_FIREWALLTYPE    11
#define PID_FILEMAILER_FIREWALLUSER    12
#define PID_FILEMAILER_FROM    13
#define PID_FILEMAILER_LASTREPLY    14
#define PID_FILEMAILER_LOCALHOST    15
#define PID_FILEMAILER_MAILPORT    16
#define PID_FILEMAILER_MAILSERVER    17
#define PID_FILEMAILER_MAXHEADERLENGTH    18
#define PID_FILEMAILER_MESSAGEDATE    19
#define PID_FILEMAILER_MESSAGETEXT    20
#define PID_FILEMAILER_OTHERHEADERS    21
#define PID_FILEMAILER_REPLYTO    22
#define PID_FILEMAILER_SENDTO    23
#define PID_FILEMAILER_SOCKETHANDLE    24
#define PID_FILEMAILER_SUBJECT    25
#define PID_FILEMAILER_TIMEOUT    26
#define PID_FILEMAILER_WINSOCKINFO    27
#define PID_FILEMAILER_WINSOCKLOADED    28
#define PID_FILEMAILER_WINSOCKMAXDATAGRAMSIZE    29
#define PID_FILEMAILER_WINSOCKMAXSOCKETS    30
#define PID_FILEMAILER_WINSOCKPATH    31
#define PID_FILEMAILER_WINSOCKSTATUS    32


#define MID_FILEMAILER_ADDATTACHMENT    1
#define MID_FILEMAILER_DOEVENTS    2
#define MID_FILEMAILER_INTERRUPT    3
#define MID_FILEMAILER_SEND    4


#define EID_FILEMAILER_ENDTRANSFER    1
#define EID_FILEMAILER_ERROR    2
#define EID_FILEMAILER_PITRAIL    3
#define EID_FILEMAILER_STARTTRANSFER    4
#define EID_FILEMAILER_TRANSFER    5


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID FileMailer_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    FileMailer_Destroy(LPVOID lpObj);
CNX_IMPORT INT    FileMailer_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID FileMailer_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    FileMailer_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    FileMailer_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  FileMailer_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    FileMailer_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   FileMailer_StaticInit(LPVOID hInst);

class FileMailerA {
  
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
         case EID_FILEMAILER_ENDTRANSFER: {
            
            return ((FileMailerA*)lpObj)->FireEndTransfer();
         }
         case EID_FILEMAILER_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((FileMailerA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_FILEMAILER_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((FileMailerA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_FILEMAILER_STARTTRANSFER: {
            
            return ((FileMailerA*)lpObj)->FireStartTransfer();
         }
         case EID_FILEMAILER_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((FileMailerA*)lpObj)->FireTransfer(pBytesTransferred);
         }

      }
      return 0;
    }

  public:

    FileMailerA(LPCSTR lpOemKey = IPWORKS_OEMKEY_41) {
      m_pObj = FileMailer_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~FileMailerA() {
      FileMailer_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)FileMailer_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return FileMailer_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)FileMailer_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return FileMailer_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_ACTION, 0, (LPVOID)val, 0);
    }
    inline INT GetAttachmentCount() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_ATTACHMENTCOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetAttachmentCount(INT iAttachmentCount) {
      int val = (int)iAttachmentCount;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_ATTACHMENTCOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAttachments(USHORT usAttachmentIndex) {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_ATTACHMENTS, usAttachmentIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetAttachments(USHORT usAttachmentIndex, LPCSTR lpszAttachments) {
      int val = (int)lpszAttachments;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_ATTACHMENTS, usAttachmentIndex, (LPVOID)val, 0);
    }
    inline LPCSTR GetBCc() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_BCC, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetBCc(LPCSTR lpszBCc) {
      int val = (int)lpszBCc;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_BCC, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCc() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_CC, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCc(LPCSTR lpszCc) {
      int val = (int)lpszCc;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_CC, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDate() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_DATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDate(LPCSTR lpszDate) {
      int val = (int)lpszDate;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_DATE, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)FileMailer_Get(m_pObj, PID_FILEMAILER_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFrom() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_FROM, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMailPort() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_MAILPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMailPort(USHORT usMailPort) {
      int val = (int)usMailPort;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_MAILPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailServer() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_MAILSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMailServer(LPCSTR lpszMailServer) {
      int val = (int)lpszMailServer;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_MAILSERVER, 0, (LPVOID)val, 0);
    }
    inline INT GetMaxHeaderLength() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_MAXHEADERLENGTH, 0, 0);
      return (INT)val;
    }
    inline INT SetMaxHeaderLength(INT iMaxHeaderLength) {
      int val = (int)iMaxHeaderLength;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_MAXHEADERLENGTH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageDate() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_MESSAGEDATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageDate(LPCSTR lpszMessageDate) {
      int val = (int)lpszMessageDate;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_MESSAGEDATE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageText() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_MESSAGETEXT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageText(LPCSTR lpszMessageText) {
      int val = (int)lpszMessageText;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_MESSAGETEXT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReplyTo() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_REPLYTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReplyTo(LPCSTR lpszReplyTo) {
      int val = (int)lpszReplyTo;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_REPLYTO, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSendTo() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_SENDTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSendTo(LPCSTR lpszSendTo) {
      int val = (int)lpszSendTo;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_SENDTO, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetSubject() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_SUBJECT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSubject(LPCSTR lpszSubject) {
      int val = (int)lpszSubject;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_SUBJECT, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return FileMailer_Set(m_pObj, PID_FILEMAILER_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)FileMailer_Get(m_pObj, PID_FILEMAILER_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int AddAttachment(LPSTR lpszFileName) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszFileName, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return FileMailer_Do(m_pObj, MID_FILEMAILER_ADDATTACHMENT, 1, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FileMailer_Do(m_pObj, MID_FILEMAILER_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FileMailer_Do(m_pObj, MID_FILEMAILER_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int Send() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FileMailer_Do(m_pObj, MID_FILEMAILER_SEND, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class FileMailer : public FileMailerA {
  
  public:
    FileMailer(LPCSTR lpOemKey = IPWORKS_OEMKEY_41):FileMailerA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAttachments;
    MCFStringRef tmpBCc;
    MCFStringRef tmpCc;
    MCFStringRef tmpDate;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFrom;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpMailServer;
    MCFStringRef tmpMessageDate;
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
      return tmpLastError.Set(FileMailerA::GetLastError());
    }

    // CFString versions of properties


    inline CFStringRef GetAttachments(USHORT usAttachmentIndex) {
      return tmpAttachments.Set(FileMailerA::GetAttachments(usAttachmentIndex));
    }

    inline INT SetAttachments(USHORT usAttachmentIndex, CFStringRef strAttachments) {
      MCFStringAcc tmp;
      return FileMailerA::SetAttachments(usAttachmentIndex, tmp.Deref(strAttachments));
    }
    inline CFStringRef GetBCc() {
      return tmpBCc.Set(FileMailerA::GetBCc());
    }

    inline INT SetBCc(CFStringRef strBCc) {
      MCFStringAcc tmp;
      return FileMailerA::SetBCc(tmp.Deref(strBCc));
    }
    inline CFStringRef GetCc() {
      return tmpCc.Set(FileMailerA::GetCc());
    }

    inline INT SetCc(CFStringRef strCc) {
      MCFStringAcc tmp;
      return FileMailerA::SetCc(tmp.Deref(strCc));
    }
    inline CFStringRef GetDate() {
      return tmpDate.Set(FileMailerA::GetDate());
    }

    inline INT SetDate(CFStringRef strDate) {
      MCFStringAcc tmp;
      return FileMailerA::SetDate(tmp.Deref(strDate));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = FileMailerA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return FileMailerA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(FileMailerA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return FileMailerA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(FileMailerA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return FileMailerA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(FileMailerA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return FileMailerA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetFrom() {
      return tmpFrom.Set(FileMailerA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return FileMailerA::SetFrom(tmp.Deref(strFrom));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(FileMailerA::GetLastReply());
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(FileMailerA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return FileMailerA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetMailServer() {
      return tmpMailServer.Set(FileMailerA::GetMailServer());
    }

    inline INT SetMailServer(CFStringRef strMailServer) {
      MCFStringAcc tmp;
      return FileMailerA::SetMailServer(tmp.Deref(strMailServer));
    }

    inline CFStringRef GetMessageDate() {
      return tmpMessageDate.Set(FileMailerA::GetMessageDate());
    }

    inline INT SetMessageDate(CFStringRef strMessageDate) {
      MCFStringAcc tmp;
      return FileMailerA::SetMessageDate(tmp.Deref(strMessageDate));
    }
    inline CFStringRef GetMessageText() {
      return tmpMessageText.Set(FileMailerA::GetMessageText());
    }

    inline INT SetMessageText(CFStringRef strMessageText) {
      MCFStringAcc tmp;
      return FileMailerA::SetMessageText(tmp.Deref(strMessageText));
    }
    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(FileMailerA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return FileMailerA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetReplyTo() {
      return tmpReplyTo.Set(FileMailerA::GetReplyTo());
    }

    inline INT SetReplyTo(CFStringRef strReplyTo) {
      MCFStringAcc tmp;
      return FileMailerA::SetReplyTo(tmp.Deref(strReplyTo));
    }
    inline CFStringRef GetSendTo() {
      return tmpSendTo.Set(FileMailerA::GetSendTo());
    }

    inline INT SetSendTo(CFStringRef strSendTo) {
      MCFStringAcc tmp;
      return FileMailerA::SetSendTo(tmp.Deref(strSendTo));
    }

    inline CFStringRef GetSubject() {
      return tmpSubject.Set(FileMailerA::GetSubject());
    }

    inline INT SetSubject(CFStringRef strSubject) {
      MCFStringAcc tmp;
      return FileMailerA::SetSubject(tmp.Deref(strSubject));
    }

    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(FileMailerA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(FileMailerA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return FileMailerA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(FileMailerA::GetWinsockStatus());
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

    inline int AddAttachment(CFStringRef pFileName) {
      MCFStringAcc etmpFileName;
      LPSTR lpszFileName = etmpFileName.Deref(pFileName);

      return FileMailerA::AddAttachment(lpszFileName);
    }









#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAttachments;
    MUString tmpBCc;
    MUString tmpCc;
    MUString tmpDate;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFrom;
    MUString tmpLastReply;
    MUString tmpLocalHost;
    MUString tmpMailServer;
    MUString tmpMessageDate;
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
      tmpLastError.Set(FileMailerA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties


    inline LPWSTR GetAttachments(USHORT usAttachmentIndex) {
      tmpAttachments.Set(FileMailerA::GetAttachments(usAttachmentIndex));
      return tmpAttachments.Deref();
    }

    inline INT SetAttachments(USHORT usAttachmentIndex, LPWSTR lpszAttachments) {
      MAString tmp(lpszAttachments);
      return FileMailerA::SetAttachments(usAttachmentIndex, tmp.Deref());
    }
    inline LPWSTR GetBCc() {
      tmpBCc.Set(FileMailerA::GetBCc());
      return tmpBCc.Deref();
    }

    inline INT SetBCc(LPWSTR lpszBCc) {
      MAString tmp(lpszBCc);
      return FileMailerA::SetBCc(tmp.Deref());
    }
    inline LPWSTR GetCc() {
      tmpCc.Set(FileMailerA::GetCc());
      return tmpCc.Deref();
    }

    inline INT SetCc(LPWSTR lpszCc) {
      MAString tmp(lpszCc);
      return FileMailerA::SetCc(tmp.Deref());
    }
    inline LPWSTR GetDate() {
      tmpDate.Set(FileMailerA::GetDate());
      return tmpDate.Deref();
    }

    inline INT SetDate(LPWSTR lpszDate) {
      MAString tmp(lpszDate);
      return FileMailerA::SetDate(tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = FileMailerA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return FileMailerA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(FileMailerA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return FileMailerA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(FileMailerA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return FileMailerA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(FileMailerA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return FileMailerA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetFrom() {
      tmpFrom.Set(FileMailerA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return FileMailerA::SetFrom(tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(FileMailerA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(FileMailerA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return FileMailerA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetMailServer() {
      tmpMailServer.Set(FileMailerA::GetMailServer());
      return tmpMailServer.Deref();
    }

    inline INT SetMailServer(LPWSTR lpszMailServer) {
      MAString tmp(lpszMailServer);
      return FileMailerA::SetMailServer(tmp.Deref());
    }

    inline LPWSTR GetMessageDate() {
      tmpMessageDate.Set(FileMailerA::GetMessageDate());
      return tmpMessageDate.Deref();
    }

    inline INT SetMessageDate(LPWSTR lpszMessageDate) {
      MAString tmp(lpszMessageDate);
      return FileMailerA::SetMessageDate(tmp.Deref());
    }
    inline LPWSTR GetMessageText() {
      tmpMessageText.Set(FileMailerA::GetMessageText());
      return tmpMessageText.Deref();
    }

    inline INT SetMessageText(LPWSTR lpszMessageText) {
      MAString tmp(lpszMessageText);
      return FileMailerA::SetMessageText(tmp.Deref());
    }
    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(FileMailerA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return FileMailerA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetReplyTo() {
      tmpReplyTo.Set(FileMailerA::GetReplyTo());
      return tmpReplyTo.Deref();
    }

    inline INT SetReplyTo(LPWSTR lpszReplyTo) {
      MAString tmp(lpszReplyTo);
      return FileMailerA::SetReplyTo(tmp.Deref());
    }
    inline LPWSTR GetSendTo() {
      tmpSendTo.Set(FileMailerA::GetSendTo());
      return tmpSendTo.Deref();
    }

    inline INT SetSendTo(LPWSTR lpszSendTo) {
      MAString tmp(lpszSendTo);
      return FileMailerA::SetSendTo(tmp.Deref());
    }

    inline LPWSTR GetSubject() {
      tmpSubject.Set(FileMailerA::GetSubject());
      return tmpSubject.Deref();
    }

    inline INT SetSubject(LPWSTR lpszSubject) {
      MAString tmp(lpszSubject);
      return FileMailerA::SetSubject(tmp.Deref());
    }

    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(FileMailerA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(FileMailerA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return FileMailerA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(FileMailerA::GetWinsockStatus());
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

#endif //_IPWORKS_FILEMAILER_H_




