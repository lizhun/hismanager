object MainForm: TMainForm
  Left = 226
  Top = 196
  Width = 1176
  Height = 733
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
  object btn1: TButton
    Left = 456
    Top = 40
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 4
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 40
    Top = 144
    Width = 697
    Height = 401
    Lines.Strings = (
      '<Response>'
      '  <Header>'
      '    <SourceSystem>HIS</SourceSystem>'
      '    <MessageID>546</MessageID>'
      '  </Header>'
      '  <Body>'
      '    <ResultCode>0</ResultCode>'
      '    <ResultContent>'#25104#21151'</ResultContent>'
      '    <AdmInfo>'
      '      <AdmNo>11819534</AdmNo>'
      '      <AdmSerialNum>IP00291276</AdmSerialNum>'
      '      <DocumentID>198172</DocumentID>'
      '      <PatRowID>2697938</PatRowID>'
      '      <RegisterNo>02714673</RegisterNo>'
      '      <AdmName>'#40644#38886#38125'</AdmName>'
      '      <SexCode>1</SexCode>'
      '      <Age>53Y2M27D</Age>'
      '      <Birthday>1965-03-09</Birthday>'
      '      <AdmHospID/>'
      '      <AdmHospCode>12440300455755530N</AdmHospCode>'
      '      <AdmHospDesc>'#28145#22323#24066#20013#21307#38498'</AdmHospDesc>'
      '      <AdmStatusCode>D</AdmStatusCode>'
      '      <AdmStatusDesc>'#20986#38498'</AdmStatusDesc>'
      '      <AdmTypeCode>I</AdmTypeCode>'
      '      <AdmTypeDesc>'#20303#38498'</AdmTypeDesc>'
      '      <FeeTypeRowID>1</FeeTypeRowID>'
      '      <FeeTypeCode>9</FeeTypeCode>'
      '      <FeeTypeDesc>'#33258#36153'</FeeTypeDesc>'
      '      <AdmDate>2016-09-19</AdmDate>'
      '      <AdmTime>09:51:41</AdmTime>'
      '      <InBedDate>2016-09-19</InBedDate>'
      '      <InBedTime>10:21:00</InBedTime>'
      '      <AdmDoctorRowID>196</AdmDoctorRowID>'
      '      <AdmDoctorCode>001217</AdmDoctorCode>'
      '      <AdmDoctorDesc>'#38472#20142'</AdmDoctorDesc>'
      '      <Height/>'
      '      <Weigth/>'
      '      <Diagnoses>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode/>'
      '          <DiagnoseTypeDesc/>'
      '          <DiagnoseCode>B18.10003</DiagnoseCode>'
      '          <DiagnoseDesc>'#30149#27602#24615#32925#28814#65292#20057#22411#65292#24930#24615#65288#37325#24230#65289'</DiagnoseDesc>'
      '          <DiagUserCode>001217</DiagUserCode>'
      '          <DiagUserDesc>'#38472#20142'</DiagUserDesc>'
      '          <DiagnoseDate>2016-09-19</DiagnoseDate>'
      '          <DiagnoseTime>10:31:29</DiagnoseTime>'
      '        </Diagnose>'
      '        <Diagnose>'
      '          <DiagnoseTypeCode/>'
      '          <DiagnoseTypeDesc/>'
      '          <DiagnoseCode>B18.10003</DiagnoseCode>'
      '          <DiagnoseDesc>'#30149#27602#24615#32925#28814#65292#20057#22411#65292#24930#24615#65288#37325#24230#65289'</DiagnoseDesc>'
      '          <DiagUserCode>001217</DiagUserCode>'
      '          <DiagUserDesc>'#38472#20142'</DiagUserDesc>'
      '          <DiagnoseDate>2016-09-19</DiagnoseDate>'
      '          <DiagnoseTime>10:31:29</DiagnoseTime>'
      '        </Diagnose>'
      '      </Diagnoses>'
      '      <VisitNum>1</VisitNum>'
      '      <ResidentDays>30</ResidentDays>'
      '      <DisDateMR>2016-10-18</DisDateMR>'
      '      <DisTimeMR>09:46:14</DisTimeMR>'
      '      <DisDateNurse>2016-10-18</DisDateNurse>'
      '      <DisTimeNurse>09:46:14</DisTimeNurse>'
      '      <DisDateDoctor>2016-10-18</DisDateDoctor>'
      '      <DisTimeDoctor>09:08:00</DisTimeDoctor>'
      '      <AdmDeptRowID>30</AdmDeptRowID>'
      '      <AdmDeptCode>'#32925#30149#31185#19968#30149#21306'</AdmDeptCode>'
      '      <AdmDeptDesc>'#32925#30149#31185#19968#30149#21306'</AdmDeptDesc>'
      '      <AdmWardRowID>9</AdmWardRowID>'
      '      <AdmWardCode>'#32925#30149#19968#31185#25252#22763#31449'</AdmWardCode>'
      '      <AdmWardDesc>'#32925#30149#31185#19968#30149#21306#25252#22763#31449'</AdmWardDesc>'
      '      <AdmRoomRowID>139</AdmRoomRowID>'
      '      <AdmRoomCode>209</AdmRoomCode>'
      '      <AdmRoomDesc>209</AdmRoomDesc>'
      '      <AdmBedRowID>9||27</AdmBedRowID>'
      '      <AdmBedNo>27'#24202'</AdmBedNo>'
      '      <CurrentDetpRowID>30</CurrentDetpRowID>'
      '      <CurrentDetpCode>'#32925#30149#31185#19968#30149#21306'</CurrentDetpCode>'
      '      <CurrentDetpDesc>'#32925#30149#31185#19968#30149#21306'</CurrentDetpDesc>'
      '      <CurrentWardRowID>30</CurrentWardRowID>'
      '      <CurrentWardCode>'#32925#30149#19968#31185#25252#22763#31449'</CurrentWardCode>'
      '      <CurrentWardDesc>'#32925#30149#31185#19968#30149#21306#25252#22763#31449'</CurrentWardDesc>'
      '      <CurrentRoomRowID>139</CurrentRoomRowID>'
      '      <CurrentRoomCode>209</CurrentRoomCode>'
      '      <CurrentRoomDesc>209</CurrentRoomDesc>'
      '      <CurrentBedRowID>9||27</CurrentBedRowID>'
      '      <CurrentBedNo>27'#24202'</CurrentBedNo>'
      '      <ClinicDisease/>'
      '      <OperationInfo/>'
      '      <OtherInfo/>'
      '      <DischCondit>3717</DischCondit>'
      '      <PhyAddress/>'
      '      <TimeRangeCode/>'
      '      <RegfeeNo/>'
      '    </AdmInfo>'
      '  </Body>'
      '</Response>')
    TabOrder = 5
  end
end
