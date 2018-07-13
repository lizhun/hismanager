unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, StrUtils, HisManager, HisEntity;

type
  TLoginForm = class(TForm)
    btn_login: TButton;
    lbledt_ticket: TLabeledEdit;
    lbledt_code: TLabeledEdit;
    procedure btn_loginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation


{$R *.dfm}

procedure TLoginForm.btn_loginClick(Sender: TObject);
var
  pcount: Integer;
  validateInfo: TValidateInfo;
begin
  pcount := ParamCount;
  if pcount > 0 then
  begin
    validateInfo := THisManager.MGetValidateInfo;
    if (HisManager.THisManager.MValidateTicket('dzt_station_01', validateInfo.Ptickets, validateInfo.Pcode).CanLogin) then
    begin
      ShowMessage('登录成功');
    end
    else
    begin
      ShowMessage('登录失败');
    end;
  end
  else
  begin
    ShowMessage('没有找到ticket');
  end;

end;

end.

