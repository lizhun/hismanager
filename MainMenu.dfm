object MainForm: TMainForm
  Left = 226
  Top = 196
  Width = 923
  Height = 192
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn_wzj: TButton
    Left = 24
    Top = 24
    Width = 97
    Height = 25
    Caption = #21361#24613#20540#27979#35797
    TabOrder = 0
    OnClick = btn_wzjClick
  end
  object btn_login: TButton
    Left = 160
    Top = 24
    Width = 113
    Height = 25
    Caption = #21333#28857#30331#24405#27979#35797
    TabOrder = 1
    OnClick = btn_loginClick
  end
  object btn_registerdoc: TButton
    Left = 296
    Top = 24
    Width = 113
    Height = 25
    Caption = #27880#20876#25991#26723#27979#35797
    TabOrder = 2
    OnClick = btn_registerdocClick
  end
  object lbledt_input: TLabeledEdit
    Left = 56
    Top = 88
    Width = 569
    Height = 21
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = #31243#24207#21551#21160#21442#25968'      '
    TabOrder = 3
    Text = 
      'openneijing:ptickets=ST-839-EAx12ugVQfn6F5vgKuBS-cas01.example.o' +
      'rg&pcode=neijing'
    Visible = False
  end
  object btn_open: TButton
    Left = 672
    Top = 72
    Width = 75
    Height = 25
    Caption = #21333#28857#20256#21442
    TabOrder = 4
    Visible = False
    OnClick = btn_openClick
  end
  object btn1: TButton
    Left = 776
    Top = 56
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 5
    OnClick = btn1Click
  end
end
