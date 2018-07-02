program DemoTest;

uses
  Forms,
  main in 'main.pas' {WJZForm},
  HisEntity in 'HisEntity.pas',
  HisManager in 'HisManager.pas',
  MainMenu in 'MainMenu.pas' {MainForm},
  Login in 'Login.pas' {LoginForm},
  RegDoc in 'RegDoc.pas' {RegDocFrom};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TRegDocFrom, RegDocFrom);
  Application.Run;
end.
