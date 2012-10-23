// TimedThread.h: interface for the CTimedThread class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_TIMEDTHREAD_H__19DC6988_2882_4084_AF65_C336FB6735A9__INCLUDED_)
#define AFX_TIMEDTHREAD_H__19DC6988_2882_4084_AF65_C336FB6735A9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "IPHlpApi.h"
#include "Thread.h"
#include "lm.h"
#pragma comment(lib, "iphlpapi.lib")

class CTimedThread : public CThread
{

	public:
	CTimedThread(int StationCount);
	virtual ~CTimedThread();
	virtual DWORD Run( LPVOID );


    private:
		CString Adapter;
		CString FullName;
		CString App;
		CString Version;
		CString Values;
		int     result;
		int     StationCount;

	public:
		void GetMachineName     ( void );
		void GetAdapterAddress  ( void );
		void DoHttpPost         ( void );

};

#endif // !defined(AFX_TIMEDTHREAD_H__19DC6988_2882_4084_AF65_C336FB6735A9__INCLUDED_)




