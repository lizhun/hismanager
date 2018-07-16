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
  resData: TValidateTicketRes;
begin
  pcount := ParamCount;
  if pcount > 0 then
  begin
    validateInfo := THisManager.MGetValidateInfo;
    resData := HisManager.THisManager.MValidateTicket('dzt_station_01', validateInfo.Ptickets, validateInfo.Pcode);
    if (resData.CanLogin) then
    begin
      ShowMessage('登录成功,医生工号：' + resData.ResText);

    end
    else
    begin
      ShowMessage('登录失败,错误消息:' + resData.ResText);
    end;
    FreeAndNil(validateInfo);
    FreeAndNil(resData);
  end
  else
  begin
    ShowMessage('没有找到ticket');
  end;

end;

end.

