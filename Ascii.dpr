program Ascii;

uses
  Forms,
  AsciiMain in 'AsciiMain.pas' {frmAsciiMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ASCII Chart';
  Application.CreateForm(TfrmAsciiMain, frmAsciiMain);
  Application.Run;
end.
