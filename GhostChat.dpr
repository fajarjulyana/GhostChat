program GhostChat;

uses
  Forms,
  source in 'src\source.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ghost Chat';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
