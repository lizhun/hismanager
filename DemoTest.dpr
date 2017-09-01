program DemoTest;

uses
  Forms,
  main in 'main.pas' {Form1},
  HisEntity in 'HisEntity.pas',
  HisManager in 'HisManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
