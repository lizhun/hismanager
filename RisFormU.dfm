object RisTimeForm: TRisTimeForm
  Left = 387
  Top = 327
  Width = 273
  Height = 485
  Caption = #27880#20876#26102#38388#36724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_risTime: TButton
    Left = 64
    Top = 384
    Width = 89
    Height = 25
    Caption = #27880#20876#26102#38388#36724
    TabOrder = 0
    OnClick = btn_risTimeClick
  end
  object lbledt_ordrowid: TLabeledEdit
    Left = 56
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Ordrowid'
    TabOrder = 1
  end
  object lbledt_studyno: TLabeledEdit
    Left = 56
    Top = 78
    Width = 121
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'StudyNo'
    TabOrder = 2
  end
  object lbledt_doccode: TLabeledEdit
    Left = 56
    Top = 124
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'DocCode'
    TabOrder = 3
  end
  object lbledt_doc: TLabeledEdit
    Left = 56
    Top = 170
    Width = 121
    Height = 21
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Doc'
    TabOrder = 4
  end
  object lbledt_startDate: TLabeledEdit
    Left = 56
    Top = 216
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'StartDate'
    TabOrder = 5
  end
  object lbledt_starttime: TLabeledEdit
    Left = 56
    Top = 262
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'StartTime'
    TabOrder = 6
  end
  object lbledt_endDate: TLabeledEdit
    Left = 56
    Top = 308
    Width = 121
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'EndDate'
    TabOrder = 7
  end
  object lbledt_endTime: TLabeledEdit
    Left = 56
    Top = 354
    Width = 121
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'EndTime'
    TabOrder = 8
  end
end
