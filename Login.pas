unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, StrUtils;

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

uses
  HisManager;
{$R *.dfm}

procedure TLoginForm.btn_loginClick(Sender: TObject);
var
  i, pcount: Integer;
  pcode, pticket, pinput: AnsiString;
  plist: TStringList;
  pcodelist: TStringList;
  pticketlist: TStringList;
begin
  pcount := ParamCount;
  plist := TStringList.Create;
  if pcount > 1 then
  begin
    //lbledt_input.Text := ParamStr(1);
    pinput := ParamStr(1);
    ExtractStrings(['&'], [' '], PChar(pinput), plist);
    if plist.Count > 1 then
    begin
      ExtractStrings(['&'], [' '], PChar(plist[0]), pticketlist);
      ExtractStrings(['&'], [' '], PChar(plist[1]), pcodelist);
      if pticketlist[0] = 'ptickets' then
      begin
        lbledt_ticket.Text := pticketlist[1];
      end
      else
      begin
        lbledt_code.Text := pticketlist[1];
      end;
      if pcodelist[0] = 'pcode' then
      begin
        lbledt_code.Text := pcodelist[1];
      end
      else
      begin
        lbledt_ticket.Text := pcodelist[1];
      end;

      if (HisManager.THisManager.MValidateTicket('dzt_station_01', lbledt_ticket.Text, lbledt_code.Text).Sucess) then
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
  end
  else
  begin
    ShowMessage('没有找到ticket');
  end;

end;

end.

