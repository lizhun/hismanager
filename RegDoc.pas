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
  //��ֵ����...
  admRes := THisManager.MGetAdmInfo('��Ϻ�');
  if Length(admRes.Diagnoses) > 0 then
  begin
    data.DiagnoseRowInfo := admRes.Diagnoses;
    if (THisManager.MRegisterDocument(data)) then
    begin
      ShowMessage('�ɹ�');
    end
    else
    begin
      ShowMessage('ʧ��');
    end;
  end
  else
  begin
    ShowMessage('û����ҽ�����Ϣ�������ĵ��޷�����');
  end;
  FreeAndNil(data);
  FreeAndNil(admRes);
end;

end.

