#include "stdafx.h"
#include <afxmt.h>
#include <tchar.h>
#include <string.h>
#include <iostream.h>
#include <stdio.h>
#include <direct.h>

CCriticalSection mWriteLog;
extern char m_gLogFileName[_MAX_PATH];

void  WriteLog	(LPSTR pMessage, LPSTR pDebugMode)
{

	   mWriteLog.Lock();
			
	   char pFileName[MAX_PATH]= {0};
	   char path_buffer[_MAX_PATH] = {0};
	   char drive[_MAX_DRIVE]= {0};
       char dir[_MAX_DIR]= {0};
       char fname[_MAX_FNAME]= {0};
       char ext[_MAX_EXT]= {0};
       memset( path_buffer, 0, sizeof( path_buffer ) );
       memset( drive,       0, sizeof( drive ) );
       memset( dir,         0, sizeof( dir ) );
       memset( fname,       0, sizeof( fname ) );
       memset( ext,         0, sizeof( ext ) );

	   GetModuleFileName( 0, path_buffer, 1023 );
      _splitpath ( path_buffer, drive, dir, fname, ext );
	   sprintf(pFileName,"%s%s%s",drive,dir,m_gLogFileName);
	
		CFile f;
		CFileException ex;
		DWORD dwActual = 0;

		if( f.Open( pFileName, CFile::modeRead | CFile::shareDenyWrite, &ex) !=0)
		{
			dwActual = f.SeekToEnd();
			f.Close();
	
			if ( dwActual >=  500000)
		        DeleteFile(pFileName);
		}
	

		FILE *fp = fopen(pFileName, "a");
		if (fp)
		{
			 CString strData;
			 CTime t = CTime::GetCurrentTime();
			 strData.Format("%s,%s,%s,%s\n",strModule, strVersion,t.Format("%c"),pMessage);
			 fputs(strData,fp);
			 fclose(fp);
		}

	mWriteLog.Unlock();
	return;

}


void  WriteLog	(CString &pMessage, LPSTR pDebugMode)
{

	   mWriteLog.Lock();
			
	   char pFileName[MAX_PATH]= {0};
	   char path_buffer[_MAX_PATH] = {0};
	   char drive[_MAX_DRIVE]= {0};
       char dir[_MAX_DIR]= {0};
       char fname[_MAX_FNAME]= {0};
       char ext[_MAX_EXT]= {0};
       memset( path_buffer, 0, sizeof( path_buffer ) );
       memset( drive,       0, sizeof( drive ) );
       memset( dir,         0, sizeof( dir ) );
       memset( fname,       0, sizeof( fname ) );
       memset( ext,         0, sizeof( ext ) );

	   GetModuleFileName( 0, path_buffer, 1023 );
      _splitpath ( path_buffer, drive, dir, fname, ext );
	   sprintf(pFileName,"%s%s%s",drive,dir,m_gLogFileName);
	
		CFile f;
		CFileException ex;
		DWORD dwActual = 0;

		if( f.Open( pFileName, CFile::modeRead | CFile::shareDenyWrite, &ex) !=0)
		{
			dwActual = f.SeekToEnd();
			f.Close();
	
			if ( dwActual >=  500000)
		        DeleteFile(pFileName);
		}
	

		FILE *fp = fopen(pFileName, "a");
		if (fp)
		{
			 CString strData;
			 CTime t = CTime::GetCurrentTime();
			 strData.Format("%s,%s,%s,%s\n",strModule, strVersion,t.Format("%c"),pMessage);
			 fputs(strData,fp);
			 fclose(fp);
		}

	mWriteLog.Unlock();
	return;

}

