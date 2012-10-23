// IP*Works! V5 C++ Edition - C++ Interface
//
// Copyright (c) 2003 /n software inc. - All rights reserved.
//

#ifndef _IPWORKS_H_
#define _IPWORKS_H_

#ifdef WIN32
#include <windows.h>
#ifndef _IPWORKS_INTERNAL_
#pragma comment(lib,"ipworks5.lib")
#endif
#endif //WIN32

#ifdef _WIN32_WCE
#include <windows.h>
#include <tchar.h>
#endif //_WIN32_WCE

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

#pragma warning(push, 1)
#if (__BORLANDC__ > 0x530 )
#pragma warn -8027
#endif

typedef INT (*LPFNIPWORKSEVENT)
  (LPVOID lpObj, INT event_id, INT cparam, LPVOID param[], UINT cbparam[]);

#ifndef _IPWORKS_INTERNAL_

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

#if (__BORLANDC__ > 0x530 )
#pragma warn +8027
#endif
#pragma warning(pop)

#endif //_IPWORKS_H_


