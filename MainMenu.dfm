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
end
