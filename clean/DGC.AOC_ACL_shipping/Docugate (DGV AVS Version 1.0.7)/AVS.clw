; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CTransactionRS
LastTemplate=CRecordset
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "AVS.h"

ClassCount=5
Class1=CAVSApp
Class2=CAVSDlg
Class3=CAboutDlg

ResourceCount=2
Resource1=IDR_MAINFRAME
Class4=CDocugateAcc
Class5=CTransactionRS
Resource2=IDD_AVS_DIALOG

[CLS:CAVSApp]
Type=0
HeaderFile=AVS.h
ImplementationFile=AVS.cpp
Filter=N

[CLS:CAVSDlg]
Type=0
HeaderFile=AVSDlg.h
ImplementationFile=AVSDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=IDC_LASTDATA

[CLS:CAboutDlg]
Type=0
HeaderFile=AVSDlg.h
ImplementationFile=AVSDlg.cpp
Filter=D

[DLG:IDD_AVS_DIALOG]
Type=1
Class=CAVSDlg
ControlCount=5
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_DATALIST,listbox,1352745217
Control4=IDC_EDIT1,edit,1350568064
Control5=IDC_LASTDATA,edit,1350568064

[CLS:CDocugateAcc]
Type=0
HeaderFile=DocugateAcc.h
ImplementationFile=DocugateAcc.cpp
BaseClass=CRecordset
Filter=N
VirtualFilter=r

[DB:CDocugateAcc]
DB=1
DBType=ODBC
ColumnCount=23
Column1=[ACC_ACC_GUID], -11, 16
Column2=[ACC_TYPE], 12, 20
Column3=[ACC_BADGE], 12, 50
Column4=[ACC_FIRSTNAME], 12, 50
Column5=[ACC_LASTNAME], 12, 50
Column6=[ACC_FULLNAME], 12, 100
Column7=[ACC_CMETHOD], 12, 50
Column8=[ACC_OU_GUID], -11, 16
Column9=[ACC_FUNDS], 3, 22
Column10=[ACC_ACCESS_LEVEL], 4, 4
Column11=[ACC_PASSWORD], 12, 50
Column12=[ACC_PASSWORD_ENABLED], 1, 1
Column13=[ACC_PIN], 12, 50
Column14=[ACC_PIN_ENABLED], 1, 1
Column15=[ACC_EMAIL], 12, 100
Column16=[ACC_COPYID], 12, 50
Column17=[ACC_COPYPIN], 12, 10
Column18=[ACC_COPYPIN_ENABLED], 1, 1
Column19=[ACC_LOCKED], 1, 1
Column20=[ACC_AVAILABILITY], 4, 4
Column21=[ACC_DEFAULT_CLIENT], 12, 50
Column22=[ACC_DEFAULT_MATTER], 12, 50
Column23=[ACC_DEFAULT_ONLY], 1, 1

[CLS:CTransactionRS]
Type=0
HeaderFile=TransactionRS.h
ImplementationFile=TransactionRS.cpp
BaseClass=CRecordset
Filter=N
VirtualFilter=r

[DB:CTransactionRS]
DB=1
DBType=ODBC
ColumnCount=19
Column1=[ACC_TRAN_GUID], -11, 16
Column2=[ACC_TRAN_ACC_BADGE], 12, 50
Column3=[ACC_TRAN_ACC_FULLNAME], 12, 50
Column4=[ACC_TRAN_ACC_OU_NAME], 12, 50
Column5=[ACC_TRAN_DT], 11, 16
Column6=[ACC_TRAN_TYPE], 12, 50
Column7=[ACC_TRAN_DOER_BADGE], 12, 50
Column8=[ACC_TRAN_DOER_FULLNAME], 12, 50
Column9=[ACC_TRAN_DOER_OU_NAME], 12, 50
Column10=[ACC_TRAN_FUND_OPEN_BAL], 3, 22
Column11=[ACC_TRAN_FUND_CLOSE_BAL], 3, 22
Column12=[ACC_TRAN_AMT_DEBIT], 3, 22
Column13=[ACC_TRAN_AMT_CREDIT], 3, 22
Column14=[ACC_TRAN_CMETHOD], 12, 50
Column15=[ACC_TRAN_RECEIPT_NO], 4, 4
Column16=[ACC_TRAN_RECEIPT_NO_DISPLAY], 12, 50
Column17=[ACC_TRAN_CUSTOM1], 12, 50
Column18=[ACC_TRAN_CUSTOM2], 12, 50
Column19=[ACC_TRAN_CUSTOM3], 12, 50

