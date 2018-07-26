object MainForm: TMainForm
  Left = 226
  Top = 196
  Width = 1135
  Height = 689
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
    Width = 521
    Height = 21
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = #31243#24207#21551#21160#21442#25968'      '
    TabOrder = 3
  end
  object btn_risTimeaxis: TButton
    Left = 424
    Top = 24
    Width = 113
    Height = 25
    Caption = #26102#38388#36724#27979#35797
    TabOrder = 4
    OnClick = btn_risTimeaxisClick
  end
  object btn1: TButton
    Left = 640
    Top = 48
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 5
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 40
    Top = 144
    Width = 929
    Height = 457
    Lines.Strings = (
      '<Response>'
      '  <Header>'
      '    <SourceSystem>HIS</SourceSystem>'
      '    <MessageID>31784</MessageID>'
      '  </Header>'
      '  <Body>'
      '    <ResultCode>0</ResultCode>'
      '    <ResultContent>'#25104#21151'</ResultContent>'
      '    <AdmInfo>'
      '      <AdmNo>12528188</AdmNo>'
      '      <AdmSerialNum>IP00303189</AdmSerialNum>'
      '      <DocumentID>203946</DocumentID>'
      '      <PatRowID>2920389</PatRowID>'
      '      <RegisterNo>02937036</RegisterNo>'
      '      <AdmName>'#27979#35797#19968'</AdmName>'
      '      <SexCode>1</SexCode>'
      '      <Age>27Y8M7D</Age>'
      '      <Birthday>1990-11-19</Birthday>'
      '      <AdmHospID/>'
      '      <AdmHospCode>45575553-0</AdmHospCode>'
      '      <AdmHospDesc>'#28145#22323#24066#20013#21307#38498'</AdmHospDesc>'
      '      <AdmStatusCode>A</AdmStatusCode>'
      '      <AdmStatusDesc>'#22312#23601#35786'</AdmStatusDesc>'
      '      <AdmTypeCode>I</AdmTypeCode>'
      '      <AdmTypeDesc>'#20303#38498'</AdmTypeDesc>'
      '      <FeeTypeRowID>2</FeeTypeRowID>'
      '      <FeeTypeCode>1</FeeTypeCode>'
      '      <FeeTypeDesc>'#21307#20445'</FeeTypeDesc>'
      '      <AdmDate>2017-01-19</AdmDate>'
      '      <AdmTime>09:14:00</AdmTime>'
      '      <InBedDate>2017-01-23</InBedDate>'
      '      <InBedTime>09:04:00</InBedTime>'
      '      <AdmDoctorRowID>175</AdmDoctorRowID>'
      '      <AdmDoctorCode>doctor</AdmDoctorCode>'
      '      <AdmDoctorDesc>doctor</AdmDoctorDesc>'
      '      <Height/>'
      '      <Weigth/>'
      '      <Diagnoses>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>E11.900</DiagnoseCode>'
      '          <DiagnoseDesc>2'#22411#31958#23615#30149'</DiagnoseDesc>'
      '          <DiagUserCode>demo</DiagUserCode>'
      '          <DiagUserDesc>Demo User</DiagUserDesc>'
      '          <DiagnoseDate>2017-01-19</DiagnoseDate>'
      '          <DiagnoseTime>09:57:27</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>J45.904</DiagnoseCode>'
      '          <DiagnoseDesc>'#25903#27668#31649#21742#21912#65292#21361#37325'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2017-03-07</DiagnoseDate>'
      '          <DiagnoseTime>15:45:34</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>J45.904</DiagnoseCode>'
      '          <DiagnoseDesc>'#25903#27668#31649#21742#21912#65292#21361#37325'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2017-03-07</DiagnoseDate>'
      '          <DiagnoseTime>15:46:11</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>I84.201</DiagnoseCode>'
      '          <DiagnoseDesc>'#28151#21512#30164'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2017-03-09</DiagnoseDate>'
      '          <DiagnoseTime>17:16:30</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>J40.x00</DiagnoseCode>'
      '          <DiagnoseDesc>'#25903#27668#31649#28814'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2017-11-30</DiagnoseDate>'
      '          <DiagnoseTime>17:31:17</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>J40.x00</DiagnoseCode>'
      '          <DiagnoseDesc>'#25903#27668#31649#28814'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2017-11-30</DiagnoseDate>'
      '          <DiagnoseTime>20:20:21</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>K74.600</DiagnoseCode>'
      '          <DiagnoseDesc>'#32925#30828#21270'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2017-12-01</DiagnoseDate>'
      '          <DiagnoseTime>17:34:31</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode>PRE</DiagnoseTypeCode>'
      '          <DiagnoseTypeDesc>'#21021#27493#35786#26029'</DiagnoseTypeDesc>'
      '          <DiagnoseCode>K27.503</DiagnoseCode>'
      '          <DiagnoseDesc>'#19978#28040#21270#36947#31359#23380'</DiagnoseDesc>'
      '          <DiagUserCode>doctor</DiagUserCode>'
      '          <DiagUserDesc>doctor</DiagUserDesc>'
      '          <DiagnoseDate>2018-04-23</DiagnoseDate>'
      '          <DiagnoseTime>22:36:26</DiagnoseTime>'
      '        </Diagnose>'
      '      </Diagnoses>'
      '      <VisitNum>1</VisitNum>'
      '      <ResidentDays>554</ResidentDays>'
      '      <DisDateMR/>'
      '      <DisTimeMR/>'
      '      <DisDateNurse/>'
      '      <DisTimeNurse/>'
      '      <DisDateDoctor/>'
      '      <DisTimeDoctor/>'
      '      <AdmDeptRowID>458</AdmDeptRowID>'
      '      <AdmDeptCode>'#27979#35797#30149#21306'</AdmDeptCode>'
      '      <AdmDeptDesc>'#27979#35797#30149#21306'</AdmDeptDesc>'
      '      <AdmWardRowID>27</AdmWardRowID>'
      '      <AdmWardCode>'#27979#35797#31185#25252#22763#31449'</AdmWardCode>'
      '      <AdmWardDesc>'#27979#35797#31185#25252#22763#31449'</AdmWardDesc>'
      '      <AdmRoomRowID>23</AdmRoomRowID>'
      '      <AdmRoomCode>1002</AdmRoomCode>'
      '      <AdmRoomDesc>1002</AdmRoomDesc>'
      '      <AdmBedRowID>27||2</AdmBedRowID>'
      '      <AdmBedNo>0002</AdmBedNo>'
      '      <CurrentDetpRowID>458</CurrentDetpRowID>'
      '      <CurrentDetpCode>'#27979#35797#30149#21306'</CurrentDetpCode>'
      '      <CurrentDetpDesc>'#27979#35797#30149#21306'</CurrentDetpDesc>'
      '      <CurrentWardRowID>458</CurrentWardRowID>'
      '      <CurrentWardCode>'#27979#35797#31185#25252#22763#31449'</CurrentWardCode>'
      '      <CurrentWardDesc>'#27979#35797#31185#25252#22763#31449'</CurrentWardDesc>'
      '      <CurrentRoomRowID>23</CurrentRoomRowID>'
      '      <CurrentRoomCode>1002</CurrentRoomCode>'
      '      <CurrentRoomDesc>1002</CurrentRoomDesc>'
      '      <CurrentBedRowID>27||2</CurrentBedRowID>'
      '      <CurrentBedNo>0002</CurrentBedNo>'
      '      <ClinicDisease/>'
      '      <OperationInfo/>'
      '      <OtherInfo/>'
      '      <DischCondit/>'
      '      <PhyAddress/>'
      '      <TimeRangeCode/>'
      '      <RegfeeNo/>'
      '    </AdmInfo>'
      '  </Body>'
      '</Response>')
    TabOrder = 6
  end
end
