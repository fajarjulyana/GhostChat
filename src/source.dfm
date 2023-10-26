object Form1: TForm1
  Left = 927
  Top = 376
  Width = 346
  Height = 385
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 305
    Height = 89
    Caption = 'Configuration'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 16
      Height = 13
      Caption = 'IP :'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Edit2: TEdit
      Left = 56
      Top = 53
      Width = 161
      Height = 21
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 56
      Top = 21
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 224
      Top = 16
      Width = 75
      Height = 57
      Caption = 'Connect'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 88
    Width = 305
    Height = 193
    Caption = 'Chat'
    TabOrder = 1
    object Memo1: TMemo
      Left = 8
      Top = 16
      Width = 289
      Height = 177
      Hint = 'Kolom Chat'
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 288
    Width = 305
    Height = 49
    Caption = 'Sender'
    TabOrder = 2
    object Edit3: TEdit
      Left = 8
      Top = 16
      Width = 233
      Height = 21
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 245
      Top = 12
      Width = 51
      Height = 25
      Caption = 'Kirim'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientRead = ServerSocket1ClientRead
    Left = 192
    Top = 48
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnError = ClientSocket1Error
    Left = 192
    Top = 8
  end
end
