// AVS.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "AVS.h"
#include "AVSDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAVSApp

BEGIN_MESSAGE_MAP(CAVSApp, CWinApp)
	//{{AFX_MSG_MAP(CAVSApp)
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAVSApp construction

CAVSApp::CAVSApp()
{
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CAVSApp object

CAVSApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CAVSApp initialization

BOOL CAVSApp::InitInstance()
{
	if (!AfxSocketInit())
	{
		AfxMessageBox(IDP_SOCKETS_INIT_FAILED);
		return FALSE;
	}

	AfxEnableControlContainer();

	#ifdef _AFXDLL
		Enable3dControls();			// Call this when using MFC in a shared DLL
	#else
		Enable3dControlsStatic();	// Call this when linking to MFC statically
	#endif

	/////////////////////////
	//
	/////////////////////////



   
	CAVSDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
	}
	else if (nResponse == IDCANCEL)
	{
	}
	return FALSE;
}



int CAVSApp::GetKeyBoardBufferState()
{
	return(mKeyBoardBufferState);
}


void CAVSApp::SetKeyBoardBufferState( int state)
{
	mKeyBoardBufferState = state;
}


