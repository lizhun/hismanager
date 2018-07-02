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
  //��ֵ����...

  SetLength(items, 2);
  items[0] := TDiagnoseRowInfo.Create;
  //��ֵ������
  items[1] := TDiagnoseRowInfo.Create;
  //��ֵ��������
  data.DiagnoseRowInfo := items;
  if (THisManager.MRegisterDocument(data)) then
  begin
    ShowMessage('��¼�ɹ�');
  end
  else
  begin
    ShowMessage('��¼ʧ��');
  end;

end;

end.

