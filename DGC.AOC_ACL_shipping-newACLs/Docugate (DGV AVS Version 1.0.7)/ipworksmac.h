// IP*Works! V5 C++ Edition - C++ Interface
//
// Copyright (c) 2003 /n software inc. - All rights reserved.
//

#ifndef _IPWORKS_H_
#define _IPWORKS_H_

#ifndef MACOS
#define MACOS
#endif

#ifdef __OBJC__ //Mac OS X
#import <IPWorks/ipworksfilemailer.h>
#import <IPWorks/ipworksftp.h>
#import <IPWorks/ipworkshtmlmailer.h>
#import <IPWorks/ipworkshttp.h>
#import <IPWorks/ipworksicmpport.h>
#import <IPWorks/ipworksimap.h>
#import <IPWorks/ipworksipdaemon.h>
#import <IPWorks/ipworksipinfo.h>
#import <IPWorks/ipworksipport.h>
#import <IPWorks/ipworksldap.h>
#import <IPWorks/ipworksmcast.h>
#import <IPWorks/ipworksmime.h>
#import <IPWorks/ipworksmx.h>
#import <IPWorks/ipworksnetclock.h>
#import <IPWorks/ipworksnetcode.h>
#import <IPWorks/ipworksnetdial.h>
#import <IPWorks/ipworksnntp.h>
#import <IPWorks/ipworksping.h>
#import <IPWorks/ipworkspop.h>
#import <IPWorks/ipworksrcp.h>
#import <IPWorks/ipworksrexec.h>
#import <IPWorks/ipworksrshell.h>
#import <IPWorks/ipworkssmtp.h>
#import <IPWorks/ipworkssnmp.h>
#import <IPWorks/ipworkssnpp.h>
#import <IPWorks/ipworkssoap.h>
#import <IPWorks/ipworkstelnet.h>
#import <IPWorks/ipworkstftp.h>
#import <IPWorks/ipworkstraceroute.h>
#import <IPWorks/ipworksudpport.h>
#import <IPWorks/ipworkswebform.h>
#import <IPWorks/ipworkswebupload.h>
#import <IPWorks/ipworkswhois.h>
#import <IPWorks/ipworksxmlp.h>

#else

#include <Carbon/Carbon.h>
#include <string.h>

typedef char *LPSTR;
typedef const char *LPCSTR;
typedef int INT;
typedef unsigned int UINT;
typedef long LONG;
typedef long *LPLONG;
typedef int BOOL;
typedef unsigned short USHORT;
typedef void *LPVOID;
typedef unsigned short *LPUSHORT;
typedef unsigned int *LPUINT;

#ifndef VOID
#define VOID void
#endif

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#ifndef NULL
#define NULL 0
#endif

#ifndef FAR
#define FAR
#endif

typedef INT (*LPFNIPWORKSEVENT)
  (LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]);

#ifndef _IPWORKS_INTERNAL_

class MCFStringRef {
  
  private:
  
    CFStringRef m_pStr;
  
  public:
    
    MCFStringRef() {
      m_pStr = NULL;
    }
    
    MCFStringRef(LPSTR lp) {
      m_pStr = NULL;
      Set((LPCSTR)lp);
    }
    
    MCFStringRef(LPCSTR lp) {
      m_pStr = NULL;
      Set(lp);
    }
    
    MCFStringRef(LPSTR lp, size_t len) {
      m_pStr = NULL;
      Set((LPCSTR)lp, len);
    }

    MCFStringRef(LPCSTR lp, size_t len) {
      m_pStr = NULL;
      Set(lp, len);
    }

    CFStringRef Deref() {return m_pStr;}

    ~MCFStringRef() {
      Reset();
    }

    void Reset() {
      if (m_pStr) CFRelease(m_pStr);
      m_pStr = NULL;
    }

    CFStringRef Set(LPCSTR lp) {
      m_pStr = NULL;
      Reset();
      m_pStr = CFStringCreateWithCStringNoCopy(NULL, lp, CFStringGetSystemEncoding(), kCFAllocatorNull);
      return m_pStr;
    }
    
    CFStringRef Set(LPCSTR lp, size_t len) {
      m_pStr = NULL;
      Reset();
      m_pStr = CFStringCreateWithBytes (NULL, (const UInt8*)lp, (CFIndex)len, CFStringGetSystemEncoding(), FALSE);
      return m_pStr;
    }
};

class MCFStringAcc {
  
  private:
    LPSTR m_pBuf;
  
  public:
    
    MCFStringAcc() {
      m_pBuf = NULL;
    }
    
    ~MCFStringAcc() {
      if (m_pBuf) free(m_pBuf);
      m_pBuf = NULL;
    }
    
    LPSTR Deref(CFStringRef cfstr) {
 
      LPSTR pStr = (LPSTR)CFStringGetCStringPtr(cfstr, CFStringGetSystemEncoding()); 
  
      if (pStr != NULL) return pStr;
      
      CFIndex len = CFStringGetLength(cfstr);
      len = CFStringGetMaximumSizeForEncoding(len, CFStringGetSystemEncoding());
      
      m_pBuf = (LPSTR)malloc((int)(len+1));
      if (!m_pBuf) return NULL;
      m_pBuf[len] = 0;
      
      if (CFStringGetCString(cfstr, m_pBuf, len, CFStringGetSystemEncoding())) {
        return m_pBuf; 
      } else {
        free(m_pBuf);
        m_pBuf = NULL;
        return NULL;
      }
    }
    
    UINT Length() {
      if (!m_pBuf) return 0;
      return strlen(m_pBuf);
    }
};

#include "filemailer.h"
#include "ftp.h"
#include "htmlmailer.h"
#include "http.h"
#include "icmpport.h"
#include "imap.h"
#include "ipdaemon.h"
#include "ipinfo.h"
#include "ipport.h"
#include "ldap.h"
#include "mcast.h"
#include "mime.h"
#include "mx.h"
#include "netclock.h"
#include "netcode.h"
#include "netdial.h"
#include "nntp.h"
#include "ping.h"
#include "pop.h"
#include "rcp.h"
#include "rexec.h"
#include "rshell.h"
#include "smtp.h"
#include "snmp.h"
#include "snpp.h"
#include "soap.h"
#include "telnet.h"
#include "tftp.h"
#include "traceroute.h"
#include "udpport.h"
#include "webform.h"
#include "webupload.h"
#include "whois.h"
#include "xmlp.h"


#endif //_IPWORKS_INTERNAL_

#endif

#endif //_IPWORKS_H_


