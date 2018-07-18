unit RegDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HisEntity, StdCtrls, Buttons;

type
  TRegDocFrom = class(TForm)
    btn_reg: TBitBtn;
    procedure btn_regClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegDocFrom: TRegDocFrom;

implementation

uses
  HisManager;

{$R *.dfm}

procedure TRegDocFrom.btn_regClick(Sender: TObject);
var
  data: TRegisterDocument;
  items: TArrayTDiagnoseRowInfo;
  admRes: TAdmRes;
begin
  data := TRegisterDocument.Create;
  //赋值处理...
  admRes := THisManager.MGetAdmInfo('诊断号');
  if Length(admRes.Diagnoses) > 0 then
  begin
    data.DiagnoseRowInfo := admRes.Diagnoses;
    if (THisManager.MRegisterDocument(data)) then
    begin
      ShowMessage('成功');
    end
    else
    begin
      ShowMessage('失败');
    end;
  end
  else
  begin
    ShowMessage('没有西医诊断信息，共享文档无法生成');
  end;
  FreeAndNil(data);
  FreeAndNil(admRes);
end;

end.

