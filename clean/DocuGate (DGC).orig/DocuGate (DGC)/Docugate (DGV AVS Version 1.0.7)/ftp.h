/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_FTP_H_
#define _IPWORKS_FTP_H_

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

#define ftpIdle                                            0
#define ftpAbort                                           1
#define ftpLogon                                           2
#define ftpLogoff                                          3
#define ftpDownload                                        4
#define ftpUpload                                          5
#define ftpDeleteFile                                      6
#define ftpRenameFile                                      7
#define ftpListDirectory                                   8
#define ftpListDirectoryLong                               9
#define ftpMakeDirectory                                   10
#define ftpRemoveDirectory                                 11
#define ftpAppend                                          12
#define ftpStoreUnique                                     13

#define fwNone                                             0
#define fwTunnel                                           1
#define fwSOCKS4                                           2
#define fwSOCKS5                                           3

#define tmDefault                                          0
#define tmASCII                                            1
#define tmBinary                                           2


#define FTP_IDLE                                           0
#define FTP_ABORT                                          1
#define FTP_LOGON                                          2
#define FTP_LOGOFF                                         3
#define FTP_DOWNLOAD                                       4
#define FTP_UPLOAD                                         5
#define FTP_DELETE_FILE                                    6
#define FTP_RENAME_FILE                                    7
#define FTP_LIST_DIRECTORY                                 8
#define FTP_LIST_DIRECTORY_LONG                            9
#define FTP_MAKE_DIRECTORY                                 10
#define FTP_REMOVE_DIRECTORY                               11
#define FTP_APPEND                                         12
#define FTP_STORE_UNIQUE                                   13

#define FW_NONE                                            0
#define FW_TUNNEL                                          1
#define FW_SOCKS4                                          2
#define FW_SOCKS5                                          3

#define TM_DEFAULT                                         0
#define TM_ASCII                                           1
#define TM_BINARY                                          2



#endif //_IPWORKS_INTERNAL_

#define PID_FTP_ACTION    1
#define PID_FTP_ALTFILE    2
#define PID_FTP_COMMAND    3
#define PID_FTP_CONNECTED    4
#define PID_FTP_FIREWALLDATA    5
#define PID_FTP_FIREWALLHOST    6
#define PID_FTP_FIREWALLPASSWORD    7
#define PID_FTP_FIREWALLPORT    8
#define PID_FTP_FIREWALLTYPE    9
#define PID_FTP_FIREWALLUSER    10
#define PID_FTP_LASTREPLY    11
#define PID_FTP_LOCALFILE    12
#define PID_FTP_LOCALHOST    13
#define PID_FTP_PASSIVE    14
#define PID_FTP_PASSWORD    15
#define PID_FTP_REMOTEFILE    16
#define PID_FTP_REMOTEHOST    17
#define PID_FTP_REMOTEPATH    18
#define PID_FTP_REMOTEPORT    19
#define PID_FTP_SOCKETHANDLE    20
#define PID_FTP_STARTBYTE    21
#define PID_FTP_TIMEOUT    22
#define PID_FTP_TRANSFERMODE    23
#define PID_FTP_USER    24
#define PID_FTP_WINSOCKINFO    25
#define PID_FTP_WINSOCKLOADED    26
#define PID_FTP_WINSOCKMAXDATAGRAMSIZE    27
#define PID_FTP_WINSOCKMAXSOCKETS    28
#define PID_FTP_WINSOCKPATH    29
#define PID_FTP_WINSOCKSTATUS    30


#define MID_FTP_ABORT    1
#define MID_FTP_APPEND    2
#define MID_FTP_DELETEFILE    3
#define MID_FTP_DOEVENTS    4
#define MID_FTP_DOWNLOAD    5
#define MID_FTP_INTERRUPT    6
#define MID_FTP_LISTDIRECTORY    7
#define MID_FTP_LISTDIRECTORYLONG    8
#define MID_FTP_LOGOFF    9
#define MID_FTP_LOGON    10
#define MID_FTP_MAKEDIRECTORY    11
#define MID_FTP_REMOVEDIRECTORY    12
#define MID_FTP_RENAMEFILE    13
#define MID_FTP_STOREUNIQUE    14
#define MID_FTP_UPLOAD    15


#define EID_FTP_DIRLIST    1
#define EID_FTP_ENDTRANSFER    2
#define EID_FTP_ERROR    3
#define EID_FTP_PITRAIL    4
#define EID_FTP_STARTTRANSFER    5
#define EID_FTP_TRANSFER    6


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID FTP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    FTP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    FTP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID FTP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    FTP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    FTP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  FTP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    FTP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   FTP_StaticInit(LPVOID hInst);

class FTPA {
  
  public: //events
  
    virtual INT FireDirList(LPSTR &lpszDirEntry, LPSTR &lpszFileName, BOOL &bIsDir, LONG &lFileSize, LPSTR &lpszFileTime) {return 0;}
    virtual INT FireEndTransfer() {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {return 0;}
    virtual INT FireStartTransfer() {return 0;}
    virtual INT FireTransfer(LONG &lBytesTransferred, LPSTR &lpText, USHORT &lenText) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_FTP_DIRLIST: {
                        LPSTR pDirEntry = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFileName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        BOOL pIsDir = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pFileSize = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pFileTime = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((FTPA*)lpObj)->FireDirList(pDirEntry, pFileName, pIsDir, pFileSize, pFileTime);
         }
         case EID_FTP_ENDTRANSFER: {
            
            return ((FTPA*)lpObj)->FireEndTransfer();
         }
         case EID_FTP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((FTPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_FTP_PITRAIL: {
                        USHORT pDirection = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pMessage = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((FTPA*)lpObj)->FirePITrail(pDirection, pMessage);
         }
         case EID_FTP_STARTTRANSFER: {
            
            return ((FTPA*)lpObj)->FireStartTransfer();
         }
         case EID_FTP_TRANSFER: {
                        LONG pBytesTransferred = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((FTPA*)lpObj)->FireTransfer(pBytesTransferred, pText, lenText);
         }

      }
      return 0;
    }

  public:

    FTPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_17) {
      m_pObj = FTP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~FTPA() {
      FTP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)FTP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return FTP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)FTP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return FTP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return FTP_Set(m_pObj, PID_FTP_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetAltFile() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_ALTFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetAltFile(LPCSTR lpszAltFile) {
      int val = (int)lpszAltFile;
      return FTP_Set(m_pObj, PID_FTP_ALTFILE, 0, (LPVOID)val, 0);
    }

    inline INT SetCommand(LPCSTR lpszCommand) {
      int val = (int)lpszCommand;
      return FTP_Set(m_pObj, PID_FTP_COMMAND, 0, (LPVOID)val, 0);
    }
    inline BOOL GetConnected() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_CONNECTED, 0, 0);
      return (BOOL)val;
    }

    inline INT GetFirewallData(LPCSTR &lpFirewallData, UINT &lenFirewallData) {
      lpFirewallData = (LPSTR)FTP_Get(m_pObj, PID_FTP_FIREWALLDATA, 0, &lenFirewallData);
      if ( ! lpFirewallData) return lenFirewallData;
      return 0;
    }

    inline INT SetFirewallData(LPCSTR lpFirewallData, UINT lenFirewallData) {
      return FTP_Set(m_pObj, PID_FTP_FIREWALLDATA, 0, (LPVOID)lpFirewallData, lenFirewallData);
    }

    inline LPCSTR GetFirewallHost() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_FIREWALLHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallHost(LPCSTR lpszFirewallHost) {
      int val = (int)lpszFirewallHost;
      return FTP_Set(m_pObj, PID_FTP_FIREWALLHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallPassword() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_FIREWALLPASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallPassword(LPCSTR lpszFirewallPassword) {
      int val = (int)lpszFirewallPassword;
      return FTP_Set(m_pObj, PID_FTP_FIREWALLPASSWORD, 0, (LPVOID)val, 0);
    }
    inline USHORT GetFirewallPort() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_FIREWALLPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetFirewallPort(USHORT usFirewallPort) {
      int val = (int)usFirewallPort;
      return FTP_Set(m_pObj, PID_FTP_FIREWALLPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetFirewallType() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_FIREWALLTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetFirewallType(INT iFirewallType) {
      int val = (int)iFirewallType;
      return FTP_Set(m_pObj, PID_FTP_FIREWALLTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetFirewallUser() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_FIREWALLUSER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFirewallUser(LPCSTR lpszFirewallUser) {
      int val = (int)lpszFirewallUser;
      return FTP_Set(m_pObj, PID_FTP_FIREWALLUSER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLastReply() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_LASTREPLY, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetLocalFile() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_LOCALFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalFile(LPCSTR lpszLocalFile) {
      int val = (int)lpszLocalFile;
      return FTP_Set(m_pObj, PID_FTP_LOCALFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return FTP_Set(m_pObj, PID_FTP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline BOOL GetPassive() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_PASSIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetPassive(BOOL bPassive) {
      int val = (int)bPassive;
      return FTP_Set(m_pObj, PID_FTP_PASSIVE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return FTP_Set(m_pObj, PID_FTP_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteFile() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_REMOTEFILE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteFile(LPCSTR lpszRemoteFile) {
      int val = (int)lpszRemoteFile;
      return FTP_Set(m_pObj, PID_FTP_REMOTEFILE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return FTP_Set(m_pObj, PID_FTP_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemotePath() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_REMOTEPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemotePath(LPCSTR lpszRemotePath) {
      int val = (int)lpszRemotePath;
      return FTP_Set(m_pObj, PID_FTP_REMOTEPATH, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return FTP_Set(m_pObj, PID_FTP_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetStartByte() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_STARTBYTE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetStartByte(LPCSTR lpszStartByte) {
      int val = (int)lpszStartByte;
      return FTP_Set(m_pObj, PID_FTP_STARTBYTE, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return FTP_Set(m_pObj, PID_FTP_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline INT GetTransferMode() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_TRANSFERMODE, 0, 0);
      return (INT)val;
    }
    inline INT SetTransferMode(INT iTransferMode) {
      int val = (int)iTransferMode;
      return FTP_Set(m_pObj, PID_FTP_TRANSFERMODE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return FTP_Set(m_pObj, PID_FTP_USER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return FTP_Set(m_pObj, PID_FTP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return FTP_Set(m_pObj, PID_FTP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)FTP_Get(m_pObj, PID_FTP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int Abort() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_ABORT, 0, param, cbparam);
      
      
    }
    inline int Append() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_APPEND, 0, param, cbparam);
      
      
    }
    inline int DeleteFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_DELETEFILE, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Download() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_DOWNLOAD, 0, param, cbparam);
      
      
    }
    inline int Interrupt() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_INTERRUPT, 0, param, cbparam);
      
      
    }
    inline int ListDirectory() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_LISTDIRECTORY, 0, param, cbparam);
      
      
    }
    inline int ListDirectoryLong() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_LISTDIRECTORYLONG, 0, param, cbparam);
      
      
    }
    inline int Logoff() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_LOGOFF, 0, param, cbparam);
      
      
    }
    inline int Logon() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_LOGON, 0, param, cbparam);
      
      
    }
    inline int MakeDirectory() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_MAKEDIRECTORY, 0, param, cbparam);
      
      
    }
    inline int RemoveDirectory() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_REMOVEDIRECTORY, 0, param, cbparam);
      
      
    }
    inline int RenameFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_RENAMEFILE, 0, param, cbparam);
      
      
    }
    inline int StoreUnique() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_STOREUNIQUE, 0, param, cbparam);
      
      
    }
    inline int Upload() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return FTP_Do(m_pObj, MID_FTP_UPLOAD, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class FTP : public FTPA {
  
  public:
    FTP(LPCSTR lpOemKey = IPWORKS_OEMKEY_17):FTPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAltFile;
    MCFStringRef tmpCommand;
    MCFStringRef tmpFirewallData;
    MCFStringRef tmpFirewallHost;
    MCFStringRef tmpFirewallPassword;
    MCFStringRef tmpFirewallUser;
    MCFStringRef tmpLastReply;
    MCFStringRef tmpLocalFile;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpPassword;
    MCFStringRef tmpRemoteFile;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpRemotePath;
    MCFStringRef tmpStartByte;
    MCFStringRef tmpUser;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(FTPA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetAltFile() {
      return tmpAltFile.Set(FTPA::GetAltFile());
    }

    inline INT SetAltFile(CFStringRef strAltFile) {
      MCFStringAcc tmp;
      return FTPA::SetAltFile(tmp.Deref(strAltFile));
    }

    inline INT SetCommand(CFStringRef strCommand) {
      MCFStringAcc tmp;
      return FTPA::SetCommand(tmp.Deref(strCommand));
    }

    inline CFStringRef GetFirewallData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = FTPA::GetFirewallData(tmp, len);
      if (ret_code) return NULL;
      return tmpFirewallData.Set(tmp, len);
    }

    inline INT SetFirewallData(CFStringRef strFirewallData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strFirewallData);
      return FTPA::SetFirewallData(lp, tmp.Length());
    }
    inline CFStringRef GetFirewallHost() {
      return tmpFirewallHost.Set(FTPA::GetFirewallHost());
    }

    inline INT SetFirewallHost(CFStringRef strFirewallHost) {
      MCFStringAcc tmp;
      return FTPA::SetFirewallHost(tmp.Deref(strFirewallHost));
    }
    inline CFStringRef GetFirewallPassword() {
      return tmpFirewallPassword.Set(FTPA::GetFirewallPassword());
    }

    inline INT SetFirewallPassword(CFStringRef strFirewallPassword) {
      MCFStringAcc tmp;
      return FTPA::SetFirewallPassword(tmp.Deref(strFirewallPassword));
    }


    inline CFStringRef GetFirewallUser() {
      return tmpFirewallUser.Set(FTPA::GetFirewallUser());
    }

    inline INT SetFirewallUser(CFStringRef strFirewallUser) {
      MCFStringAcc tmp;
      return FTPA::SetFirewallUser(tmp.Deref(strFirewallUser));
    }
    inline CFStringRef GetLastReply() {
      return tmpLastReply.Set(FTPA::GetLastReply());
    }

    inline CFStringRef GetLocalFile() {
      return tmpLocalFile.Set(FTPA::GetLocalFile());
    }

    inline INT SetLocalFile(CFStringRef strLocalFile) {
      MCFStringAcc tmp;
      return FTPA::SetLocalFile(tmp.Deref(strLocalFile));
    }
    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(FTPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return FTPA::SetLocalHost(tmp.Deref(strLocalHost));
    }

    inline CFStringRef GetPassword() {
      return tmpPassword.Set(FTPA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return FTPA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetRemoteFile() {
      return tmpRemoteFile.Set(FTPA::GetRemoteFile());
    }

    inline INT SetRemoteFile(CFStringRef strRemoteFile) {
      MCFStringAcc tmp;
      return FTPA::SetRemoteFile(tmp.Deref(strRemoteFile));
    }
    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(FTPA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return FTPA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }
    inline CFStringRef GetRemotePath() {
      return tmpRemotePath.Set(FTPA::GetRemotePath());
    }

    inline INT SetRemotePath(CFStringRef strRemotePath) {
      MCFStringAcc tmp;
      return FTPA::SetRemotePath(tmp.Deref(strRemotePath));
    }


    inline CFStringRef GetStartByte() {
      return tmpStartByte.Set(FTPA::GetStartByte());
    }

    inline INT SetStartByte(CFStringRef strStartByte) {
      MCFStringAcc tmp;
      return FTPA::SetStartByte(tmp.Deref(strStartByte));
    }


    inline CFStringRef GetUser() {
      return tmpUser.Set(FTPA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return FTPA::SetUser(tmp.Deref(strUser));
    }
    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(FTPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(FTPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return FTPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(FTPA::GetWinsockStatus());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireDirList(LPSTR &lpszDirEntry, LPSTR &lpszFileName, BOOL &bIsDir, LONG &lFileSize, LPSTR &lpszFileTime) {
      MCFStringRef etmpDirEntry(lpszDirEntry);
      CFStringRef uval_lpszDirEntry = etmpDirEntry.Deref();
      MCFStringRef etmpFileName(lpszFileName);
      CFStringRef uval_lpszFileName = etmpFileName.Deref();
      MCFStringRef etmpFileTime(lpszFileTime);
      CFStringRef uval_lpszFileTime = etmpFileTime.Deref();

      return FireDirList(uval_lpszDirEntry, uval_lpszFileName, bIsDir, lFileSize, uval_lpszFileTime);
    }
    virtual INT FireDirList(CFStringRef &lpszDirEntry, CFStringRef &lpszFileName, BOOL &bIsDir, LONG &lFileSize, CFStringRef &lpszFileTime) {
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

    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {
      MCFStringRef etmpMessage(lpszMessage);
      CFStringRef uval_lpszMessage = etmpMessage.Deref();

      return FirePITrail(usDirection, uval_lpszMessage);
    }
    virtual INT FirePITrail(USHORT &usDirection, CFStringRef &lpszMessage) {
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

































#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAltFile;
    MUString tmpCommand;
    MUString tmpFirewallData;
    MUString tmpFirewallHost;
    MUString tmpFirewallPassword;
    MUString tmpFirewallUser;
    MUString tmpLastReply;
    MUString tmpLocalFile;
    MUString tmpLocalHost;
    MUString tmpPassword;
    MUString tmpRemoteFile;
    MUString tmpRemoteHost;
    MUString tmpRemotePath;
    MUString tmpStartByte;
    MUString tmpUser;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(FTPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetAltFile() {
      tmpAltFile.Set(FTPA::GetAltFile());
      return tmpAltFile.Deref();
    }

    inline INT SetAltFile(LPWSTR lpszAltFile) {
      MAString tmp(lpszAltFile);
      return FTPA::SetAltFile(tmp.Deref());
    }

    inline INT SetCommand(LPWSTR lpszCommand) {
      MAString tmp(lpszCommand);
      return FTPA::SetCommand(tmp.Deref());
    }

    inline INT GetFirewallData(LPWSTR &lpFirewallData, UINT &lenFirewallData) {
      LPSTR tmp = NULL;
      INT ret_code = FTPA::GetFirewallData(tmp, lenFirewallData);
      if (ret_code) return ret_code;
      tmpFirewallData.Set(tmp, lenFirewallData);
      lpFirewallData = tmpFirewallData.Deref();
      return 0;
    }

    inline INT SetFirewallData(LPWSTR lpFirewallData, UINT lenFirewallData) {
      MAString tmp(lpFirewallData, lenFirewallData);
      return FTPA::SetFirewallData(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetFirewallHost() {
      tmpFirewallHost.Set(FTPA::GetFirewallHost());
      return tmpFirewallHost.Deref();
    }

    inline INT SetFirewallHost(LPWSTR lpszFirewallHost) {
      MAString tmp(lpszFirewallHost);
      return FTPA::SetFirewallHost(tmp.Deref());
    }
    inline LPWSTR GetFirewallPassword() {
      tmpFirewallPassword.Set(FTPA::GetFirewallPassword());
      return tmpFirewallPassword.Deref();
    }

    inline INT SetFirewallPassword(LPWSTR lpszFirewallPassword) {
      MAString tmp(lpszFirewallPassword);
      return FTPA::SetFirewallPassword(tmp.Deref());
    }


    inline LPWSTR GetFirewallUser() {
      tmpFirewallUser.Set(FTPA::GetFirewallUser());
      return tmpFirewallUser.Deref();
    }

    inline INT SetFirewallUser(LPWSTR lpszFirewallUser) {
      MAString tmp(lpszFirewallUser);
      return FTPA::SetFirewallUser(tmp.Deref());
    }
    inline LPWSTR GetLastReply() {
      tmpLastReply.Set(FTPA::GetLastReply());
      return tmpLastReply.Deref();
    }

    inline LPWSTR GetLocalFile() {
      tmpLocalFile.Set(FTPA::GetLocalFile());
      return tmpLocalFile.Deref();
    }

    inline INT SetLocalFile(LPWSTR lpszLocalFile) {
      MAString tmp(lpszLocalFile);
      return FTPA::SetLocalFile(tmp.Deref());
    }
    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(FTPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return FTPA::SetLocalHost(tmp.Deref());
    }

    inline LPWSTR GetPassword() {
      tmpPassword.Set(FTPA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return FTPA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetRemoteFile() {
      tmpRemoteFile.Set(FTPA::GetRemoteFile());
      return tmpRemoteFile.Deref();
    }

    inline INT SetRemoteFile(LPWSTR lpszRemoteFile) {
      MAString tmp(lpszRemoteFile);
      return FTPA::SetRemoteFile(tmp.Deref());
    }
    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(FTPA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return FTPA::SetRemoteHost(tmp.Deref());
    }
    inline LPWSTR GetRemotePath() {
      tmpRemotePath.Set(FTPA::GetRemotePath());
      return tmpRemotePath.Deref();
    }

    inline INT SetRemotePath(LPWSTR lpszRemotePath) {
      MAString tmp(lpszRemotePath);
      return FTPA::SetRemotePath(tmp.Deref());
    }


    inline LPWSTR GetStartByte() {
      tmpStartByte.Set(FTPA::GetStartByte());
      return tmpStartByte.Deref();
    }

    inline INT SetStartByte(LPWSTR lpszStartByte) {
      MAString tmp(lpszStartByte);
      return FTPA::SetStartByte(tmp.Deref());
    }


    inline LPWSTR GetUser() {
      tmpUser.Set(FTPA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return FTPA::SetUser(tmp.Deref());
    }
    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(FTPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(FTPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return FTPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(FTPA::GetWinsockStatus());
      return tmpWinsockStatus.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireDirList(LPSTR &lpszDirEntry, LPSTR &lpszFileName, BOOL &bIsDir, LONG &lFileSize, LPSTR &lpszFileTime) {
      MUString etmpDirEntry(lpszDirEntry);
      LPWSTR uval_lpszDirEntry = etmpDirEntry.Deref();
      MUString etmpFileName(lpszFileName);
      LPWSTR uval_lpszFileName = etmpFileName.Deref();
      MUString etmpFileTime(lpszFileTime);
      LPWSTR uval_lpszFileTime = etmpFileTime.Deref();

      return FireDirList(uval_lpszDirEntry, uval_lpszFileName, bIsDir, lFileSize, uval_lpszFileTime);
    }
    virtual INT FireDirList(LPWSTR &lpszDirEntry, LPWSTR &lpszFileName, BOOL &bIsDir, LONG &lFileSize, LPWSTR &lpszFileTime) {
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

    virtual INT FirePITrail(USHORT &usDirection, LPSTR &lpszMessage) {
      MUString etmpMessage(lpszMessage);
      LPWSTR uval_lpszMessage = etmpMessage.Deref();

      return FirePITrail(usDirection, uval_lpszMessage);
    }
    virtual INT FirePITrail(USHORT &usDirection, LPWSTR &lpszMessage) {
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

#endif //_IPWORKS_FTP_H_




