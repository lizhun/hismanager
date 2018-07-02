object LoginForm: TLoginForm
  Left = 296
  Top = 174
  Width = 257
  Height = 230
  Caption = 'LoginForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_login: TButton
    Left = 72
    Top = 128
    Width = 75
    Height = 25
    Caption = #30331#24405
    TabOrder = 0
    OnClick = btn_loginClick
  end
  object lbledt_ticket: TLabeledEdit
    Left = 56
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Ticket'
    TabOrder = 1
  end
  object lbledt_code: TLabeledEdit
    Left = 56
    Top = 88
    Width = 121
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'PCode'
    TabOrder = 2
  end
end
