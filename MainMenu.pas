unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMainForm = class(TForm)
    btn_wzj: TButton;
    btn_login: TButton;
    btn_registerdoc: TButton;
    procedure btn_wzjClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure btn_registerdocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  main,Login,RegDoc;

{$R *.dfm}

procedure TMainForm.btn_wzjClick(Sender: TObject);
var
  wzjfrom: TWJZForm;
begin
  wzjfrom := TWJZForm.Create(nil);
  wzjfrom.ShowModal;
  FreeAndNil(wzjfrom);
end;

procedure TMainForm.btn_loginClick(Sender: TObject);
var
  loginForm: TLoginForm;
begin
  loginForm := TLoginForm.Create(nil);
  loginForm.ShowModal;
  FreeAndNil(loginForm);

end;

procedure TMainForm.btn_registerdocClick(Sender: TObject);
var
  form: TRegDocFrom;
begin
  form := TRegDocFrom.Create(nil);
  form.ShowModal;
  FreeAndNil(form);

end;

end.

