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
begin
  data := TRegisterDocument.Create;
  //赋值处理...

  SetLength(items, 2);
  items[0] := TDiagnoseRowInfo.Create;
  //赋值处理。。
  items[1] := TDiagnoseRowInfo.Create;
  //赋值处理。。。
  data.DiagnoseRowInfo := items;
  if (THisManager.MRegisterDocument(data)) then
  begin
    ShowMessage('登录成功');
  end
  else
  begin
    ShowMessage('登录失败');
  end;

end;

end.

