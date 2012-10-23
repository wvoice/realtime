Attribute VB_Name = "mod_Plimus"
' These are the product ID and action IDs assigned by Plimus Inc. DO NOT change their values
Public Const PD_PRODUCT_ID = 76664

' The following are the declarations for the API functions
Declare Function PlimusInit Lib "PlimWare.dll" (ByVal productId As Long) As Long   sample
Declare Function PlimusInitSilent Lib "PlimWare.dll" (ByVal productId As Long) As Long
Declare Function PlimusUserLogin Lib "PlimWare.dll" () As Long
Declare Function PlimusForgetLoginInfo Lib "PlimWare.dll" () As Long
Declare Function PlimusChargeRequest Lib "PlimWare.dll" (ByVal actionId As Long) As Long
Declare Function PlimusAuthRequest Lib "PlimWare.dll" (ByVal actionId As Long) As Long
Declare Function PlimusConfirmRequest Lib "PlimWare.dll" (ByVal authCode As Long) As Long
Declare Function PlimusIsAppValid Lib "PlimWare.dll" () As Long
Declare Function PlimusDaysLeft Lib "PlimWare.dll" () As Long
Declare Function PlimusCheckTrialPeriod Lib "PlimWare.dll" () As Long
Declare Function PlimusEnterRegisterKey Lib "PlimWare.dll" () As Long
Declare Function PlimusPurchaseSharewareContract Lib "PlimWare.dll" () As Long

The following are samples of the usage of the functions provided by the API:
'This is the Plimus Engine initialization routine, it must be called before any other Plimus functions.
'To ensure this, it is recommended this code is placed at the beginning of the program?s execution.
'A good place for this code is within the InitInstance.
If PlimusInit(PD_PRODUCT_ID) <= 0 Then

   ' Problem initializing Plimus Engine
   ' Errors will be presented to the user by the Plimus engine, no need
   ' to report an error, just exit.
   Quit
End If
'This is another option of the Plimus Engine initialization routine, it must be called before any other Plimus functions.
'To ensure this, it is recommended this code is placed at the beginning of the program?s execution.
'A good place for this code is within the InitInstance.
'This form will NOT prompt the user to install the PlimusWallet.
If PlimusInitSilent(PD_PRODUCT_ID) <= 0 Then

   ' Problem initializing Plimus Engine
   ' Errors will be presented to the user by the Plimus engine, no need
   ' to report an error, just exit.
   Quit
End If

'This is an example of how PlimWare can be used for trial period validations.
If PlimusInitSilent(PD_PRODUCT_ID) <= 0 Then
    Quit
If PlimusIsAppValid() <= 0 Then   'Check if App is registered, i.e. ALL fees are paid for.
    If PlimusCheckTrialPeriod() <= 0 Then   'App not registered, lets check if trial period still OK.
        'exit or show nag screen (The Plimus engine would have already told the
        'user that the trial period is over and that he/she must register to continue)
    Else
        daysLeft = PlimusDaysLeft();
        'Trial period OK, maybe show nag screen or something
    End If
End If
'Continue with the program...

' The following sample can be used to change users, first call PlimusForgetLoginInfo and if
' successful, just call PlimusUserLogin to ask for username and password again.
If PlimusForgetLoginInfo() > 0 Then

   PlimusUserLogin()
End If

