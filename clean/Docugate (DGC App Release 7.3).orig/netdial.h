/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_NETDIAL_H_
#define _IPWORKS_NETDIAL_H_

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

#define netdialIdle                                        0
#define netdialConnect                                     1
#define netdialDisconnect                                  2
#define netdialListPhonebook                               3
#define netdialListConnections                             4
#define netdialListDevices                                 5
#define netdialCreateEntry                                 6
#define netdialDeleteEntry                                 7


#define NETDIAL_IDLE                                       0
#define NETDIAL_CONNECT                                    1
#define NETDIAL_DISCONNECT                                 2
#define NETDIAL_LIST_PHONEBOOK                             3
#define NETDIAL_LIST_CONNECTIONS                           4
#define NETDIAL_LIST_DEVICES                               5
#define NETDIAL_CREATE_ENTRY                               6
#define NETDIAL_DELETE_ENTRY                               7



#endif //_IPWORKS_INTERNAL_

#define PID_NETDIAL_ACTION    1
#define PID_NETDIAL_CALLBACKNUMBER    2
#define PID_NETDIAL_DOMAIN    3
#define PID_NETDIAL_ENTRYDEVICENAME    4
#define PID_NETDIAL_ENTRYDEVICETYPE    5
#define PID_NETDIAL_ENTRYDNSSERVER    6
#define PID_NETDIAL_ENTRYIPADDRESS    7
#define PID_NETDIAL_ENTRYPHONENUMBER    8
#define PID_NETDIAL_ENTRYWINSSERVER    9
#define PID_NETDIAL_HANDLE    10
#define PID_NETDIAL_PASSWORD    11
#define PID_NETDIAL_PHONEBOOK    12
#define PID_NETDIAL_PHONEBOOKENTRY    13
#define PID_NETDIAL_PHONENUMBER    14
#define PID_NETDIAL_TIMEOUT    15
#define PID_NETDIAL_USER    16


#define MID_NETDIAL_CONNECT    1
#define MID_NETDIAL_CREATEENTRY    2
#define MID_NETDIAL_DELETEENTRY    3
#define MID_NETDIAL_DISCONNECT    4
#define MID_NETDIAL_DOEVENTS    5
#define MID_NETDIAL_LISTCONNECTIONS    6
#define MID_NETDIAL_LISTDEVICES    7
#define MID_NETDIAL_LISTPHONEBOOK    8


#define EID_NETDIAL_CONNECTEDENTRY    1
#define EID_NETDIAL_DEVICE    2
#define EID_NETDIAL_ERROR    3
#define EID_NETDIAL_PHONEBOOKENTRY    4
#define EID_NETDIAL_STATUS    5


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID NetDial_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    NetDial_Destroy(LPVOID lpObj);
CNX_IMPORT INT    NetDial_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID NetDial_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    NetDial_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    NetDial_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  NetDial_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    NetDial_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   NetDial_StaticInit(LPVOID hInst);

class NetDialA {
  
  public: //events
  
    virtual INT FireConnectedEntry(LONG &lHandle, LPSTR &lpszEntry, LPSTR &lpszDeviceName, LPSTR &lpszDeviceType, LPSTR &lpszStatusDescription) {return 0;}
    virtual INT FireDevice(LPSTR &lpszDeviceName, LPSTR &lpszDeviceType) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FirePhonebookEntry(LPSTR &lpszEntry) {return 0;}
    virtual INT FireStatus(LONG &lOperation, LONG &lStatusCode, LPSTR &lpszOperationDescription, LPSTR &lpszStatusDescription) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_NETDIAL_CONNECTEDENTRY: {
                        LONG pHandle = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pEntry = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDeviceName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDeviceType = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pStatusDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetDialA*)lpObj)->FireConnectedEntry(pHandle, pEntry, pDeviceName, pDeviceType, pStatusDescription);
         }
         case EID_NETDIAL_DEVICE: {
                        LPSTR pDeviceName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDeviceType = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetDialA*)lpObj)->FireDevice(pDeviceName, pDeviceType);
         }
         case EID_NETDIAL_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetDialA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_NETDIAL_PHONEBOOKENTRY: {
                        LPSTR pEntry = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetDialA*)lpObj)->FirePhonebookEntry(pEntry);
         }
         case EID_NETDIAL_STATUS: {
                        LONG pOperation = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pStatusCode = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pOperationDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pStatusDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetDialA*)lpObj)->FireStatus(pOperation, pStatusCode, pOperationDescription, pStatusDescription);
         }

      }
      return 0;
    }

  public:

    NetDialA(LPCSTR lpOemKey = IPWORKS_OEMKEY_27) {
      m_pObj = NetDial_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~NetDialA() {
      NetDial_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)NetDial_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return NetDial_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)NetDial_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return NetDial_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return NetDial_Set(m_pObj, PID_NETDIAL_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCallbackNumber() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_CALLBACKNUMBER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCallbackNumber(LPCSTR lpszCallbackNumber) {
      int val = (int)lpszCallbackNumber;
      return NetDial_Set(m_pObj, PID_NETDIAL_CALLBACKNUMBER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetDomain() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_DOMAIN, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetDomain(LPCSTR lpszDomain) {
      int val = (int)lpszDomain;
      return NetDial_Set(m_pObj, PID_NETDIAL_DOMAIN, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEntryDeviceName() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ENTRYDEVICENAME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEntryDeviceName(LPCSTR lpszEntryDeviceName) {
      int val = (int)lpszEntryDeviceName;
      return NetDial_Set(m_pObj, PID_NETDIAL_ENTRYDEVICENAME, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEntryDeviceType() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ENTRYDEVICETYPE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEntryDeviceType(LPCSTR lpszEntryDeviceType) {
      int val = (int)lpszEntryDeviceType;
      return NetDial_Set(m_pObj, PID_NETDIAL_ENTRYDEVICETYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEntryDNSServer() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ENTRYDNSSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEntryDNSServer(LPCSTR lpszEntryDNSServer) {
      int val = (int)lpszEntryDNSServer;
      return NetDial_Set(m_pObj, PID_NETDIAL_ENTRYDNSSERVER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEntryIPAddress() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ENTRYIPADDRESS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEntryIPAddress(LPCSTR lpszEntryIPAddress) {
      int val = (int)lpszEntryIPAddress;
      return NetDial_Set(m_pObj, PID_NETDIAL_ENTRYIPADDRESS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEntryPhoneNumber() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ENTRYPHONENUMBER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEntryPhoneNumber(LPCSTR lpszEntryPhoneNumber) {
      int val = (int)lpszEntryPhoneNumber;
      return NetDial_Set(m_pObj, PID_NETDIAL_ENTRYPHONENUMBER, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetEntryWINSServer() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_ENTRYWINSSERVER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetEntryWINSServer(LPCSTR lpszEntryWINSServer) {
      int val = (int)lpszEntryWINSServer;
      return NetDial_Set(m_pObj, PID_NETDIAL_ENTRYWINSSERVER, 0, (LPVOID)val, 0);
    }
    inline LONG GetHandle() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_HANDLE, 0, 0);
      return (LONG)val;
    }
    inline INT SetHandle(LONG lHandle) {
      int val = (int)lHandle;
      return NetDial_Set(m_pObj, PID_NETDIAL_HANDLE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPassword() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_PASSWORD, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPassword(LPCSTR lpszPassword) {
      int val = (int)lpszPassword;
      return NetDial_Set(m_pObj, PID_NETDIAL_PASSWORD, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPhonebook() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_PHONEBOOK, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPhonebook(LPCSTR lpszPhonebook) {
      int val = (int)lpszPhonebook;
      return NetDial_Set(m_pObj, PID_NETDIAL_PHONEBOOK, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPhonebookEntry() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_PHONEBOOKENTRY, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPhonebookEntry(LPCSTR lpszPhonebookEntry) {
      int val = (int)lpszPhonebookEntry;
      return NetDial_Set(m_pObj, PID_NETDIAL_PHONEBOOKENTRY, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPhoneNumber() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_PHONENUMBER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetPhoneNumber(LPCSTR lpszPhoneNumber) {
      int val = (int)lpszPhoneNumber;
      return NetDial_Set(m_pObj, PID_NETDIAL_PHONENUMBER, 0, (LPVOID)val, 0);
    }
    inline INT GetTimeout() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_TIMEOUT, 0, 0);
      return (INT)val;
    }
    inline INT SetTimeout(INT iTimeout) {
      int val = (int)iTimeout;
      return NetDial_Set(m_pObj, PID_NETDIAL_TIMEOUT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetUser() {
      int val = (int)NetDial_Get(m_pObj, PID_NETDIAL_USER, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetUser(LPCSTR lpszUser) {
      int val = (int)lpszUser;
      return NetDial_Set(m_pObj, PID_NETDIAL_USER, 0, (LPVOID)val, 0);
    }

  public: //methods

    inline int Connect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_CONNECT, 0, param, cbparam);
      
      
    }
    inline int CreateEntry() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_CREATEENTRY, 0, param, cbparam);
      
      
    }
    inline int DeleteEntry() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_DELETEENTRY, 0, param, cbparam);
      
      
    }
    inline int Disconnect() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_DISCONNECT, 0, param, cbparam);
      
      
    }
    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int ListConnections() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_LISTCONNECTIONS, 0, param, cbparam);
      
      
    }
    inline int ListDevices() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_LISTDEVICES, 0, param, cbparam);
      
      
    }
    inline int ListPhonebook() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetDial_Do(m_pObj, MID_NETDIAL_LISTPHONEBOOK, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class NetDial : public NetDialA {
  
  public:
    NetDial(LPCSTR lpOemKey = IPWORKS_OEMKEY_27):NetDialA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpCallbackNumber;
    MCFStringRef tmpDomain;
    MCFStringRef tmpEntryDeviceName;
    MCFStringRef tmpEntryDeviceType;
    MCFStringRef tmpEntryDNSServer;
    MCFStringRef tmpEntryIPAddress;
    MCFStringRef tmpEntryPhoneNumber;
    MCFStringRef tmpEntryWINSServer;
    MCFStringRef tmpPassword;
    MCFStringRef tmpPhonebook;
    MCFStringRef tmpPhonebookEntry;
    MCFStringRef tmpPhoneNumber;
    MCFStringRef tmpUser;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(NetDialA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetCallbackNumber() {
      return tmpCallbackNumber.Set(NetDialA::GetCallbackNumber());
    }

    inline INT SetCallbackNumber(CFStringRef strCallbackNumber) {
      MCFStringAcc tmp;
      return NetDialA::SetCallbackNumber(tmp.Deref(strCallbackNumber));
    }
    inline CFStringRef GetDomain() {
      return tmpDomain.Set(NetDialA::GetDomain());
    }

    inline INT SetDomain(CFStringRef strDomain) {
      MCFStringAcc tmp;
      return NetDialA::SetDomain(tmp.Deref(strDomain));
    }
    inline CFStringRef GetEntryDeviceName() {
      return tmpEntryDeviceName.Set(NetDialA::GetEntryDeviceName());
    }

    inline INT SetEntryDeviceName(CFStringRef strEntryDeviceName) {
      MCFStringAcc tmp;
      return NetDialA::SetEntryDeviceName(tmp.Deref(strEntryDeviceName));
    }
    inline CFStringRef GetEntryDeviceType() {
      return tmpEntryDeviceType.Set(NetDialA::GetEntryDeviceType());
    }

    inline INT SetEntryDeviceType(CFStringRef strEntryDeviceType) {
      MCFStringAcc tmp;
      return NetDialA::SetEntryDeviceType(tmp.Deref(strEntryDeviceType));
    }
    inline CFStringRef GetEntryDNSServer() {
      return tmpEntryDNSServer.Set(NetDialA::GetEntryDNSServer());
    }

    inline INT SetEntryDNSServer(CFStringRef strEntryDNSServer) {
      MCFStringAcc tmp;
      return NetDialA::SetEntryDNSServer(tmp.Deref(strEntryDNSServer));
    }
    inline CFStringRef GetEntryIPAddress() {
      return tmpEntryIPAddress.Set(NetDialA::GetEntryIPAddress());
    }

    inline INT SetEntryIPAddress(CFStringRef strEntryIPAddress) {
      MCFStringAcc tmp;
      return NetDialA::SetEntryIPAddress(tmp.Deref(strEntryIPAddress));
    }
    inline CFStringRef GetEntryPhoneNumber() {
      return tmpEntryPhoneNumber.Set(NetDialA::GetEntryPhoneNumber());
    }

    inline INT SetEntryPhoneNumber(CFStringRef strEntryPhoneNumber) {
      MCFStringAcc tmp;
      return NetDialA::SetEntryPhoneNumber(tmp.Deref(strEntryPhoneNumber));
    }
    inline CFStringRef GetEntryWINSServer() {
      return tmpEntryWINSServer.Set(NetDialA::GetEntryWINSServer());
    }

    inline INT SetEntryWINSServer(CFStringRef strEntryWINSServer) {
      MCFStringAcc tmp;
      return NetDialA::SetEntryWINSServer(tmp.Deref(strEntryWINSServer));
    }

    inline CFStringRef GetPassword() {
      return tmpPassword.Set(NetDialA::GetPassword());
    }

    inline INT SetPassword(CFStringRef strPassword) {
      MCFStringAcc tmp;
      return NetDialA::SetPassword(tmp.Deref(strPassword));
    }
    inline CFStringRef GetPhonebook() {
      return tmpPhonebook.Set(NetDialA::GetPhonebook());
    }

    inline INT SetPhonebook(CFStringRef strPhonebook) {
      MCFStringAcc tmp;
      return NetDialA::SetPhonebook(tmp.Deref(strPhonebook));
    }
    inline CFStringRef GetPhonebookEntry() {
      return tmpPhonebookEntry.Set(NetDialA::GetPhonebookEntry());
    }

    inline INT SetPhonebookEntry(CFStringRef strPhonebookEntry) {
      MCFStringAcc tmp;
      return NetDialA::SetPhonebookEntry(tmp.Deref(strPhonebookEntry));
    }
    inline CFStringRef GetPhoneNumber() {
      return tmpPhoneNumber.Set(NetDialA::GetPhoneNumber());
    }

    inline INT SetPhoneNumber(CFStringRef strPhoneNumber) {
      MCFStringAcc tmp;
      return NetDialA::SetPhoneNumber(tmp.Deref(strPhoneNumber));
    }

    inline CFStringRef GetUser() {
      return tmpUser.Set(NetDialA::GetUser());
    }

    inline INT SetUser(CFStringRef strUser) {
      MCFStringAcc tmp;
      return NetDialA::SetUser(tmp.Deref(strUser));
    }


  public:
  
    //redeclare events with CFString parameters

    virtual INT FireConnectedEntry(LONG &lHandle, LPSTR &lpszEntry, LPSTR &lpszDeviceName, LPSTR &lpszDeviceType, LPSTR &lpszStatusDescription) {
      MCFStringRef etmpEntry(lpszEntry);
      CFStringRef uval_lpszEntry = etmpEntry.Deref();
      MCFStringRef etmpDeviceName(lpszDeviceName);
      CFStringRef uval_lpszDeviceName = etmpDeviceName.Deref();
      MCFStringRef etmpDeviceType(lpszDeviceType);
      CFStringRef uval_lpszDeviceType = etmpDeviceType.Deref();
      MCFStringRef etmpStatusDescription(lpszStatusDescription);
      CFStringRef uval_lpszStatusDescription = etmpStatusDescription.Deref();

      return FireConnectedEntry(lHandle, uval_lpszEntry, uval_lpszDeviceName, uval_lpszDeviceType, uval_lpszStatusDescription);
    }
    virtual INT FireConnectedEntry(LONG &lHandle, CFStringRef &lpszEntry, CFStringRef &lpszDeviceName, CFStringRef &lpszDeviceType, CFStringRef &lpszStatusDescription) {
      return 0;
    }

    virtual INT FireDevice(LPSTR &lpszDeviceName, LPSTR &lpszDeviceType) {
      MCFStringRef etmpDeviceName(lpszDeviceName);
      CFStringRef uval_lpszDeviceName = etmpDeviceName.Deref();
      MCFStringRef etmpDeviceType(lpszDeviceType);
      CFStringRef uval_lpszDeviceType = etmpDeviceType.Deref();

      return FireDevice(uval_lpszDeviceName, uval_lpszDeviceType);
    }
    virtual INT FireDevice(CFStringRef &lpszDeviceName, CFStringRef &lpszDeviceType) {
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

    virtual INT FirePhonebookEntry(LPSTR &lpszEntry) {
      MCFStringRef etmpEntry(lpszEntry);
      CFStringRef uval_lpszEntry = etmpEntry.Deref();

      return FirePhonebookEntry(uval_lpszEntry);
    }
    virtual INT FirePhonebookEntry(CFStringRef &lpszEntry) {
      return 0;
    }

    virtual INT FireStatus(LONG &lOperation, LONG &lStatusCode, LPSTR &lpszOperationDescription, LPSTR &lpszStatusDescription) {
      MCFStringRef etmpOperationDescription(lpszOperationDescription);
      CFStringRef uval_lpszOperationDescription = etmpOperationDescription.Deref();
      MCFStringRef etmpStatusDescription(lpszStatusDescription);
      CFStringRef uval_lpszStatusDescription = etmpStatusDescription.Deref();

      return FireStatus(lOperation, lStatusCode, uval_lpszOperationDescription, uval_lpszStatusDescription);
    }
    virtual INT FireStatus(LONG &lOperation, LONG &lStatusCode, CFStringRef &lpszOperationDescription, CFStringRef &lpszStatusDescription) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters



















#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpCallbackNumber;
    MUString tmpDomain;
    MUString tmpEntryDeviceName;
    MUString tmpEntryDeviceType;
    MUString tmpEntryDNSServer;
    MUString tmpEntryIPAddress;
    MUString tmpEntryPhoneNumber;
    MUString tmpEntryWINSServer;
    MUString tmpPassword;
    MUString tmpPhonebook;
    MUString tmpPhonebookEntry;
    MUString tmpPhoneNumber;
    MUString tmpUser;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(NetDialA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetCallbackNumber() {
      tmpCallbackNumber.Set(NetDialA::GetCallbackNumber());
      return tmpCallbackNumber.Deref();
    }

    inline INT SetCallbackNumber(LPWSTR lpszCallbackNumber) {
      MAString tmp(lpszCallbackNumber);
      return NetDialA::SetCallbackNumber(tmp.Deref());
    }
    inline LPWSTR GetDomain() {
      tmpDomain.Set(NetDialA::GetDomain());
      return tmpDomain.Deref();
    }

    inline INT SetDomain(LPWSTR lpszDomain) {
      MAString tmp(lpszDomain);
      return NetDialA::SetDomain(tmp.Deref());
    }
    inline LPWSTR GetEntryDeviceName() {
      tmpEntryDeviceName.Set(NetDialA::GetEntryDeviceName());
      return tmpEntryDeviceName.Deref();
    }

    inline INT SetEntryDeviceName(LPWSTR lpszEntryDeviceName) {
      MAString tmp(lpszEntryDeviceName);
      return NetDialA::SetEntryDeviceName(tmp.Deref());
    }
    inline LPWSTR GetEntryDeviceType() {
      tmpEntryDeviceType.Set(NetDialA::GetEntryDeviceType());
      return tmpEntryDeviceType.Deref();
    }

    inline INT SetEntryDeviceType(LPWSTR lpszEntryDeviceType) {
      MAString tmp(lpszEntryDeviceType);
      return NetDialA::SetEntryDeviceType(tmp.Deref());
    }
    inline LPWSTR GetEntryDNSServer() {
      tmpEntryDNSServer.Set(NetDialA::GetEntryDNSServer());
      return tmpEntryDNSServer.Deref();
    }

    inline INT SetEntryDNSServer(LPWSTR lpszEntryDNSServer) {
      MAString tmp(lpszEntryDNSServer);
      return NetDialA::SetEntryDNSServer(tmp.Deref());
    }
    inline LPWSTR GetEntryIPAddress() {
      tmpEntryIPAddress.Set(NetDialA::GetEntryIPAddress());
      return tmpEntryIPAddress.Deref();
    }

    inline INT SetEntryIPAddress(LPWSTR lpszEntryIPAddress) {
      MAString tmp(lpszEntryIPAddress);
      return NetDialA::SetEntryIPAddress(tmp.Deref());
    }
    inline LPWSTR GetEntryPhoneNumber() {
      tmpEntryPhoneNumber.Set(NetDialA::GetEntryPhoneNumber());
      return tmpEntryPhoneNumber.Deref();
    }

    inline INT SetEntryPhoneNumber(LPWSTR lpszEntryPhoneNumber) {
      MAString tmp(lpszEntryPhoneNumber);
      return NetDialA::SetEntryPhoneNumber(tmp.Deref());
    }
    inline LPWSTR GetEntryWINSServer() {
      tmpEntryWINSServer.Set(NetDialA::GetEntryWINSServer());
      return tmpEntryWINSServer.Deref();
    }

    inline INT SetEntryWINSServer(LPWSTR lpszEntryWINSServer) {
      MAString tmp(lpszEntryWINSServer);
      return NetDialA::SetEntryWINSServer(tmp.Deref());
    }

    inline LPWSTR GetPassword() {
      tmpPassword.Set(NetDialA::GetPassword());
      return tmpPassword.Deref();
    }

    inline INT SetPassword(LPWSTR lpszPassword) {
      MAString tmp(lpszPassword);
      return NetDialA::SetPassword(tmp.Deref());
    }
    inline LPWSTR GetPhonebook() {
      tmpPhonebook.Set(NetDialA::GetPhonebook());
      return tmpPhonebook.Deref();
    }

    inline INT SetPhonebook(LPWSTR lpszPhonebook) {
      MAString tmp(lpszPhonebook);
      return NetDialA::SetPhonebook(tmp.Deref());
    }
    inline LPWSTR GetPhonebookEntry() {
      tmpPhonebookEntry.Set(NetDialA::GetPhonebookEntry());
      return tmpPhonebookEntry.Deref();
    }

    inline INT SetPhonebookEntry(LPWSTR lpszPhonebookEntry) {
      MAString tmp(lpszPhonebookEntry);
      return NetDialA::SetPhonebookEntry(tmp.Deref());
    }
    inline LPWSTR GetPhoneNumber() {
      tmpPhoneNumber.Set(NetDialA::GetPhoneNumber());
      return tmpPhoneNumber.Deref();
    }

    inline INT SetPhoneNumber(LPWSTR lpszPhoneNumber) {
      MAString tmp(lpszPhoneNumber);
      return NetDialA::SetPhoneNumber(tmp.Deref());
    }

    inline LPWSTR GetUser() {
      tmpUser.Set(NetDialA::GetUser());
      return tmpUser.Deref();
    }

    inline INT SetUser(LPWSTR lpszUser) {
      MAString tmp(lpszUser);
      return NetDialA::SetUser(tmp.Deref());
    }


  public:
  
    //redeclare events with wide string parameters

    virtual INT FireConnectedEntry(LONG &lHandle, LPSTR &lpszEntry, LPSTR &lpszDeviceName, LPSTR &lpszDeviceType, LPSTR &lpszStatusDescription) {
      MUString etmpEntry(lpszEntry);
      LPWSTR uval_lpszEntry = etmpEntry.Deref();
      MUString etmpDeviceName(lpszDeviceName);
      LPWSTR uval_lpszDeviceName = etmpDeviceName.Deref();
      MUString etmpDeviceType(lpszDeviceType);
      LPWSTR uval_lpszDeviceType = etmpDeviceType.Deref();
      MUString etmpStatusDescription(lpszStatusDescription);
      LPWSTR uval_lpszStatusDescription = etmpStatusDescription.Deref();

      return FireConnectedEntry(lHandle, uval_lpszEntry, uval_lpszDeviceName, uval_lpszDeviceType, uval_lpszStatusDescription);
    }
    virtual INT FireConnectedEntry(LONG &lHandle, LPWSTR &lpszEntry, LPWSTR &lpszDeviceName, LPWSTR &lpszDeviceType, LPWSTR &lpszStatusDescription) {
      return 0;
    }

    virtual INT FireDevice(LPSTR &lpszDeviceName, LPSTR &lpszDeviceType) {
      MUString etmpDeviceName(lpszDeviceName);
      LPWSTR uval_lpszDeviceName = etmpDeviceName.Deref();
      MUString etmpDeviceType(lpszDeviceType);
      LPWSTR uval_lpszDeviceType = etmpDeviceType.Deref();

      return FireDevice(uval_lpszDeviceName, uval_lpszDeviceType);
    }
    virtual INT FireDevice(LPWSTR &lpszDeviceName, LPWSTR &lpszDeviceType) {
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

    virtual INT FirePhonebookEntry(LPSTR &lpszEntry) {
      MUString etmpEntry(lpszEntry);
      LPWSTR uval_lpszEntry = etmpEntry.Deref();

      return FirePhonebookEntry(uval_lpszEntry);
    }
    virtual INT FirePhonebookEntry(LPWSTR &lpszEntry) {
      return 0;
    }

    virtual INT FireStatus(LONG &lOperation, LONG &lStatusCode, LPSTR &lpszOperationDescription, LPSTR &lpszStatusDescription) {
      MUString etmpOperationDescription(lpszOperationDescription);
      LPWSTR uval_lpszOperationDescription = etmpOperationDescription.Deref();
      MUString etmpStatusDescription(lpszStatusDescription);
      LPWSTR uval_lpszStatusDescription = etmpStatusDescription.Deref();

      return FireStatus(lOperation, lStatusCode, uval_lpszOperationDescription, uval_lpszStatusDescription);
    }
    virtual INT FireStatus(LONG &lOperation, LONG &lStatusCode, LPWSTR &lpszOperationDescription, LPWSTR &lpszStatusDescription) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_NETDIAL_H_




