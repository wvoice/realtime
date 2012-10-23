// Activity.h: interface for the CActivity class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ACTIVITY_H__9FF8BE6B_859C_4E27_A270_054EBCB272A3__INCLUDED_)
#define AFX_ACTIVITY_H__9FF8BE6B_859C_4E27_A270_054EBCB272A3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CActivity : public CObject 
{
private:
	int  m_ActivityType;
	char m_ActivityData[255];

public:
	CActivity(int type,LPSTR pData);
	virtual ~CActivity();
	int   GetType  ( void );
	LPSTR GetData  ( void );
	bool  IsPong   ( void );
	long  GetAmount( void );
};

#endif // !defined(AFX_ACTIVITY_H__9FF8BE6B_859C_4E27_A270_054EBCB272A3__INCLUDED_)
