unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TMainForm = class(TForm)
    btn_wzj: TButton;
    btn_login: TButton;
    btn_registerdoc: TButton;
    lbledt_input: TLabeledEdit;
    btn_open: TButton;
    btn1: TButton;
    procedure btn_wzjClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure btn_registerdocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_openClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  main, Login, RegDoc;

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

procedure TMainForm.FormCreate(Sender: TObject);
var
  i, pcount: Integer;
begin
  //ShowMessage(IntToStr(ParamCount));
  pcount := ParamCount;
  if ParamCount > 0 then
  begin
    lbledt_input.Text := ParamStr(1);
  end;

end;

procedure TMainForm.btn_openClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'DemoTest.exe', PAnsiChar(lbledt_input.Text), nil, SW_SHOWNORMAL);
end;

procedure TMainForm.btn1Click(Sender: TObject);
var
  Buffer: array[0..255] of char;
  tmpstr: string;
  ModuleName: string;
begin
  SetLength(ModuleName, 255);
  GetModuleFileName(HInstance, PChar(ModuleName), Length(ModuleName));
  ShowMessage(ExtractFileDir(ModuleName));
end;

end.

