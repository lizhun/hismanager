object Form1: TForm1
  Left = 327
  Top = 152
  Width = 1119
  Height = 751
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn_saveacv: TButton
    Left = 32
    Top = 24
    Width = 201
    Height = 25
    Caption = #20445#23384#21361#24613#20540#33267'HIS'
    TabOrder = 0
    OnClick = btn_saveacvClick
  end
  object btn_localDB: TButton
    Left = 32
    Top = 80
    Width = 201
    Height = 25
    Caption = #20445#23384#21361#24613#20540#33267'DB'
    TabOrder = 1
    OnClick = btn_localDBClick
  end
  object lbledtAntCVResultID: TLabeledEdit
    Left = 40
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtAntCVResultID'
    TabOrder = 2
  end
  object lbledtReportType: TLabeledEdit
    Left = 40
    Top = 188
    Width = 121
    Height = 21
    EditLabel.Width = 81
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtReportType'
    TabOrder = 3
  end
  object lbledtStudyNo: TLabeledEdit
    Left = 40
    Top = 233
    Width = 121
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtStudyNo'
    TabOrder = 4
  end
  object lbledtOrdRowID: TLabeledEdit
    Left = 40
    Top = 277
    Width = 121
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtOrdRowID'
    TabOrder = 5
  end
  object lbledtAuditDate: TLabeledEdit
    Left = 40
    Top = 321
    Width = 121
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtAuditDate'
    TabOrder = 6
  end
  object lbledtAuditTime: TLabeledEdit
    Left = 40
    Top = 366
    Width = 121
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtAuditTime'
    TabOrder = 7
  end
  object lbledtAuditDocCode: TLabeledEdit
    Left = 40
    Top = 410
    Width = 121
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtAuditDocCode'
    TabOrder = 8
  end
  object lbledtAuditComment: TLabeledEdit
    Left = 40
    Top = 492
    Width = 121
    Height = 21
    EditLabel.Width = 93
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtAuditComment'
    TabOrder = 9
  end
  object lbledtOrdName: TLabeledEdit
    Left = 40
    Top = 536
    Width = 121
    Height = 21
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtOrdName'
    TabOrder = 10
  end
  object lbledtResult: TLabeledEdit
    Left = 40
    Top = 580
    Width = 121
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtResult'
    TabOrder = 11
  end
  object lbledtRanges: TLabeledEdit
    Left = 40
    Top = 625
    Width = 121
    Height = 21
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtRanges'
    TabOrder = 12
  end
  object lbledtOrdDoc: TLabeledEdit
    Left = 40
    Top = 669
    Width = 121
    Height = 21
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtOrdDoc'
    TabOrder = 13
  end
  object lbledtOrdDate: TLabeledEdit
    Left = 191
    Top = 140
    Width = 121
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtOrdDate'
    TabOrder = 14
  end
  object lbledtOrdTime: TLabeledEdit
    Left = 191
    Top = 181
    Width = 121
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtOrdTime'
    TabOrder = 15
  end
  object lbledtColDoc: TLabeledEdit
    Left = 191
    Top = 223
    Width = 121
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtColDoc'
    TabOrder = 16
  end
  object lbledtColDate: TLabeledEdit
    Left = 191
    Top = 264
    Width = 121
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtColDate'
    TabOrder = 17
  end
  object lbledtColTime: TLabeledEdit
    Left = 191
    Top = 305
    Width = 121
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtColTime'
    TabOrder = 18
  end
  object lbledtRecDoc: TLabeledEdit
    Left = 191
    Top = 347
    Width = 121
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtRecDoc'
    TabOrder = 19
  end
  object lbledtRecDate: TLabeledEdit
    Left = 191
    Top = 388
    Width = 121
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtRecDate'
    TabOrder = 20
  end
  object lbledtRecTime: TLabeledEdit
    Left = 191
    Top = 429
    Width = 121
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtRecTime'
    TabOrder = 21
  end
  object lbledtWarDate: TLabeledEdit
    Left = 191
    Top = 471
    Width = 121
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtWarDate'
    TabOrder = 22
  end
  object lbledtWarTime: TLabeledEdit
    Left = 191
    Top = 512
    Width = 121
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtWarTime'
    TabOrder = 23
  end
  object lbledtCheckDoc: TLabeledEdit
    Left = 191
    Top = 553
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtCheckDoc'
    TabOrder = 24
  end
  object lbledtCheckDate: TLabeledEdit
    Left = 191
    Top = 595
    Width = 121
    Height = 21
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtCheckDate'
    TabOrder = 25
  end
  object lbledtCheckTime: TLabeledEdit
    Left = 191
    Top = 636
    Width = 121
    Height = 21
    EditLabel.Width = 79
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtCheckTime'
    TabOrder = 26
  end
  object lbledtReportDoc: TLabeledEdit
    Left = 336
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtReportDoc'
    TabOrder = 27
  end
  object lbledtReportDate: TLabeledEdit
    Left = 336
    Top = 176
    Width = 121
    Height = 21
    EditLabel.Width = 80
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtReportDate'
    TabOrder = 28
  end
  object lbledtReportTime: TLabeledEdit
    Left = 336
    Top = 216
    Width = 121
    Height = 21
    EditLabel.Width = 80
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtReportTime'
    TabOrder = 29
  end
  object lbledtSpecType: TLabeledEdit
    Left = 336
    Top = 256
    Width = 121
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtSpecType'
    TabOrder = 30
  end
  object lbledtComment: TLabeledEdit
    Left = 336
    Top = 296
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtComment'
    TabOrder = 31
  end
  object lbledtNote: TLabeledEdit
    Left = 336
    Top = 344
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtNote'
    TabOrder = 32
  end
  object lbledtAuditDocName: TLabeledEdit
    Left = 40
    Top = 449
    Width = 121
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'lbledtAuditDocName'
    TabOrder = 33
  end
  object lbledtDBServerHost: TLabeledEdit
    Left = 488
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 84
    EditLabel.Height = 13
    EditLabel.Caption = #25968#25454#24211#22320#22336'        '
    TabOrder = 34
    Text = '192.168.1.25'
  end
  object lbledtDBUserName: TLabeledEdit
    Left = 625
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #29992#25143#21517'    '
    TabOrder = 35
    Text = 'demo'
  end
  object lbledtDBPassword: TLabeledEdit
    Left = 760
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = #23494#30721'    '
    TabOrder = 36
    Text = 'demo'
  end
  object lbledtDBInitiaBase: TLabeledEdit
    Left = 896
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 129
    EditLabel.Height = 13
    EditLabel.Caption = #40664#35748#25968#25454#24211#21517'                   '
    TabOrder = 37
    Text = 'test'
  end
  object mmo_request: TMemo
    Left = 480
    Top = 136
    Width = 577
    Height = 313
    Lines.Strings = (
      'mmo_request')
    TabOrder = 38
  end
  object btn_DBTest: TButton
    Left = 904
    Top = 56
    Width = 129
    Height = 25
    Caption = #27979#35797#25968#25454#24211#36830#25509'            '
    TabOrder = 39
    OnClick = btn_DBTestClick
  end
  object btn_sendXml: TButton
    Left = 872
    Top = 464
    Width = 179
    Height = 25
    Caption = #21457#36865'XML'#21361#24613#20540#33267'HIS   '
    TabOrder = 40
    OnClick = btn_sendXmlClick
  end
  object con1: TADOConnection
    Left = 352
    Top = 32
  end
end
