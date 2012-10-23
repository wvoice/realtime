VERSION 5.00
Object = "{D58B0E43-C5DF-4A4E-8635-84ADA7EAA339}#5.0#0"; "ctList.ocx"
Begin VB.Form Frm_ClientMatter 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Client Matter Selection"
   ClientHeight    =   7125
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8580
   Icon            =   "Frm_ClientMatter.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7125
   ScaleWidth      =   8580
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox piccm 
      BackColor       =   &H8000000A&
      Height          =   7140
      Left            =   -15
      ScaleHeight     =   7080
      ScaleWidth      =   8550
      TabIndex        =   11
      Top             =   0
      Width           =   8610
      Begin VB.CommandButton cmd_Save 
         Caption         =   "&Save"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   7290
         TabIndex        =   19
         Top             =   4140
         Width           =   990
      End
      Begin VB.CommandButton Cmd_selectall 
         Caption         =   "&Select All"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   5220
         TabIndex        =   6
         Top             =   4140
         Width           =   990
      End
      Begin VB.TextBox cm_selected 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1365
         TabIndex        =   5
         Top             =   4125
         Width           =   2220
      End
      Begin VB.TextBox cc_selected 
         Height          =   285
         Left            =   1365
         TabIndex        =   4
         Top             =   3810
         Width           =   2220
      End
      Begin VB.OptionButton Opt_cn 
         Caption         =   "Option2"
         Height          =   195
         Left            =   405
         TabIndex        =   16
         Top             =   570
         Width           =   240
      End
      Begin VB.OptionButton Opt_cc 
         Caption         =   "Option1"
         Height          =   195
         Left            =   405
         TabIndex        =   15
         Top             =   195
         Value           =   -1  'True
         Width           =   165
      End
      Begin VB.TextBox cCodeFilter 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2430
         TabIndex        =   0
         Top             =   180
         Width           =   2415
      End
      Begin CTLISTLibCtl.ctList ctClientList 
         Height          =   1485
         Left            =   300
         TabIndex        =   2
         Top             =   1035
         Width           =   8040
         _Version        =   327680
         _ExtentX        =   14182
         _ExtentY        =   2619
         _StockProps     =   77
         BackColor       =   12648447
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty HeaderFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TitleBackImage  =   "Frm_ClientMatter.frx":6852
         CheckPicDown    =   "Frm_ClientMatter.frx":686E
         CheckPicUp      =   "Frm_ClientMatter.frx":688A
         CheckPicDisabled=   "Frm_ClientMatter.frx":68A6
         BackImage       =   "Frm_ClientMatter.frx":68C2
         MouseIcon       =   "Frm_ClientMatter.frx":68DE
         PreColumnPicture=   "Frm_ClientMatter.frx":68FA
         BackColorTo     =   12648447
         BorderType      =   0
         HeaderBorder    =   4
         ShowHeader      =   -1  'True
         HeaderData      =   "Frm_ClientMatter.frx":6916
         PicArray0       =   "Frm_ClientMatter.frx":69E3
         PicArray1       =   "Frm_ClientMatter.frx":69FF
         PicArray2       =   "Frm_ClientMatter.frx":6A1B
         PicArray3       =   "Frm_ClientMatter.frx":6A37
         PicArray4       =   "Frm_ClientMatter.frx":6A53
         PicArray5       =   "Frm_ClientMatter.frx":6A6F
         PicArray6       =   "Frm_ClientMatter.frx":6A8B
         PicArray7       =   "Frm_ClientMatter.frx":6AA7
         PicArray8       =   "Frm_ClientMatter.frx":6AC3
         PicArray9       =   "Frm_ClientMatter.frx":6ADF
         PicArray10      =   "Frm_ClientMatter.frx":6AFB
         PicArray11      =   "Frm_ClientMatter.frx":6B17
         PicArray12      =   "Frm_ClientMatter.frx":6B33
         PicArray13      =   "Frm_ClientMatter.frx":6B4F
         PicArray14      =   "Frm_ClientMatter.frx":6B6B
         PicArray15      =   "Frm_ClientMatter.frx":6B87
         PicArray16      =   "Frm_ClientMatter.frx":6BA3
         PicArray17      =   "Frm_ClientMatter.frx":6BBF
         PicArray18      =   "Frm_ClientMatter.frx":6BDB
         PicArray19      =   "Frm_ClientMatter.frx":6BF7
         PicArray20      =   "Frm_ClientMatter.frx":6C13
         PicArray21      =   "Frm_ClientMatter.frx":6C2F
         PicArray22      =   "Frm_ClientMatter.frx":6C4B
         PicArray23      =   "Frm_ClientMatter.frx":6C67
         PicArray24      =   "Frm_ClientMatter.frx":6C83
         PicArray25      =   "Frm_ClientMatter.frx":6C9F
         PicArray26      =   "Frm_ClientMatter.frx":6CBB
         PicArray27      =   "Frm_ClientMatter.frx":6CD7
         PicArray28      =   "Frm_ClientMatter.frx":6CF3
         PicArray29      =   "Frm_ClientMatter.frx":6D0F
         PicArray30      =   "Frm_ClientMatter.frx":6D2B
         PicArray31      =   "Frm_ClientMatter.frx":6D47
         PicArray32      =   "Frm_ClientMatter.frx":6D63
         PicArray33      =   "Frm_ClientMatter.frx":6D7F
         PicArray34      =   "Frm_ClientMatter.frx":6D9B
         PicArray35      =   "Frm_ClientMatter.frx":6DB7
         PicArray36      =   "Frm_ClientMatter.frx":6DD3
         PicArray37      =   "Frm_ClientMatter.frx":6DEF
         PicArray38      =   "Frm_ClientMatter.frx":6E0B
         PicArray39      =   "Frm_ClientMatter.frx":6E27
         PicArray40      =   "Frm_ClientMatter.frx":6E43
         PicArray41      =   "Frm_ClientMatter.frx":6E5F
         PicArray42      =   "Frm_ClientMatter.frx":6E7B
         PicArray43      =   "Frm_ClientMatter.frx":6E97
         PicArray44      =   "Frm_ClientMatter.frx":6EB3
         PicArray45      =   "Frm_ClientMatter.frx":6ECF
         PicArray46      =   "Frm_ClientMatter.frx":6EEB
         PicArray47      =   "Frm_ClientMatter.frx":6F07
         PicArray48      =   "Frm_ClientMatter.frx":6F23
         PicArray49      =   "Frm_ClientMatter.frx":6F3F
         PicArray50      =   "Frm_ClientMatter.frx":6F5B
         PicArray51      =   "Frm_ClientMatter.frx":6F77
         PicArray52      =   "Frm_ClientMatter.frx":6F93
         PicArray53      =   "Frm_ClientMatter.frx":6FAF
         PicArray54      =   "Frm_ClientMatter.frx":6FCB
         PicArray55      =   "Frm_ClientMatter.frx":6FE7
         PicArray56      =   "Frm_ClientMatter.frx":7003
         PicArray57      =   "Frm_ClientMatter.frx":701F
         PicArray58      =   "Frm_ClientMatter.frx":703B
         PicArray59      =   "Frm_ClientMatter.frx":7057
         PicArray60      =   "Frm_ClientMatter.frx":7073
         PicArray61      =   "Frm_ClientMatter.frx":708F
         PicArray62      =   "Frm_ClientMatter.frx":70AB
         PicArray63      =   "Frm_ClientMatter.frx":70C7
         PicArray64      =   "Frm_ClientMatter.frx":70E3
         PicArray65      =   "Frm_ClientMatter.frx":70FF
         PicArray66      =   "Frm_ClientMatter.frx":711B
         PicArray67      =   "Frm_ClientMatter.frx":7137
         PicArray68      =   "Frm_ClientMatter.frx":7153
         PicArray69      =   "Frm_ClientMatter.frx":716F
         PicArray70      =   "Frm_ClientMatter.frx":718B
         PicArray71      =   "Frm_ClientMatter.frx":71A7
         PicArray72      =   "Frm_ClientMatter.frx":71C3
         PicArray73      =   "Frm_ClientMatter.frx":71DF
         PicArray74      =   "Frm_ClientMatter.frx":71FB
         PicArray75      =   "Frm_ClientMatter.frx":7217
         PicArray76      =   "Frm_ClientMatter.frx":7233
         PicArray77      =   "Frm_ClientMatter.frx":724F
         PicArray78      =   "Frm_ClientMatter.frx":726B
         PicArray79      =   "Frm_ClientMatter.frx":7287
         PicArray80      =   "Frm_ClientMatter.frx":72A3
         PicArray81      =   "Frm_ClientMatter.frx":72BF
         PicArray82      =   "Frm_ClientMatter.frx":72DB
         PicArray83      =   "Frm_ClientMatter.frx":72F7
         PicArray84      =   "Frm_ClientMatter.frx":7313
         PicArray85      =   "Frm_ClientMatter.frx":732F
         PicArray86      =   "Frm_ClientMatter.frx":734B
         PicArray87      =   "Frm_ClientMatter.frx":7367
         PicArray88      =   "Frm_ClientMatter.frx":7383
         PicArray89      =   "Frm_ClientMatter.frx":739F
         PicArray90      =   "Frm_ClientMatter.frx":73BB
         PicArray91      =   "Frm_ClientMatter.frx":73D7
         PicArray92      =   "Frm_ClientMatter.frx":73F3
         PicArray93      =   "Frm_ClientMatter.frx":740F
         PicArray94      =   "Frm_ClientMatter.frx":742B
         PicArray95      =   "Frm_ClientMatter.frx":7447
         PicArray96      =   "Frm_ClientMatter.frx":7463
         PicArray97      =   "Frm_ClientMatter.frx":747F
         PicArray98      =   "Frm_ClientMatter.frx":749B
         PicArray99      =   "Frm_ClientMatter.frx":74B7
      End
      Begin CTLISTLibCtl.ctList ctJobList 
         Height          =   2160
         Left            =   300
         TabIndex        =   9
         Top             =   4500
         Width           =   8040
         _Version        =   327680
         _ExtentX        =   14182
         _ExtentY        =   3810
         _StockProps     =   77
         BackColor       =   12648447
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty HeaderFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TitleBackImage  =   "Frm_ClientMatter.frx":74D3
         CheckPicDown    =   "Frm_ClientMatter.frx":74EF
         CheckPicUp      =   "Frm_ClientMatter.frx":750B
         CheckPicDisabled=   "Frm_ClientMatter.frx":7527
         BackImage       =   "Frm_ClientMatter.frx":7543
         MouseIcon       =   "Frm_ClientMatter.frx":755F
         PreColumnPicture=   "Frm_ClientMatter.frx":757B
         BorderType      =   0
         HeaderAlign     =   0
         HeaderBorder    =   4
         CheckAlign      =   0
         PreColumnBorder =   4
         PreSelectBorder =   4
         PreColumnWidth  =   20
         ShowHeader      =   -1  'True
         MultiSelect     =   -1  'True
         ScrollOnHThumb  =   -1  'True
         SelectOnScroll  =   -1  'True
         HeaderData      =   "Frm_ClientMatter.frx":7597
         PicArray0       =   "Frm_ClientMatter.frx":769F
         PicArray1       =   "Frm_ClientMatter.frx":76BB
         PicArray2       =   "Frm_ClientMatter.frx":76D7
         PicArray3       =   "Frm_ClientMatter.frx":76F3
         PicArray4       =   "Frm_ClientMatter.frx":770F
         PicArray5       =   "Frm_ClientMatter.frx":772B
         PicArray6       =   "Frm_ClientMatter.frx":7747
         PicArray7       =   "Frm_ClientMatter.frx":7763
         PicArray8       =   "Frm_ClientMatter.frx":777F
         PicArray9       =   "Frm_ClientMatter.frx":779B
         PicArray10      =   "Frm_ClientMatter.frx":77B7
         PicArray11      =   "Frm_ClientMatter.frx":77D3
         PicArray12      =   "Frm_ClientMatter.frx":77EF
         PicArray13      =   "Frm_ClientMatter.frx":780B
         PicArray14      =   "Frm_ClientMatter.frx":7827
         PicArray15      =   "Frm_ClientMatter.frx":7843
         PicArray16      =   "Frm_ClientMatter.frx":785F
         PicArray17      =   "Frm_ClientMatter.frx":787B
         PicArray18      =   "Frm_ClientMatter.frx":7897
         PicArray19      =   "Frm_ClientMatter.frx":78B3
         PicArray20      =   "Frm_ClientMatter.frx":78CF
         PicArray21      =   "Frm_ClientMatter.frx":78EB
         PicArray22      =   "Frm_ClientMatter.frx":7907
         PicArray23      =   "Frm_ClientMatter.frx":7923
         PicArray24      =   "Frm_ClientMatter.frx":793F
         PicArray25      =   "Frm_ClientMatter.frx":795B
         PicArray26      =   "Frm_ClientMatter.frx":7977
         PicArray27      =   "Frm_ClientMatter.frx":7993
         PicArray28      =   "Frm_ClientMatter.frx":79AF
         PicArray29      =   "Frm_ClientMatter.frx":79CB
         PicArray30      =   "Frm_ClientMatter.frx":79E7
         PicArray31      =   "Frm_ClientMatter.frx":7A03
         PicArray32      =   "Frm_ClientMatter.frx":7A1F
         PicArray33      =   "Frm_ClientMatter.frx":7A3B
         PicArray34      =   "Frm_ClientMatter.frx":7A57
         PicArray35      =   "Frm_ClientMatter.frx":7A73
         PicArray36      =   "Frm_ClientMatter.frx":7A8F
         PicArray37      =   "Frm_ClientMatter.frx":7AAB
         PicArray38      =   "Frm_ClientMatter.frx":7AC7
         PicArray39      =   "Frm_ClientMatter.frx":7AE3
         PicArray40      =   "Frm_ClientMatter.frx":7AFF
         PicArray41      =   "Frm_ClientMatter.frx":7B1B
         PicArray42      =   "Frm_ClientMatter.frx":7B37
         PicArray43      =   "Frm_ClientMatter.frx":7B53
         PicArray44      =   "Frm_ClientMatter.frx":7B6F
         PicArray45      =   "Frm_ClientMatter.frx":7B8B
         PicArray46      =   "Frm_ClientMatter.frx":7BA7
         PicArray47      =   "Frm_ClientMatter.frx":7BC3
         PicArray48      =   "Frm_ClientMatter.frx":7BDF
         PicArray49      =   "Frm_ClientMatter.frx":7BFB
         PicArray50      =   "Frm_ClientMatter.frx":7C17
         PicArray51      =   "Frm_ClientMatter.frx":7C33
         PicArray52      =   "Frm_ClientMatter.frx":7C4F
         PicArray53      =   "Frm_ClientMatter.frx":7C6B
         PicArray54      =   "Frm_ClientMatter.frx":7C87
         PicArray55      =   "Frm_ClientMatter.frx":7CA3
         PicArray56      =   "Frm_ClientMatter.frx":7CBF
         PicArray57      =   "Frm_ClientMatter.frx":7CDB
         PicArray58      =   "Frm_ClientMatter.frx":7CF7
         PicArray59      =   "Frm_ClientMatter.frx":7D13
         PicArray60      =   "Frm_ClientMatter.frx":7D2F
         PicArray61      =   "Frm_ClientMatter.frx":7D4B
         PicArray62      =   "Frm_ClientMatter.frx":7D67
         PicArray63      =   "Frm_ClientMatter.frx":7D83
         PicArray64      =   "Frm_ClientMatter.frx":7D9F
         PicArray65      =   "Frm_ClientMatter.frx":7DBB
         PicArray66      =   "Frm_ClientMatter.frx":7DD7
         PicArray67      =   "Frm_ClientMatter.frx":7DF3
         PicArray68      =   "Frm_ClientMatter.frx":7E0F
         PicArray69      =   "Frm_ClientMatter.frx":7E2B
         PicArray70      =   "Frm_ClientMatter.frx":7E47
         PicArray71      =   "Frm_ClientMatter.frx":7E63
         PicArray72      =   "Frm_ClientMatter.frx":7E7F
         PicArray73      =   "Frm_ClientMatter.frx":7E9B
         PicArray74      =   "Frm_ClientMatter.frx":7EB7
         PicArray75      =   "Frm_ClientMatter.frx":7ED3
         PicArray76      =   "Frm_ClientMatter.frx":7EEF
         PicArray77      =   "Frm_ClientMatter.frx":7F0B
         PicArray78      =   "Frm_ClientMatter.frx":7F27
         PicArray79      =   "Frm_ClientMatter.frx":7F43
         PicArray80      =   "Frm_ClientMatter.frx":7F5F
         PicArray81      =   "Frm_ClientMatter.frx":7F7B
         PicArray82      =   "Frm_ClientMatter.frx":7F97
         PicArray83      =   "Frm_ClientMatter.frx":7FB3
         PicArray84      =   "Frm_ClientMatter.frx":7FCF
         PicArray85      =   "Frm_ClientMatter.frx":7FEB
         PicArray86      =   "Frm_ClientMatter.frx":8007
         PicArray87      =   "Frm_ClientMatter.frx":8023
         PicArray88      =   "Frm_ClientMatter.frx":803F
         PicArray89      =   "Frm_ClientMatter.frx":805B
         PicArray90      =   "Frm_ClientMatter.frx":8077
         PicArray91      =   "Frm_ClientMatter.frx":8093
         PicArray92      =   "Frm_ClientMatter.frx":80AF
         PicArray93      =   "Frm_ClientMatter.frx":80CB
         PicArray94      =   "Frm_ClientMatter.frx":80E7
         PicArray95      =   "Frm_ClientMatter.frx":8103
         PicArray96      =   "Frm_ClientMatter.frx":811F
         PicArray97      =   "Frm_ClientMatter.frx":813B
         PicArray98      =   "Frm_ClientMatter.frx":8157
         PicArray99      =   "Frm_ClientMatter.frx":8173
      End
      Begin VB.CommandButton cmd_close 
         Caption         =   "&Exit"
         Default         =   -1  'True
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   7335
         TabIndex        =   10
         Top             =   6690
         Width           =   990
      End
      Begin VB.CommandButton cmd_reset 
         Caption         =   "&Reset"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   6315
         TabIndex        =   8
         Top             =   6690
         Width           =   990
      End
      Begin VB.TextBox cNameFilter 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2415
         TabIndex        =   1
         Top             =   585
         Width           =   2430
      End
      Begin VB.CommandButton Cmd_Apply 
         Caption         =   "&Apply"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   6255
         TabIndex        =   7
         Top             =   4140
         Width           =   990
      End
      Begin CTLISTLibCtl.ctList ctMatterList 
         Height          =   1155
         Left            =   300
         TabIndex        =   3
         Top             =   2580
         Width           =   8040
         _Version        =   327680
         _ExtentX        =   14182
         _ExtentY        =   2037
         _StockProps     =   77
         BackColor       =   12648447
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty HeaderFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TitleBackImage  =   "Frm_ClientMatter.frx":818F
         CheckPicDown    =   "Frm_ClientMatter.frx":81AB
         CheckPicUp      =   "Frm_ClientMatter.frx":81C7
         CheckPicDisabled=   "Frm_ClientMatter.frx":81E3
         BackImage       =   "Frm_ClientMatter.frx":81FF
         MouseIcon       =   "Frm_ClientMatter.frx":821B
         PreColumnPicture=   "Frm_ClientMatter.frx":8237
         BackColorTo     =   12648447
         BorderType      =   0
         HeaderAlign     =   0
         HeaderBorder    =   4
         PreColumnBorder =   4
         ShowHeader      =   -1  'True
         SelectOnScroll  =   -1  'True
         HeaderData      =   "Frm_ClientMatter.frx":8253
         PicArray0       =   "Frm_ClientMatter.frx":82F1
         PicArray1       =   "Frm_ClientMatter.frx":830D
         PicArray2       =   "Frm_ClientMatter.frx":8329
         PicArray3       =   "Frm_ClientMatter.frx":8345
         PicArray4       =   "Frm_ClientMatter.frx":8361
         PicArray5       =   "Frm_ClientMatter.frx":837D
         PicArray6       =   "Frm_ClientMatter.frx":8399
         PicArray7       =   "Frm_ClientMatter.frx":83B5
         PicArray8       =   "Frm_ClientMatter.frx":83D1
         PicArray9       =   "Frm_ClientMatter.frx":83ED
         PicArray10      =   "Frm_ClientMatter.frx":8409
         PicArray11      =   "Frm_ClientMatter.frx":8425
         PicArray12      =   "Frm_ClientMatter.frx":8441
         PicArray13      =   "Frm_ClientMatter.frx":845D
         PicArray14      =   "Frm_ClientMatter.frx":8479
         PicArray15      =   "Frm_ClientMatter.frx":8495
         PicArray16      =   "Frm_ClientMatter.frx":84B1
         PicArray17      =   "Frm_ClientMatter.frx":84CD
         PicArray18      =   "Frm_ClientMatter.frx":84E9
         PicArray19      =   "Frm_ClientMatter.frx":8505
         PicArray20      =   "Frm_ClientMatter.frx":8521
         PicArray21      =   "Frm_ClientMatter.frx":853D
         PicArray22      =   "Frm_ClientMatter.frx":8559
         PicArray23      =   "Frm_ClientMatter.frx":8575
         PicArray24      =   "Frm_ClientMatter.frx":8591
         PicArray25      =   "Frm_ClientMatter.frx":85AD
         PicArray26      =   "Frm_ClientMatter.frx":85C9
         PicArray27      =   "Frm_ClientMatter.frx":85E5
         PicArray28      =   "Frm_ClientMatter.frx":8601
         PicArray29      =   "Frm_ClientMatter.frx":861D
         PicArray30      =   "Frm_ClientMatter.frx":8639
         PicArray31      =   "Frm_ClientMatter.frx":8655
         PicArray32      =   "Frm_ClientMatter.frx":8671
         PicArray33      =   "Frm_ClientMatter.frx":868D
         PicArray34      =   "Frm_ClientMatter.frx":86A9
         PicArray35      =   "Frm_ClientMatter.frx":86C5
         PicArray36      =   "Frm_ClientMatter.frx":86E1
         PicArray37      =   "Frm_ClientMatter.frx":86FD
         PicArray38      =   "Frm_ClientMatter.frx":8719
         PicArray39      =   "Frm_ClientMatter.frx":8735
         PicArray40      =   "Frm_ClientMatter.frx":8751
         PicArray41      =   "Frm_ClientMatter.frx":876D
         PicArray42      =   "Frm_ClientMatter.frx":8789
         PicArray43      =   "Frm_ClientMatter.frx":87A5
         PicArray44      =   "Frm_ClientMatter.frx":87C1
         PicArray45      =   "Frm_ClientMatter.frx":87DD
         PicArray46      =   "Frm_ClientMatter.frx":87F9
         PicArray47      =   "Frm_ClientMatter.frx":8815
         PicArray48      =   "Frm_ClientMatter.frx":8831
         PicArray49      =   "Frm_ClientMatter.frx":884D
         PicArray50      =   "Frm_ClientMatter.frx":8869
         PicArray51      =   "Frm_ClientMatter.frx":8885
         PicArray52      =   "Frm_ClientMatter.frx":88A1
         PicArray53      =   "Frm_ClientMatter.frx":88BD
         PicArray54      =   "Frm_ClientMatter.frx":88D9
         PicArray55      =   "Frm_ClientMatter.frx":88F5
         PicArray56      =   "Frm_ClientMatter.frx":8911
         PicArray57      =   "Frm_ClientMatter.frx":892D
         PicArray58      =   "Frm_ClientMatter.frx":8949
         PicArray59      =   "Frm_ClientMatter.frx":8965
         PicArray60      =   "Frm_ClientMatter.frx":8981
         PicArray61      =   "Frm_ClientMatter.frx":899D
         PicArray62      =   "Frm_ClientMatter.frx":89B9
         PicArray63      =   "Frm_ClientMatter.frx":89D5
         PicArray64      =   "Frm_ClientMatter.frx":89F1
         PicArray65      =   "Frm_ClientMatter.frx":8A0D
         PicArray66      =   "Frm_ClientMatter.frx":8A29
         PicArray67      =   "Frm_ClientMatter.frx":8A45
         PicArray68      =   "Frm_ClientMatter.frx":8A61
         PicArray69      =   "Frm_ClientMatter.frx":8A7D
         PicArray70      =   "Frm_ClientMatter.frx":8A99
         PicArray71      =   "Frm_ClientMatter.frx":8AB5
         PicArray72      =   "Frm_ClientMatter.frx":8AD1
         PicArray73      =   "Frm_ClientMatter.frx":8AED
         PicArray74      =   "Frm_ClientMatter.frx":8B09
         PicArray75      =   "Frm_ClientMatter.frx":8B25
         PicArray76      =   "Frm_ClientMatter.frx":8B41
         PicArray77      =   "Frm_ClientMatter.frx":8B5D
         PicArray78      =   "Frm_ClientMatter.frx":8B79
         PicArray79      =   "Frm_ClientMatter.frx":8B95
         PicArray80      =   "Frm_ClientMatter.frx":8BB1
         PicArray81      =   "Frm_ClientMatter.frx":8BCD
         PicArray82      =   "Frm_ClientMatter.frx":8BE9
         PicArray83      =   "Frm_ClientMatter.frx":8C05
         PicArray84      =   "Frm_ClientMatter.frx":8C21
         PicArray85      =   "Frm_ClientMatter.frx":8C3D
         PicArray86      =   "Frm_ClientMatter.frx":8C59
         PicArray87      =   "Frm_ClientMatter.frx":8C75
         PicArray88      =   "Frm_ClientMatter.frx":8C91
         PicArray89      =   "Frm_ClientMatter.frx":8CAD
         PicArray90      =   "Frm_ClientMatter.frx":8CC9
         PicArray91      =   "Frm_ClientMatter.frx":8CE5
         PicArray92      =   "Frm_ClientMatter.frx":8D01
         PicArray93      =   "Frm_ClientMatter.frx":8D1D
         PicArray94      =   "Frm_ClientMatter.frx":8D39
         PicArray95      =   "Frm_ClientMatter.frx":8D55
         PicArray96      =   "Frm_ClientMatter.frx":8D71
         PicArray97      =   "Frm_ClientMatter.frx":8D8D
         PicArray98      =   "Frm_ClientMatter.frx":8DA9
         PicArray99      =   "Frm_ClientMatter.frx":8DC5
      End
      Begin VB.Label lbl_error 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   4110
         TabIndex        =   20
         Top             =   3795
         Width           =   4200
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Client Matter:"
         Height          =   195
         Left            =   330
         TabIndex        =   18
         Top             =   4140
         Width           =   930
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Client Code:"
         Height          =   195
         Left            =   360
         TabIndex        =   17
         Top             =   3825
         Width           =   855
      End
      Begin VB.Label OptcName_Filter 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Use a client name filter:"
         Height          =   195
         Left            =   675
         TabIndex        =   14
         ToolTipText     =   "Use a Client Name Filter:"
         Top             =   585
         Width           =   1650
      End
      Begin VB.Label OptcCode_Filter 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000B&
         BackStyle       =   0  'Transparent
         Caption         =   "Use a client code filter:"
         Height          =   195
         Left            =   675
         TabIndex        =   13
         ToolTipText     =   "Use a Client Code Filter:"
         Top             =   210
         Width           =   1620
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   $"Frm_ClientMatter.frx":8DE1
         Height          =   855
         Left            =   4950
         TabIndex        =   12
         Top             =   135
         Width           =   3390
      End
   End
End
Attribute VB_Name = "Frm_ClientMatter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

''DISCLAIMER OF WARRANTY
''
''IN NO EVENT SHALL THE AUTHOR AND/OR NPS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL,
''OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
''EVEN IF THE AUTHOR AND/OR NPS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
''THE AUTHOR AND NPS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
''OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
''THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS PROVIDED "AS IS".
''THE AUTHOR AND NPS HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

''The author and/or distributors of this source code may have made statements about this source code.
''Any such statements do not constitute warranties and shall not be relied on by the user in deciding
''whether to use this source code.
''This source code is provided without any express or implied warranties whatsoever.
''Because of the diversity of conditions and hardware under which this source code may be used,
''no warranty of fitness for a particular purpose is offered.
''The user is advised to test the source code thoroughly before relying on it.
''The user must assume the entire risk of using the source code.


Dim clsCM As cls_cmChargeBack
Private clientsplit() As String

Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub cc_selected_Change()
If (cc_selected.Text = "") Then
    cm_selected.Enabled = False
    cm_selected.BackColor = &H8000000F
Else
    cm_selected.Enabled = True
    cm_selected.BackColor = &H80000005
End If

End Sub

Private Sub cmd_reset_Click()
 
 For a = 0 To ctJobList.ListCount
      ctJobList.CellText(a, 4) = ""
      ctJobList.CellText(a, 5) = ""
      ctJobList.CellCheck(a, 1) = 0
 Next

End Sub

Private Sub cmd_Save_Click()
'''''''''''''''''''''''''
' here we save the items'
'''''''''''''''''''''''''
 Dim GUID As String
 Dim CC   As String
 Dim CM   As String
 Dim result As Boolean
 
 
 For a = 0 To ctJobList.ListCount - 1
        GUID = ctJobList.ListCargo(a)
        CC = ctJobList.CellText(a, 4)
        CM = ctJobList.CellText(a, 5)
    
        Exists = InStr(GUID, "{") <> 0
        If (Exists = True) Then
           result = clsCM.CM_UpdateDatabaseJob(GUID, CC, CM)
        Else
           result = clsCM.CM_UpdateSessionJob(GUID, CC, CM)
        End If
    
        If (result = True) Then
           ctJobList.ListBackColor(a) = &HC0FFC0
        Else
           ctJobList.ListBackColor(a) = &HC0C0FF
        End If
 Next
 
  
End Sub

Private Sub cNameFilter_Change()
        
        If (cNameFilter.Text = "") Then
            ctClientList.ClearList
            ctMatterList.ClearList
            cc_selected = ""
            cm_selected = ""
        Else
          Call clsCM.CM_PopulateClientsByName(ctClientList, cNameFilter)
        End If

End Sub

Private Sub cCodeFilter_Change()
        
        If (cCodeFilter.Text = "") Then
            ctClientList.ClearList
            ctMatterList.ClearList
            cc_selected = ""
            cm_selected = ""
            
        Else
          Call clsCM.CM_PopulateClientsByCode(ctClientList, cCodeFilter)
        End If

End Sub


Private Sub Cmd_selectall_Click()
 
 For a = 0 To ctJobList.ListCount
   
   If (ctJobList.CellCheck(a, 1) = 1) Then
       ctJobList.CellCheck(a, 1) = 0
   Else
       ctJobList.CellCheck(a, 1) = 1
   End If
 
 Next

End Sub


Private Sub Cmd_Apply_Click()
 Dim selected As Long
 
 If (cc_selected = "") Then
     lbl_error.Caption = "Client Code is Required.!"
     cc_selected.SetFocus
     Exit Sub
 Else
     lbl_error.Caption = ""
 End If

 
 selected = 0
 For a = 0 To ctJobList.ListCount
   If (ctJobList.CellCheck(a, 1) = 1) Then
       selected = selected + 1
   End If
 Next
 
 If (selected = 0) Then
     lbl_error.Caption = "No Jobs Selected.!"
     ctJobList.SetFocus
     Exit Sub
 Else
     lbl_error.Caption = ""
 End If


 For a = 0 To ctJobList.ListCount
   
   If (ctJobList.CellCheck(a, 1) = 1) Then
      ctJobList.CellText(a, 4) = cc_selected
      ctJobList.CellText(a, 5) = cm_selected
   End If
   
 Next

End Sub

Private Sub ctClientList_Change(ByVal nIndex As Long)
        
        If (Index = -1) Then Exit Sub
        
        If (ctClientList.ColumnText(1) = "Client Code:") Then
          cc_selected = ctClientList.CellText(nIndex, 1)
        Else
          cc_selected = ctClientList.CellText(nIndex, 3)
        End If
          
        cm_selected = ""
        
        Call clsCM.CM_PopulateMatters(ctMatterList, ctClientList.ListCargo(nIndex))
         
End Sub

Private Sub ctMatterList_Change(ByVal nIndex As Long)
        
        If (Index = -1) Then Exit Sub
        cm_selected = ctMatterList.CellText(nIndex, 1)
         
End Sub


Private Sub Form_Load()
     Set clsCM = New cls_cmChargeBack
     clsCM.CM_PopulateView ctJobList

     cNameFilter.BackColor = &H8000000F
     cNameFilter.Enabled = False
     cCodeFilter.BackColor = &H80000005
     cCodeFilter.Enabled = True
     
     ctClientList.ColumnText(1) = "Client Code:"
     ctClientList.ColumnWidth(1) = 125
 
     ctClientList.ColumnText(2) = "Client Name:"
     ctClientList.ColumnWidth(2) = 225
 
     ctClientList.ColumnText(3) = "Client Description:"
     ctClientList.ColumnWidth(3) = 150

     If (ctJobList.ListCount = 0) Then
       Cmd_selectall.Enabled = False
       Cmd_Apply.Enabled = False
       cmd_Save.Enabled = False
       cmd_reset.Enabled = False
       ctJobList.Enabled = False
     End If
     

End Sub


Private Sub Opt_cc_Click()
 
    cNameFilter.BackColor = &H8000000F
    cNameFilter.Enabled = False
    cCodeFilter.BackColor = &H80000005
    cCodeFilter.Enabled = True

    ctClientList.ColumnText(1) = "Client Code:"
    ctClientList.ColumnWidth(1) = 125
 
    ctClientList.ColumnText(2) = "Client Name:"
    ctClientList.ColumnWidth(2) = 225
 
    ctClientList.ColumnText(3) = "Client Description:"
    ctClientList.ColumnWidth(3) = 150
  
    ctClientList.ClearList
    ctMatterList.ClearList
  
    cCodeFilter.Text = ""
    cCodeFilter.SetFocus
 
End Sub

Private Sub Opt_cn_Click()
 
 cNameFilter.BackColor = &H80000005
 cNameFilter.Enabled = True
 cCodeFilter.BackColor = &H8000000F
 cCodeFilter.Enabled = False
 
 ctClientList.ColumnText(1) = "Client Name:"
 ctClientList.ColumnWidth(1) = 225
 
 ctClientList.ColumnText(2) = "Client Description:"
 ctClientList.ColumnWidth(2) = 150
 
 ctClientList.ColumnText(3) = "Client Code:"
 ctClientList.ColumnWidth(3) = 125
   
 ctClientList.ClearList
 ctMatterList.ClearList
   
 cNameFilter.Text = ""
 cNameFilter.SetFocus
   
End Sub

Private Sub cmd_close_Click()

    Unload Me
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    gCmOpen = False
    Set clsCM = Nothing
End Sub

