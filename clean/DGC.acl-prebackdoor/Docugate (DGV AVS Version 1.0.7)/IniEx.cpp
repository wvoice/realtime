// IniEx.cpp: implementation of the CIniEx class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "IniEx.h"
#include "malloc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

//GrowSize for Dynmiz Section Allocation
CIniEx::CIniEx(int GrowSize/*=4*/)
{
	m_GrowSize=GrowSize;

	m_SectionNo=0;
	m_writeWhenChange=FALSE;
	m_makeBackup=FALSE;
	m_NoCaseSensitive=TRUE;
	m_Changed=FALSE;
	m_Keys=NULL;
	m_Values=NULL;
}

CIniEx::~CIniEx()
{
	if (m_writeWhenChange)
		WriteFile(m_makeBackup);
	ResetContent();
}

BOOL CIniEx::OpenAtExeDirectory(LPCSTR pFileName,
							BOOL writeWhenChange,/*=TRUE*/
							BOOL createIfNotExist/*=TRUE*/,
							BOOL noCaseSensitive /*=TRUE*/,
							BOOL makeBackup      /*=FALSE*/)
{

	CString filePath;
//if it's a dll argv will be NULL and it may cause memory leak	
#ifndef _USRDLL
	CString tmpFilePath;
	int nPlace=0;
	tmpFilePath=__argv[0];
	nPlace=tmpFilePath.ReverseFind('\\');
	
	
	if (nPlace!=-1)
	{
		filePath=tmpFilePath.Left(nPlace);
	}
	else
	{
		char curDir[MAX_PATH];
		GetCurrentDirectory(MAX_PATH,curDir);
		filePath=curDir;
	}
#else
	//it must be safe for dll's
	char curDir[MAX_PATH];
	GetCurrentDirectory(MAX_PATH,curDir);
	filePath=curDir;
#endif
	filePath+="\\";
	filePath+=pFileName;
	return Open(filePath,writeWhenChange,createIfNotExist,noCaseSensitive,makeBackup);
}

BOOL CIniEx::Open(LPCSTR pFileName,
				  BOOL writeWhenChange,/*=TRUE*/
				  BOOL createIfNotExist/*=TRUE*/,
				  BOOL noCaseSensitive /*=TRUE*/,
				  BOOL makeBackup      /*=FALSE*/)
{

	CFileException e;
	BOOL bRet;
	CString Line;
	CString sectionStr;
	int nPlace;
	UINT mode=CFile::modeReadWrite;

	//if it's second ini file for this instance
	//we have to save it and delete member variables contents
	if (!m_FileName.IsEmpty()) 
	{
		WriteFile();
		ResetContent();
	}

	m_NoCaseSensitive=noCaseSensitive;
	m_writeWhenChange=writeWhenChange;
	m_makeBackup=makeBackup;

	CString tmpKey;
	CString tmpValue;
	if (createIfNotExist)
		mode= mode | CFile::modeCreate | CFile::modeNoTruncate;
	try
	{
		CStdioFile file;
		bRet=file.Open( pFileName, mode, &e );
		if( !bRet )
		{
			return FALSE;
		}
		m_FileName=pFileName;

		//Grow the arrays as GrowSize(which given constructor)
		m_Keys=(CStringArray **)malloc( m_GrowSize * sizeof(CStringArray *) );
		m_Values=(CStringArray **)malloc( m_GrowSize * sizeof(CStringArray *) );
		for (int i=0;i<m_GrowSize;i++)
		{
			m_Keys[m_SectionNo+i]=NULL;
			m_Values[m_SectionNo+i]=NULL;
		}


		//1.th section for sectionless ini files
		m_Keys[m_SectionNo]=new CStringArray;
		m_Values[m_SectionNo]=new CStringArray;

		
		file.SeekToBegin();
		while (TRUE)
		{
			//Read one line from given ini file
			bRet=file.ReadString(Line);
			if (!bRet) break;
			
					
			//if line's first character = '[' 
			//and last character = ']' it's section 
			if (Line.Left(1)=="[" && Line.Right(1)=="]")
			{
				m_SectionNo++;
				
				GrowIfNecessary();
				
				m_Keys[m_SectionNo]=new CStringArray;
				m_Values[m_SectionNo]=new CStringArray;

				sectionStr=Line.Mid(1,Line.GetLength()-2);
				continue;
			}
			
			nPlace=Line.Find("=");
			if (nPlace==-1)
			{
				tmpKey=Line;
				tmpValue="";
			}
			else
			{
				tmpKey=Line.Left(nPlace);
				tmpValue=Line.Mid(nPlace+1);
			}
			
		
			m_Keys[m_SectionNo]->Add(tmpKey);
			m_Values[m_SectionNo]->Add(tmpValue);
			m_Sections.SetAtGrow(m_SectionNo,sectionStr);
		}
		file.Close();
	}
	catch (CFileException *e)
	{
		m_ErrStr=e->m_cause;
	}
	

	return TRUE;
}



CString CIniEx::GetValue(CString Key)
{
	return GetValue("",Key);
}

//if Section Name="" -> looking up key for witout section
CString CIniEx::GetValue(CString Section,CString Key,CString DefaultValue/*=""*/)
{
	int nIndex=LookupSection(&Section);
	if (nIndex==-1) return DefaultValue;
	int nRet;
	CString retStr;
	for (int i=m_Keys[nIndex]->GetUpperBound();i>=0;i--)
	{
		nRet=CompareStrings(&m_Keys[nIndex]->GetAt(i),&Key);
		if (nRet==0)
		{
			retStr=m_Values[nIndex]->GetAt(i);
			int nPlace=retStr.ReverseFind(';');
			if (nPlace!=-1) retStr.Delete(nPlace,retStr.GetLength()-nPlace);
			return retStr;
		}
	}

	return DefaultValue;

}



//returns index of key for given section
//if no result returns -1
int CIniEx::LookupKey(int nSectionIndex,CString *Key)
{
	ASSERT(nSectionIndex<=m_SectionNo);
	int nRet;
	for (int i=m_Keys[nSectionIndex]->GetUpperBound();i>=0;i--)
	{
		nRet=CompareStrings(&m_Keys[nSectionIndex]->GetAt(i),Key);
		if (nRet==0) return i;
	}
	return -1;
}

//return given sections index in array
int CIniEx::LookupSection(CString *Section)
{
	int nRet;
	for (int i=0;i<m_Sections.GetSize();i++)
	{
		nRet=CompareStrings(&m_Sections.GetAt(i),Section);
		if (nRet==0) return i;
	}
	return -1;
}

//Sets for Key=Value for without section
void CIniEx::SetValue(CString Key,CString Value)
{
	SetValue("",Key,Value);
}

//writes Key=value given section
void CIniEx::SetValue(CString Section,CString Key,CString Value)
{
	//file opened?
	ASSERT(!m_FileName.IsEmpty());

	//if given key already existing, overwrite it
	int nIndex=LookupSection(&Section);
	int nKeyIndex;
	if (nIndex==-1)
	{
		//if key not exist grow arrays (if necessary)
		m_Changed=TRUE;
		m_SectionNo++;
		GrowIfNecessary();
		m_Keys[m_SectionNo]=new CStringArray;
		m_Values[m_SectionNo]=new CStringArray;
		nIndex=m_SectionNo;
		m_Sections.SetAtGrow(m_SectionNo,Section);
	}

	
	//looking up keys for section
	nKeyIndex=LookupKey(nIndex,&Key);
	
	//if key exist -> overwrite it
	//if not add to end of array
	if (nKeyIndex!=-1) //Bulundu ise;
	{
		//Var olan value'nun �zerine yaz�l�yor Fakat ayn�s� m� diye kontrol ediliyor
		//Ayn�s� de�il ise m_Chanced=TRUE yap�lmal� ki Write i�lemi yap�ls�n.
		if (CompareStrings(&m_Values[nIndex]->GetAt(nKeyIndex),&Value)!=0)
			m_Changed=TRUE;
		m_Values[nIndex]->SetAt(nKeyIndex,Value);
	}
	else	//if not exist
	{
		m_Changed=TRUE;
		m_Keys[nIndex]->Add(Key);
		m_Values[nIndex]->Add(Value);
	}
}


//returns backup file name
//if you didn't want backup (when openning file) it returns ""
CString CIniEx::WriteFile(BOOL makeBackup/*=FALSE*/)
{
	if (!m_Changed) return "";
	CString tmpFileName=m_FileName;

	if (makeBackup)
	{
		if (m_BackupFileName.IsEmpty())
		{
			FindBackupFile();
		}
		//32768. Log dosyas�nda tekrar 1.nin �zerine yazacak(FALSE ile)
		BOOL ret=CopyFile(m_FileName,m_BackupFileName,FALSE);
	}

	
	CStdioFile file;
	if (!file.Open(m_FileName,CFile::modeCreate | CFile::modeWrite)) 
	{
		#ifdef _DEBUG
			afxDump << "ERROR!!!!: The file could not open for writing\n";
		#endif
		return "";
	}

	CString tmpLine;
	for (int i=0;i<m_Sections.GetSize();i++)
	{
		if (!m_Sections.GetAt(i).IsEmpty())
		{
			tmpLine.Format("[%s]\n",m_Sections.GetAt(i));
			file.WriteString(tmpLine);
		}
		if (!m_Keys[i]) continue;
		for (int j=0;j<=m_Keys[i]->GetUpperBound();j++)
		{
			//if key is empts we don't write "="
			tmpLine.Format("%s%s%s\n",m_Keys[i]->GetAt(j),
							m_Keys[i]->GetAt(j).IsEmpty()?"":"=",
							   m_Values[i]->GetAt(j));
		
			file.WriteString(tmpLine);
 
		}
	}

	file.Close();
	return m_BackupFileName;


}

BOOL CIniEx::GetWriteWhenChange(void)
{
	return m_writeWhenChange;
}


void CIniEx::SetWriteWhenChange(BOOL WriteWhenChange)
{
	m_writeWhenChange=WriteWhenChange;
}


void CIniEx::SetBackupFileName(CString &backupFile)
{
	m_BackupFileName=backupFile;
}


void CIniEx::FindBackupFile(void)
{
	WIN32_FIND_DATA ffData;
	BOOL bContinue=TRUE;
	CString filePath(m_FileName);
	CString ext;
	int nPlace=filePath.ReverseFind('.');
	filePath.Delete(nPlace,filePath.GetLength()-nPlace);
	filePath+="*.*";
	int extNo=0;
	char *p;
	HANDLE handle=FindFirstFile(filePath,&ffData);
	while (bContinue)
	{
		bContinue=FindNextFile(handle,&ffData);
		p=ffData.cFileName;
		p+=strlen(ffData.cFileName)-3;
		if (atoi(p)>extNo) extNo=atoi(p);
	}
	m_BackupFileName.Format("%s.%.3d",m_FileName,extNo+1);

}


void CIniEx::ResetContent()
{
	if (!m_Keys) return;
	int alloctedObjectCount=_msize(m_Keys)/4;
	if ( m_Keys)
	{
		for (int i=0;i<alloctedObjectCount;i++)
		{
			if (m_Keys[i])
				delete m_Keys[i];
			if (m_Values[i])
				delete m_Values[i];
		}
		delete [] m_Keys;
		delete [] m_Values;
	}
	m_Keys=NULL;
	m_Values=NULL;
	m_Sections.RemoveAll();
	m_SectionNo=0;
	m_FileName="";
	m_Changed=FALSE;

}


//Removes key and it's value from given section
BOOL CIniEx::RemoveKey(CString Section,CString Key)
{
	int nIndex=LookupSection(&Section);
	if (nIndex==-1) return FALSE;

	int nKeyIndex=LookupKey(nIndex,&Key);
	if (nKeyIndex==-1) return FALSE;

	m_Keys[nIndex]->RemoveAt(nKeyIndex);
	m_Values[nIndex]->RemoveAt(nKeyIndex);
	m_Changed=TRUE;
	return TRUE;
}

//Removes key and it's value 
BOOL CIniEx::RemoveKey(CString Key)
{
	return RemoveKey("",Key);
}


//Removes given section(including all keys and values)
//return FALSE when given section not found
//It won't couse memory leak because when deleting object
//the msize (malloc size) checking
BOOL CIniEx::RemoveSection(CString Section)
{
	int nIndex=LookupSection(&Section);
	if (nIndex==-1) return FALSE;

	m_Keys[nIndex]->RemoveAll();
	m_Values[nIndex]->RemoveAll();

	delete m_Keys[nIndex];
	delete m_Values[nIndex];

	m_Keys[nIndex]=NULL;
	m_Values[nIndex]=NULL;

	m_Sections.RemoveAt(nIndex);
	m_SectionNo--;
	m_Changed=TRUE;
	return TRUE;
}

int CIniEx::CompareStrings(CString *str1, CString *str2)
{
	if (m_NoCaseSensitive)
		return str1->CompareNoCase(*str2);
	else
		return str1->Compare(*str2);
}

void CIniEx::GrowIfNecessary(void)
{
	int alloctedObjectCount=_msize(m_Keys)/4;
	//for first gives GrowSize
	if (m_SectionNo>=alloctedObjectCount)
	{
		//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//realloc for GrowSize
		m_Keys=(CStringArray **) 
				realloc(m_Keys,
					sizeof(CStringArray *) * (alloctedObjectCount + m_GrowSize ) );
		m_Values=(CStringArray **) 
				realloc(m_Values,
					sizeof(CStringArray *) * (alloctedObjectCount + m_GrowSize ) );
		//allocated + GrowSize
		//zero memory for new allocation
		for (int i=0;i<m_GrowSize;i++)
		{
			m_Keys[m_SectionNo+i]=NULL;
			m_Values[m_SectionNo+i]=NULL;
		}
	}
}

//copy each string (section name) because 
//if sections parametter be a pointer it may clear content of member
void CIniEx::GetSections(CStringArray &sections)
{
	for (int i=0;i<m_Sections.GetSize();i++)
		sections.Add(m_Sections.GetAt(i));

}

void CIniEx::GetKeysInSection(CString section,CStringArray &keys)
{
	int nIndex=LookupSection(&section);
	if (nIndex==-1) return;

	for (int i=0;i<m_Keys[nIndex]->GetSize();i++)
	{
		keys.Add(m_Keys[nIndex]->GetAt(i));
	}
}



CString CIniEx::GetIniPath(void)
{
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

	  CString strPath;
 	  strPath.Format("%s\\program files\\realtime\\docugate.ini",drive);
	   return strPath;
}
