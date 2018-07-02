unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

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
begin
  if (HisManager.THisManager.MValidateTicket('dzt_station_01',lbledt_ticket.Text, lbledt_code.Text)) then
  begin
    ShowMessage('µÇÂ¼³É¹¦');
  end
  else
  begin
    ShowMessage('µÇÂ¼Ê§°Ü');
  end;
end;

end.

