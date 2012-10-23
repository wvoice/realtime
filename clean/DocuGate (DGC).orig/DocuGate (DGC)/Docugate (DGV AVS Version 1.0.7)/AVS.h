// AVS.h : main header file for the AVS application
//

#if !defined(AFX_AVS_H__29FB5193_DFFA_4874_9FA7_EB6C4E8184CE__INCLUDED_)
#define AFX_AVS_H__29FB5193_DFFA_4874_9FA7_EB6C4E8184CE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CAVSApp:
// See AVS.cpp for the implementation of this class
//

class CAVSApp : public CWinApp
{
private:
		int mKeyBoardBufferState;
public:

	int  GetKeyBoardBufferState();
	void SetKeyBoardBufferState( int state);
	CAVSApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAVSApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CAVSApp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_AVS_H__29FB5193_DFFA_4874_9FA7_EB6C4E8184CE__INCLUDED_)
