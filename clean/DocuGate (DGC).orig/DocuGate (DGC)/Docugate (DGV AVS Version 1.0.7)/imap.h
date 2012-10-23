/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_IMAP_H_
#define _IPWORKS_IMAP_H_

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

#define imapIdle                                           0
#define imapNoop                                           1
#define imapConnect                                        2
#define imapDisconnect                                     3
#define imapSelectMailbox                                  4
#define imapExamineMailbox                                 5
#define imapCreateMailbox                                  6
#define imapDeleteMailbox                                  7
#define imapRenameMailbox                                  8
#define imapSearchMailbox                                  9
#define imapAppendToMailbox                                10
#define imapCopyToMailbox                                  11
#define imapCheckMailbox                                   12
#define imapExpungeMailbox                                 13
#define imapCloseMailbox                                   14
#define imapListMailboxes                                  15
#define imapListSubscribedMailboxes                        16
#define imapSubscribeMailbox                               17
#define imapUnsubscribeMailbox                             18
#define imapGetMessageInfo                                 19
#define imapGetMessageHeaders                              20
#define imapGetMessageText                                 21
#define imapGetMessagePart                                 22
#define imapResetMessageFlags                              23
#define imapSetMessageFlags                                24
#define imapUnsetMessageFlags                              25

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define IMAP_IDLE                                          0
#define IMAP_NOOP                                          1
#define IMAP_CONNECT                                       2
#define IMAP_DISCONNECT                                    3
#define IMAP_SELECT_MAILBOX                                4
#define IMAP_EXAMINE_MAILBOX                               5
#define IMAP_CREATE_MAILBOX                                6
#define IMAP_DELETE_MAILBOX                                7
#define IMAP_RENAME_MAILBOX                                8
#define IMAP_SEARCH_MAILBOX                                9
#define IMAP_APPEND_TO_MAILBOX                             10
#define IMAP_COPY_TO_MAILBOX                               11
#define IMAP_CHECK_MAILBOX                                 12
#define IMAP_EXPUNGE_MAILBOX                               13
#define IMAP_CLOSE_MAILBOX                                 14
#define IMAP_LIST_MAILBOXES                                15
#define IMAP_LIST_SUBSCRIBED_MAILBOXES                     16
#define IMAP_SUBSCRIBE_MAILBOX                             17
#define IMAP_UNSUBSCRIBE_MAILBOX                           18
#define IMAP_GET_MESSAGE_INFO                              19
#define IMAP_GET_MESSAGE_HEADERS                           20
#define IMAP_GET_MESSAGE_TEXT                              21
#define IMAP_GET_MESSAGE_PART                              22
#define IMAP_RESET_MESSAGE_FLAGS                           23
#define IMAP_SET_MESSAGE_FLAGS                             24
#define IMAP_UNSET_MESSAGE_FLAGS                           25

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_IMAP_ACTION    1
#define PID_IMAP_COMMAND    2
#define PID_IMAP_CONNECTED    3
#define PID_IMAP_ENDBYTE    4
#define PID_IMAP_FIREWALLDATA    5
#define PID_IMAP_FIREWALLHOST    6
#define PID_IMAP_FIREWALLPASSWORD    7
#define PID_IMAP_FIREWALLPORT    8
#define PID_IMAP_FIREWALLTYPE    9
#define PID_IMAP_FIREWALLUSER    10
#define PID_IMAP_LASTREPLY    11
#define PID_IMAP_LOCALFILE    12
#define PID_IMAP_LOCALHOST    13
#define PID_IMAP_MAILBOX    14
#define PID_IMAP_MAILBOXFLAGS    15
#define PID_IMAP_MAILPORT    16
#define PID_IMAP_MAILSERVER    17
#define PID_IMAP_MESSAGEBCC    18
#define PID_IMAP_MESSAGECC    19
#define PID_IMAP_MESSAGECONTENTENCODING    20
#define PID_IMAP_MESSAGECONTENTTYPE    21
#define PID_IMAP_MESSAGECOUNT    22
#define PID_IMAP_MESSAGEDATE    23
#define PID_IMAP_MESSAGEDELIVERYTIME    24
#define PID_IMAP_MESSAGEFLAGS    25
#define PID_IMAP_MESSAGEFROM    26
#define PID_IMAP_MESSAGEHEADERS    27
#define PID_IMAP_MESSAGEID    28
#define PID_IMAP_MESSAGEINREPLYTO    29
#define PID_IMAP_MESSAGENETID    30
#define PID_IMAP_MESSAGEREPLYTO    31
#define PID_IMAP_MESSAGESENDER    32
#define PID_IMAP_MESSAGESET    33
#define PID_IMAP_MESSAGESIZE    34
#define PID_IMAP_MESSAGESUBJECT    35
#define PID_IMAP_MESSAGETEXT    36
#define PID_IMAP_MESSAGETO    37
#define PID_IMAP_NEWMAILBOX    38
#define PID_IMAP_PARTID    39
#define PID_IMAP_PASSWORD    40
#define PID_IMAP_PEEKMODE    41
#define PID_IMAP_RECENTMESSAGECOUNT    42
#define PID_IMAP_SEARCHCRITERIA    43
#define PID_IMAP_SOCKETHANDLE    44
#define PID_IMAP_STARTBYTE    45
#define PID_IMAP_TIMEOUT    46
#define PID_IMAP_UIDMODE    47
#define PID_IMAP_USER    48
#define PID_IMAP_WINSOCKINFO    49
#define PID_IMAP_WINSOCKLOADED    50
#define PID_IMAP_WINSOCKMAXDATAGRAMSIZE    51
#define PID_IMAP_WINSOCKMAXSOCKETS    52
#define PID_IMAP_WINSOCKPATH    53
#define PID_IMAP_WINSOCKSTATUS    54


#define MID_IMAP_ADDMESSAGEFLAGS    1
#define MID_IMAP_APPENDTOMAILBOX    2
#define MID_IMAP_CHECKMAILBOX    3
#define MID_IMAP_CLOSEMAILBOX    4
#define MID_IMAP_CONNECT    5
#define MID_IMAP_COPYTOMAILBOX    6
#define MID_IMAP_CREATEMAILBOX    7
#define MID_IMAP_DELETEMAILBOX    8
#define MID_IMAP_DISCONNECT    9
#define MID_IMAP_DOEVENTS    10
#define MID_IMAP_EXAMINEMAILBOX    11
#define MID_IMAP_EXPUNGEMAILBOX    12
#define MID_IMAP_FETCHMESSAGEHEADERS    13
#define MID_IMAP_FETCHMESSAGEINFO    14
#define MID_IMAP_FETCHMESSAGEPART    15
#define MID_IMAP_FETCHMESSAGETEXT    16
#define MID_IMAP_INTERRUPT    17
#define MID_IMAP_LISTMAILBOXES    18
#define MID_IMAP_LISTSUBSCRIBEDMAILBOXES    19
#define MID_IMAP_NOOP    20
#define MID_IMAP_RENAMEMAILBOX    21
#define MID_IMAP_RESETMESSAGEFLAGS    22
#define MID_IMAP_SEARCHMAILBOX    23
#define MID_IMAP_SELECTMAILBOX    24
#define MID_IMAP_SUBSCRIBEMAILBOX    25
#define MID_IMAP_UNSETMESSAGEFLAGS    26
#define MID_IMAP_UNSUBSCRIBEMAILBOX    27


#define EID_IMAP_ENDTRANSFER    1
#define EID_IMAP_ERROR    2
#define EID_IMAP_MAILBOXLIST    3
#define EID_IMAP_MESSAGEINFO    4
#define EID_IMAP_MESSAGEPART    5
#define EID_IMAP_PITRAIL    6
#define EID_IMAP_STARTTRANSFER    7
#define EID_IMAP_TRANSFER    8


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID IMAP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    IMAP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    IMAP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID IMAP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    IMAP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    IMAP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  IMAP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    IMAP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   IMAP_StaticInit(LPVOID hInst);

class IMAPA {
  
  public: //events
  
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireMailboxList(LPSTR &lpszMailbox, LPSTR &lpszSeparator, LPSTR &lpszFlags) {return 0;}
    virtual INT FireMessageInfo(LPSTR &lpszMessageId, LPSTR &lpszSubject, LPSTR &lpszMessageDate, LPSTR &lpszFrom, LPSTR &lpszFlags, LONG &lSize) {return 0;}
    virtual INT FireMessagePart(LPSTR &lpszPartId, LONG &lSize, LPSTR &lpszContentType, LPSTR &lpszFilename, LPSTR &lpszContentEncoding, LPSTR &lpszParameters, LPSTR &lpszMultipartMode) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpszText) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_IMAP_ENDTRANSFER: {
            
            return ((IMAPA*)lpObj)->FireEndTransfer();
         }
         case EID_IMAP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IMAPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_IMAP_MAILBOXLIST: {
                        LPSTR pMailbox = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSeparator = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFlags = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IMAPA*)lpObj)->FireMailboxList(pMailbox, pSeparator, pFlags);
         }
         case EID_IMAP_MESSAGEINFO: {
                        LPSTR pMessageId = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSubject = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessageDate = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFrom = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFlags = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pSize = (LONG)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IMAPA*)lpObj)->FireMessageInfo(pMessageId, pSubject, pMessageDate, pFrom, pFlags, pSize);
         }
         case EID_IMAP_MESSAGEPART: {
                        LPSTR pPartId = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pSize = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pContentType = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFilename = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pContentEncoding = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pParameters = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMultipartMode = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IMAPA*)lpObj)->FireMessagePart(pPartId, pSize, pContentType, pFilename, pContentEncoding, pParameters, pMultipartMode);
         }
         case EID_IMAP_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IMAPA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_IMAP_STARTTRANSFER: {
            
            return ((IMAPA*)lpObj)->FireStartTransfer();
         }
         case EID_IMAP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((IMAPA*)lpObj)->FireTransfer(pBytesTransferred, pText);
         }

      }
      return 0;
    }

  public:

    IMAPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_31) {
      m_pObj = IMAP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~IMAPA() {
      IMAP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)IMAP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return IMAP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)IMAP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return IMAP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return IMAP_Set(m_pObj, PID_IMAP_ACTION, 0, (LPVOID)val, 0);
    }

    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return IMAP_Set(m_pObj, PID_IMAP_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline LONG GetEndByte() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_ENDBYTE, 0, 0);
      return (LONG)val;
    }
    inline INT SetEndByte(LONG lEndByte) {
      int val = (int)lEndByte;
      return IMAP_Set(m_pObj, PID_IMAP_ENDBYTE, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)IMAP_Get(m_pObj, PID_IMAP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return IMAP_Set(m_pObj, PID_IMAP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return IMAP_Set(m_pObj, PID_IMAP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return IMAP_Set(m_pObj, PID_IMAP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return IMAP_Set(m_pObj, PID_IMAP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return IMAP_Set(m_pObj, PID_IMAP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return IMAP_Set(m_pObj, PID_IMAP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalFile() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return IMAP_Set(m_pObj, PID_IMAP_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return IMAP_Set(m_pObj, PID_IMAP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailbox() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MAILBOX, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMailbox(LPCSTR lpszMailbox) {
      int val = (int)lpszMailbox;
      return IMAP_Set(m_pObj, PID_IMAP_MAILBOX, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailboxFlags() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MAILBOXFLAGS, 0, 0);
      return (LPCSTR)val;
    }

    inline LONG GetMailPort() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MAILPORT, 0, 0);
      return (LONG)val;
    }
    inline INT SetMailPort(LONG lMailPort) {
      int val = (int)lMailPort;
      return IMAP_Set(m_pObj, PID_IMAP_MAILPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMailServer() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MAILSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMailServer(LPCSTR lpszMailServer) {
      int val = (int)lpszMailServer;
      return IMAP_Set(m_pObj, PID_IMAP_MAILSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageBCc(USHORT usAddressIndex) {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEBCC, usAddressIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageCc(USHORT usAddressIndex) {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGECC, usAddressIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageContentEncoding() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGECONTENTENCODING, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageContentType() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGECONTENTTYPE, 0, 0);
      return (LPCSTR)val;
    }

    inline INT GetMessageCount() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGECOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetMessageDate() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEDATE, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageDeliveryTime() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEDELIVERYTIME, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageFlags() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEFLAGS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageFlags(LPCSTR lpszMessageFlags) {
      int val = (int)lpszMessageFlags;
      return IMAP_Set(m_pObj, PID_IMAP_MESSAGEFLAGS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageFrom() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEFROM, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageHeaders() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageHeaders(LPCSTR lpszMessageHeaders) {
      int val = (int)lpszMessageHeaders;
      return IMAP_Set(m_pObj, PID_IMAP_MESSAGEHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageId() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEID, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageInReplyTo() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEINREPLYTO, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageNetId() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGENETID, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageReplyTo() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGEREPLYTO, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageSender() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGESENDER, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageSet() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGESET, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageSet(LPCSTR lpszMessageSet) {
      int val = (int)lpszMessageSet;
      return IMAP_Set(m_pObj, PID_IMAP_MESSAGESET, 0, (LPVOID)val, 0);
    }
    inline LONG GetMessageSize() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGESIZE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetMessageSubject() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGESUBJECT, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetMessageText() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGETEXT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageText(LPCSTR lpszMessageText) {
      int val = (int)lpszMessageText;
      return IMAP_Set(m_pObj, PID_IMAP_MESSAGETEXT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMessageTo(USHORT usAddressIndex) {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_MESSAGETO, usAddressIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetNewMailbox() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_NEWMAILBOX, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetNewMailbox(LPCSTR lpszNewMailbox) {
      int val = (int)lpszNewMailbox;
      return IMAP_Set(m_pObj, PID_IMAP_NEWMAILBOX, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartId() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_PARTID, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartId(LPCSTR lpszPartId) {
      int val = (int)lpszPartId;
      return IMAP_Set(m_pObj, PID_IMAP_PARTID, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return IMAP_Set(m_pObj, PID_IMAP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline BOOL GetPeekMode() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_PEEKMODE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetPeekMode(BOOL bPeekMode) {
      int val = (int)bPeekMode;
      return IMAP_Set(m_pObj, PID_IMAP_PEEKMODE, 0, (LPVOID)val, 0);
    }
    inline INT GetRecentMessageCount() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_RECENTMESSAGECOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetSearchCriteria() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_SEARCHCRITERIA, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSearchCriteria(LPCSTR lpszSearchCriteria) {
      int val = (int)lpszSearchCriteria;
      return IMAP_Set(m_pObj, PID_IMAP_SEARCHCRITERIA, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetStartByte() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_STARTBYTE, 0, 0);
      return (LONG)val;
    }
    inline INT SetStartByte(LONG lStartByte) {
      int val = (int)lStartByte;
      return IMAP_Set(m_pObj, PID_IMAP_STARTBYTE, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return IMAP_Set(m_pObj, PID_IMAP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline BOOL GetUIDMode() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_UIDMODE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetUIDMode(BOOL bUIDMode) {
      int val = (int)bUIDMode;
      return IMAP_Set(m_pObj, PID_IMAP_UIDMODE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return IMAP_Set(m_pObj, PID_IMAP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return IMAP_Set(m_pObj, PID_IMAP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return IMAP_Set(m_pObj, PID_IMAP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)IMAP_Get(m_pObj, PID_IMAP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int AddMessageFlags(LPSTR lpszFlags) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszFlags, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_ADDMESSAGEFLAGS, 1, param, cbparam);
      
      
    }
    inline int AppendToMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_APPENDTOMAILBOX, 0, param, cbparam);
      
      
    }
    inline int CheckMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_CHECKMAILBOX, 0, param, cbparam);
      
      
    }
    inline int CloseMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_CLOSEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int Connect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_CONNECT, 0, param, cbparam);
      
      
    }
    inline int CopyToMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_COPYTOMAILBOX, 0, param, cbparam);
      
      
    }
    inline int CreateMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_CREATEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int DeleteMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_DELETEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int ExamineMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_EXAMINEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int ExpungeMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_EXPUNGEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int FetchMessageHeaders() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_FETCHMESSAGEHEADERS, 0, param, cbparam);
      
      
    }
    inline int FetchMessageInfo() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_FETCHMESSAGEINFO, 0, param, cbparam);
      
      
    }
    inline int FetchMessagePart() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_FETCHMESSAGEPART, 0, param, cbparam);
      
      
    }
    inline int FetchMessageText() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_FETCHMESSAGETEXT, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int ListMailboxes() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_LISTMAILBOXES, 0, param, cbparam);
      
      
    }
    inline int ListSubscribedMailboxes() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_LISTSUBSCRIBEDMAILBOXES, 0, param, cbparam);
      
      
    }
    inline int Noop() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_NOOP, 0, param, cbparam);
      
      
    }
    inline int RenameMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_RENAMEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int ResetMessageFlags() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_RESETMESSAGEFLAGS, 0, param, cbparam);
      
      
    }
    inline int SearchMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_SEARCHMAILBOX, 0, param, cbparam);
      
      
    }
    inline int SelectMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_SELECTMAILBOX, 0, param, cbparam);
      
      
    }
    inline int SubscribeMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_SUBSCRIBEMAILBOX, 0, param, cbparam);
      
      
    }
    inline int UnsetMessageFlags() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_UNSETMESSAGEFLAGS, 0, param, cbparam);
      
      
    }
    inline int UnsubscribeMailbox() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return IMAP_Do(m_pObj, MID_IMAP_UNSUBSCRIBEMAILBOX, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class IMAP : public IMAPA {
  
  public:
    IMAP(LPCSTR lpOemKey = IPWORKS_OEMKEY_31):IMAPA(lpOemKey) {}

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
    MCFStringRef tmpMailbox;
    MCFStringRef tmpMailboxFlags;
    MCFStringRef tmpMailServer;
    MCFStringRef tmpMessageBCc;
    MCFStringRef tmpMessageCc;
    MCFStringRef tmpMessageContentEncoding;
    MCFStringRef tmpMessageContentType;
    MCFStringRef tmpMessageDate;
    MCFStringRef tmpMessageDeliveryTime;
    MCFStringRef tmpMessageFlags;
    MCFStringRef tmpMessageFrom;
    MCFStringRef tmpMessageHeaders;
    MCFStringRef tmpMessageId;
    MCFStringRef tmpMessageInReplyTo;
    MCFStringRef tmpMessageNetId;
    MCFStringRef tmpMessageReplyTo;
    MCFStringRef tmpMessageSender;
    MCFStringRef tmpMessageSet;
    MCFStringRef tmpMessageSubject;
    MCFStringRef tmpMessageText;
    MCFStringRef tmpMessageTo;
    MCFStringRef tmpNewMailbox;
    MCFStringRef tmpPartId;
    MCFStringRef tmpPassword;
    MCFStringRef tmpSearchCriteria;
    MCFStringRef tmpUser;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(IMAPA::GetLastError());
    }

    // CFString versions of properties


    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return IMAPA::SetCommand(tmp.Deref(strCommand));
    }


    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = IMAPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return IMAPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(IMAPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return IMAPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(IMAPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return IMAPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(IMAPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return IMAPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(IMAPA::GetLastReply());
    }

    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(IMAPA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return IMAPA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(IMAPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return IMAPA::SetLocalHost(tmp.Deref(strLocalHost));
    }
    inline CFStringRef GetMailbox() {
      return tmpMailbox.Set(IMAPA::GetMailbox());
    }

    inline INT SetMailbox(CFStringRef strMailbox) {
      MCFStringAcc tmp;
      return IMAPA::SetMailbox(tmp.Deref(strMailbox));
    }
    inline CFStringRef GetMailboxFlags() {
      return tmpMailboxFlags.Set(IMAPA::GetMailboxFlags());
    }


    inline CFStringRef GetMailServer() {
      return tmpMailServer.Set(IMAPA::GetMailServer());
    }

    inline INT SetMailServer(CFStringRef strMailServer) {
      MCFStringAcc tmp;
      return IMAPA::SetMailServer(tmp.Deref(strMailServer));
    }
    inline CFStringRef GetMessageBCc(USHORT usAddressIndex) {
      return tmpMessageBCc.Set(IMAPA::GetMessageBCc(usAddressIndex));
    }

    inline CFStringRef GetMessageCc(USHORT usAddressIndex) {
      return tmpMessageCc.Set(IMAPA::GetMessageCc(usAddressIndex));
    }

    inline CFStringRef GetMessageContentEncoding() {
      return tmpMessageContentEncoding.Set(IMAPA::GetMessageContentEncoding());
    }

    inline CFStringRef GetMessageContentType() {
      return tmpMessageContentType.Set(IMAPA::GetMessageContentType());
    }


    inline CFStringRef GetMessageDate() {
      return tmpMessageDate.Set(IMAPA::GetMessageDate());
    }

    inline CFStringRef GetMessageDeliveryTime() {
      return tmpMessageDeliveryTime.Set(IMAPA::GetMessageDeliveryTime());
    }

    inline CFStringRef GetMessageFlags() {
      return tmpMessageFlags.Set(IMAPA::GetMessageFlags());
    }

    inline INT SetMessageFlags(CFStringRef strMessageFlags) {
      MCFStringAcc tmp;
      return IMAPA::SetMessageFlags(tmp.Deref(strMessageFlags));
    }
    inline CFStringRef GetMessageFrom() {
      return tmpMessageFrom.Set(IMAPA::GetMessageFrom());
    }

    inline CFStringRef GetMessageHeaders() {
      return tmpMessageHeaders.Set(IMAPA::GetMessageHeaders());
    }

    inline INT SetMessageHeaders(CFStringRef strMessageHeaders) {
      MCFStringAcc tmp;
      return IMAPA::SetMessageHeaders(tmp.Deref(strMessageHeaders));
    }
    inline CFStringRef GetMessageId() {
      return tmpMessageId.Set(IMAPA::GetMessageId());
    }

    inline CFStringRef GetMessageInReplyTo() {
      return tmpMessageInReplyTo.Set(IMAPA::GetMessageInReplyTo());
    }

    inline CFStringRef GetMessageNetId() {
      return tmpMessageNetId.Set(IMAPA::GetMessageNetId());
    }

    inline CFStringRef GetMessageReplyTo() {
      return tmpMessageReplyTo.Set(IMAPA::GetMessageReplyTo());
    }

    inline CFStringRef GetMessageSender() {
      return tmpMessageSender.Set(IMAPA::GetMessageSender());
    }

    inline CFStringRef GetMessageSet() {
      return tmpMessageSet.Set(IMAPA::GetMessageSet());
    }

    inline INT SetMessageSet(CFStringRef strMessageSet) {
      MCFStringAcc tmp;
      return IMAPA::SetMessageSet(tmp.Deref(strMessageSet));
    }

    inline CFStringRef GetMessageSubject() {
      return tmpMessageSubject.Set(IMAPA::GetMessageSubject());
    }

    inline CFStringRef GetMessageText() {
      return tmpMessageText.Set(IMAPA::GetMessageText());
    }

    inline INT SetMessageText(CFStringRef strMessageText) {
      MCFStringAcc tmp;
      return IMAPA::SetMessageText(tmp.Deref(strMessageText));
    }
    inline CFStringRef GetMessageTo(USHORT usAddressIndex) {
      return tmpMessageTo.Set(IMAPA::GetMessageTo(usAddressIndex));
    }

    inline CFStringRef GetNewMailbox() {
      return tmpNewMailbox.Set(IMAPA::GetNewMailbox());
    }

    inline INT SetNewMailbox(CFStringRef strNewMailbox) {
      MCFStringAcc tmp;
      return IMAPA::SetNewMailbox(tmp.Deref(strNewMailbox));
    }
    inline CFStringRef GetPartId() {
      return tmpPartId.Set(IMAPA::GetPartId());
    }

    inline INT SetPartId(CFStringRef strPartId) {
      MCFStringAcc tmp;
      return IMAPA::SetPartId(tmp.Deref(strPartId));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(IMAPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return IMAPA::SetPassword(tmp.Deref(strPassword));
    }


    inline CFStringRef GetSearchCriteria() {
      return tmpSearchCriteria.Set(IMAPA::GetSearchCriteria());
    }

    inline INT SetSearchCriteria(CFStringRef strSearchCriteria) {
      MCFStringAcc tmp;
      return IMAPA::SetSearchCriteria(tmp.Deref(strSearchCriteria));
    }




    inline CFStringRef GetUser() {
      return tmpUser.Set(IMAPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return IMAPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(IMAPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(IMAPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return IMAPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(IMAPA::GetWinsockStatus());
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

    virtual INT FireMailboxList(LPSTR &lpszMailbox, LPSTR &lpszSeparator, LPSTR &lpszFlags) {
      MCFStringRef etmpMailbox(lpszMailbox);
      CFStringRef uval_lpszMailbox = etmpMailbox.Deref();
      MCFStringRef etmpSeparator(lpszSeparator);
      CFStringRef uval_lpszSeparator = etmpSeparator.Deref();
      MCFStringRef etmpFlags(lpszFlags);
      CFStringRef uval_lpszFlags = etmpFlags.Deref();

      return FireMailboxList(uval_lpszMailbox, uval_lpszSeparator, uval_lpszFlags);
    }
    virtual INT FireMailboxList(CFStringRef &lpszMailbox, CFStringRef &lpszSeparator, CFStringRef &lpszFlags) {
      return 0;
    }

    virtual INT FireMessageInfo(LPSTR &lpszMessageId, LPSTR &lpszSubject, LPSTR &lpszMessageDate, LPSTR &lpszFrom, LPSTR &lpszFlags, LONG &lSize) {
      MCFStringRef etmpMessageId(lpszMessageId);
      CFStringRef uval_lpszMessageId = etmpMessageId.Deref();
      MCFStringRef etmpSubject(lpszSubject);
      CFStringRef uval_lpszSubject = etmpSubject.Deref();
      MCFStringRef etmpMessageDate(lpszMessageDate);
      CFStringRef uval_lpszMessageDate = etmpMessageDate.Deref();
      MCFStringRef etmpFrom(lpszFrom);
      CFStringRef uval_lpszFrom = etmpFrom.Deref();
      MCFStringRef etmpFlags(lpszFlags);
      CFStringRef uval_lpszFlags = etmpFlags.Deref();

      return FireMessageInfo(uval_lpszMessageId, uval_lpszSubject, uval_lpszMessageDate, uval_lpszFrom, uval_lpszFlags, lSize);
    }
    virtual INT FireMessageInfo(CFStringRef &lpszMessageId, CFStringRef &lpszSubject, CFStringRef &lpszMessageDate, CFStringRef &lpszFrom, CFStringRef &lpszFlags, LONG &lSize) {
      return 0;
    }

    virtual INT FireMessagePart(LPSTR &lpszPartId, LONG &lSize, LPSTR &lpszContentType, LPSTR &lpszFilename, LPSTR &lpszContentEncoding, LPSTR &lpszParameters, LPSTR &lpszMultipartMode) {
      MCFStringRef etmpPartId(lpszPartId);
      CFStringRef uval_lpszPartId = etmpPartId.Deref();
      MCFStringRef etmpContentType(lpszContentType);
      CFStringRef uval_lpszContentType = etmpContentType.Deref();
      MCFStringRef etmpFilename(lpszFilename);
      CFStringRef uval_lpszFilename = etmpFilename.Deref();
      MCFStringRef etmpContentEncoding(lpszContentEncoding);
      CFStringRef uval_lpszContentEncoding = etmpContentEncoding.Deref();
      MCFStringRef etmpParameters(lpszParameters);
      CFStringRef uval_lpszParameters = etmpParameters.Deref();
      MCFStringRef etmpMultipartMode(lpszMultipartMode);
      CFStringRef uval_lpszMultipartMode = etmpMultipartMode.Deref();

      return FireMessagePart(uval_lpszPartId, lSize, uval_lpszContentType, uval_lpszFilename, uval_lpszContentEncoding, uval_lpszParameters, uval_lpszMultipartMode);
    }
    virtual INT FireMessagePart(CFStringRef &lpszPartId, LONG &lSize, CFStringRef &lpszContentType, CFStringRef &lpszFilename, CFStringRef &lpszContentEncoding, CFStringRef &lpszParameters, CFStringRef &lpszMultipartMode) {
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



    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpszText) {
      MCFStringRef etmpText(lpszText);
      CFStringRef uval_lpszText = etmpText.Deref();

      return FireTransfer(lBytesTransferred, uval_lpszText);
    }
    virtual INT FireTransfer(LONG &lBytesTransferred, CFStringRef &lpszText) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters

    inline int AddMessageFlags(CFStringRef pFlags) {
      MCFStringAcc etmpFlags;
      LPSTR lpszFlags = etmpFlags.Deref(pFlags);

      return IMAPA::AddMessageFlags(lpszFlags);
    }























































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
    MUString tmpMailbox;
    MUString tmpMailboxFlags;
    MUString tmpMailServer;
    MUString tmpMessageBCc;
    MUString tmpMessageCc;
    MUString tmpMessageContentEncoding;
    MUString tmpMessageContentType;
    MUString tmpMessageDate;
    MUString tmpMessageDeliveryTime;
    MUString tmpMessageFlags;
    MUString tmpMessageFrom;
    MUString tmpMessageHeaders;
    MUString tmpMessageId;
    MUString tmpMessageInReplyTo;
    MUString tmpMessageNetId;
    MUString tmpMessageReplyTo;
    MUString tmpMessageSender;
    MUString tmpMessageSet;
    MUString tmpMessageSubject;
    MUString tmpMessageText;
    MUString tmpMessageTo;
    MUString tmpNewMailbox;
    MUString tmpPartId;
    MUString tmpPassword;
    MUString tmpSearchCriteria;
    MUString tmpUser;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(IMAPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties


    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return IMAPA::SetCommand(tmp.Deref());
    }


    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = IMAPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return IMAPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(IMAPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return IMAPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(IMAPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return IMAPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(IMAPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return IMAPA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(IMAPA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(IMAPA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return IMAPA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(IMAPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return IMAPA::SetLocalHost(tmp.Deref());
    }
    inline LPWSTR GetMailbox() {
      tmpMailbox.Set(IMAPA::GetMailbox());
      return tmpMailbox.Deref();
    }

    inline INT SetMailbox(LPWSTR lpszMailbox) {
      MAString tmp(lpszMailbox);
      return IMAPA::SetMailbox(tmp.Deref());
    }
    inline LPWSTR GetMailboxFlags() {
      tmpMailboxFlags.Set(IMAPA::GetMailboxFlags());
      return tmpMailboxFlags.Deref();
    }


    inline LPWSTR GetMailServer() {
      tmpMailServer.Set(IMAPA::GetMailServer());
      return tmpMailServer.Deref();
    }

    inline INT SetMailServer(LPWSTR lpszMailServer) {
      MAString tmp(lpszMailServer);
      return IMAPA::SetMailServer(tmp.Deref());
    }
    inline LPWSTR GetMessageBCc(USHORT usAddressIndex) {
      tmpMessageBCc.Set(IMAPA::GetMessageBCc(usAddressIndex));
      return tmpMessageBCc.Deref();
    }

    inline LPWSTR GetMessageCc(USHORT usAddressIndex) {
      tmpMessageCc.Set(IMAPA::GetMessageCc(usAddressIndex));
      return tmpMessageCc.Deref();
    }

    inline LPWSTR GetMessageContentEncoding() {
      tmpMessageContentEncoding.Set(IMAPA::GetMessageContentEncoding());
      return tmpMessageContentEncoding.Deref();
    }

    inline LPWSTR GetMessageContentType() {
      tmpMessageContentType.Set(IMAPA::GetMessageContentType());
      return tmpMessageContentType.Deref();
    }


    inline LPWSTR GetMessageDate() {
      tmpMessageDate.Set(IMAPA::GetMessageDate());
      return tmpMessageDate.Deref();
    }

    inline LPWSTR GetMessageDeliveryTime() {
      tmpMessageDeliveryTime.Set(IMAPA::GetMessageDeliveryTime());
      return tmpMessageDeliveryTime.Deref();
    }

    inline LPWSTR GetMessageFlags() {
      tmpMessageFlags.Set(IMAPA::GetMessageFlags());
      return tmpMessageFlags.Deref();
    }

    inline INT SetMessageFlags(LPWSTR lpszMessageFlags) {
      MAString tmp(lpszMessageFlags);
      return IMAPA::SetMessageFlags(tmp.Deref());
    }
    inline LPWSTR GetMessageFrom() {
      tmpMessageFrom.Set(IMAPA::GetMessageFrom());
      return tmpMessageFrom.Deref();
    }

    inline LPWSTR GetMessageHeaders() {
      tmpMessageHeaders.Set(IMAPA::GetMessageHeaders());
      return tmpMessageHeaders.Deref();
    }

    inline INT SetMessageHeaders(LPWSTR lpszMessageHeaders) {
      MAString tmp(lpszMessageHeaders);
      return IMAPA::SetMessageHeaders(tmp.Deref());
    }
    inline LPWSTR GetMessageId() {
      tmpMessageId.Set(IMAPA::GetMessageId());
      return tmpMessageId.Deref();
    }

    inline LPWSTR GetMessageInReplyTo() {
      tmpMessageInReplyTo.Set(IMAPA::GetMessageInReplyTo());
      return tmpMessageInReplyTo.Deref();
    }

    inline LPWSTR GetMessageNetId() {
      tmpMessageNetId.Set(IMAPA::GetMessageNetId());
      return tmpMessageNetId.Deref();
    }

    inline LPWSTR GetMessageReplyTo() {
      tmpMessageReplyTo.Set(IMAPA::GetMessageReplyTo());
      return tmpMessageReplyTo.Deref();
    }

    inline LPWSTR GetMessageSender() {
      tmpMessageSender.Set(IMAPA::GetMessageSender());
      return tmpMessageSender.Deref();
    }

    inline LPWSTR GetMessageSet() {
      tmpMessageSet.Set(IMAPA::GetMessageSet());
      return tmpMessageSet.Deref();
    }

    inline INT SetMessageSet(LPWSTR lpszMessageSet) {
      MAString tmp(lpszMessageSet);
      return IMAPA::SetMessageSet(tmp.Deref());
    }

    inline LPWSTR GetMessageSubject() {
      tmpMessageSubject.Set(IMAPA::GetMessageSubject());
      return tmpMessageSubject.Deref();
    }

    inline LPWSTR GetMessageText() {
      tmpMessageText.Set(IMAPA::GetMessageText());
      return tmpMessageText.Deref();
    }

    inline INT SetMessageText(LPWSTR lpszMessageText) {
      MAString tmp(lpszMessageText);
      return IMAPA::SetMessageText(tmp.Deref());
    }
    inline LPWSTR GetMessageTo(USHORT usAddressIndex) {
      tmpMessageTo.Set(IMAPA::GetMessageTo(usAddressIndex));
      return tmpMessageTo.Deref();
    }

    inline LPWSTR GetNewMailbox() {
      tmpNewMailbox.Set(IMAPA::GetNewMailbox());
      return tmpNewMailbox.Deref();
    }

    inline INT SetNewMailbox(LPWSTR lpszNewMailbox) {
      MAString tmp(lpszNewMailbox);
      return IMAPA::SetNewMailbox(tmp.Deref());
    }
    inline LPWSTR GetPartId() {
      tmpPartId.Set(IMAPA::GetPartId());
      return tmpPartId.Deref();
    }

    inline INT SetPartId(LPWSTR lpszPartId) {
      MAString tmp(lpszPartId);
      return IMAPA::SetPartId(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(IMAPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return IMAPA::SetPassword(tmp.Deref());
    }


    inline LPWSTR GetSearchCriteria() {
      tmpSearchCriteria.Set(IMAPA::GetSearchCriteria());
      return tmpSearchCriteria.Deref();
    }

    inline INT SetSearchCriteria(LPWSTR lpszSearchCriteria) {
      MAString tmp(lpszSearchCriteria);
      return IMAPA::SetSearchCriteria(tmp.Deref());
    }




    inline LPWSTR GetUser() {
      tmpUser.Set(IMAPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return IMAPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(IMAPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(IMAPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return IMAPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(IMAPA::GetWinsockStatus());
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

    virtual INT FireMailboxList(LPSTR &lpszMailbox, LPSTR &lpszSeparator, LPSTR &lpszFlags) {
      MUString etmpMailbox(lpszMailbox);
      LPWSTR uval_lpszMailbox = etmpMailbox.Deref();
      MUString etmpSeparator(lpszSeparator);
      LPWSTR uval_lpszSeparator = etmpSeparator.Deref();
      MUString etmpFlags(lpszFlags);
      LPWSTR uval_lpszFlags = etmpFlags.Deref();

      return FireMailboxList(uval_lpszMailbox, uval_lpszSeparator, uval_lpszFlags);
    }
    virtual INT FireMailboxList(LPWSTR &lpszMailbox, LPWSTR &lpszSeparator, LPWSTR &lpszFlags) {
      return 0;
    }

    virtual INT FireMessageInfo(LPSTR &lpszMessageId, LPSTR &lpszSubject, LPSTR &lpszMessageDate, LPSTR &lpszFrom, LPSTR &lpszFlags, LONG &lSize) {
      MUString etmpMessageId(lpszMessageId);
      LPWSTR uval_lpszMessageId = etmpMessageId.Deref();
      MUString etmpSubject(lpszSubject);
      LPWSTR uval_lpszSubject = etmpSubject.Deref();
      MUString etmpMessageDate(lpszMessageDate);
      LPWSTR uval_lpszMessageDate = etmpMessageDate.Deref();
      MUString etmpFrom(lpszFrom);
      LPWSTR uval_lpszFrom = etmpFrom.Deref();
      MUString etmpFlags(lpszFlags);
      LPWSTR uval_lpszFlags = etmpFlags.Deref();

      return FireMessageInfo(uval_lpszMessageId, uval_lpszSubject, uval_lpszMessageDate, uval_lpszFrom, uval_lpszFlags, lSize);
    }
    virtual INT FireMessageInfo(LPWSTR &lpszMessageId, LPWSTR &lpszSubject, LPWSTR &lpszMessageDate, LPWSTR &lpszFrom, LPWSTR &lpszFlags, LONG &lSize) {
      return 0;
    }

    virtual INT FireMessagePart(LPSTR &lpszPartId, LONG &lSize, LPSTR &lpszContentType, LPSTR &lpszFilename, LPSTR &lpszContentEncoding, LPSTR &lpszParameters, LPSTR &lpszMultipartMode) {
      MUString etmpPartId(lpszPartId);
      LPWSTR uval_lpszPartId = etmpPartId.Deref();
      MUString etmpContentType(lpszContentType);
      LPWSTR uval_lpszContentType = etmpContentType.Deref();
      MUString etmpFilename(lpszFilename);
      LPWSTR uval_lpszFilename = etmpFilename.Deref();
      MUString etmpContentEncoding(lpszContentEncoding);
      LPWSTR uval_lpszContentEncoding = etmpContentEncoding.Deref();
      MUString etmpParameters(lpszParameters);
      LPWSTR uval_lpszParameters = etmpParameters.Deref();
      MUString etmpMultipartMode(lpszMultipartMode);
      LPWSTR uval_lpszMultipartMode = etmpMultipartMode.Deref();

      return FireMessagePart(uval_lpszPartId, lSize, uval_lpszContentType, uval_lpszFilename, uval_lpszContentEncoding, uval_lpszParameters, uval_lpszMultipartMode);
    }
    virtual INT FireMessagePart(LPWSTR &lpszPartId, LONG &lSize, LPWSTR &lpszContentType, LPWSTR &lpszFilename, LPWSTR &lpszContentEncoding, LPWSTR &lpszParameters, LPWSTR &lpszMultipartMode) {
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



    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpszText) {
      MUString etmpText(lpszText);
      LPWSTR uval_lpszText = etmpText.Deref();

      return FireTransfer(lBytesTransferred, uval_lpszText);
    }
    virtual INT FireTransfer(LONG &lBytesTransferred, LPWSTR &lpszText) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_IMAP_H_




