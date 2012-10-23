// Activity.cpp: implementation of the CActivity class.
//
// 
/////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Activity.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CActivity::CActivity(int Type, LPSTR pData)
{
	m_ActivityType = Type;
	lstrcpyn(m_ActivityData,pData,255);
}

CActivity::~CActivity()
{
}

int CActivity::GetType(void)
{
	return m_ActivityType;
}

LPSTR CActivity::GetData(void)
{
	return (LPSTR)&m_ActivityData[0];
}


bool CActivity::IsPong(void)
{
	if ( m_ActivityType == 0x91)
		 return true;
	else
		return false;

}
