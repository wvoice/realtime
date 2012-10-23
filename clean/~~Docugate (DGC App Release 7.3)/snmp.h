/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_SNMP_H_
#define _IPWORKS_SNMP_H_

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

#define snmpReset                                          0
#define snmpSendGetRequest                                 1
#define snmpSendGetNextRequest                             2
#define snmpSendSetRequest                                 3
#define snmpSendGetResponse                                4
#define snmpSendTrap                                       5
#define snmpSendGetBulkRequest                             6
#define snmpSendInformRequest                              7

#define otInteger                                          2
#define otOctetString                                      4
#define otNull                                             5
#define otObjectId                                         6
#define otIPAddress                                        64
#define otCounter32                                        65
#define otGauge32                                          66
#define otTimeTicks                                        67
#define otOpaque                                           68
#define otNSAP                                             69
#define otCounter64                                        70
#define otUnsignedInteger32                                71

#define snmpverDefault                                     0
#define snmpverV1                                          1
#define snmpverV2c                                         2

#define tgtColdStart                                       0
#define tgtWarmStart                                       1
#define tgtLinkDown                                        2
#define tgtLinkUp                                          3
#define tgtAuthenticationFailure                           4
#define tgtEGPNeighborLoss                                 5
#define tgtEnterpriseSpecific                              6


#define SNMP_RESET                                         0
#define SNMP_SEND_GET_REQUEST                              1
#define SNMP_SEND_GET_NEXT_REQUEST                         2
#define SNMP_SEND_SET_REQUEST                              3
#define SNMP_SEND_GET_RESPONSE                             4
#define SNMP_SEND_TRAP                                     5
#define SNMP_SEND_GET_BULK_REQUEST                         6
#define SNMP_SEND_INFORM_REQUEST                           7

#define OT_INTEGER                                         2
#define OT_OCTET_STRING                                    4
#define OT_NULL                                            5
#define OT_OBJECT_ID                                       6
#define OT_IPADDRESS                                       64
#define OT_COUNTER_32                                      65
#define OT_GAUGE_32                                        66
#define OT_TIME_TICKS                                      67
#define OT_OPAQUE                                          68
#define OT_NSAP                                            69
#define OT_COUNTER_64                                      70
#define OT_UNSIGNED_INTEGER_32                             71

#define SNMPVER_DEFAULT                                    0
#define SNMPVER_V1                                         1
#define SNMPVER_V2C                                        2

#define TGT_COLD_START                                     0
#define TGT_WARM_START                                     1
#define TGT_LINK_DOWN                                      2
#define TGT_LINK_UP                                        3
#define TGT_AUTHENTICATION_FAILURE                         4
#define TGT_EGPNEIGHBOR_LOSS                               5
#define TGT_ENTERPRISE_SPECIFIC                            6



#endif //_IPWORKS_INTERNAL_

#define PID_SNMP_ACCEPTDATA    1
#define PID_SNMP_ACTION    2
#define PID_SNMP_ACTIVE    3
#define PID_SNMP_COMMUNITY    4
#define PID_SNMP_ERRORINDEX    5
#define PID_SNMP_ERRORSTATUS    6
#define PID_SNMP_INBUFFERSIZE    7
#define PID_SNMP_LOCALHOST    8
#define PID_SNMP_LOCALPORT    9
#define PID_SNMP_MAXREPETITIONS    10
#define PID_SNMP_NONREPEATERS    11
#define PID_SNMP_OBJCOUNT    12
#define PID_SNMP_OBJID    13
#define PID_SNMP_OBJTYPE    14
#define PID_SNMP_OBJVALUE    15
#define PID_SNMP_OUTBUFFERSIZE    16
#define PID_SNMP_REMOTEHOST    17
#define PID_SNMP_REMOTEPORT    18
#define PID_SNMP_REQUESTID    19
#define PID_SNMP_SHARELOCALPORT    20
#define PID_SNMP_SNMPVERSION    21
#define PID_SNMP_SOCKETHANDLE    22
#define PID_SNMP_TRAPAGENTADDRESS    23
#define PID_SNMP_TRAPENTERPRISE    24
#define PID_SNMP_TRAPGENERICTYPE    25
#define PID_SNMP_TRAPSPECIFICTYPE    26
#define PID_SNMP_TRAPTIMESTAMP    27
#define PID_SNMP_WINSOCKINFO    28
#define PID_SNMP_WINSOCKLOADED    29
#define PID_SNMP_WINSOCKMAXDATAGRAMSIZE    30
#define PID_SNMP_WINSOCKMAXSOCKETS    31
#define PID_SNMP_WINSOCKPATH    32
#define PID_SNMP_WINSOCKSTATUS    33


#define MID_SNMP_DOEVENTS    1
#define MID_SNMP_RESET    2
#define MID_SNMP_SENDGETBULKREQUEST    3
#define MID_SNMP_SENDGETNEXTREQUEST    4
#define MID_SNMP_SENDGETREQUEST    5
#define MID_SNMP_SENDGETRESPONSE    6
#define MID_SNMP_SENDINFORMREQUEST    7
#define MID_SNMP_SENDSETREQUEST    8
#define MID_SNMP_SENDTRAP    9


#define EID_SNMP_ERROR    1
#define EID_SNMP_GETBULKREQUEST    2
#define EID_SNMP_GETNEXTREQUEST    3
#define EID_SNMP_GETREQUEST    4
#define EID_SNMP_GETRESPONSE    5
#define EID_SNMP_INFORMREQUEST    6
#define EID_SNMP_PDUTRACE    7
#define EID_SNMP_READYTOSEND    8
#define EID_SNMP_SETREQUEST    9
#define EID_SNMP_TRAP    10


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID SNMP_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    SNMP_Destroy(LPVOID lpObj);
CNX_IMPORT INT    SNMP_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID SNMP_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    SNMP_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    SNMP_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  SNMP_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    SNMP_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   SNMP_StaticInit(LPVOID hInst);

class SNMPA {
  
  public: //events
  
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireGetBulkRequest(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usNonRepeaters, USHORT &usMaxRepetitions, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireGetNextRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireGetRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireGetResponse(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireInformRequest(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FirePDUTrace(LPSTR &lpPDU, USHORT &lenPDU, LPSTR &lpszSourceAddress) {return 0;}
    virtual INT FireReadyToSend() {return 0;}
    virtual INT FireSetRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}
    virtual INT FireTrap(LPSTR &lpszCommunity, LPSTR &lpszEnterprise, LPSTR &lpszAgentAddress, USHORT &usGenericType, USHORT &usSpecificType, LONG &lTimeStamp, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_SNMP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_SNMP_GETBULKREQUEST: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pNonRepeaters = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pMaxRepetitions = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireGetBulkRequest(pRequestId, pCommunity, pNonRepeaters, pMaxRepetitions, pSourceAddress, pSourcePort);
         }
         case EID_SNMP_GETNEXTREQUEST: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireGetNextRequest(pRequestId, pCommunity, pSourceAddress, pSourcePort);
         }
         case EID_SNMP_GETREQUEST: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireGetRequest(pRequestId, pCommunity, pSourceAddress, pSourcePort);
         }
         case EID_SNMP_GETRESPONSE: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pErrorStatus = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pErrorIndex = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireGetResponse(pRequestId, pCommunity, pErrorStatus, pErrorIndex, pSourceAddress, pSourcePort);
         }
         case EID_SNMP_INFORMREQUEST: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pErrorStatus = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pErrorIndex = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireInformRequest(pRequestId, pCommunity, pErrorStatus, pErrorIndex, pSourceAddress, pSourcePort);
         }
         case EID_SNMP_PDUTRACE: {
                        LPSTR pPDU = (LPSTR)(INT)(*param++);
            
                        USHORT lenPDU = (USHORT)(*cbparam++);
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FirePDUTrace(pPDU, lenPDU, pSourceAddress);
         }
         case EID_SNMP_READYTOSEND: {
            
            return ((SNMPA*)lpObj)->FireReadyToSend();
         }
         case EID_SNMP_SETREQUEST: {
                        LONG pRequestId = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireSetRequest(pRequestId, pCommunity, pSourceAddress, pSourcePort);
         }
         case EID_SNMP_TRAP: {
                        LPSTR pCommunity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pEnterprise = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pAgentAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pGenericType = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSpecificType = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LONG pTimeStamp = (LONG)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pSourceAddress = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        USHORT pSourcePort = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((SNMPA*)lpObj)->FireTrap(pCommunity, pEnterprise, pAgentAddress, pGenericType, pSpecificType, pTimeStamp, pSourceAddress, pSourcePort);
         }

      }
      return 0;
    }

  public:

    SNMPA(LPCSTR lpOemKey = IPWORKS_OEMKEY_30) {
      m_pObj = SNMP_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~SNMPA() {
      SNMP_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)SNMP_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return SNMP_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)SNMP_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return SNMP_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline BOOL GetAcceptData() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_ACCEPTDATA, 0, 0);
      return (BOOL)val;
    }
    inline INT SetAcceptData(BOOL bAcceptData) {
      int val = (int)bAcceptData;
      return SNMP_Set(m_pObj, PID_SNMP_ACCEPTDATA, 0, (LPVOID)val, 0);
    }
    inline INT GetAction() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return SNMP_Set(m_pObj, PID_SNMP_ACTION, 0, (LPVOID)val, 0);
    }
    inline BOOL GetActive() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_ACTIVE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetActive(BOOL bActive) {
      int val = (int)bActive;
      return SNMP_Set(m_pObj, PID_SNMP_ACTIVE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetCommunity() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_COMMUNITY, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetCommunity(LPCSTR lpszCommunity) {
      int val = (int)lpszCommunity;
      return SNMP_Set(m_pObj, PID_SNMP_COMMUNITY, 0, (LPVOID)val, 0);
    }
    inline INT GetErrorIndex() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_ERRORINDEX, 0, 0);
      return (INT)val;
    }
    inline INT SetErrorIndex(INT iErrorIndex) {
      int val = (int)iErrorIndex;
      return SNMP_Set(m_pObj, PID_SNMP_ERRORINDEX, 0, (LPVOID)val, 0);
    }
    inline INT GetErrorStatus() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_ERRORSTATUS, 0, 0);
      return (INT)val;
    }
    inline INT SetErrorStatus(INT iErrorStatus) {
      int val = (int)iErrorStatus;
      return SNMP_Set(m_pObj, PID_SNMP_ERRORSTATUS, 0, (LPVOID)val, 0);
    }
    inline LONG GetInBufferSize() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_INBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetInBufferSize(LONG lInBufferSize) {
      int val = (int)lInBufferSize;
      return SNMP_Set(m_pObj, PID_SNMP_INBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetLocalHost() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_LOCALHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetLocalHost(LPCSTR lpszLocalHost) {
      int val = (int)lpszLocalHost;
      return SNMP_Set(m_pObj, PID_SNMP_LOCALHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetLocalPort() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_LOCALPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetLocalPort(USHORT usLocalPort) {
      int val = (int)usLocalPort;
      return SNMP_Set(m_pObj, PID_SNMP_LOCALPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetMaxRepetitions() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_MAXREPETITIONS, 0, 0);
      return (INT)val;
    }
    inline INT SetMaxRepetitions(INT iMaxRepetitions) {
      int val = (int)iMaxRepetitions;
      return SNMP_Set(m_pObj, PID_SNMP_MAXREPETITIONS, 0, (LPVOID)val, 0);
    }
    inline INT GetNonRepeaters() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_NONREPEATERS, 0, 0);
      return (INT)val;
    }
    inline INT SetNonRepeaters(INT iNonRepeaters) {
      int val = (int)iNonRepeaters;
      return SNMP_Set(m_pObj, PID_SNMP_NONREPEATERS, 0, (LPVOID)val, 0);
    }
    inline INT GetObjCount() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_OBJCOUNT, 0, 0);
      return (INT)val;
    }
    inline INT SetObjCount(INT iObjCount) {
      int val = (int)iObjCount;
      return SNMP_Set(m_pObj, PID_SNMP_OBJCOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetObjId(USHORT usObjIndex) {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_OBJID, usObjIndex, 0);
      return (LPCSTR)val;
    }
    inline INT SetObjId(USHORT usObjIndex, LPCSTR lpszObjId) {
      int val = (int)lpszObjId;
      return SNMP_Set(m_pObj, PID_SNMP_OBJID, usObjIndex, (LPVOID)val, 0);
    }
    inline INT GetObjType(USHORT usObjIndex) {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_OBJTYPE, usObjIndex, 0);
      return (INT)val;
    }
    inline INT SetObjType(USHORT usObjIndex, INT iObjType) {
      int val = (int)iObjType;
      return SNMP_Set(m_pObj, PID_SNMP_OBJTYPE, usObjIndex, (LPVOID)val, 0);
    }
    inline INT GetObjValue(USHORT usObjIndex, LPCSTR &lpObjValue, UINT &lenObjValue) {
      lpObjValue = (LPSTR)SNMP_Get(m_pObj, PID_SNMP_OBJVALUE, usObjIndex, &lenObjValue);
      if ( ! lpObjValue) return lenObjValue;
      return 0;
    }

    inline INT SetObjValue(USHORT usObjIndex, LPCSTR lpObjValue, UINT lenObjValue) {
      return SNMP_Set(m_pObj, PID_SNMP_OBJVALUE, usObjIndex, (LPVOID)lpObjValue, lenObjValue);
    }

    inline LONG GetOutBufferSize() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_OUTBUFFERSIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetOutBufferSize(LONG lOutBufferSize) {
      int val = (int)lOutBufferSize;
      return SNMP_Set(m_pObj, PID_SNMP_OUTBUFFERSIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetRemoteHost() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_REMOTEHOST, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetRemoteHost(LPCSTR lpszRemoteHost) {
      int val = (int)lpszRemoteHost;
      return SNMP_Set(m_pObj, PID_SNMP_REMOTEHOST, 0, (LPVOID)val, 0);
    }
    inline USHORT GetRemotePort() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_REMOTEPORT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetRemotePort(USHORT usRemotePort) {
      int val = (int)usRemotePort;
      return SNMP_Set(m_pObj, PID_SNMP_REMOTEPORT, 0, (LPVOID)val, 0);
    }
    inline LONG GetRequestId() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_REQUESTID, 0, 0);
      return (LONG)val;
    }
    inline INT SetRequestId(LONG lRequestId) {
      int val = (int)lRequestId;
      return SNMP_Set(m_pObj, PID_SNMP_REQUESTID, 0, (LPVOID)val, 0);
    }
    inline BOOL GetShareLocalPort() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_SHARELOCALPORT, 0, 0);
      return (BOOL)val;
    }
    inline INT SetShareLocalPort(BOOL bShareLocalPort) {
      int val = (int)bShareLocalPort;
      return SNMP_Set(m_pObj, PID_SNMP_SHARELOCALPORT, 0, (LPVOID)val, 0);
    }
    inline INT GetSNMPVersion() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_SNMPVERSION, 0, 0);
      return (INT)val;
    }
    inline INT SetSNMPVersion(INT iSNMPVersion) {
      int val = (int)iSNMPVersion;
      return SNMP_Set(m_pObj, PID_SNMP_SNMPVERSION, 0, (LPVOID)val, 0);
    }
    inline LONG GetSocketHandle() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_SOCKETHANDLE, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetTrapAgentAddress() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_TRAPAGENTADDRESS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetTrapAgentAddress(LPCSTR lpszTrapAgentAddress) {
      int val = (int)lpszTrapAgentAddress;
      return SNMP_Set(m_pObj, PID_SNMP_TRAPAGENTADDRESS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetTrapEnterprise() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_TRAPENTERPRISE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetTrapEnterprise(LPCSTR lpszTrapEnterprise) {
      int val = (int)lpszTrapEnterprise;
      return SNMP_Set(m_pObj, PID_SNMP_TRAPENTERPRISE, 0, (LPVOID)val, 0);
    }
    inline INT GetTrapGenericType() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_TRAPGENERICTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetTrapGenericType(INT iTrapGenericType) {
      int val = (int)iTrapGenericType;
      return SNMP_Set(m_pObj, PID_SNMP_TRAPGENERICTYPE, 0, (LPVOID)val, 0);
    }
    inline INT GetTrapSpecificType() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_TRAPSPECIFICTYPE, 0, 0);
      return (INT)val;
    }
    inline INT SetTrapSpecificType(INT iTrapSpecificType) {
      int val = (int)iTrapSpecificType;
      return SNMP_Set(m_pObj, PID_SNMP_TRAPSPECIFICTYPE, 0, (LPVOID)val, 0);
    }
    inline LONG GetTrapTimeStamp() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_TRAPTIMESTAMP, 0, 0);
      return (LONG)val;
    }
    inline INT SetTrapTimeStamp(LONG lTrapTimeStamp) {
      int val = (int)lTrapTimeStamp;
      return SNMP_Set(m_pObj, PID_SNMP_TRAPTIMESTAMP, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockInfo() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_WINSOCKINFO, 0, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetWinsockLoaded() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_WINSOCKLOADED, 0, 0);
      return (BOOL)val;
    }
    inline INT SetWinsockLoaded(BOOL bWinsockLoaded) {
      int val = (int)bWinsockLoaded;
      return SNMP_Set(m_pObj, PID_SNMP_WINSOCKLOADED, 0, (LPVOID)val, 0);
    }
    inline LONG GetWinsockMaxDatagramSize() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_WINSOCKMAXDATAGRAMSIZE, 0, 0);
      return (LONG)val;
    }

    inline LONG GetWinsockMaxSockets() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_WINSOCKMAXSOCKETS, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetWinsockPath() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_WINSOCKPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetWinsockPath(LPCSTR lpszWinsockPath) {
      int val = (int)lpszWinsockPath;
      return SNMP_Set(m_pObj, PID_SNMP_WINSOCKPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetWinsockStatus() {
      int val = (int)SNMP_Get(m_pObj, PID_SNMP_WINSOCKSTATUS, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline int DoEvents() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_DOEVENTS, 0, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_RESET, 0, param, cbparam);
      
      
    }
    inline int SendGetBulkRequest() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDGETBULKREQUEST, 0, param, cbparam);
      
      
    }
    inline int SendGetNextRequest() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDGETNEXTREQUEST, 0, param, cbparam);
      
      
    }
    inline int SendGetRequest() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDGETREQUEST, 0, param, cbparam);
      
      
    }
    inline int SendGetResponse() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDGETRESPONSE, 0, param, cbparam);
      
      
    }
    inline int SendInformRequest() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDINFORMREQUEST, 0, param, cbparam);
      
      
    }
    inline int SendSetRequest() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDSETREQUEST, 0, param, cbparam);
      
      
    }
    inline int SendTrap() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return SNMP_Do(m_pObj, MID_SNMP_SENDTRAP, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class SNMP : public SNMPA {
  
  public:
    SNMP(LPCSTR lpOemKey = IPWORKS_OEMKEY_30):SNMPA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpCommunity;
    MCFStringRef tmpLocalHost;
    MCFStringRef tmpObjId;
    MCFStringRef tmpObjValue;
    MCFStringRef tmpRemoteHost;
    MCFStringRef tmpTrapAgentAddress;
    MCFStringRef tmpTrapEnterprise;
    MCFStringRef tmpWinsockInfo;
    MCFStringRef tmpWinsockPath;
    MCFStringRef tmpWinsockStatus;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(SNMPA::GetLastError());
    }

    // CFString versions of properties



    inline CFStringRef GetCommunity() {
      return tmpCommunity.Set(SNMPA::GetCommunity());
    }

    inline INT SetCommunity(CFStringRef strCommunity) {
      MCFStringAcc tmp;
      return SNMPA::SetCommunity(tmp.Deref(strCommunity));
    }



    inline CFStringRef GetLocalHost() {
      return tmpLocalHost.Set(SNMPA::GetLocalHost());
    }

    inline INT SetLocalHost(CFStringRef strLocalHost) {
      MCFStringAcc tmp;
      return SNMPA::SetLocalHost(tmp.Deref(strLocalHost));
    }




    inline CFStringRef GetObjId(USHORT usObjIndex) {
      return tmpObjId.Set(SNMPA::GetObjId(usObjIndex));
    }

    inline INT SetObjId(USHORT usObjIndex, CFStringRef strObjId) {
      MCFStringAcc tmp;
      return SNMPA::SetObjId(usObjIndex, tmp.Deref(strObjId));
    }

    inline CFStringRef GetObjValue(USHORT usObjIndex) {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = SNMPA::GetObjValue(usObjIndex, tmp, len);
      if (ret_code) return NULL;
      return tmpObjValue.Set(tmp, len);
    }

    inline INT SetObjValue(USHORT usObjIndex, CFStringRef strObjValue) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strObjValue);
      return SNMPA::SetObjValue(usObjIndex, lp, tmp.Length());
    }

    inline CFStringRef GetRemoteHost() {
      return tmpRemoteHost.Set(SNMPA::GetRemoteHost());
    }

    inline INT SetRemoteHost(CFStringRef strRemoteHost) {
      MCFStringAcc tmp;
      return SNMPA::SetRemoteHost(tmp.Deref(strRemoteHost));
    }





    inline CFStringRef GetTrapAgentAddress() {
      return tmpTrapAgentAddress.Set(SNMPA::GetTrapAgentAddress());
    }

    inline INT SetTrapAgentAddress(CFStringRef strTrapAgentAddress) {
      MCFStringAcc tmp;
      return SNMPA::SetTrapAgentAddress(tmp.Deref(strTrapAgentAddress));
    }
    inline CFStringRef GetTrapEnterprise() {
      return tmpTrapEnterprise.Set(SNMPA::GetTrapEnterprise());
    }

    inline INT SetTrapEnterprise(CFStringRef strTrapEnterprise) {
      MCFStringAcc tmp;
      return SNMPA::SetTrapEnterprise(tmp.Deref(strTrapEnterprise));
    }



    inline CFStringRef GetWinsockInfo() {
      return tmpWinsockInfo.Set(SNMPA::GetWinsockInfo());
    }




    inline CFStringRef GetWinsockPath() {
      return tmpWinsockPath.Set(SNMPA::GetWinsockPath());
    }

    inline INT SetWinsockPath(CFStringRef strWinsockPath) {
      MCFStringAcc tmp;
      return SNMPA::SetWinsockPath(tmp.Deref(strWinsockPath));
    }
    inline CFStringRef GetWinsockStatus() {
      return tmpWinsockStatus.Set(SNMPA::GetWinsockStatus());
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

    virtual INT FireGetBulkRequest(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usNonRepeaters, USHORT &usMaxRepetitions, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetBulkRequest(lRequestId, uval_lpszCommunity, usNonRepeaters, usMaxRepetitions, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetBulkRequest(LONG &lRequestId, CFStringRef &lpszCommunity, USHORT &usNonRepeaters, USHORT &usMaxRepetitions, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireGetNextRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetNextRequest(lRequestId, uval_lpszCommunity, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetNextRequest(LONG &lRequestId, CFStringRef &lpszCommunity, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireGetRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetRequest(lRequestId, uval_lpszCommunity, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetRequest(LONG &lRequestId, CFStringRef &lpszCommunity, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireGetResponse(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetResponse(lRequestId, uval_lpszCommunity, usErrorStatus, usErrorIndex, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetResponse(LONG &lRequestId, CFStringRef &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireInformRequest(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireInformRequest(lRequestId, uval_lpszCommunity, usErrorStatus, usErrorIndex, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireInformRequest(LONG &lRequestId, CFStringRef &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FirePDUTrace(LPSTR &lpPDU, USHORT &lenPDU, LPSTR &lpszSourceAddress) {
      MCFStringRef etmpPDU(lpPDU, lenPDU);
      CFStringRef uval_lpPDU = etmpPDU.Deref();      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FirePDUTrace(uval_lpPDU, lenPDU, uval_lpszSourceAddress);
    }
    virtual INT FirePDUTrace(CFStringRef &lpPDU, USHORT &lenPDU, CFStringRef &lpszSourceAddress) {
      return 0;
    }



    virtual INT FireSetRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireSetRequest(lRequestId, uval_lpszCommunity, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireSetRequest(LONG &lRequestId, CFStringRef &lpszCommunity, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireTrap(LPSTR &lpszCommunity, LPSTR &lpszEnterprise, LPSTR &lpszAgentAddress, USHORT &usGenericType, USHORT &usSpecificType, LONG &lTimeStamp, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MCFStringRef etmpCommunity(lpszCommunity);
      CFStringRef uval_lpszCommunity = etmpCommunity.Deref();
      MCFStringRef etmpEnterprise(lpszEnterprise);
      CFStringRef uval_lpszEnterprise = etmpEnterprise.Deref();
      MCFStringRef etmpAgentAddress(lpszAgentAddress);
      CFStringRef uval_lpszAgentAddress = etmpAgentAddress.Deref();
      MCFStringRef etmpSourceAddress(lpszSourceAddress);
      CFStringRef uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireTrap(uval_lpszCommunity, uval_lpszEnterprise, uval_lpszAgentAddress, usGenericType, usSpecificType, lTimeStamp, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireTrap(CFStringRef &lpszCommunity, CFStringRef &lpszEnterprise, CFStringRef &lpszAgentAddress, USHORT &usGenericType, USHORT &usSpecificType, LONG &lTimeStamp, CFStringRef &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters





















#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpCommunity;
    MUString tmpLocalHost;
    MUString tmpObjId;
    MUString tmpObjValue;
    MUString tmpRemoteHost;
    MUString tmpTrapAgentAddress;
    MUString tmpTrapEnterprise;
    MUString tmpWinsockInfo;
    MUString tmpWinsockPath;
    MUString tmpWinsockStatus;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(SNMPA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties



    inline LPWSTR GetCommunity() {
      tmpCommunity.Set(SNMPA::GetCommunity());
      return tmpCommunity.Deref();
    }

    inline INT SetCommunity(LPWSTR lpszCommunity) {
      MAString tmp(lpszCommunity);
      return SNMPA::SetCommunity(tmp.Deref());
    }



    inline LPWSTR GetLocalHost() {
      tmpLocalHost.Set(SNMPA::GetLocalHost());
      return tmpLocalHost.Deref();
    }

    inline INT SetLocalHost(LPWSTR lpszLocalHost) {
      MAString tmp(lpszLocalHost);
      return SNMPA::SetLocalHost(tmp.Deref());
    }




    inline LPWSTR GetObjId(USHORT usObjIndex) {
      tmpObjId.Set(SNMPA::GetObjId(usObjIndex));
      return tmpObjId.Deref();
    }

    inline INT SetObjId(USHORT usObjIndex, LPWSTR lpszObjId) {
      MAString tmp(lpszObjId);
      return SNMPA::SetObjId(usObjIndex, tmp.Deref());
    }

    inline INT GetObjValue(USHORT usObjIndex, LPWSTR &lpObjValue, UINT &lenObjValue) {
      LPSTR tmp = NULL;
      INT ret_code = SNMPA::GetObjValue(usObjIndex, tmp, lenObjValue);
      if (ret_code) return ret_code;
      tmpObjValue.Set(tmp, lenObjValue);
      lpObjValue = tmpObjValue.Deref();
      return 0;
    }

    inline INT SetObjValue(USHORT usObjIndex, LPWSTR lpObjValue, UINT lenObjValue) {
      MAString tmp(lpObjValue, lenObjValue);
      return SNMPA::SetObjValue(usObjIndex, tmp.Deref(), tmp.Length());
    }

    inline LPWSTR GetRemoteHost() {
      tmpRemoteHost.Set(SNMPA::GetRemoteHost());
      return tmpRemoteHost.Deref();
    }

    inline INT SetRemoteHost(LPWSTR lpszRemoteHost) {
      MAString tmp(lpszRemoteHost);
      return SNMPA::SetRemoteHost(tmp.Deref());
    }





    inline LPWSTR GetTrapAgentAddress() {
      tmpTrapAgentAddress.Set(SNMPA::GetTrapAgentAddress());
      return tmpTrapAgentAddress.Deref();
    }

    inline INT SetTrapAgentAddress(LPWSTR lpszTrapAgentAddress) {
      MAString tmp(lpszTrapAgentAddress);
      return SNMPA::SetTrapAgentAddress(tmp.Deref());
    }
    inline LPWSTR GetTrapEnterprise() {
      tmpTrapEnterprise.Set(SNMPA::GetTrapEnterprise());
      return tmpTrapEnterprise.Deref();
    }

    inline INT SetTrapEnterprise(LPWSTR lpszTrapEnterprise) {
      MAString tmp(lpszTrapEnterprise);
      return SNMPA::SetTrapEnterprise(tmp.Deref());
    }



    inline LPWSTR GetWinsockInfo() {
      tmpWinsockInfo.Set(SNMPA::GetWinsockInfo());
      return tmpWinsockInfo.Deref();
    }




    inline LPWSTR GetWinsockPath() {
      tmpWinsockPath.Set(SNMPA::GetWinsockPath());
      return tmpWinsockPath.Deref();
    }

    inline INT SetWinsockPath(LPWSTR lpszWinsockPath) {
      MAString tmp(lpszWinsockPath);
      return SNMPA::SetWinsockPath(tmp.Deref());
    }
    inline LPWSTR GetWinsockStatus() {
      tmpWinsockStatus.Set(SNMPA::GetWinsockStatus());
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

    virtual INT FireGetBulkRequest(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usNonRepeaters, USHORT &usMaxRepetitions, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetBulkRequest(lRequestId, uval_lpszCommunity, usNonRepeaters, usMaxRepetitions, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetBulkRequest(LONG &lRequestId, LPWSTR &lpszCommunity, USHORT &usNonRepeaters, USHORT &usMaxRepetitions, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireGetNextRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetNextRequest(lRequestId, uval_lpszCommunity, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetNextRequest(LONG &lRequestId, LPWSTR &lpszCommunity, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireGetRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetRequest(lRequestId, uval_lpszCommunity, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetRequest(LONG &lRequestId, LPWSTR &lpszCommunity, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireGetResponse(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireGetResponse(lRequestId, uval_lpszCommunity, usErrorStatus, usErrorIndex, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireGetResponse(LONG &lRequestId, LPWSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireInformRequest(LONG &lRequestId, LPSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireInformRequest(lRequestId, uval_lpszCommunity, usErrorStatus, usErrorIndex, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireInformRequest(LONG &lRequestId, LPWSTR &lpszCommunity, USHORT &usErrorStatus, USHORT &usErrorIndex, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FirePDUTrace(LPSTR &lpPDU, USHORT &lenPDU, LPSTR &lpszSourceAddress) {
      MUString etmpPDU(lpPDU, lenPDU);
      LPWSTR uval_lpPDU = etmpPDU.Deref();      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FirePDUTrace(uval_lpPDU, lenPDU, uval_lpszSourceAddress);
    }
    virtual INT FirePDUTrace(LPWSTR &lpPDU, USHORT &lenPDU, LPWSTR &lpszSourceAddress) {
      return 0;
    }



    virtual INT FireSetRequest(LONG &lRequestId, LPSTR &lpszCommunity, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireSetRequest(lRequestId, uval_lpszCommunity, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireSetRequest(LONG &lRequestId, LPWSTR &lpszCommunity, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }

    virtual INT FireTrap(LPSTR &lpszCommunity, LPSTR &lpszEnterprise, LPSTR &lpszAgentAddress, USHORT &usGenericType, USHORT &usSpecificType, LONG &lTimeStamp, LPSTR &lpszSourceAddress, USHORT &usSourcePort) {
      MUString etmpCommunity(lpszCommunity);
      LPWSTR uval_lpszCommunity = etmpCommunity.Deref();
      MUString etmpEnterprise(lpszEnterprise);
      LPWSTR uval_lpszEnterprise = etmpEnterprise.Deref();
      MUString etmpAgentAddress(lpszAgentAddress);
      LPWSTR uval_lpszAgentAddress = etmpAgentAddress.Deref();
      MUString etmpSourceAddress(lpszSourceAddress);
      LPWSTR uval_lpszSourceAddress = etmpSourceAddress.Deref();

      return FireTrap(uval_lpszCommunity, uval_lpszEnterprise, uval_lpszAgentAddress, usGenericType, usSpecificType, lTimeStamp, uval_lpszSourceAddress, usSourcePort);
    }
    virtual INT FireTrap(LPWSTR &lpszCommunity, LPWSTR &lpszEnterprise, LPWSTR &lpszAgentAddress, USHORT &usGenericType, USHORT &usSpecificType, LONG &lTimeStamp, LPWSTR &lpszSourceAddress, USHORT &usSourcePort) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_SNMP_H_




