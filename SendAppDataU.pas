unit SendAppDataU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HisManager, HisEntity, StdCtrls;

type
  Tfrm_SendAppData = class(TForm)
    btn_send: TButton;
    procedure btn_sendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_SendAppData: Tfrm_SendAppData;

implementation

{$R *.dfm}

procedure Tfrm_SendAppData.btn_sendClick(Sender: TObject);
var
  data: TSendAppBillReq;
begin
  data := TSendAppBillReq.Create;
  if THisManager.MSendAppBill(data) then
  begin
    ShowMessage('发送成功');
  end
  else
  begin
    ShowMessage('发送失败');
  end;
end;

end.

