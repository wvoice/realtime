Attribute VB_Name = "mod_Receipt"
    Dim cmd As ADODB.Command
    Dim ParamRetVal As ADODB.Parameter
    Dim ParamAccBadge As ADODB.Parameter
    Dim ParamCashierBadge As ADODB.Parameter
    Dim ParamCashierFull As ADODB.Parameter
    Dim ParamAmtAdjustment As ADODB.Parameter
    Dim Dt As Variant

    'added 09152008 - to handle the receipt
    Dim Caption As String
    Caption = "Account Funding Receipt"
    
    Dim Account As String
    Dim CurBalance As String
    Dim BeginBalance As String
    Dim TransAmount As String
    Dim FinalBalance As String
    Dim Lable1 As String
    Dim Activity As String
    Dim TimeLable As String
    Dim TransDate As String
    Dim TransDate As String
    Dim Cashier As String
    
    
    
    '09122008 - setup the account and running balance section of the receipt
    Account = gObjAccountMngr.mFirstname & " " & "," & " " & gObjAccountMngr.mLastname
    CurBalance = "$" & Format(gObjAccountMngr.mFunds, "0.00")
    'Me.txt_CurBalance = Frm_ACCOUNT_fund.txt_ACC_FUNDS
    
    '09122008 - setup the transaction detial section for the receipt
    'need lable for the beinning balance
    BeginBalance = Frm_ACCOUNT_fund.txt_BeginningBalance
    'Me.scl_Activity.Caption = Frm_ACCOUNT_fund.scl_ActivityType.Caption
    TransAmount = Frm_ACCOUNT_fund.txt_TransAmount
    TransAmount = Format(Me.txt_TransAmount, "Currency")
    'need label for teh final
    FinalBalance = "$" & Format(gObjAccountMngr.mFunds, "0.00")
    Label1.Caption = "$" & Format(gObjAccountMngr.mFunds, "0.00")
    
    Activity.Caption = Frm_ACCOUNT_fund.scl_ActivityType.Caption
    
    '09122008 - setup the time and date section of the receipt
    TimeLabel.Caption = "The time and date of this transaction was as follows:"
    TransDate = MyDate
    TransTime = MyTime
   
   'Casheir
   Cashier.Caption = gObjLogonMngr.mFullname
   
   'mFullname = m_ActiveLogon.m_FULLNAME
    
    
End Sub

Public Function MyDate() As String
  
  MyDate = Format(Now, "dd-MMM-yyyy")

End Function

Public Function MyTime() As String
  
  'MyTime = Format(Now, "HH:nn:ss") & "." & Right(Format(Timer, "#0.00"), 2)
   MyTime = Format(Time$, "Long Time")
End Function


Private Sub cmd_Print_Click()

 On Error GoTo Handler
 Dim x As Printer
' For Each x In Printers
'   If x.DeviceName = "OUTPUT" Then
'      Set Printer = x
'      Exit For
'   End If
' Next
 
   'Printer.NewPage
     
   Printer.Font.Name = "Comic Sans MS"
   Printer.PaperSize = vbPRPSLetter
   Printer.Orientation = vbPRORPortrait
   Printer.ScaleMode = vbInches
   Printer.Font.Bold = True
         
   'Start the page heading section
   Printer.Font.Size = 24
   Printer.CurrentX = 1.5
   Printer.Print "Network Printing Solutions,Inc."
   Printer.CurrentX = 1.2
   Printer.Print "DocuGate Account Funding Receipt"
   Printer.Font.Size = 12
   Printer.Print ""
   Printer.Print ""
   'End the page heading section
         
   'Printer.PaintPicture "" need to put a picture of a line in here!
   'PaintPicture LoadPicture("C:line.gif"), 1000, 1000

   'start the accoutn details section
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print "Account details:"
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Account Name: " & txt_Account
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Account Balance: " & txt_CurBalance
   Printer.Print ""
   
   'Printer.PaintPicture "" need to put a picture of a line in here!
   
   'Start the receipt detail section
   'Printer.Print ""
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print Frm_ACCOUNT_fund.scl_ActivityType.Caption
   'Printer.Print ""
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Beginning Balance: " & txt_BeginBalance
   'Printer.Print ""
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Amount: " & txt_TransAmount
   'Printer.Print ""
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Final Balance: " & txt_FinalBalance
   Printer.Print ""
   'End the Receipt details section
   
  'Printer.PaintPicture "" need to put a picture of a line in here!
   
   'Start the timestamp seciton
   'Printer.Print ""
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print Me.scl_TimeLabel.Caption '= "The time and date of this trabsaction is as follows -
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Date: " & txt_TransDate '; Spc(20); "Transaction Time: " & txt_TransTime
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Time: " & txt_TransTime
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Your cashier was: " & scl_Cashier.Caption
   Printer.Print ""
   'End the receipt section
  
  ' Printer.NewPage
   
Handler:
   
   Printer.EndDoc
     
     
End Sub

Private Sub Cmd_Exit_Click()
     Unload Me
End Sub




