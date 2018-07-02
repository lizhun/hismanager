unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB,HisEntity;

type
  TWJZForm = class(TForm)
    btn_saveacv: TButton;
    btn_localDB: TButton;
    lbledtAntCVResultID: TLabeledEdit;
    lbledtReportType: TLabeledEdit;
    lbledtStudyNo: TLabeledEdit;
    lbledtOrdRowID: TLabeledEdit;
    lbledtAuditDate: TLabeledEdit;
    lbledtAuditTime: TLabeledEdit;
    lbledtAuditDocCode: TLabeledEdit;
    lbledtAuditComment: TLabeledEdit;
    lbledtOrdName: TLabeledEdit;
    lbledtResult: TLabeledEdit;
    lbledtRanges: TLabeledEdit;
    lbledtOrdDoc: TLabeledEdit;
    lbledtOrdDate: TLabeledEdit;
    lbledtOrdTime: TLabeledEdit;
    lbledtColDoc: TLabeledEdit;
    lbledtColDate: TLabeledEdit;
    lbledtColTime: TLabeledEdit;
    lbledtRecDoc: TLabeledEdit;
    lbledtRecDate: TLabeledEdit;
    lbledtRecTime: TLabeledEdit;
    lbledtWarDate: TLabeledEdit;
    lbledtWarTime: TLabeledEdit;
    lbledtCheckDoc: TLabeledEdit;
    lbledtCheckDate: TLabeledEdit;
    lbledtCheckTime: TLabeledEdit;
    lbledtReportDoc: TLabeledEdit;
    lbledtReportDate: TLabeledEdit;
    lbledtReportTime: TLabeledEdit;
    lbledtSpecType: TLabeledEdit;
    lbledtComment: TLabeledEdit;
    lbledtNote: TLabeledEdit;
    con1: TADOConnection;
    lbledtAuditDocName: TLabeledEdit;
    lbledtDBServerHost: TLabeledEdit;
    lbledtDBUserName: TLabeledEdit;
    lbledtDBPassword: TLabeledEdit;
    lbledtDBInitiaBase: TLabeledEdit;
    btn_DBTest: TButton;
    btn_sendXml: TButton;
    mmo_request: TMemo;
    procedure btn_saveacvClick(Sender: TObject);
    function getcon:TADOConnection;
    function getData:TSaveAntCVResult;
    procedure btn_localDBClick(Sender: TObject);
    procedure btn_DBTestClick(Sender: TObject);
    procedure btn_sendXmlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WJZForm: TWJZForm;
  function  SaveAntCVResult(const Input: PWideChar): PWideChar; stdcall;external 'HISDHC.dll';

implementation


uses
  HisManager;

{$R *.dfm}

procedure TWJZForm.btn_saveacvClick(Sender: TObject);
var
    data:TSaveAntCVResult;
    con:TADOConnection;
begin
    data:=getData;
     mmo_request.Text := THisManager.MMakeSaveAntCVResultStr(data);
     if THisManager.MSaveAntCVResult(data) then
     begin
        ShowMessage('成功');
     end
     else
     begin
         ShowMessage('失败');
     end; 
end;

function TWJZForm.getcon:TADOConnection;
var
  con:TADOConnection;
begin
    con:=TADOConnection.Create(nil);
    con.ConnectionString:='Provider=SQLOLEDB.1;User ID='+ lbledtDBUserName.Text+
    ';Password='+ lbledtDBPassword.Text +
    ';Data Source='+ lbledtDBServerHost.Text +
    ';Initial Catalog='+ lbledtDBInitiaBase.Text;
    Result := con;
    con := nil;
end;

function TWJZForm.getData:TSaveAntCVResult;
var
    data:TSaveAntCVResult;
begin
    data:= TSaveAntCVResult.Create;
    data.AntCVResultID := lbledtAntCVResultID.Text;
    data.ReportType := lbledtReportType.Text;
    data.StudyNo := lbledtStudyNo.Text;
    data.OrdRowID := lbledtOrdRowID.Text;
    data.AuditDate := lbledtAuditDate.Text;
    data.AuditTime := lbledtAuditTime.Text;
    data.AuditDocCode := lbledtAuditDocCode.Text;
    data.AuditDocName := lbledtAuditDocName.Text;
    data.AuditComment := lbledtAuditComment.Text;
    data.OrdName := lbledtOrdName.Text;
    data.Result := lbledtResult.Text;
    data.Ranges := lbledtRanges.Text;
    data.OrdDoc := lbledtOrdDoc.Text;
    data.OrdDate := lbledtOrdDate.Text;
    data.OrdTime := lbledtOrdTime.Text;
    data.ColDoc := lbledtColDoc.Text;
    data.ColDate := lbledtColDate.Text;
    data.ColTime := lbledtColTime.Text;
    data.RecDoc := lbledtRecDoc.Text;
    data.RecDate := lbledtRecDate.Text;
    data.RecTime := lbledtRecTime.Text;
    data.WarDate := lbledtWarDate.Text;
    data.WarTime := lbledtWarTime.Text;
    data.CheckDoc := lbledtCheckDoc.Text;
    data.CheckDate := lbledtCheckDate.Text;
    data.CheckTime := lbledtCheckTime.Text;
    data.ReportDoc := lbledtReportDoc.Text;
    data.ReportDate := lbledtReportDate.Text;
    data.ReportTime := lbledtReportTime.Text;
    data.SpecType := lbledtSpecType.Text;
    data.Comment := lbledtComment.Text;
    data.Note := lbledtNote.Text;
    data.SendUser := 'tester';
    data.SendUserCode := 'testcode'; 
    Result:=data;
    data:= nil;
end;

procedure TWJZForm.btn_localDBClick(Sender: TObject);
var
    data:TSaveAntCVResult;
    con:TADOConnection;
begin
    data:=getData;
    con:=getcon;
    mmo_request.Text := THisManager.MMakeSaveAntCVResultStr(data);
    THisManager.SaveAntCVResultToDb(con,data);
    con.Close;
    con.Free;
    con := nil;

end;

procedure TWJZForm.btn_DBTestClick(Sender: TObject);
var
    con:TADOConnection;
begin
    con := getcon;
    try
        con.Open;
        con.Close;
        ShowMessage('连接成功');
    except  on e:Exception do
        ShowMessage('连接失败');
    end;
    con.Free;
    con := nil;
end;

procedure TWJZForm.btn_sendXmlClick(Sender: TObject);
var
  xmlstr:WideString;
  resultstr:WideString;
begin
  xmlstr:=mmo_request.Text;
  resultstr:=SaveAntCVResult(PWideChar(xmlstr));
  ShowMessage(resultstr);
end;

end.

