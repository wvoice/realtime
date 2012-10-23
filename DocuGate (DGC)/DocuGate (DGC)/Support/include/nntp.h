/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_NNTP_H_
#define _IPWORKS_NNTP_H_

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

#define nntpIdle                                           0
#define nntpConnect                                        1
#define nntpDisconnect                                     2
#define nntpListGroups                                     3
#define nntpListNewGroups                                  4
#define nntpGroupOverview                                  5
#define nntpGetArticle                                     6
#define nntpGetArticleHeaders                              7
#define nntpGetArticleBody                                 8
#define nntpPostArticle                                    9
#define nntpResetHeaders                                   10
#define nntpGroupSearch                                    11

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3


#define NNTP_IDLE                                          0
#define NNTP_CONNECT                                       1
#define NNTP_DISCONNECT                                    2
#define NNTP_LIST_GROUPS                                   3
#define NNTP_LIST_NEW_GROUPS                               4
#define NNTP_GROUP_OVERVIEW                                5
#define NNTP_GET_ARTICLE                                   6
#define NNTP_GET_ARTICLE_HEADERS                           7
#define NNTP_GET_ARTICLE_BODY                              8
#define NNTP_POST_ARTICLE                                  9
#define NNTP_RESET_HEADERS                                 10
#define NNTP_GROUP_SEARCH                                  11

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3



#endif //_IPWORKS_INTERNAL_

#define PID_NNTP_ACTION    1
#define PID_NNTP_ARTICLECOUNT    2
#define PID_NNTP_ARTICLEHEADERS    3
#define PID_NNTP_ARTICLETEXT    4
#define PID_NNTP_ATTACHEDFILE    5
#define PID_NNTP_CHECKDATE    6
#define PID_NNTP_COMMAND    7
#define PID_NNTP_CONNECTED    8
#define PID_NNTP_CURRENTARTICLE    9
#define PID_NNTP_CURRENTGROUP    10
#define PID_NNTP_FIREWALLDATA    11
#define PID_NNTP_FIREWALLHOST    12
#define PID_NNTP_FIREWALLPASSWORD    13
#define PID_NNTP_FIREWALLPORT    14
#define PID_NNTP_FIREWALLTYPE    15
#define PID_NNTP_FIREWALLUSER    16
#define PID_NNTP_FIRSTARTICLE    17
#define PID_NNTP_FROM    18
#define PID_NNTP_LASTARTICLE    19
#define PID_NNTP_LASTREPLY    20
#define PID_NNTP_LOCALHOST    21
#define PID_NNTP_MAXHEADERLENGTH    22
#define PID_NNTP_MAXLINES    23
#define PID_NNTP_NEWSGROUPS    24
#define PID_NNTP_NEWSPORT    25
#define PID_NNTP_NEWSSERVER    26
#define PID_NNTP_ORGANIZATION    27
#define PID_NNTP_OTHERHEADERS    28
#define PID_NNTP_OVERVIEWRANGE    29
#define PID_NNTP_PASSWORD    30
#define PID_NNTP_REFERENCES    31
#define PID_NNTP_REPLYTO    32
#define PID_NNTP_SEARCHHEADER    33
#define PID_NNTP_SEARCHPATTERN    34
#define PID_NNTP_SEARCHRANGE    35
#define PID_NNTP_SOCKETHANDLE    36
#define PID_NNTP_SUBJECT    37
#define PID_NNTP_TIMEOUT    38
#define PID_NNTP_USER    39
#define PID_NNTP_WINSOCKINFO    40
#define PID_NNTP_WINSOCKLOADED    41
#define PID_NNTP_WINSOCKMAXDATAGRAMSIZE    42
#define PID_NNTP_WINSOCKMAXSOCKETS    43
#define PID_NNTP_WINSOCKPATH    44
#define PID_NNTP_WINSOCKSTATUS    45


#define MID_NNTP_CONNECT    1
#define MID_NNTP_DISCONNECT    2
#define MID_NNTP_DOEVENTS    3
#define MID_NNTP_FETCHARTICLE    4
#define MID_NNTP_FETCHARTICLEBODY    5
#define MID_NNTP_FETCHARTICLEHEADERS    6
#define MID_NNTP_GROUPOVERVIEW    7
#define MID_NNTP_GROUPSEARCH    8
#define MID_NNTP_INTERRUPT    9
#define MID_NNTP_LISTGROUPS    10
#define MID_NNTP_LISTNEWGROUPS    11
#define MID_NNTP_POSTARTICLE    12
#define MID_NNTP_RESETHEADERS    13


#define EID_NNTP_ENDTRANSFER    1
#define EID_NNTP_ERROR    2
#define EID_NNTP_GROUPLIST    3
#define EID_NNTP_GROUPOVERVIEW    4
#define EID_NNTP_GROUPSEARCH    5
#define EID_NNTP_HEADER    6
#define EID_NNTP_PITRAIL    7
#define EID_NNTP_STARTTRANSFER    8
#define EID_NNTP_TRANSFER    9


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID NNTP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    NNTP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    NNTP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID NNTP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    NNTP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    NNTP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  NNTP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    NNTP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   NNTP_StaticInit(LPVOID hInst);

class NNTPA {
  
  public: //events
  
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireGroupList(LPSTR &lpszGroup, LONG &lFirstArticle, LONG &lLastArticle, BOOL &bCanPost) {return 0;}
    virtual INT FireGroupOverview(LONG &lArticleNumber, LPSTR &lpszSubject, LPSTR &lpszFrom, LPSTR &lpszArticleDate, LPSTR &lpszMessageId, LPSTR &lpszReferences, LONG &lArticleSize, LONG &lArticleLines, LPSTR &lpszOtherHeaders) {return 0;}
    virtual INT FireGroupSearch(LONG &lArticleNumber, LPSTR &lpszHeader) {return 0;}
    virtual INT FireHeader(LPSTR &lpszField, LPSTR &lpszValue) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText, BOOL &bEOL) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_NNTP_ENDTRANSFER: {
            
            return ((NNTPA*)lpObj)->FireEndTransfer();
         }
         case EID_NNTP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_NNTP_GROUPLIST: {
                        LPSTR pGroup = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pFirstArticle = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pLastArticle = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        BOOL pCanPost = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FireGroupList(pGroup, pFirstArticle, pLastArticle, pCanPost);
         }
         case EID_NNTP_GROUPOVERVIEW: {
                        LONG pArticleNumber = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSubject = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFrom = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pArticleDate = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessageId = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pReferences = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pArticleSize = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pArticleLines = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pOtherHeaders = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FireGroupOverview(pArticleNumber, pSubject, pFrom, pArticleDate, pMessageId, pReferences, pArticleSize, pArticleLines, pOtherHeaders);
         }
         case EID_NNTP_GROUPSEARCH: {
                        LONG pArticleNumber = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pHeader = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FireGroupSearch(pArticleNumber, pHeader);
         }
         case EID_NNTP_HEADER: {
                        LPSTR pField = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pValue = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FireHeader(pField, pValue);
         }
         case EID_NNTP_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_NNTP_STARTTRANSFER: {
            
            return ((NNTPA*)lpObj)->FireStartTransfer();
         }
         case EID_NNTP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
                        BOOL pEOL = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NNTPA*)lpObj)->FireTransfer(pBytesTransferred, pText, lenText, pEOL);
         }

      }
      return 0;
    }

  public:

    NNTPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_25) {
      m_pObj = NNTP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~NNTPA() {
      NNTP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)NNTP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return NNTP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)NNTP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return NNTP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return NNTP_Set(m_pObj, PID_NNTP_ACTION, 0, (LPVOID)val, 0);
    }
    inline LONG GetArticleCount() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_ARTICLECOUNT, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetArticleHeaders() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_ARTICLEHEADERS, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetArticleText() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_ARTICLETEXT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetArticleText(LPCSTR lpszArticleText) {
      int val = (int)lpszArticleText;
      return NNTP_Set(m_pObj, PID_NNTP_ARTICLETEXT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAttachedFile() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_ATTACHEDFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAttachedFile(LPCSTR lpszAttachedFile) {
      int val = (int)lpszAttachedFile;
      return NNTP_Set(m_pObj, PID_NNTP_ATTACHEDFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCheckDate() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_CHECKDATE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCheckDate(LPCSTR lpszCheckDate) {
      int val = (int)lpszCheckDate;
      return NNTP_Set(m_pObj, PID_NNTP_CHECKDATE, 0, (LPVOID)val, 0);
    }

    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return NNTP_Set(m_pObj, PID_NNTP_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline LPCSTR GetCurrentArticle() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_CURRENTARTICLE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCurrentArticle(LPCSTR lpszCurrentArticle) {
      int val = (int)lpszCurrentArticle;
      return NNTP_Set(m_pObj, PID_NNTP_CURRENTARTICLE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCurrentGroup() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_CURRENTGROUP, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCurrentGroup(LPCSTR lpszCurrentGroup) {
      int val = (int)lpszCurrentGroup;
      return NNTP_Set(m_pObj, PID_NNTP_CURRENTGROUP, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)NNTP_Get(m_pObj, PID_NNTP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return NNTP_Set(m_pObj, PID_NNTP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return NNTP_Set(m_pObj, PID_NNTP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return NNTP_Set(m_pObj, PID_NNTP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return NNTP_Set(m_pObj, PID_NNTP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return NNTP_Set(m_pObj, PID_NNTP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return NNTP_Set(m_pObj, PID_NNTP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LONG GetFirstArticle() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FIRSTARTICLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetFrom() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_FROM, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFrom(LPCSTR lpszFrom) {
      int val = (int)lpszFrom;
      return NNTP_Set(m_pObj, PID_NNTP_FROM, 0, (LPVOID)val, 0);
    }
    inline LONG GetLastArticle() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_LASTARTICLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetLastReply() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalHost() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return NNTP_Set(m_pObj, PID_NNTP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMaxHeaderLength() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_MAXHEADERLENGTH, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMaxHeaderLength(USHORT usMaxHeaderLength) {
      int val = (int)usMaxHeaderLength;
      return NNTP_Set(m_pObj, PID_NNTP_MAXHEADERLENGTH, 0, (LPVOID)val, 0);
    }
    inline USHORT GetMaxLines() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_MAXLINES, 0, 0);
      return (USHORT)val;
    }
    inline INT SetMaxLines(USHORT usMaxLines) {
      int val = (int)usMaxLines;
      return NNTP_Set(m_pObj, PID_NNTP_MAXLINES, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetNewsgroups() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_NEWSGROUPS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetNewsgroups(LPCSTR lpszNewsgroups) {
      int val = (int)lpszNewsgroups;
      return NNTP_Set(m_pObj, PID_NNTP_NEWSGROUPS, 0, (LPVOID)val, 0);
    }
    inline USHORT GetNewsPort() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_NEWSPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetNewsPort(USHORT usNewsPort) {
      int val = (int)usNewsPort;
      return NNTP_Set(m_pObj, PID_NNTP_NEWSPORT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetNewsServer() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_NEWSSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetNewsServer(LPCSTR lpszNewsServer) {
      int val = (int)lpszNewsServer;
      return NNTP_Set(m_pObj, PID_NNTP_NEWSSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOrganization() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_ORGANIZATION, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOrganization(LPCSTR lpszOrganization) {
      int val = (int)lpszOrganization;
      return NNTP_Set(m_pObj, PID_NNTP_ORGANIZATION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOtherHeaders() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_OTHERHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOtherHeaders(LPCSTR lpszOtherHeaders) {
      int val = (int)lpszOtherHeaders;
      return NNTP_Set(m_pObj, PID_NNTP_OTHERHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetOverviewRange() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_OVERVIEWRANGE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetOverviewRange(LPCSTR lpszOverviewRange) {
      int val = (int)lpszOverviewRange;
      return NNTP_Set(m_pObj, PID_NNTP_OVERVIEWRANGE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return NNTP_Set(m_pObj, PID_NNTP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReferences() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_REFERENCES, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReferences(LPCSTR lpszReferences) {
      int val = (int)lpszReferences;
      return NNTP_Set(m_pObj, PID_NNTP_REFERENCES, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetReplyTo() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_REPLYTO, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetReplyTo(LPCSTR lpszReplyTo) {
      int val = (int)lpszReplyTo;
      return NNTP_Set(m_pObj, PID_NNTP_REPLYTO, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSearchHeader() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_SEARCHHEADER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSearchHeader(LPCSTR lpszSearchHeader) {
      int val = (int)lpszSearchHeader;
      return NNTP_Set(m_pObj, PID_NNTP_SEARCHHEADER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSearchPattern() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_SEARCHPATTERN, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSearchPattern(LPCSTR lpszSearchPattern) {
      int val = (int)lpszSearchPattern;
      return NNTP_Set(m_pObj, PID_NNTP_SEARCHPATTERN, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetSearchRange() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_SEARCHRANGE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSearchRange(LPCSTR lpszSearchRange) {
      int val = (int)lpszSearchRange;
      return NNTP_Set(m_pObj, PID_NNTP_SEARCHRANGE, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetSubject() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_SUBJECT, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetSubject(LPCSTR lpszSubject) {
      int val = (int)lpszSubject;
      return NNTP_Set(m_pObj, PID_NNTP_SUBJECT, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return NNTP_Set(m_pObj, PID_NNTP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return NNTP_Set(m_pObj, PID_NNTP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return NNTP_Set(m_pObj, PID_NNTP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return NNTP_Set(m_pObj, PID_NNTP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)NNTP_Get(m_pObj, PID_NNTP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Connect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_CONNECT, 0, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int FetchArticle() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_FETCHARTICLE, 0, param, cbparam);
      
      
    }
    inline int FetchArticleBody() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_FETCHARTICLEBODY, 0, param, cbparam);
      
      
    }
    inline int FetchArticleHeaders() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_FETCHARTICLEHEADERS, 0, param, cbparam);
      
      
    }
    inline int GroupOverview() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_GROUPOVERVIEW, 0, param, cbparam);
      
      
    }
    inline int GroupSearch() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_GROUPSEARCH, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int ListGroups() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_LISTGROUPS, 0, param, cbparam);
      
      
    }
    inline int ListNewGroups() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_LISTNEWGROUPS, 0, param, cbparam);
      
      
    }
    inline int PostArticle() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_POSTARTICLE, 0, param, cbparam);
      
      
    }
    inline int ResetHeaders() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NNTP_Do(m_pObj, MID_NNTP_RESETHEADERS, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class NNTP : public NNTPA {
  
  public:
    NNTP(LPCSTR lpOemKey = IPWORKS_OEMKEY_25):NNTPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpArticleHeaders;
    MCFStringRef tmpArticleText;
    MCFStringRef tmpAttachedFile;
    MCFStringRef tmpCheckDate;
    MCFStringRef tmpCommand;
    MCFStringRef tmpCurrentArticle;
    MCFStringRef tmpCurrentGroup;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpFrom;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpNewsgroups;
    MCFStringRef tmpNewsServer;
    MCFStringRef tmpOrganization;
    MCFStringRef tmpOtherHeaders;
    MCFStringRef tmpOverviewRange;
    MCFStringRef tmpPassword;
    MCFStringRef tmpReferences;
    MCFStringRef tmpReplyTo;
    MCFStringRef tmpSearchHeader;
    MCFStringRef tmpSearchPattern;
    MCFStringRef tmpSearchRange;
    MCFStringRef tmpSubject;
    MCFStringRef tmpUser;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(NNTPA::GetLastError());
    }

    // CFString versions of properties


    inline CFStringRef GetArticleHeaders() {
      return tmpArticleHeaders.Set(NNTPA::GetArticleHeaders());
    }

    inline CFStringRef GetArticleText() {
      return tmpArticleText.Set(NNTPA::GetArticleText());
    }

    inline INT SetArticleText(CFStringRef strArticleText) {
      MCFStringAcc tmp;
      return NNTPA::SetArticleText(tmp.Deref(strArticleText));
    }
    inline CFStringRef GetAttachedFile() {
      return tmpAttachedFile.Set(NNTPA::GetAttachedFile());
    }

    inline INT SetAttachedFile(CFStringRef strAttachedFile) {
      MCFStringAcc tmp;
      return NNTPA::SetAttachedFile(tmp.Deref(strAttachedFile));
    }
    inline CFStringRef GetCheckDate() {
      return tmpCheckDate.Set(NNTPA::GetCheckDate());
    }

    inline INT SetCheckDate(CFStringRef strCheckDate) {
      MCFStringAcc tmp;
      return NNTPA::SetCheckDate(tmp.Deref(strCheckDate));
    }

    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return NNTPA::SetCommand(tmp.Deref(strCommand));
    }

    inline CFStringRef GetCurrentArticle() {
      return tmpCurrentArticle.Set(NNTPA::GetCurrentArticle());
    }

    inline INT SetCurrentArticle(CFStringRef strCurrentArticle) {
      MCFStringAcc tmp;
      return NNTPA::SetCurrentArticle(tmp.Deref(strCurrentArticle));
    }
    inline CFStringRef GetCurrentGroup() {
      return tmpCurrentGroup.Set(NNTPA::GetCurrentGroup());
    }

    inline INT SetCurrentGroup(CFStringRef strCurrentGroup) {
      MCFStringAcc tmp;
      return NNTPA::SetCurrentGroup(tmp.Deref(strCurrentGroup));
    }
    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = NNTPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return NNTPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(NNTPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return NNTPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(NNTPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return NNTPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(NNTPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return NNTPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }

    inline CFStringRef GetFrom() {
      return tmpFrom.Set(NNTPA::GetFrom());
    }

    inline INT SetFrom(CFStringRef strFrom) {
      MCFStringAcc tmp;
      return NNTPA::SetFrom(tmp.Deref(strFrom));
    }

    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(NNTPA::GetLastReply());
    }

    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(NNTPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return NNTPA::SetLocalHost(tmp.Deref(strLocalHost));
    }


    inline CFStringRef GetNewsgroups() {
      return tmpNewsgroups.Set(NNTPA::GetNewsgroups());
    }

    inline INT SetNewsgroups(CFStringRef strNewsgroups) {
      MCFStringAcc tmp;
      return NNTPA::SetNewsgroups(tmp.Deref(strNewsgroups));
    }

    inline CFStringRef GetNewsServer() {
      return tmpNewsServer.Set(NNTPA::GetNewsServer());
    }

    inline INT SetNewsServer(CFStringRef strNewsServer) {
      MCFStringAcc tmp;
      return NNTPA::SetNewsServer(tmp.Deref(strNewsServer));
    }
    inline CFStringRef GetOrganization() {
      return tmpOrganization.Set(NNTPA::GetOrganization());
    }

    inline INT SetOrganization(CFStringRef strOrganization) {
      MCFStringAcc tmp;
      return NNTPA::SetOrganization(tmp.Deref(strOrganization));
    }
    inline CFStringRef GetOtherHeaders() {
      return tmpOtherHeaders.Set(NNTPA::GetOtherHeaders());
    }

    inline INT SetOtherHeaders(CFStringRef strOtherHeaders) {
      MCFStringAcc tmp;
      return NNTPA::SetOtherHeaders(tmp.Deref(strOtherHeaders));
    }
    inline CFStringRef GetOverviewRange() {
      return tmpOverviewRange.Set(NNTPA::GetOverviewRange());
    }

    inline INT SetOverviewRange(CFStringRef strOverviewRange) {
      MCFStringAcc tmp;
      return NNTPA::SetOverviewRange(tmp.Deref(strOverviewRange));
    }
    inline CFStringRef GetPassword() {
      return tmpPassword.Set(NNTPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return NNTPA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetReferences() {
      return tmpReferences.Set(NNTPA::GetReferences());
    }

    inline INT SetReferences(CFStringRef strReferences) {
      MCFStringAcc tmp;
      return NNTPA::SetReferences(tmp.Deref(strReferences));
    }
    inline CFStringRef GetReplyTo() {
      return tmpReplyTo.Set(NNTPA::GetReplyTo());
    }

    inline INT SetReplyTo(CFStringRef strReplyTo) {
      MCFStringAcc tmp;
      return NNTPA::SetReplyTo(tmp.Deref(strReplyTo));
    }
    inline CFStringRef GetSearchHeader() {
      return tmpSearchHeader.Set(NNTPA::GetSearchHeader());
    }

    inline INT SetSearchHeader(CFStringRef strSearchHeader) {
      MCFStringAcc tmp;
      return NNTPA::SetSearchHeader(tmp.Deref(strSearchHeader));
    }
    inline CFStringRef GetSearchPattern() {
      return tmpSearchPattern.Set(NNTPA::GetSearchPattern());
    }

    inline INT SetSearchPattern(CFStringRef strSearchPattern) {
      MCFStringAcc tmp;
      return NNTPA::SetSearchPattern(tmp.Deref(strSearchPattern));
    }
    inline CFStringRef GetSearchRange() {
      return tmpSearchRange.Set(NNTPA::GetSearchRange());
    }

    inline INT SetSearchRange(CFStringRef strSearchRange) {
      MCFStringAcc tmp;
      return NNTPA::SetSearchRange(tmp.Deref(strSearchRange));
    }

    inline CFStringRef GetSubject() {
      return tmpSubject.Set(NNTPA::GetSubject());
    }

    inline INT SetSubject(CFStringRef strSubject) {
      MCFStringAcc tmp;
      return NNTPA::SetSubject(tmp.Deref(strSubject));
    }

    inline CFStringRef GetUser() {
      return tmpUser.Set(NNTPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return NNTPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(NNTPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(NNTPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return NNTPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(NNTPA::GetWinsockStatus());
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

    virtual INT FireGroupList(LPSTR &lpszGroup, LONG &lFirstArticle, LONG &lLastArticle, BOOL &bCanPost) {
      MCFStringRef etmpGroup(lpszGroup);
      CFStringRef uval_lpszGroup = etmpGroup.Deref();

      return FireGroupList(uval_lpszGroup, lFirstArticle, lLastArticle, bCanPost);
    }
    virtual INT FireGroupList(CFStringRef &lpszGroup, LONG &lFirstArticle, LONG &lLastArticle, BOOL &bCanPost) {
      return 0;
    }

    virtual INT FireGroupOverview(LONG &lArticleNumber, LPSTR &lpszSubject, LPSTR &lpszFrom, LPSTR &lpszArticleDate, LPSTR &lpszMessageId, LPSTR &lpszReferences, LONG &lArticleSize, LONG &lArticleLines, LPSTR &lpszOtherHeaders) {
      MCFStringRef etmpSubject(lpszSubject);
      CFStringRef uval_lpszSubject = etmpSubject.Deref();
      MCFStringRef etmpFrom(lpszFrom);
      CFStringRef uval_lpszFrom = etmpFrom.Deref();
      MCFStringRef etmpArticleDate(lpszArticleDate);
      CFStringRef uval_lpszArticleDate = etmpArticleDate.Deref();
      MCFStringRef etmpMessageId(lpszMessageId);
      CFStringRef uval_lpszMessageId = etmpMessageId.Deref();
      MCFStringRef etmpReferences(lpszReferences);
      CFStringRef uval_lpszReferences = etmpReferences.Deref();
      MCFStringRef etmpOtherHeaders(lpszOtherHeaders);
      CFStringRef uval_lpszOtherHeaders = etmpOtherHeaders.Deref();

      return FireGroupOverview(lArticleNumber, uval_lpszSubject, uval_lpszFrom, uval_lpszArticleDate, uval_lpszMessageId, uval_lpszReferences, lArticleSize, lArticleLines, uval_lpszOtherHeaders);
    }
    virtual INT FireGroupOverview(LONG &lArticleNumber, CFStringRef &lpszSubject, CFStringRef &lpszFrom, CFStringRef &lpszArticleDate, CFStringRef &lpszMessageId, CFStringRef &lpszReferences, LONG &lArticleSize, LONG &lArticleLines, CFStringRef &lpszOtherHeaders) {
      return 0;
    }

    virtual INT FireGroupSearch(LONG &lArticleNumber, LPSTR &lpszHeader) {
      MCFStringRef etmpHeader(lpszHeader);
      CFStringRef uval_lpszHeader = etmpHeader.Deref();

      return FireGroupSearch(lArticleNumber, uval_lpszHeader);
    }
    virtual INT FireGroupSearch(LONG &lArticleNumber, CFStringRef &lpszHeader) {
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
    MUString tmpArticleHeaders;
    MUString tmpArticleText;
    MUString tmpAttachedFile;
    MUString tmpCheckDate;
    MUString tmpCommand;
    MUString tmpCurrentArticle;
    MUString tmpCurrentGroup;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpFrom;
    MUString tmpLastReply;
    MUString tmpLocalHost;
    MUString tmpNewsgroups;
    MUString tmpNewsServer;
    MUString tmpOrganization;
    MUString tmpOtherHeaders;
    MUString tmpOverviewRange;
    MUString tmpPassword;
    MUString tmpReferences;
    MUString tmpReplyTo;
    MUString tmpSearchHeader;
    MUString tmpSearchPattern;
    MUString tmpSearchRange;
    MUString tmpSubject;
    MUString tmpUser;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(NNTPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties


    inline LPWSTR GetArticleHeaders() {
      tmpArticleHeaders.Set(NNTPA::GetArticleHeaders());
      return tmpArticleHeaders.Deref();
    }

    inline LPWSTR GetArticleText() {
      tmpArticleText.Set(NNTPA::GetArticleText());
      return tmpArticleText.Deref();
    }

    inline INT SetArticleText(LPWSTR lpszArticleText) {
      MAString tmp(lpszArticleText);
      return NNTPA::SetArticleText(tmp.Deref());
    }
    inline LPWSTR GetAttachedFile() {
      tmpAttachedFile.Set(NNTPA::GetAttachedFile());
      return tmpAttachedFile.Deref();
    }

    inline INT SetAttachedFile(LPWSTR lpszAttachedFile) {
      MAString tmp(lpszAttachedFile);
      return NNTPA::SetAttachedFile(tmp.Deref());
    }
    inline LPWSTR GetCheckDate() {
      tmpCheckDate.Set(NNTPA::GetCheckDate());
      return tmpCheckDate.Deref();
    }

    inline INT SetCheckDate(LPWSTR lpszCheckDate) {
      MAString tmp(lpszCheckDate);
      return NNTPA::SetCheckDate(tmp.Deref());
    }

    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return NNTPA::SetCommand(tmp.Deref());
    }

    inline LPWSTR GetCurrentArticle() {
      tmpCurrentArticle.Set(NNTPA::GetCurrentArticle());
      return tmpCurrentArticle.Deref();
    }

    inline INT SetCurrentArticle(LPWSTR lpszCurrentArticle) {
      MAString tmp(lpszCurrentArticle);
      return NNTPA::SetCurrentArticle(tmp.Deref());
    }
    inline LPWSTR GetCurrentGroup() {
      tmpCurrentGroup.Set(NNTPA::GetCurrentGroup());
      return tmpCurrentGroup.Deref();
    }

    inline INT SetCurrentGroup(LPWSTR lpszCurrentGroup) {
      MAString tmp(lpszCurrentGroup);
      return NNTPA::SetCurrentGroup(tmp.Deref());
    }
    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = NNTPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return NNTPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(NNTPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return NNTPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(NNTPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return NNTPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(NNTPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return NNTPA::SetFirewallUser(tmp.Deref());
    }

    inline LPWSTR GetFrom() {
      tmpFrom.Set(NNTPA::GetFrom());
      return tmpFrom.Deref();
    }

    inline INT SetFrom(LPWSTR lpszFrom) {
      MAString tmp(lpszFrom);
      return NNTPA::SetFrom(tmp.Deref());
    }

    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(NNTPA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(NNTPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return NNTPA::SetLocalHost(tmp.Deref());
    }


    inline LPWSTR GetNewsgroups() {
      tmpNewsgroups.Set(NNTPA::GetNewsgroups());
      return tmpNewsgroups.Deref();
    }

    inline INT SetNewsgroups(LPWSTR lpszNewsgroups) {
      MAString tmp(lpszNewsgroups);
      return NNTPA::SetNewsgroups(tmp.Deref());
    }

    inline LPWSTR GetNewsServer() {
      tmpNewsServer.Set(NNTPA::GetNewsServer());
      return tmpNewsServer.Deref();
    }

    inline INT SetNewsServer(LPWSTR lpszNewsServer) {
      MAString tmp(lpszNewsServer);
      return NNTPA::SetNewsServer(tmp.Deref());
    }
    inline LPWSTR GetOrganization() {
      tmpOrganization.Set(NNTPA::GetOrganization());
      return tmpOrganization.Deref();
    }

    inline INT SetOrganization(LPWSTR lpszOrganization) {
      MAString tmp(lpszOrganization);
      return NNTPA::SetOrganization(tmp.Deref());
    }
    inline LPWSTR GetOtherHeaders() {
      tmpOtherHeaders.Set(NNTPA::GetOtherHeaders());
      return tmpOtherHeaders.Deref();
    }

    inline INT SetOtherHeaders(LPWSTR lpszOtherHeaders) {
      MAString tmp(lpszOtherHeaders);
      return NNTPA::SetOtherHeaders(tmp.Deref());
    }
    inline LPWSTR GetOverviewRange() {
      tmpOverviewRange.Set(NNTPA::GetOverviewRange());
      return tmpOverviewRange.Deref();
    }

    inline INT SetOverviewRange(LPWSTR lpszOverviewRange) {
      MAString tmp(lpszOverviewRange);
      return NNTPA::SetOverviewRange(tmp.Deref());
    }
    inline LPWSTR GetPassword() {
      tmpPassword.Set(NNTPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return NNTPA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetReferences() {
      tmpReferences.Set(NNTPA::GetReferences());
      return tmpReferences.Deref();
    }

    inline INT SetReferences(LPWSTR lpszReferences) {
      MAString tmp(lpszReferences);
      return NNTPA::SetReferences(tmp.Deref());
    }
    inline LPWSTR GetReplyTo() {
      tmpReplyTo.Set(NNTPA::GetReplyTo());
      return tmpReplyTo.Deref();
    }

    inline INT SetReplyTo(LPWSTR lpszReplyTo) {
      MAString tmp(lpszReplyTo);
      return NNTPA::SetReplyTo(tmp.Deref());
    }
    inline LPWSTR GetSearchHeader() {
      tmpSearchHeader.Set(NNTPA::GetSearchHeader());
      return tmpSearchHeader.Deref();
    }

    inline INT SetSearchHeader(LPWSTR lpszSearchHeader) {
      MAString tmp(lpszSearchHeader);
      return NNTPA::SetSearchHeader(tmp.Deref());
    }
    inline LPWSTR GetSearchPattern() {
      tmpSearchPattern.Set(NNTPA::GetSearchPattern());
      return tmpSearchPattern.Deref();
    }

    inline INT SetSearchPattern(LPWSTR lpszSearchPattern) {
      MAString tmp(lpszSearchPattern);
      return NNTPA::SetSearchPattern(tmp.Deref());
    }
    inline LPWSTR GetSearchRange() {
      tmpSearchRange.Set(NNTPA::GetSearchRange());
      return tmpSearchRange.Deref();
    }

    inline INT SetSearchRange(LPWSTR lpszSearchRange) {
      MAString tmp(lpszSearchRange);
      return NNTPA::SetSearchRange(tmp.Deref());
    }

    inline LPWSTR GetSubject() {
      tmpSubject.Set(NNTPA::GetSubject());
      return tmpSubject.Deref();
    }

    inline INT SetSubject(LPWSTR lpszSubject) {
      MAString tmp(lpszSubject);
      return NNTPA::SetSubject(tmp.Deref());
    }

    inline LPWSTR GetUser() {
      tmpUser.Set(NNTPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return NNTPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(NNTPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(NNTPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return NNTPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(NNTPA::GetWinsockStatus());
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

    virtual INT FireGroupList(LPSTR &lpszGroup, LONG &lFirstArticle, LONG &lLastArticle, BOOL &bCanPost) {
      MUString etmpGroup(lpszGroup);
      LPWSTR uval_lpszGroup = etmpGroup.Deref();

      return FireGroupList(uval_lpszGroup, lFirstArticle, lLastArticle, bCanPost);
    }
    virtual INT FireGroupList(LPWSTR &lpszGroup, LONG &lFirstArticle, LONG &lLastArticle, BOOL &bCanPost) {
      return 0;
    }

    virtual INT FireGroupOverview(LONG &lArticleNumber, LPSTR &lpszSubject, LPSTR &lpszFrom, LPSTR &lpszArticleDate, LPSTR &lpszMessageId, LPSTR &lpszReferences, LONG &lArticleSize, LONG &lArticleLines, LPSTR &lpszOtherHeaders) {
      MUString etmpSubject(lpszSubject);
      LPWSTR uval_lpszSubject = etmpSubject.Deref();
      MUString etmpFrom(lpszFrom);
      LPWSTR uval_lpszFrom = etmpFrom.Deref();
      MUString etmpArticleDate(lpszArticleDate);
      LPWSTR uval_lpszArticleDate = etmpArticleDate.Deref();
      MUString etmpMessageId(lpszMessageId);
      LPWSTR uval_lpszMessageId = etmpMessageId.Deref();
      MUString etmpReferences(lpszReferences);
      LPWSTR uval_lpszReferences = etmpReferences.Deref();
      MUString etmpOtherHeaders(lpszOtherHeaders);
      LPWSTR uval_lpszOtherHeaders = etmpOtherHeaders.Deref();

      return FireGroupOverview(lArticleNumber, uval_lpszSubject, uval_lpszFrom, uval_lpszArticleDate, uval_lpszMessageId, uval_lpszReferences, lArticleSize, lArticleLines, uval_lpszOtherHeaders);
    }
    virtual INT FireGroupOverview(LONG &lArticleNumber, LPWSTR &lpszSubject, LPWSTR &lpszFrom, LPWSTR &lpszArticleDate, LPWSTR &lpszMessageId, LPWSTR &lpszReferences, LONG &lArticleSize, LONG &lArticleLines, LPWSTR &lpszOtherHeaders) {
      return 0;
    }

    virtual INT FireGroupSearch(LONG &lArticleNumber, LPSTR &lpszHeader) {
      MUString etmpHeader(lpszHeader);
      LPWSTR uval_lpszHeader = etmpHeader.Deref();

      return FireGroupSearch(lArticleNumber, uval_lpszHeader);
    }
    virtual INT FireGroupSearch(LONG &lArticleNumber, LPWSTR &lpszHeader) {
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

#endif //_IPWORKS_NNTP_H_




