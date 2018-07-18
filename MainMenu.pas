unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, xmldom, XMLDoc, msxmldom, XMLIntf,
  HisEntity;

type
  TMainForm = class(TForm)
    btn_wzj: TButton;
    btn_login: TButton;
    btn_registerdoc: TButton;
    lbledt_input: TLabeledEdit;
    btn_risTimeaxis: TButton;
    procedure btn_wzjClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure btn_registerdocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  main, Login, RegDoc, RisFormU;

{$R *.dfm}

//危急值测试窗体
procedure TMainForm.btn_wzjClick(Sender: TObject);
var
  wzjfrom: TWJZForm;
begin
  wzjfrom := TWJZForm.Create(nil);
  wzjfrom.ShowModal;
  FreeAndNil(wzjfrom);
end;

//单点登录测试窗体
procedure TMainForm.btn_loginClick(Sender: TObject);
var
  loginForm: TLoginForm;
begin
  loginForm := TLoginForm.Create(nil);
  loginForm.ShowModal;
  FreeAndNil(loginForm);

end;

//注册文档测试窗体
procedure TMainForm.btn_registerdocClick(Sender: TObject);
var
  form: TRisTimeForm;
begin
  form := TRisTimeForm.Create(nil);
  form.ShowModal;
  FreeAndNil(form);

end;

//显示传入主程序参数
procedure TMainForm.FormCreate(Sender: TObject);
var
  i, pcount: Integer;
begin
  pcount := ParamCount;
  if ParamCount > 0 then
  begin
    lbledt_input.Text := ParamStr(1);
  end;
end;

end.

