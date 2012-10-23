/******************************************************************
   IP*Works! V5 C++ Edition
   Copyright (c) 2003 /n software inc. - All rights reserved.
*******************************************************************/

#ifndef _IPWORKS_XMLP_H_
#define _IPWORKS_XMLP_H_

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




#endif //_IPWORKS_INTERNAL_

#define PID_XMLP_ATTRCOUNT    1
#define PID_XMLP_ATTRNAME    2
#define PID_XMLP_ATTRNAMESPACE    3
#define PID_XMLP_ATTRPREFIX    4
#define PID_XMLP_ATTRVALUE    5
#define PID_XMLP_BUILDDOM    6
#define PID_XMLP_ELEMENTCOUNT    7
#define PID_XMLP_ELEMENTS    8
#define PID_XMLP_EXTRANAMECHARS    9
#define PID_XMLP_EXTRASPACECHARS    10
#define PID_XMLP_FLAGS    11
#define PID_XMLP_FLUSHONEOL    12
#define PID_XMLP_FLUSHTEXT    13
#define PID_XMLP_INPUTTEXT    14
#define PID_XMLP_NAMESPACECOUNT    15
#define PID_XMLP_NAMESPACES    16
#define PID_XMLP_OFFSET    17
#define PID_XMLP_PREFIXES    18
#define PID_XMLP_RESETTEXT    19
#define PID_XMLP_VALIDATE    20
#define PID_XMLP_XCHILDREN    21
#define PID_XMLP_XELEMENT    22
#define PID_XMLP_XNAMESPACE    23
#define PID_XMLP_XPARENT    24
#define PID_XMLP_XPATH    25
#define PID_XMLP_XPREFIX    26
#define PID_XMLP_XTEXT    27


#define MID_XMLP_ATTR    1
#define MID_XMLP_FLUSH    2
#define MID_XMLP_INPUT    3
#define MID_XMLP_PARSEFILE    4
#define MID_XMLP_RESET    5


#define EID_XMLP_CHARACTERS    1
#define EID_XMLP_COMMENT    2
#define EID_XMLP_ENDELEMENT    3
#define EID_XMLP_ENDPREFIXMAPPING    4
#define EID_XMLP_ERROR    5
#define EID_XMLP_EVALENTITY    6
#define EID_XMLP_IGNORABLEWHITESPACE    7
#define EID_XMLP_META    8
#define EID_XMLP_PI    9
#define EID_XMLP_SPECIALSECTION    10
#define EID_XMLP_STARTELEMENT    11
#define EID_XMLP_STARTPREFIXMAPPING    12


#ifdef WIN32
#ifndef IPWORKS_STATIC_LIB
#define CNX_IMPORT extern "C" __declspec(dllexport)
#else
#define CNX_IMPORT extern "C"
#endif
#else
#define CNX_IMPORT extern "C"
#endif

CNX_IMPORT LPVOID XMLp_Create(LPFNIPWORKSEVENT lpSink, LPVOID lpContext, LPSTR lpOemKey);
CNX_IMPORT INT    XMLp_Destroy(LPVOID lpObj);
CNX_IMPORT INT    XMLp_CheckIndex(LPVOID lpObj, INT propid, INT arridx);
CNX_IMPORT LPVOID XMLp_Get(LPVOID lpObj, INT propid, INT arridx, LPUINT lpcbVal);
CNX_IMPORT INT    XMLp_Set(LPVOID lpObj, INT propid, INT arridx, LPVOID val, UINT cbVal);
CNX_IMPORT INT    XMLp_Do(LPVOID lpObj, INT methid, INT cparam, LPVOID param[], UINT cbparam[]);
CNX_IMPORT LPSTR  XMLp_GetLastError(LPVOID lpObj);
CNX_IMPORT INT    XMLp_GetLastErrorCode(LPVOID lpObj);
CNX_IMPORT VOID   XMLp_StaticInit(LPVOID hInst);

class XMLpA {
  
  public: //events
  
    virtual INT FireCharacters(LPSTR &lpText, USHORT &lenText) {return 0;}
    virtual INT FireComment(LPSTR &lpszText) {return 0;}
    virtual INT FireEndElement(LPSTR &lpszNamespace, LPSTR &lpszElement, LPSTR &lpszQName, BOOL &bIsEmpty) {return 0;}
    virtual INT FireEndPrefixMapping(LPSTR &lpszPrefix) {return 0;}
    virtual INT FireError(USHORT &usErrorCode, LPSTR &lpszDescription) {return 0;}
    virtual INT FireEvalEntity(LPSTR &lpszEntity, LPSTR &lpszValue) {return 0;}
    virtual INT FireIgnorableWhitespace(LPSTR &lpszText) {return 0;}
    virtual INT FireMeta(LPSTR &lpszText) {return 0;}
    virtual INT FirePI(LPSTR &lpszText) {return 0;}
    virtual INT FireSpecialSection(LPSTR &lpszSectionId, LPSTR &lpszText) {return 0;}
    virtual INT FireStartElement(LPSTR &lpszNamespace, LPSTR &lpszElement, LPSTR &lpszQName, BOOL &bIsEmpty) {return 0;}
    virtual INT FireStartPrefixMapping(LPSTR &lpszPrefix, LPSTR &lpszURI) {return 0;}


  private:

    LPVOID m_pObj;
    static INT dSink(LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]) {
      switch (event_id) {
         case EID_XMLP_CHARACTERS: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        USHORT lenText = (USHORT)(*cbparam++);
            
            
            return ((XMLpA*)lpObj)->FireCharacters(pText, lenText);
         }
         case EID_XMLP_COMMENT: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireComment(pText);
         }
         case EID_XMLP_ENDELEMENT: {
                        LPSTR pNamespace = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pElement = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pQName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        BOOL pIsEmpty = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireEndElement(pNamespace, pElement, pQName, pIsEmpty);
         }
         case EID_XMLP_ENDPREFIXMAPPING: {
                        LPSTR pPrefix = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireEndPrefixMapping(pPrefix);
         }
         case EID_XMLP_ERROR: {
                        USHORT pErrorCode = (USHORT)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pDescription = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireError(pErrorCode, pDescription);
         }
         case EID_XMLP_EVALENTITY: {
                        LPSTR pEntity = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR *pValue = (LPSTR*)(INT)param++;
                 
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireEvalEntity(pEntity, *pValue);
         }
         case EID_XMLP_IGNORABLEWHITESPACE: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireIgnorableWhitespace(pText);
         }
         case EID_XMLP_META: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireMeta(pText);
         }
         case EID_XMLP_PI: {
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FirePI(pText);
         }
         case EID_XMLP_SPECIALSECTION: {
                        LPSTR pSectionId = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pText = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireSpecialSection(pSectionId, pText);
         }
         case EID_XMLP_STARTELEMENT: {
                        LPSTR pNamespace = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pElement = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pQName = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        BOOL pIsEmpty = (BOOL)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireStartElement(pNamespace, pElement, pQName, pIsEmpty);
         }
         case EID_XMLP_STARTPREFIXMAPPING: {
                        LPSTR pPrefix = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
                        LPSTR pURI = (LPSTR)(INT)(*param++);
            
                        cbparam++;
            
            
            return ((XMLpA*)lpObj)->FireStartPrefixMapping(pPrefix, pURI);
         }

      }
      return 0;
    }

  public:

    XMLpA(LPCSTR lpOemKey = IPWORKS_OEMKEY_54) {
      m_pObj = XMLp_Create(dSink, (LPVOID)this, (LPSTR)lpOemKey);
    }

    virtual ~XMLpA() {
      XMLp_Destroy(m_pObj);
    }

  public: //properties

    inline LPCSTR GetLastError() {
      return (LPCSTR)XMLp_GetLastError(m_pObj);
    }
    
    inline INT GetLastErrorCode() {
      return XMLp_GetLastErrorCode(m_pObj);
    }
      
    inline LONG GetCharsetMode() {
      return (LONG)XMLp_Get(m_pObj, 242, 0, 0);
    }
    inline INT SetCharsetMode(LONG val) {
      return XMLp_Set(m_pObj, 242, 0, (LPVOID)val, 0);
    }

    inline INT GetAttrCount() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ATTRCOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetAttrName(USHORT usAttrIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ATTRNAME, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetAttrNamespace(USHORT usAttrIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ATTRNAMESPACE, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetAttrPrefix(USHORT usAttrIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ATTRPREFIX, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetAttrValue(USHORT usAttrIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ATTRVALUE, usAttrIndex, 0);
      return (LPCSTR)val;
    }

    inline BOOL GetBuildDOM() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_BUILDDOM, 0, 0);
      return (BOOL)val;
    }
    inline INT SetBuildDOM(BOOL bBuildDOM) {
      int val = (int)bBuildDOM;
      return XMLp_Set(m_pObj, PID_XMLP_BUILDDOM, 0, (LPVOID)val, 0);
    }
    inline INT GetElementCount() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ELEMENTCOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetElements(USHORT usElementIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_ELEMENTS, usElementIndex, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetExtraNameChars() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_EXTRANAMECHARS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetExtraNameChars(LPCSTR lpszExtraNameChars) {
      int val = (int)lpszExtraNameChars;
      return XMLp_Set(m_pObj, PID_XMLP_EXTRANAMECHARS, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetExtraSpaceChars() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_EXTRASPACECHARS, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetExtraSpaceChars(LPCSTR lpszExtraSpaceChars) {
      int val = (int)lpszExtraSpaceChars;
      return XMLp_Set(m_pObj, PID_XMLP_EXTRASPACECHARS, 0, (LPVOID)val, 0);
    }
    inline LONG GetFlags() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_FLAGS, 0, 0);
      return (LONG)val;
    }
    inline INT SetFlags(LONG lFlags) {
      int val = (int)lFlags;
      return XMLp_Set(m_pObj, PID_XMLP_FLAGS, 0, (LPVOID)val, 0);
    }
    inline BOOL GetFlushOnEOL() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_FLUSHONEOL, 0, 0);
      return (BOOL)val;
    }
    inline INT SetFlushOnEOL(BOOL bFlushOnEOL) {
      int val = (int)bFlushOnEOL;
      return XMLp_Set(m_pObj, PID_XMLP_FLUSHONEOL, 0, (LPVOID)val, 0);
    }

    inline INT SetFlushText(BOOL bFlushText) {
      int val = (int)bFlushText;
      return XMLp_Set(m_pObj, PID_XMLP_FLUSHTEXT, 0, (LPVOID)val, 0);
    }

    inline INT SetInputText(LPCSTR lpszInputText) {
      int val = (int)lpszInputText;
      return XMLp_Set(m_pObj, PID_XMLP_INPUTTEXT, 0, (LPVOID)val, 0);
    }
    inline INT GetNamespaceCount() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_NAMESPACECOUNT, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetNamespaces(USHORT usNamespaceIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_NAMESPACES, usNamespaceIndex, 0);
      return (LPCSTR)val;
    }

    inline LONG GetOffset() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_OFFSET, 0, 0);
      return (LONG)val;
    }

    inline LPCSTR GetPrefixes(USHORT usNamespaceIndex) {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_PREFIXES, usNamespaceIndex, 0);
      return (LPCSTR)val;
    }


    inline INT SetResetText(BOOL bResetText) {
      int val = (int)bResetText;
      return XMLp_Set(m_pObj, PID_XMLP_RESETTEXT, 0, (LPVOID)val, 0);
    }
    inline BOOL GetValidate() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_VALIDATE, 0, 0);
      return (BOOL)val;
    }
    inline INT SetValidate(BOOL bValidate) {
      int val = (int)bValidate;
      return XMLp_Set(m_pObj, PID_XMLP_VALIDATE, 0, (LPVOID)val, 0);
    }
    inline INT GetXChildren() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XCHILDREN, 0, 0);
      return (INT)val;
    }

    inline LPCSTR GetXElement() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XELEMENT, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXNamespace() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XNAMESPACE, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXParent() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XPARENT, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXPath() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XPATH, 0, 0);
      return (LPCSTR)val;
    }
    inline INT SetXPath(LPCSTR lpszXPath) {
      int val = (int)lpszXPath;
      return XMLp_Set(m_pObj, PID_XMLP_XPATH, 0, (LPVOID)val, 0);
    }
    inline LPCSTR GetXPrefix() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XPREFIX, 0, 0);
      return (LPCSTR)val;
    }

    inline LPCSTR GetXText() {
      int val = (int)XMLp_Get(m_pObj, PID_XMLP_XTEXT, 0, 0);
      return (LPCSTR)val;
    }


  public: //methods

    inline LPSTR Attr(LPSTR lpszAttrName) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszAttrName, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      XMLp_Do(m_pObj, MID_XMLP_ATTR, 1, param, cbparam);
      
      return (LPSTR)param[1];
    }
    inline int Flush() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return XMLp_Do(m_pObj, MID_XMLP_FLUSH, 0, param, cbparam);
      
      
    }
    inline int Input(LPSTR lpszText) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszText, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return XMLp_Do(m_pObj, MID_XMLP_INPUT, 1, param, cbparam);
      
      
    }
    inline int ParseFile(LPSTR lpszFileName) {
      LPVOID param[1+1] = {(LPVOID)(INT)lpszFileName, NULL};
      UINT cbparam[1+1] = {0, (UINT)NULL};
      return XMLp_Do(m_pObj, MID_XMLP_PARSEFILE, 1, param, cbparam);
      
      
    }
    inline int Reset() {
      LPVOID param[0+1] = {NULL};
      UINT cbparam[0+1] = {(UINT)NULL};
      return XMLp_Do(m_pObj, MID_XMLP_RESET, 0, param, cbparam);
      
      
    }

};

#ifdef _WIN32_WCE
#ifndef _IPWORKS_INTERNAL_
#include "ustring.h"
#endif
#endif

class XMLp : public XMLpA {
  
  public:
    XMLp(LPCSTR lpOemKey = IPWORKS_OEMKEY_54):XMLpA(lpOemKey) {}

#ifndef NO_UNICODE_WRAPPER
#ifndef _IPWORKS_INTERNAL_

#ifdef MACOS

  private:
    MCFStringRef tmpLastError;
    MCFStringRef tmpAttrName;
    MCFStringRef tmpAttrNamespace;
    MCFStringRef tmpAttrPrefix;
    MCFStringRef tmpAttrValue;
    MCFStringRef tmpElements;
    MCFStringRef tmpExtraNameChars;
    MCFStringRef tmpExtraSpaceChars;
    MCFStringRef tmpInputText;
    MCFStringRef tmpNamespaces;
    MCFStringRef tmpPrefixes;
    MCFStringRef tmpXElement;
    MCFStringRef tmpXNamespace;
    MCFStringRef tmpXParent;
    MCFStringRef tmpXPath;
    MCFStringRef tmpXPrefix;
    MCFStringRef tmpXText;

  
  public:  //properties

    CFStringRef GetLastError() {
      return tmpLastError.Set(XMLpA::GetLastError());
    }

    // CFString versions of properties

    inline CFStringRef GetAttrName(USHORT usAttrIndex) {
      return tmpAttrName.Set(XMLpA::GetAttrName(usAttrIndex));
    }

    inline CFStringRef GetAttrNamespace(USHORT usAttrIndex) {
      return tmpAttrNamespace.Set(XMLpA::GetAttrNamespace(usAttrIndex));
    }

    inline CFStringRef GetAttrPrefix(USHORT usAttrIndex) {
      return tmpAttrPrefix.Set(XMLpA::GetAttrPrefix(usAttrIndex));
    }

    inline CFStringRef GetAttrValue(USHORT usAttrIndex) {
      return tmpAttrValue.Set(XMLpA::GetAttrValue(usAttrIndex));
    }



    inline CFStringRef GetElements(USHORT usElementIndex) {
      return tmpElements.Set(XMLpA::GetElements(usElementIndex));
    }

    inline CFStringRef GetExtraNameChars() {
      return tmpExtraNameChars.Set(XMLpA::GetExtraNameChars());
    }

    inline INT SetExtraNameChars(CFStringRef strExtraNameChars) {
      MCFStringAcc tmp;
      return XMLpA::SetExtraNameChars(tmp.Deref(strExtraNameChars));
    }
    inline CFStringRef GetExtraSpaceChars() {
      return tmpExtraSpaceChars.Set(XMLpA::GetExtraSpaceChars());
    }

    inline INT SetExtraSpaceChars(CFStringRef strExtraSpaceChars) {
      MCFStringAcc tmp;
      return XMLpA::SetExtraSpaceChars(tmp.Deref(strExtraSpaceChars));
    }




    inline INT SetInputText(CFStringRef strInputText) {
      MCFStringAcc tmp;
      return XMLpA::SetInputText(tmp.Deref(strInputText));
    }

    inline CFStringRef GetNamespaces(USHORT usNamespaceIndex) {
      return tmpNamespaces.Set(XMLpA::GetNamespaces(usNamespaceIndex));
    }


    inline CFStringRef GetPrefixes(USHORT usNamespaceIndex) {
      return tmpPrefixes.Set(XMLpA::GetPrefixes(usNamespaceIndex));
    }




    inline CFStringRef GetXElement() {
      return tmpXElement.Set(XMLpA::GetXElement());
    }

    inline CFStringRef GetXNamespace() {
      return tmpXNamespace.Set(XMLpA::GetXNamespace());
    }

    inline CFStringRef GetXParent() {
      return tmpXParent.Set(XMLpA::GetXParent());
    }

    inline CFStringRef GetXPath() {
      return tmpXPath.Set(XMLpA::GetXPath());
    }

    inline INT SetXPath(CFStringRef strXPath) {
      MCFStringAcc tmp;
      return XMLpA::SetXPath(tmp.Deref(strXPath));
    }
    inline CFStringRef GetXPrefix() {
      return tmpXPrefix.Set(XMLpA::GetXPrefix());
    }

    inline CFStringRef GetXText() {
      return tmpXText.Set(XMLpA::GetXText());
    }



  public:
  
    //redeclare events with CFString parameters

    virtual INT FireCharacters(LPSTR &lpText, USHORT &lenText) {
      MCFStringRef etmpText(lpText, lenText);
      CFStringRef uval_lpText = etmpText.Deref();
      return FireCharacters(uval_lpText, lenText);
    }
    virtual INT FireCharacters(CFStringRef &lpText, USHORT &lenText) {
      return 0;
    }

    virtual INT FireComment(LPSTR &lpszText) {
      MCFStringRef etmpText(lpszText);
      CFStringRef uval_lpszText = etmpText.Deref();

      return FireComment(uval_lpszText);
    }
    virtual INT FireComment(CFStringRef &lpszText) {
      return 0;
    }

    virtual INT FireEndElement(LPSTR &lpszNamespace, LPSTR &lpszElement, LPSTR &lpszQName, BOOL &bIsEmpty) {
      MCFStringRef etmpNamespace(lpszNamespace);
      CFStringRef uval_lpszNamespace = etmpNamespace.Deref();
      MCFStringRef etmpElement(lpszElement);
      CFStringRef uval_lpszElement = etmpElement.Deref();
      MCFStringRef etmpQName(lpszQName);
      CFStringRef uval_lpszQName = etmpQName.Deref();

      return FireEndElement(uval_lpszNamespace, uval_lpszElement, uval_lpszQName, bIsEmpty);
    }
    virtual INT FireEndElement(CFStringRef &lpszNamespace, CFStringRef &lpszElement, CFStringRef &lpszQName, BOOL &bIsEmpty) {
      return 0;
    }

    virtual INT FireEndPrefixMapping(LPSTR &lpszPrefix) {
      MCFStringRef etmpPrefix(lpszPrefix);
      CFStringRef uval_lpszPrefix = etmpPrefix.Deref();

      return FireEndPrefixMapping(uval_lpszPrefix);
    }
    virtual INT FireEndPrefixMapping(CFStringRef &lpszPrefix) {
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

    virtual INT FireEvalEntity(LPSTR &lpszEntity, LPSTR &lpszValue) {
      MCFStringRef etmpEntity(lpszEntity);
      CFStringRef uval_lpszEntity = etmpEntity.Deref();
      MCFStringRef etmpValue(lpszValue);
      CFStringRef uval_lpszValue = etmpValue.Deref();

      return FireEvalEntity(uval_lpszEntity, uval_lpszValue);
    }
    virtual INT FireEvalEntity(CFStringRef &lpszEntity, CFStringRef &lpszValue) {
      return 0;
    }

    virtual INT FireIgnorableWhitespace(LPSTR &lpszText) {
      MCFStringRef etmpText(lpszText);
      CFStringRef uval_lpszText = etmpText.Deref();

      return FireIgnorableWhitespace(uval_lpszText);
    }
    virtual INT FireIgnorableWhitespace(CFStringRef &lpszText) {
      return 0;
    }

    virtual INT FireMeta(LPSTR &lpszText) {
      MCFStringRef etmpText(lpszText);
      CFStringRef uval_lpszText = etmpText.Deref();

      return FireMeta(uval_lpszText);
    }
    virtual INT FireMeta(CFStringRef &lpszText) {
      return 0;
    }

    virtual INT FirePI(LPSTR &lpszText) {
      MCFStringRef etmpText(lpszText);
      CFStringRef uval_lpszText = etmpText.Deref();

      return FirePI(uval_lpszText);
    }
    virtual INT FirePI(CFStringRef &lpszText) {
      return 0;
    }

    virtual INT FireSpecialSection(LPSTR &lpszSectionId, LPSTR &lpszText) {
      MCFStringRef etmpSectionId(lpszSectionId);
      CFStringRef uval_lpszSectionId = etmpSectionId.Deref();
      MCFStringRef etmpText(lpszText);
      CFStringRef uval_lpszText = etmpText.Deref();

      return FireSpecialSection(uval_lpszSectionId, uval_lpszText);
    }
    virtual INT FireSpecialSection(CFStringRef &lpszSectionId, CFStringRef &lpszText) {
      return 0;
    }

    virtual INT FireStartElement(LPSTR &lpszNamespace, LPSTR &lpszElement, LPSTR &lpszQName, BOOL &bIsEmpty) {
      MCFStringRef etmpNamespace(lpszNamespace);
      CFStringRef uval_lpszNamespace = etmpNamespace.Deref();
      MCFStringRef etmpElement(lpszElement);
      CFStringRef uval_lpszElement = etmpElement.Deref();
      MCFStringRef etmpQName(lpszQName);
      CFStringRef uval_lpszQName = etmpQName.Deref();

      return FireStartElement(uval_lpszNamespace, uval_lpszElement, uval_lpszQName, bIsEmpty);
    }
    virtual INT FireStartElement(CFStringRef &lpszNamespace, CFStringRef &lpszElement, CFStringRef &lpszQName, BOOL &bIsEmpty) {
      return 0;
    }

    virtual INT FireStartPrefixMapping(LPSTR &lpszPrefix, LPSTR &lpszURI) {
      MCFStringRef etmpPrefix(lpszPrefix);
      CFStringRef uval_lpszPrefix = etmpPrefix.Deref();
      MCFStringRef etmpURI(lpszURI);
      CFStringRef uval_lpszURI = etmpURI.Deref();

      return FireStartPrefixMapping(uval_lpszPrefix, uval_lpszURI);
    }
    virtual INT FireStartPrefixMapping(CFStringRef &lpszPrefix, CFStringRef &lpszURI) {
      return 0;
    }



  public:
  
    //redeclare methods with CFString parameters

    inline LPSTR Attr(CFStringRef pAttrName) {
      MCFStringAcc etmpAttrName;
      LPSTR lpszAttrName = etmpAttrName.Deref(pAttrName);

      return XMLpA::Attr(lpszAttrName);
    }



    inline int Input(CFStringRef pText) {
      MCFStringAcc etmpText;
      LPSTR lpszText = etmpText.Deref(pText);

      return XMLpA::Input(lpszText);
    }

    inline int ParseFile(CFStringRef pFileName) {
      MCFStringAcc etmpFileName;
      LPSTR lpszFileName = etmpFileName.Deref(pFileName);

      return XMLpA::ParseFile(lpszFileName);
    }





#endif //MACOS

#ifdef _WIN32_WCE

  private:
    MUString tmpLastError;
    MUString tmpAttrName;
    MUString tmpAttrNamespace;
    MUString tmpAttrPrefix;
    MUString tmpAttrValue;
    MUString tmpElements;
    MUString tmpExtraNameChars;
    MUString tmpExtraSpaceChars;
    MUString tmpInputText;
    MUString tmpNamespaces;
    MUString tmpPrefixes;
    MUString tmpXElement;
    MUString tmpXNamespace;
    MUString tmpXParent;
    MUString tmpXPath;
    MUString tmpXPrefix;
    MUString tmpXText;


  public:  //properties

    LPWSTR GetLastError() {
      tmpLastError.Set(XMLpA::GetLastError());
      return tmpLastError.Deref();
    }

    // wide string versions of properties

    inline LPWSTR GetAttrName(USHORT usAttrIndex) {
      tmpAttrName.Set(XMLpA::GetAttrName(usAttrIndex));
      return tmpAttrName.Deref();
    }

    inline LPWSTR GetAttrNamespace(USHORT usAttrIndex) {
      tmpAttrNamespace.Set(XMLpA::GetAttrNamespace(usAttrIndex));
      return tmpAttrNamespace.Deref();
    }

    inline LPWSTR GetAttrPrefix(USHORT usAttrIndex) {
      tmpAttrPrefix.Set(XMLpA::GetAttrPrefix(usAttrIndex));
      return tmpAttrPrefix.Deref();
    }

    inline LPWSTR GetAttrValue(USHORT usAttrIndex) {
      tmpAttrValue.Set(XMLpA::GetAttrValue(usAttrIndex));
      return tmpAttrValue.Deref();
    }



    inline LPWSTR GetElements(USHORT usElementIndex) {
      tmpElements.Set(XMLpA::GetElements(usElementIndex));
      return tmpElements.Deref();
    }

    inline LPWSTR GetExtraNameChars() {
      tmpExtraNameChars.Set(XMLpA::GetExtraNameChars());
      return tmpExtraNameChars.Deref();
    }

    inline INT SetExtraNameChars(LPWSTR lpszExtraNameChars) {
      MAString tmp(lpszExtraNameChars);
      return XMLpA::SetExtraNameChars(tmp.Deref());
    }
    inline LPWSTR GetExtraSpaceChars() {
      tmpExtraSpaceChars.Set(XMLpA::GetExtraSpaceChars());
      return tmpExtraSpaceChars.Deref();
    }

    inline INT SetExtraSpaceChars(LPWSTR lpszExtraSpaceChars) {
      MAString tmp(lpszExtraSpaceChars);
      return XMLpA::SetExtraSpaceChars(tmp.Deref());
    }




    inline INT SetInputText(LPWSTR lpszInputText) {
      MAString tmp(lpszInputText);
      return XMLpA::SetInputText(tmp.Deref());
    }

    inline LPWSTR GetNamespaces(USHORT usNamespaceIndex) {
      tmpNamespaces.Set(XMLpA::GetNamespaces(usNamespaceIndex));
      return tmpNamespaces.Deref();
    }


    inline LPWSTR GetPrefixes(USHORT usNamespaceIndex) {
      tmpPrefixes.Set(XMLpA::GetPrefixes(usNamespaceIndex));
      return tmpPrefixes.Deref();
    }




    inline LPWSTR GetXElement() {
      tmpXElement.Set(XMLpA::GetXElement());
      return tmpXElement.Deref();
    }

    inline LPWSTR GetXNamespace() {
      tmpXNamespace.Set(XMLpA::GetXNamespace());
      return tmpXNamespace.Deref();
    }

    inline LPWSTR GetXParent() {
      tmpXParent.Set(XMLpA::GetXParent());
      return tmpXParent.Deref();
    }

    inline LPWSTR GetXPath() {
      tmpXPath.Set(XMLpA::GetXPath());
      return tmpXPath.Deref();
    }

    inline INT SetXPath(LPWSTR lpszXPath) {
      MAString tmp(lpszXPath);
      return XMLpA::SetXPath(tmp.Deref());
    }
    inline LPWSTR GetXPrefix() {
      tmpXPrefix.Set(XMLpA::GetXPrefix());
      return tmpXPrefix.Deref();
    }

    inline LPWSTR GetXText() {
      tmpXText.Set(XMLpA::GetXText());
      return tmpXText.Deref();
    }



  public:
  
    //redeclare events with wide string parameters

    virtual INT FireCharacters(LPSTR &lpText, USHORT &lenText) {
      MUString etmpText(lpText, lenText);
      LPWSTR uval_lpText = etmpText.Deref();
      return FireCharacters(uval_lpText, lenText);
    }
    virtual INT FireCharacters(LPWSTR &lpText, USHORT &lenText) {
      return 0;
    }

    virtual INT FireComment(LPSTR &lpszText) {
      MUString etmpText(lpszText);
      LPWSTR uval_lpszText = etmpText.Deref();

      return FireComment(uval_lpszText);
    }
    virtual INT FireComment(LPWSTR &lpszText) {
      return 0;
    }

    virtual INT FireEndElement(LPSTR &lpszNamespace, LPSTR &lpszElement, LPSTR &lpszQName, BOOL &bIsEmpty) {
      MUString etmpNamespace(lpszNamespace);
      LPWSTR uval_lpszNamespace = etmpNamespace.Deref();
      MUString etmpElement(lpszElement);
      LPWSTR uval_lpszElement = etmpElement.Deref();
      MUString etmpQName(lpszQName);
      LPWSTR uval_lpszQName = etmpQName.Deref();

      return FireEndElement(uval_lpszNamespace, uval_lpszElement, uval_lpszQName, bIsEmpty);
    }
    virtual INT FireEndElement(LPWSTR &lpszNamespace, LPWSTR &lpszElement, LPWSTR &lpszQName, BOOL &bIsEmpty) {
      return 0;
    }

    virtual INT FireEndPrefixMapping(LPSTR &lpszPrefix) {
      MUString etmpPrefix(lpszPrefix);
      LPWSTR uval_lpszPrefix = etmpPrefix.Deref();

      return FireEndPrefixMapping(uval_lpszPrefix);
    }
    virtual INT FireEndPrefixMapping(LPWSTR &lpszPrefix) {
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

    virtual INT FireEvalEntity(LPSTR &lpszEntity, LPSTR &lpszValue) {
      MUString etmpEntity(lpszEntity);
      LPWSTR uval_lpszEntity = etmpEntity.Deref();
      MUString etmpValue(lpszValue);
      LPWSTR uval_lpszValue = etmpValue.Deref();

      return FireEvalEntity(uval_lpszEntity, uval_lpszValue);
    }
    virtual INT FireEvalEntity(LPWSTR &lpszEntity, LPWSTR &lpszValue) {
      return 0;
    }

    virtual INT FireIgnorableWhitespace(LPSTR &lpszText) {
      MUString etmpText(lpszText);
      LPWSTR uval_lpszText = etmpText.Deref();

      return FireIgnorableWhitespace(uval_lpszText);
    }
    virtual INT FireIgnorableWhitespace(LPWSTR &lpszText) {
      return 0;
    }

    virtual INT FireMeta(LPSTR &lpszText) {
      MUString etmpText(lpszText);
      LPWSTR uval_lpszText = etmpText.Deref();

      return FireMeta(uval_lpszText);
    }
    virtual INT FireMeta(LPWSTR &lpszText) {
      return 0;
    }

    virtual INT FirePI(LPSTR &lpszText) {
      MUString etmpText(lpszText);
      LPWSTR uval_lpszText = etmpText.Deref();

      return FirePI(uval_lpszText);
    }
    virtual INT FirePI(LPWSTR &lpszText) {
      return 0;
    }

    virtual INT FireSpecialSection(LPSTR &lpszSectionId, LPSTR &lpszText) {
      MUString etmpSectionId(lpszSectionId);
      LPWSTR uval_lpszSectionId = etmpSectionId.Deref();
      MUString etmpText(lpszText);
      LPWSTR uval_lpszText = etmpText.Deref();

      return FireSpecialSection(uval_lpszSectionId, uval_lpszText);
    }
    virtual INT FireSpecialSection(LPWSTR &lpszSectionId, LPWSTR &lpszText) {
      return 0;
    }

    virtual INT FireStartElement(LPSTR &lpszNamespace, LPSTR &lpszElement, LPSTR &lpszQName, BOOL &bIsEmpty) {
      MUString etmpNamespace(lpszNamespace);
      LPWSTR uval_lpszNamespace = etmpNamespace.Deref();
      MUString etmpElement(lpszElement);
      LPWSTR uval_lpszElement = etmpElement.Deref();
      MUString etmpQName(lpszQName);
      LPWSTR uval_lpszQName = etmpQName.Deref();

      return FireStartElement(uval_lpszNamespace, uval_lpszElement, uval_lpszQName, bIsEmpty);
    }
    virtual INT FireStartElement(LPWSTR &lpszNamespace, LPWSTR &lpszElement, LPWSTR &lpszQName, BOOL &bIsEmpty) {
      return 0;
    }

    virtual INT FireStartPrefixMapping(LPSTR &lpszPrefix, LPSTR &lpszURI) {
      MUString etmpPrefix(lpszPrefix);
      LPWSTR uval_lpszPrefix = etmpPrefix.Deref();
      MUString etmpURI(lpszURI);
      LPWSTR uval_lpszURI = etmpURI.Deref();

      return FireStartPrefixMapping(uval_lpszPrefix, uval_lpszURI);
    }
    virtual INT FireStartPrefixMapping(LPWSTR &lpszPrefix, LPWSTR &lpszURI) {
      return 0;
    }



#endif //_WIN32_WCE

#endif //_IPWORKS_INTERNAL_
#endif //NO_UNICODE_WRAPPER

};

#endif //_IPWORKS_XMLP_H_




