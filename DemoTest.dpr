program DemoTest;

uses
  Forms,
  main in 'main.pas' {WJZForm},
  HisEntity in 'HisEntity.pas',
  HisManager in 'HisManager.pas',
  MainMenu in 'MainMenu.pas' {MainForm},
  Login in 'Login.pas' {LoginForm},
  RegDoc in 'RegDoc.pas' {RegDocFrom},
  RisFormU in 'RisFormU.pas' {RisTimeForm},
  SendAppDataU in 'SendAppDataU.pas' {frm_SendAppData};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TRegDocFrom, RegDocFrom);
  Application.CreateForm(TRisTimeForm, RisTimeForm);
  Application.CreateForm(Tfrm_SendAppData, frm_SendAppData);
  Application.Run;
end.
