unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, xmldom, XMLDoc, msxmldom, XMLIntf,
  HisEntity;

type
  TMainForm = class(TForm)
    btn_wzj: TButton;
    btn_login: TButton;
    btn_registerdoc: TButton;
    lbledt_input: TLabeledEdit;
    btn_risTimeaxis: TButton;
    btn1: TButton;
    mmo1: TMemo;
    btn_sendappbill: TButton;
    procedure btn_wzjClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure btn_registerdocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_risTimeaxisClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn_sendappbillClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  main, Login, RegDoc, RisFormU, SendAppDataU;

{$R *.dfm}

//危急值测试窗体
procedure TMainForm.btn_wzjClick(Sender: TObject);
var
  wzjfrom: TWJZForm;
begin
  wzjfrom := TWJZForm.Create(nil);
  wzjfrom.ShowModal;
  FreeAndNil(wzjfrom);
end;

//单点登录测试窗体
procedure TMainForm.btn_loginClick(Sender: TObject);
var
  loginForm: TLoginForm;
begin
  loginForm := TLoginForm.Create(nil);
  loginForm.ShowModal;
  FreeAndNil(loginForm);

end;

//注册文档测试窗体
procedure TMainForm.btn_registerdocClick(Sender: TObject);
var
  form: TRegDocFrom;
begin
  form := TRegDocFrom.Create(nil);
  form.ShowModal;
  FreeAndNil(form);

end;

//显示传入主程序参数
procedure TMainForm.FormCreate(Sender: TObject);
var
  i, pcount: Integer;
begin
  pcount := ParamCount;
  if ParamCount > 0 then
  begin
    lbledt_input.Text := ParamStr(1);
  end;
end;

procedure TMainForm.btn_risTimeaxisClick(Sender: TObject);
var
  form: TRisTimeForm;
begin
  form := TRisTimeForm.Create(nil);
  form.ShowModal;
  FreeAndNil(form);

end;

procedure TMainForm.btn1Click(Sender: TObject);
var
  resultstr: WideString;
  msgCode: WideString;
  xml: IXMLDocument;
  ansistr: string;
  res: TAdmRes;
  resitems: TArrayTDiagnoseRowInfo;
  admInfo: IXMLNode;
  itemnode: IXMLNode;
  i, len: Integer;
begin
  res := TAdmRes.Create;
  try
    msgCode := 'S1001';

    ansistr := UTF8Encode(mmo1.Text);
    xml := LoadXMLData(ansistr);
    if (xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['Body'].ChildNodes.Nodes['ResultCode'].text = '0') then
    begin
      admInfo := xml.ChildNodes.Nodes['Response'].ChildNodes.Nodes['Body'].ChildNodes.Nodes['AdmInfo'];
      res.AdmNo := admInfo.ChildNodes.Nodes['AdmNo'].Text;
      res.AdmSerialNum := admInfo.ChildNodes.Nodes['AdmSerialNum'].Text;
      res.DocumentID := admInfo.ChildNodes.Nodes['DocumentID'].Text;
      res.PatRowID := admInfo.ChildNodes.Nodes['PatRowID'].Text;
      res.RegisterNo := admInfo.ChildNodes.Nodes['RegisterNo'].Text;
      res.AdmName := admInfo.ChildNodes.Nodes['AdmName'].Text;
      res.SexCode := admInfo.ChildNodes.Nodes['SexCode'].Text;
      res.Age := admInfo.ChildNodes.Nodes['Age'].Text;
      res.Birthday := admInfo.ChildNodes.Nodes['Birthday'].Text;
      res.AdmHospID := admInfo.ChildNodes.Nodes['AdmHospID'].Text;
      res.AdmHospCode := admInfo.ChildNodes.Nodes['AdmHospCode'].Text;
      res.AdmHospDesc := admInfo.ChildNodes.Nodes['AdmHospDesc'].Text;
      res.AdmStatusCode := admInfo.ChildNodes.Nodes['AdmStatusCode'].Text;
      res.AdmStatusDesc := admInfo.ChildNodes.Nodes['AdmStatusDesc'].Text;
      res.AdmTypeCode := admInfo.ChildNodes.Nodes['AdmTypeCode'].Text;
      res.AdmTypeDesc := admInfo.ChildNodes.Nodes['AdmTypeDesc'].Text;
      res.FeeTypeRowID := admInfo.ChildNodes.Nodes['FeeTypeRowID'].Text;
      res.FeeTypeCode := admInfo.ChildNodes.Nodes['FeeTypeCode'].Text;
      res.FeeTypeDesc := admInfo.ChildNodes.Nodes['FeeTypeDesc'].Text;
      res.AdmDate := admInfo.ChildNodes.Nodes['AdmDate'].Text;
      res.AdmTime := admInfo.ChildNodes.Nodes['AdmTime'].Text;
      res.InBedDate := admInfo.ChildNodes.Nodes['InBedDate'].Text;
      res.InBedTime := admInfo.ChildNodes.Nodes['InBedTime'].Text;
      res.AdmDoctorRowID := admInfo.ChildNodes.Nodes['AdmDoctorRowID'].Text;
      res.AdmDoctorCode := admInfo.ChildNodes.Nodes['AdmDoctorCode'].Text;
      res.AdmDoctorDesc := admInfo.ChildNodes.Nodes['AdmDoctorDesc'].Text;
      res.Height := admInfo.ChildNodes.Nodes['Height'].Text;
      res.Weigth := admInfo.ChildNodes.Nodes['Weigth'].Text;
      res.VisitNum := admInfo.ChildNodes.Nodes['VisitNum'].Text;
      res.ResidentDays := admInfo.ChildNodes.Nodes['ResidentDays'].Text;
      res.DisDateMR := admInfo.ChildNodes.Nodes['DisDateMR'].Text;
      res.DisTimeMR := admInfo.ChildNodes.Nodes['DisTimeMR'].Text;
      res.DisDateNurse := admInfo.ChildNodes.Nodes['DisDateNurse'].Text;
      res.DisTimeNurse := admInfo.ChildNodes.Nodes['DisTimeNurse'].Text;
      res.DisDateDoctor := admInfo.ChildNodes.Nodes['DisDateDoctor'].Text;
      res.DisTimeDoctor := admInfo.ChildNodes.Nodes['DisTimeDoctor'].Text;
      res.AdmDeptRowID := admInfo.ChildNodes.Nodes['AdmDeptRowID'].Text;
      res.AdmDeptCode := admInfo.ChildNodes.Nodes['AdmDeptCode'].Text;
      res.AdmDeptDesc := admInfo.ChildNodes.Nodes['AdmDeptDesc'].Text;
      res.AdmWardRowID := admInfo.ChildNodes.Nodes['AdmWardRowID'].Text;
      res.AdmWardCode := admInfo.ChildNodes.Nodes['AdmWardCode'].Text;
      res.AdmWardDesc := admInfo.ChildNodes.Nodes['AdmWardDesc'].Text;
      res.AdmRoomRowID := admInfo.ChildNodes.Nodes['AdmRoomRowID'].Text;
      res.AdmRoomCode := admInfo.ChildNodes.Nodes['AdmRoomCode'].Text;
      res.AdmRoomDesc := admInfo.ChildNodes.Nodes['AdmRoomDesc'].Text;
      res.AdmBedRowID := admInfo.ChildNodes.Nodes['AdmBedRowID'].Text;
      res.AdmBedNo := admInfo.ChildNodes.Nodes['AdmBedNo'].Text;
      res.CurrentDetpRowID := admInfo.ChildNodes.Nodes['CurrentDetpRowID'].Text;
      res.CurrentDetpCode := admInfo.ChildNodes.Nodes['CurrentDetpCode'].Text;
      res.CurrentDetpDesc := admInfo.ChildNodes.Nodes['CurrentDetpDesc'].Text;
      res.CurrentWardRowID := admInfo.ChildNodes.Nodes['CurrentWardRowID'].Text;
      res.CurrentWardCode := admInfo.ChildNodes.Nodes['CurrentWardCode'].Text;
      res.CurrentWardDesc := admInfo.ChildNodes.Nodes['CurrentWardDesc'].Text;
      res.CurrentRoomRowID := admInfo.ChildNodes.Nodes['CurrentRoomRowID'].Text;
      res.CurrentRoomCode := admInfo.ChildNodes.Nodes['CurrentRoomCode'].Text;
      res.CurrentRoomDesc := admInfo.ChildNodes.Nodes['CurrentRoomDesc'].Text;
      res.CurrentBedRowID := admInfo.ChildNodes.Nodes['CurrentBedRowID'].Text;
      res.CurrentBedNo := admInfo.ChildNodes.Nodes['CurrentBedNo'].Text;
      res.ClinicDisease := admInfo.ChildNodes.Nodes['ClinicDisease'].Text;
      res.OperationInfo := admInfo.ChildNodes.Nodes['OperationInfo'].Text;
      res.OtherInfo := admInfo.ChildNodes.Nodes['OtherInfo'].Text;
      res.DischCondit := admInfo.ChildNodes.Nodes['DischCondit'].Text;
      res.PhyAddress := admInfo.ChildNodes.Nodes['PhyAddress'].Text;
      res.TimeRangeCode := admInfo.ChildNodes.Nodes['TimeRangeCode'].Text;
      res.RegfeeNo := admInfo.ChildNodes.Nodes['RegfeeNo'].Text;
      len := admInfo.ChildNodes.Nodes['Diagnoses'].ChildNodes.Count;
     // showmessage(inttostr(len));
      if len > 0 then
      begin
        SetLength(resitems, len);
        for i := 0 to len - 1 do
        begin
          resitems[i] := TDiagnoseRowInfo.Create;
          itemnode := admInfo.ChildNodes.Nodes['Diagnoses'].ChildNodes[i];
          resitems[i].DiagnoseTypeCode := itemnode.ChildNodes.Nodes['DiagnoseTypeCode'].Text;
          resitems[i].DiagnoseTypeDesc := itemnode.ChildNodes.Nodes['DiagnoseTypeDesc'].Text;
          resitems[i].DiagnoseCode := itemnode.ChildNodes.Nodes['DiagnoseCode'].Text;
          resitems[i].DiagnoseDesc := itemnode.ChildNodes.Nodes['DiagnoseDesc'].Text;
          resitems[i].DiagUserCode := itemnode.ChildNodes.Nodes['DiagUserCode'].Text;
          resitems[i].DiagUserDesc := itemnode.ChildNodes.Nodes['DiagUserDesc'].Text;
          resitems[i].DiagnoseDate := itemnode.ChildNodes.Nodes['DiagnoseDate'].Text;
          resitems[i].DiagnoseTime := itemnode.ChildNodes.Nodes['DiagnoseTime'].Text;
        end;
        res.Diagnoses := resitems;
      end;
    end;
    showmessage(inttostr(length(res.Diagnoses)));
  except

  end;
end;

procedure TMainForm.btn_sendappbillClick(Sender: TObject);
var
  form: Tfrm_SendAppData;
begin
  form := Tfrm_SendAppData.Create(nil);
  form.ShowModal;
  FreeAndNil(form);

end;

end.

