/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_MIME_H_
#define _IPWORKS_MIME_H_

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

#define mimeIdle                                           0
#define mimeDecodeFromFile                                 1
#define mimeDecodeFromString                               2
#define mimeEncodeToFile                                   3
#define mimeEncodeToString                                 4
#define mimeResetData                                      5

#define pe7Bit                                             0
#define peQuotedPrintable                                  1
#define peBase64                                           2
#define pe8Bit                                             3
#define peBinary                                           4


#define MIME_IDLE                                          0
#define MIME_DECODE_FROM_FILE                              1
#define MIME_DECODE_FROM_STRING                            2
#define MIME_ENCODE_TO_FILE                                3
#define MIME_ENCODE_TO_STRING                              4
#define MIME_RESET_DATA                                    5

#define PE_7BIT                                            0
#define PE_QUOTED_PRINTABLE                                1
#define PE_BASE_64                                         2
#define PE_8BIT                                            3
#define PE_BINARY                                          4



#endif //_IPWORKS_INTERNAL_

#define PID_MIME_ACTION    1
#define PID_MIME_BOUNDARY    2
#define PID_MIME_CONTENTTYPE    3
#define PID_MIME_CONTENTTYPEATTR    4
#define PID_MIME_MESSAGE    5
#define PID_MIME_MESSAGEHEADERS    6
#define PID_MIME_PARTCONTENTDISPOSITION    7
#define PID_MIME_PARTCONTENTDISPOSITIONATTR    8
#define PID_MIME_PARTCONTENTID    9
#define PID_MIME_PARTCONTENTTYPE    10
#define PID_MIME_PARTCONTENTTYPEATTR    11
#define PID_MIME_PARTCOUNT    12
#define PID_MIME_PARTDECODEDFILE    13
#define PID_MIME_PARTDECODEDSTRING    14
#define PID_MIME_PARTENCODING    15
#define PID_MIME_PARTFILENAME    16
#define PID_MIME_PARTHEADERS    17
#define PID_MIME_PARTNAME    18
#define PID_MIME_PARTSIZE    19


#define MID_MIME_DECODEFROMFILE    1
#define MID_MIME_DECODEFROMSTRING    2
#define MID_MIME_ENCODETOFILE    3
#define MID_MIME_ENCODETOSTRING    4
#define MID_MIME_RESETDATA    5


#define EID_MIME_PROGRESS    1


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID MIME_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    MIME_Destroy(LPVOID lpObj);
CNX_IMPORT INT    MIME_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID MIME_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    MIME_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    MIME_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  MIME_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    MIME_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   MIME_StaticInit(LPVOID hInst);

class MIMEA {
  
  public: //events
  
    virtual INT FireProgress(USHORT &usPercentDone) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_MIME_PROGRESS: {
                        USHORT pPercentDone = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((MIMEA*)lpObj)->FireProgress(pPercentDone);
         }

      }
      return 0;
    }

  public:

    MIMEA(LPCSTR lpOemKey = IPWORKS_OEMKEY_28) {
      m_pObj = MIME_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~MIMEA() {
      MIME_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)MIME_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return MIME_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)MIME_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return MIME_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAction() {
      int val = (int)MIME_Get(m_pObj, PID_MIME_ACTION, 0, 0);
      return (INT)val;
    }
    inline INT SetAction(INT iAction) {
      int val = (int)iAction;
      return MIME_Set(m_pObj, PID_MIME_ACTION, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetBoundary() {
      int val = (int)MIME_Get(m_pObj, PID_MIME_BOUNDARY, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetBoundary(LPCSTR lpszBoundary) {
      int val = (int)lpszBoundary;
      return MIME_Set(m_pObj, PID_MIME_BOUNDARY, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetContentType() {
      int val = (int)MIME_Get(m_pObj, PID_MIME_CONTENTTYPE, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetContentType(LPCSTR lpszContentType) {
      int val = (int)lpszContentType;
      return MIME_Set(m_pObj, PID_MIME_CONTENTTYPE, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetContentTypeAttr() {
      int val = (int)MIME_Get(m_pObj, PID_MIME_CONTENTTYPEATTR, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetContentTypeAttr(LPCSTR lpszContentTypeAttr) {
      int val = (int)lpszContentTypeAttr;
      return MIME_Set(m_pObj, PID_MIME_CONTENTTYPEATTR, 0, (LPVOID)val, 0);
    }
    inline INT GetMessage(LPCSTR &lpMessage, UINT &lenMessage) {
      lpMessage = (LPSTR)MIME_Get(m_pObj, PID_MIME_MESSAGE, 0, &lenMessage);
      if ( ! lpMessage) return lenMessage;
      return 0;
    }

    inline INT SetMessage(LPCSTR lpMessage, UINT lenMessage) {
      return MIME_Set(m_pObj, PID_MIME_MESSAGE, 0, (LPVOID)lpMessage, lenMessage);
    }

    inline LPCSTR GetMessageHeaders() {
      int val = (int)MIME_Get(m_pObj, PID_MIME_MESSAGEHEADERS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetMessageHeaders(LPCSTR lpszMessageHeaders) {
      int val = (int)lpszMessageHeaders;
      return MIME_Set(m_pObj, PID_MIME_MESSAGEHEADERS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartContentDisposition(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTCONTENTDISPOSITION, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartContentDisposition(USHORT usPartIdx, LPCSTR lpszPartContentDisposition) {
      int val = (int)lpszPartContentDisposition;
      return MIME_Set(m_pObj, PID_MIME_PARTCONTENTDISPOSITION, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartContentDispositionAttr(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTCONTENTDISPOSITIONATTR, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartContentDispositionAttr(USHORT usPartIdx, LPCSTR lpszPartContentDispositionAttr) {
      int val = (int)lpszPartContentDispositionAttr;
      return MIME_Set(m_pObj, PID_MIME_PARTCONTENTDISPOSITIONATTR, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartContentId(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTCONTENTID, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartContentId(USHORT usPartIdx, LPCSTR lpszPartContentId) {
      int val = (int)lpszPartContentId;
      return MIME_Set(m_pObj, PID_MIME_PARTCONTENTID, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartContentType(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTCONTENTTYPE, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartContentType(USHORT usPartIdx, LPCSTR lpszPartContentType) {
      int val = (int)lpszPartContentType;
      return MIME_Set(m_pObj, PID_MIME_PARTCONTENTTYPE, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartContentTypeAttr(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTCONTENTTYPEATTR, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartContentTypeAttr(USHORT usPartIdx, LPCSTR lpszPartContentTypeAttr) {
      int val = (int)lpszPartContentTypeAttr;
      return MIME_Set(m_pObj, PID_MIME_PARTCONTENTTYPEATTR, usPartIdx, (LPVOID)val, 0);
    }
    inline USHORT GetPartCount() {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTCOUNT, 0, 0);
      return (USHORT)val;
    }
    inline INT SetPartCount(USHORT usPartCount) {
      int val = (int)usPartCount;
      return MIME_Set(m_pObj, PID_MIME_PARTCOUNT, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartDecodedFile(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTDECODEDFILE, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartDecodedFile(USHORT usPartIdx, LPCSTR lpszPartDecodedFile) {
      int val = (int)lpszPartDecodedFile;
      return MIME_Set(m_pObj, PID_MIME_PARTDECODEDFILE, usPartIdx, (LPVOID)val, 0);
    }
    inline INT GetPartDecodedString(USHORT usPartIdx, LPCSTR &lpPartDecodedString, UINT &lenPartDecodedString) {
      lpPartDecodedString = (LPSTR)MIME_Get(m_pObj, PID_MIME_PARTDECODEDSTRING, usPartIdx, &lenPartDecodedString);
      if ( ! lpPartDecodedString) return lenPartDecodedString;
      return 0;
    }

    inline INT SetPartDecodedString(USHORT usPartIdx, LPCSTR lpPartDecodedString, UINT lenPartDecodedString) {
      return MIME_Set(m_pObj, PID_MIME_PARTDECODEDSTRING, usPartIdx, (LPVOID)lpPartDecodedString, lenPartDecodedString);
    }

    inline INT GetPartEncoding(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTENCODING, usPartIdx, 0);
      return (INT)val;
    }
    inline INT SetPartEncoding(USHORT usPartIdx, INT iPartEncoding) {
      int val = (int)iPartEncoding;
      return MIME_Set(m_pObj, PID_MIME_PARTENCODING, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartFilename(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTFILENAME, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartFilename(USHORT usPartIdx, LPCSTR lpszPartFilename) {
      int val = (int)lpszPartFilename;
      return MIME_Set(m_pObj, PID_MIME_PARTFILENAME, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartHeaders(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTHEADERS, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartHeaders(USHORT usPartIdx, LPCSTR lpszPartHeaders) {
      int val = (int)lpszPartHeaders;
      return MIME_Set(m_pObj, PID_MIME_PARTHEADERS, usPartIdx, (LPVOID)val, 0);
    }
    inline LPCSTR GetPartName(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTNAME, usPartIdx, 0);
      return (LPCSTR)val;
    }
    inline INT SetPartName(USHORT usPartIdx, LPCSTR lpszPartName) {
      int val = (int)lpszPartName;
      return MIME_Set(m_pObj, PID_MIME_PARTNAME, usPartIdx, (LPVOID)val, 0);
    }
    inline LONG GetPartSize(USHORT usPartIdx) {
      int val = (int)MIME_Get(m_pObj, PID_MIME_PARTSIZE, usPartIdx, 0);
      return (LONG)val;
    }


  public: //methods

    inline int DecodeFromFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MIME_Do(m_pObj, MID_MIME_DECODEFROMFILE, 0, param, cbparam);
      
      
    }
    inline int DecodeFromString() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MIME_Do(m_pObj, MID_MIME_DECODEFROMSTRING, 0, param, cbparam);
      
      
    }
    inline int EncodeToFile() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MIME_Do(m_pObj, MID_MIME_ENCODETOFILE, 0, param, cbparam);
      
      
    }
    inline int EncodeToString() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MIME_Do(m_pObj, MID_MIME_ENCODETOSTRING, 0, param, cbparam);
      
      
    }
    inline int ResetData() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return MIME_Do(m_pObj, MID_MIME_RESETDATA, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class MIME : public MIMEA {
  
  public:
    MIME(LPCSTR lpOemKey = IPWORKS_OEMKEY_28):MIMEA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpBoundary;
    MCFStringRef tmpContentType;
    MCFStringRef tmpContentTypeAttr;
    MCFStringRef tmpMessage;
    MCFStringRef tmpMessageHeaders;
    MCFStringRef tmpPartContentDisposition;
    MCFStringRef tmpPartContentDispositionAttr;
    MCFStringRef tmpPartContentId;
    MCFStringRef tmpPartContentType;
    MCFStringRef tmpPartContentTypeAttr;
    MCFStringRef tmpPartDecodedFile;
    MCFStringRef tmpPartDecodedString;
    MCFStringRef tmpPartFilename;
    MCFStringRef tmpPartHeaders;
    MCFStringRef tmpPartName;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(MIMEA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetBoundary() {
      return tmpBoundary.Set(MIMEA::GetBoundary());
    }

    inline INT SetBoundary(CFStringRef strBoundary) {
      MCFStringAcc tmp;
      return MIMEA::SetBoundary(tmp.Deref(strBoundary));
    }
    inline CFStringRef GetContentType() {
      return tmpContentType.Set(MIMEA::GetContentType());
    }

    inline INT SetContentType(CFStringRef strContentType) {
      MCFStringAcc tmp;
      return MIMEA::SetContentType(tmp.Deref(strContentType));
    }
    inline CFStringRef GetContentTypeAttr() {
      return tmpContentTypeAttr.Set(MIMEA::GetContentTypeAttr());
    }

    inline INT SetContentTypeAttr(CFStringRef strContentTypeAttr) {
      MCFStringAcc tmp;
      return MIMEA::SetContentTypeAttr(tmp.Deref(strContentTypeAttr));
    }
    inline CFStringRef GetMessage() {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = MIMEA::GetMessage(tmp, len);
      if (ret_code) return NULL;
      return tmpMessage.Set(tmp, len);
    }

    inline INT SetMessage(CFStringRef strMessage) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strMessage);
      return MIMEA::SetMessage(lp, tmp.Length());
    }
    inline CFStringRef GetMessageHeaders() {
      return tmpMessageHeaders.Set(MIMEA::GetMessageHeaders());
    }

    inline INT SetMessageHeaders(CFStringRef strMessageHeaders) {
      MCFStringAcc tmp;
      return MIMEA::SetMessageHeaders(tmp.Deref(strMessageHeaders));
    }
    inline CFStringRef GetPartContentDisposition(USHORT usPartIdx) {
      return tmpPartContentDisposition.Set(MIMEA::GetPartContentDisposition(usPartIdx));
    }

    inline INT SetPartContentDisposition(USHORT usPartIdx, CFStringRef strPartContentDisposition) {
      MCFStringAcc tmp;
      return MIMEA::SetPartContentDisposition(usPartIdx, tmp.Deref(strPartContentDisposition));
    }
    inline CFStringRef GetPartContentDispositionAttr(USHORT usPartIdx) {
      return tmpPartContentDispositionAttr.Set(MIMEA::GetPartContentDispositionAttr(usPartIdx));
    }

    inline INT SetPartContentDispositionAttr(USHORT usPartIdx, CFStringRef strPartContentDispositionAttr) {
      MCFStringAcc tmp;
      return MIMEA::SetPartContentDispositionAttr(usPartIdx, tmp.Deref(strPartContentDispositionAttr));
    }
    inline CFStringRef GetPartContentId(USHORT usPartIdx) {
      return tmpPartContentId.Set(MIMEA::GetPartContentId(usPartIdx));
    }

    inline INT SetPartContentId(USHORT usPartIdx, CFStringRef strPartContentId) {
      MCFStringAcc tmp;
      return MIMEA::SetPartContentId(usPartIdx, tmp.Deref(strPartContentId));
    }
    inline CFStringRef GetPartContentType(USHORT usPartIdx) {
      return tmpPartContentType.Set(MIMEA::GetPartContentType(usPartIdx));
    }

    inline INT SetPartContentType(USHORT usPartIdx, CFStringRef strPartContentType) {
      MCFStringAcc tmp;
      return MIMEA::SetPartContentType(usPartIdx, tmp.Deref(strPartContentType));
    }
    inline CFStringRef GetPartContentTypeAttr(USHORT usPartIdx) {
      return tmpPartContentTypeAttr.Set(MIMEA::GetPartContentTypeAttr(usPartIdx));
    }

    inline INT SetPartContentTypeAttr(USHORT usPartIdx, CFStringRef strPartContentTypeAttr) {
      MCFStringAcc tmp;
      return MIMEA::SetPartContentTypeAttr(usPartIdx, tmp.Deref(strPartContentTypeAttr));
    }

    inline CFStringRef GetPartDecodedFile(USHORT usPartIdx) {
      return tmpPartDecodedFile.Set(MIMEA::GetPartDecodedFile(usPartIdx));
    }

    inline INT SetPartDecodedFile(USHORT usPartIdx, CFStringRef strPartDecodedFile) {
      MCFStringAcc tmp;
      return MIMEA::SetPartDecodedFile(usPartIdx, tmp.Deref(strPartDecodedFile));
    }
    inline CFStringRef GetPartDecodedString(USHORT usPartIdx) {
      LPCSTR tmp = NULL;
      UINT len = 0;
      INT ret_code = MIMEA::GetPartDecodedString(usPartIdx, tmp, len);
      if (ret_code) return NULL;
      return tmpPartDecodedString.Set(tmp, len);
    }

    inline INT SetPartDecodedString(USHORT usPartIdx, CFStringRef strPartDecodedString) {
      MCFStringAcc tmp;
      LPSTR lp = tmp.Deref(strPartDecodedString);
      return MIMEA::SetPartDecodedString(usPartIdx, lp, tmp.Length());
    }

    inline CFStringRef GetPartFilename(USHORT usPartIdx) {
      return tmpPartFilename.Set(MIMEA::GetPartFilename(usPartIdx));
    }

    inline INT SetPartFilename(USHORT usPartIdx, CFStringRef strPartFilename) {
      MCFStringAcc tmp;
      return MIMEA::SetPartFilename(usPartIdx, tmp.Deref(strPartFilename));
    }
    inline CFStringRef GetPartHeaders(USHORT usPartIdx) {
      return tmpPartHeaders.Set(MIMEA::GetPartHeaders(usPartIdx));
    }

    inline INT SetPartHeaders(USHORT usPartIdx, CFStringRef strPartHeaders) {
      MCFStringAcc tmp;
      return MIMEA::SetPartHeaders(usPartIdx, tmp.Deref(strPartHeaders));
    }
    inline CFStringRef GetPartName(USHORT usPartIdx) {
      return tmpPartName.Set(MIMEA::GetPartName(usPartIdx));
    }

    inline INT SetPartName(USHORT usPartIdx, CFStringRef strPartName) {
      MCFStringAcc tmp;
      return MIMEA::SetPartName(usPartIdx, tmp.Deref(strPartName));
    }



  public:
  
    //redeclare events with CFString parameters





  public:
  
    //redeclare methods with CFString parameters













#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpBoundary;
    MUString tmpContentType;
    MUString tmpContentTypeAttr;
    MUString tmpMessage;
    MUString tmpMessageHeaders;
    MUString tmpPartContentDisposition;
    MUString tmpPartContentDispositionAttr;
    MUString tmpPartContentId;
    MUString tmpPartContentType;
    MUString tmpPartContentTypeAttr;
    MUString tmpPartDecodedFile;
    MUString tmpPartDecodedString;
    MUString tmpPartFilename;
    MUString tmpPartHeaders;
    MUString tmpPartName;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(MIMEA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetBoundary() {
      tmpBoundary.Set(MIMEA::GetBoundary());
      return tmpBoundary.Deref();
    }

    inline INT SetBoundary(LPWSTR lpszBoundary) {
      MAString tmp(lpszBoundary);
      return MIMEA::SetBoundary(tmp.Deref());
    }
    inline LPWSTR GetContentType() {
      tmpContentType.Set(MIMEA::GetContentType());
      return tmpContentType.Deref();
    }

    inline INT SetContentType(LPWSTR lpszContentType) {
      MAString tmp(lpszContentType);
      return MIMEA::SetContentType(tmp.Deref());
    }
    inline LPWSTR GetContentTypeAttr() {
      tmpContentTypeAttr.Set(MIMEA::GetContentTypeAttr());
      return tmpContentTypeAttr.Deref();
    }

    inline INT SetContentTypeAttr(LPWSTR lpszContentTypeAttr) {
      MAString tmp(lpszContentTypeAttr);
      return MIMEA::SetContentTypeAttr(tmp.Deref());
    }
    inline INT GetMessage(LPWSTR &lpMessage, UINT &lenMessage) {
      LPSTR tmp = NULL;
      INT ret_code = MIMEA::GetMessage(tmp, lenMessage);
      if (ret_code) return ret_code;
      tmpMessage.Set(tmp, lenMessage);
      lpMessage = tmpMessage.Deref();
      return 0;
    }

    inline INT SetMessage(LPWSTR lpMessage, UINT lenMessage) {
      MAString tmp(lpMessage, lenMessage);
      return MIMEA::SetMessage(tmp.Deref(), tmp.Length());
    }
    inline LPWSTR GetMessageHeaders() {
      tmpMessageHeaders.Set(MIMEA::GetMessageHeaders());
      return tmpMessageHeaders.Deref();
    }

    inline INT SetMessageHeaders(LPWSTR lpszMessageHeaders) {
      MAString tmp(lpszMessageHeaders);
      return MIMEA::SetMessageHeaders(tmp.Deref());
    }
    inline LPWSTR GetPartContentDisposition(USHORT usPartIdx) {
      tmpPartContentDisposition.Set(MIMEA::GetPartContentDisposition(usPartIdx));
      return tmpPartContentDisposition.Deref();
    }

    inline INT SetPartContentDisposition(USHORT usPartIdx, LPWSTR lpszPartContentDisposition) {
      MAString tmp(lpszPartContentDisposition);
      return MIMEA::SetPartContentDisposition(usPartIdx, tmp.Deref());
    }
    inline LPWSTR GetPartContentDispositionAttr(USHORT usPartIdx) {
      tmpPartContentDispositionAttr.Set(MIMEA::GetPartContentDispositionAttr(usPartIdx));
      return tmpPartContentDispositionAttr.Deref();
    }

    inline INT SetPartContentDispositionAttr(USHORT usPartIdx, LPWSTR lpszPartContentDispositionAttr) {
      MAString tmp(lpszPartContentDispositionAttr);
      return MIMEA::SetPartContentDispositionAttr(usPartIdx, tmp.Deref());
    }
    inline LPWSTR GetPartContentId(USHORT usPartIdx) {
      tmpPartContentId.Set(MIMEA::GetPartContentId(usPartIdx));
      return tmpPartContentId.Deref();
    }

    inline INT SetPartContentId(USHORT usPartIdx, LPWSTR lpszPartContentId) {
      MAString tmp(lpszPartContentId);
      return MIMEA::SetPartContentId(usPartIdx, tmp.Deref());
    }
    inline LPWSTR GetPartContentType(USHORT usPartIdx) {
      tmpPartContentType.Set(MIMEA::GetPartContentType(usPartIdx));
      return tmpPartContentType.Deref();
    }

    inline INT SetPartContentType(USHORT usPartIdx, LPWSTR lpszPartContentType) {
      MAString tmp(lpszPartContentType);
      return MIMEA::SetPartContentType(usPartIdx, tmp.Deref());
    }
    inline LPWSTR GetPartContentTypeAttr(USHORT usPartIdx) {
      tmpPartContentTypeAttr.Set(MIMEA::GetPartContentTypeAttr(usPartIdx));
      return tmpPartContentTypeAttr.Deref();
    }

    inline INT SetPartContentTypeAttr(USHORT usPartIdx, LPWSTR lpszPartContentTypeAttr) {
      MAString tmp(lpszPartContentTypeAttr);
      return MIMEA::SetPartContentTypeAttr(usPartIdx, tmp.Deref());
    }

    inline LPWSTR GetPartDecodedFile(USHORT usPartIdx) {
      tmpPartDecodedFile.Set(MIMEA::GetPartDecodedFile(usPartIdx));
      return tmpPartDecodedFile.Deref();
    }

    inline INT SetPartDecodedFile(USHORT usPartIdx, LPWSTR lpszPartDecodedFile) {
      MAString tmp(lpszPartDecodedFile);
      return MIMEA::SetPartDecodedFile(usPartIdx, tmp.Deref());
    }
    inline INT GetPartDecodedString(USHORT usPartIdx, LPWSTR &lpPartDecodedString, UINT &lenPartDecodedString) {
      LPSTR tmp = NULL;
      INT ret_code = MIMEA::GetPartDecodedString(usPartIdx, tmp, lenPartDecodedString);
      if (ret_code) return ret_code;
      tmpPartDecodedString.Set(tmp, lenPartDecodedString);
      lpPartDecodedString = tmpPartDecodedString.Deref();
      return 0;
    }

    inline INT SetPartDecodedString(USHORT usPartIdx, LPWSTR lpPartDecodedString, UINT lenPartDecodedString) {
      MAString tmp(lpPartDecodedString, lenPartDecodedString);
      return MIMEA::SetPartDecodedString(usPartIdx, tmp.Deref(), tmp.Length());
    }

    inline LPWSTR GetPartFilename(USHORT usPartIdx) {
      tmpPartFilename.Set(MIMEA::GetPartFilename(usPartIdx));
      return tmpPartFilename.Deref();
    }

    inline INT SetPartFilename(USHORT usPartIdx, LPWSTR lpszPartFilename) {
      MAString tmp(lpszPartFilename);
      return MIMEA::SetPartFilename(usPartIdx, tmp.Deref());
    }
    inline LPWSTR GetPartHeaders(USHORT usPartIdx) {
      tmpPartHeaders.Set(MIMEA::GetPartHeaders(usPartIdx));
      return tmpPartHeaders.Deref();
    }

    inline INT SetPartHeaders(USHORT usPartIdx, LPWSTR lpszPartHeaders) {
      MAString tmp(lpszPartHeaders);
      return MIMEA::SetPartHeaders(usPartIdx, tmp.Deref());
    }
    inline LPWSTR GetPartName(USHORT usPartIdx) {
      tmpPartName.Set(MIMEA::GetPartName(usPartIdx));
      return tmpPartName.Deref();
    }

    inline INT SetPartName(USHORT usPartIdx, LPWSTR lpszPartName) {
      MAString tmp(lpszPartName);
      return MIMEA::SetPartName(usPartIdx, tmp.Deref());
    }



  public:
  
    //redeclare events with wide string parameters





#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_MIME_H_




