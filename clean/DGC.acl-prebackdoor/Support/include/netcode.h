/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_NETCODE_H_
#define _IPWORKS_NETCODE_H_

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

#define netcodeIdle                                        0
#define netcodeDecodeToFile                                1
#define netcodeEncodeToFile                                2
#define netcodeDecodeToString                              3
#define netcodeEncodeToString                              4

#define fmtUUEncode                                        0
#define fmtBASE64                                          1
#define fmtQP                                              2
#define fmtURL                                             3
#define fmtJIS                                             4


#define NETCODE_IDLE                                       0
#define NETCODE_DECODE_TO_FILE                             1
#define NETCODE_ENCODE_TO_FILE                             2
#define NETCODE_DECODE_TO_STRING                           3
#define NETCODE_ENCODE_TO_STRING                           4

#define FMT_UUENCODE                                       0
#define FMT_BASE64                                         1
#define FMT_QP                                             2
#define FMT_URL                                            3
#define FMT_JIS                                            4



#endif //_IPWORKS_INTERNAL_

#define PID_NETCODE_ACTION    1
#define PID_NETCODE_DECODEDDATA    2
#define PID_NETCODE_ENCODEDDATA    3
#define PID_NETCODE_FILECNT    4
#define PID_NETCODE_FILENAME    5
#define PID_NETCODE_FORMAT    6
#define PID_NETCODE_INTELLICODE    7
#define PID_NETCODE_MAXFILESIZE    8
#define PID_NETCODE_MODE    9
#define PID_NETCODE_OVERWRITE    10
#define PID_NETCODE_PROGRESSSTEP    11


#define MID_NETCODE_DECODETOFILE    1
#define MID_NETCODE_DECODETOSTRING    2
#define MID_NETCODE_ENCODETOFILE    3
#define MID_NETCODE_ENCODETOSTRING    4


#define EID_NETCODE_PROGRESS    1


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID NetCode_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    NetCode_Destroy(LPVOID lpObj);
CNX_IMPORT INT    NetCode_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID NetCode_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    NetCode_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    NetCode_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  NetCode_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    NetCode_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   NetCode_StaticInit(LPVOID hInst);

class NetCodeA {
  
  public: //events
  
    virtual INT FireProgress(USHORT &usPercentDone) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_NETCODE_PROGRESS: {
                        USHORT pPercentDone = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((NetCodeA*)lpObj)->FireProgress(pPercentDone);
         }

      }
      return 0;
    }

  public:

    NetCodeA(LPCSTR lpOemKey = IPWORKS_OEMKEY_14) {
      m_pObj = NetCode_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~NetCodeA() {
      NetCode_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)NetCode_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return NetCode_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)NetCode_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return NetCode_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return NetCode_Set(m_pObj, PID_NETCODE_ACTION, 0, (LPVOID)val, 0);
    }
    inline INT GetDecodedData(LPCSTR &lpDecodedData, UINT &lenDecodedData) {
      lpDecodedData = (LPSTR)NetCode_Get(m_pObj, PID_NETCODE_DECODEDDATA, 0, &lenDecodedData);
      if ( ! lpDecodedData) return lenDecodedData;
      return 0;
    }

    inline INT SetDecodedData(LPCSTR lpDecodedData, UINT lenDecodedData) {
      return NetCode_Set(m_pObj, PID_NETCODE_DECODEDDATA, 0, (LPVOID)lpDecodedData, lenDecodedData);
    }

    inline INT GetEncodedData(LPCSTR &lpEncodedData, UINT &lenEncodedData) {
      lpEncodedData = (LPSTR)NetCode_Get(m_pObj, PID_NETCODE_ENCODEDDATA, 0, &lenEncodedData);
      if ( ! lpEncodedData) return lenEncodedData;
      return 0;
    }

    inline INT SetEncodedData(LPCSTR lpEncodedData, UINT lenEncodedData) {
      return NetCode_Set(m_pObj, PID_NETCODE_ENCODEDDATA, 0, (LPVOID)lpEncodedData, lenEncodedData);
    }

    inline INT GetFileCnt() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_FILECNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetFileName() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_FILENAME, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetFileName(LPCSTR lpszFileName) {
      int val = (int)lpszFileName;
      return NetCode_Set(m_pObj, PID_NETCODE_FILENAME, 0, (LPVOID)val, 0);
    }
    inline INT GetFormat() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_FORMAT, 0, 0);
      return (INT)val;
    }
    inline INT SetFormat(INT iFormat) {
      int val = (int)iFormat;
      return NetCode_Set(m_pObj, PID_NETCODE_FORMAT, 0, (LPVOID)val, 0);
    }
    inline BOOL GetIntelliCode() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_INTELLICODE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetIntelliCode(BOOL bIntelliCode) {
      int val = (int)bIntelliCode;
      return NetCode_Set(m_pObj, PID_NETCODE_INTELLICODE, 0, (LPVOID)val, 0);
    }
    inline LONG GetMaxFileSize() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_MAXFILESIZE, 0, 0);
      return (LONG)val;
    }
    inline INT SetMaxFileSize(LONG lMaxFileSize) {
      int val = (int)lMaxFileSize;
      return NetCode_Set(m_pObj, PID_NETCODE_MAXFILESIZE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetMode() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_MODE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMode(LPCSTR lpszMode) {
      int val = (int)lpszMode;
      return NetCode_Set(m_pObj, PID_NETCODE_MODE, 0, (LPVOID)val, 0);
    }
    inline BOOL GetOverwrite() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_OVERWRITE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetOverwrite(BOOL bOverwrite) {
      int val = (int)bOverwrite;
      return NetCode_Set(m_pObj, PID_NETCODE_OVERWRITE, 0, (LPVOID)val, 0);
    }
    inline USHORT GetProgressStep() {
      int val = (int)NetCode_Get(m_pObj, PID_NETCODE_PROGRESSSTEP, 0, 0);
      return (USHORT)val;
    }
    inline INT SetProgressStep(USHORT usProgressStep) {
      int val = (int)usProgressStep;
      return NetCode_Set(m_pObj, PID_NETCODE_PROGRESSSTEP, 0, (LPVOID)val, 0);
    }

  public: //methods

    inline int DecodeToFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetCode_Do(m_pObj, MID_NETCODE_DECODETOFILE, 0, param, cbparam);
      
      
    }
    inline int DecodeToString() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetCode_Do(m_pObj, MID_NETCODE_DECODETOSTRING, 0, param, cbparam);
      
      
    }
    inline int EncodeToFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetCode_Do(m_pObj, MID_NETCODE_ENCODETOFILE, 0, param, cbparam);
      
      
    }
    inline int EncodeToString() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return NetCode_Do(m_pObj, MID_NETCODE_ENCODETOSTRING, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class NetCode : public NetCodeA {
  
  public:
    NetCode(LPCSTR lpOemKey = IPWORKS_OEMKEY_14):NetCodeA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpDecodedData;
    MCFStringRef tmpEncodedData;
    MCFStringRef tmpFileName;
    MCFStringRef tmpMode;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(NetCodeA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetDecodedData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = NetCodeA::GetDecodedData(tmp, len);
      if (ret_code) return NULL;
      return tmpDecodedData.Set(tmp, len);
    }

    inline INT SetDecodedData(CFStringRef strDecodedData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strDecodedData);
      return NetCodeA::SetDecodedData(lp, tmp.Length());
    }
    inline CFStringRef GetEncodedData() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = NetCodeA::GetEncodedData(tmp, len);
      if (ret_code) return NULL;
      return tmpEncodedData.Set(tmp, len);
    }

    inline INT SetEncodedData(CFStringRef strEncodedData) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strEncodedData);
      return NetCodeA::SetEncodedData(lp, tmp.Length());
    }

    inline CFStringRef GetFileName() {
      return tmpFileName.Set(NetCodeA::GetFileName());
    }

    inline INT SetFileName(CFStringRef strFileName) {
      MCFStringAcc tmp;
      return NetCodeA::SetFileName(tmp.Deref(strFileName));
    }



    inline CFStringRef GetMode() {
      return tmpMode.Set(NetCodeA::GetMode());
    }

    inline INT SetMode(CFStringRef strMode) {
      MCFStringAcc tmp;
      return NetCodeA::SetMode(tmp.Deref(strMode));
    }




  public:
  
    //redeclare events with CFString parameters





  public:
  
    //redeclare methods with CFString parameters











#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpDecodedData;
    MUString tmpEncodedData;
    MUString tmpFileName;
    MUString tmpMode;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(NetCodeA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline INT GetDecodedData(LPWSTR &lpDecodedData, UINT &lenDecodedData) {
      LPSTR tmp = NULL;
      INT ret_code = NetCodeA::GetDecodedData(tmp, lenDecodedData);
      if (ret_code) return ret_code;
      tmpDecodedData.Set(tmp, lenDecodedData);
      lpDecodedData = tmpDecodedData.Deref();
      return 0;
    }

    inline INT SetDecodedData(LPWSTR lpDecodedData, UINT lenDecodedData) {
      MAString tmp(lpDecodedData, lenDecodedData);
      return NetCodeA::SetDecodedData(tmp.Deref(), tmp.Length());
    }
    inline INT GetEncodedData(LPWSTR &lpEncodedData, UINT &lenEncodedData) {
      LPSTR tmp = NULL;
      INT ret_code = NetCodeA::GetEncodedData(tmp, lenEncodedData);
      if (ret_code) return ret_code;
      tmpEncodedData.Set(tmp, lenEncodedData);
      lpEncodedData = tmpEncodedData.Deref();
      return 0;
    }

    inline INT SetEncodedData(LPWSTR lpEncodedData, UINT lenEncodedData) {
      MAString tmp(lpEncodedData, lenEncodedData);
      return NetCodeA::SetEncodedData(tmp.Deref(), tmp.Length());
    }

    inline LPWSTR GetFileName() {
      tmpFileName.Set(NetCodeA::GetFileName());
      return tmpFileName.Deref();
    }

    inline INT SetFileName(LPWSTR lpszFileName) {
      MAString tmp(lpszFileName);
      return NetCodeA::SetFileName(tmp.Deref());
    }



    inline LPWSTR GetMode() {
      tmpMode.Set(NetCodeA::GetMode());
      return tmpMode.Deref();
    }

    inline INT SetMode(LPWSTR lpszMode) {
      MAString tmp(lpszMode);
      return NetCodeA::SetMode(tmp.Deref());
    }




  public:
  
    //redeclare events with wide string parameters





#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_NETCODE_H_




