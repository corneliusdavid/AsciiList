unit AsciiMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, GFormSav, IniFiles;

type
  TfrmAsciiMain = class(TForm)
    lstAscii: TListBox;
    mnuPopup: TPopupMenu;
    itmColumns: TMenuItem;
    itm2Col: TMenuItem;
    itm3Col: TMenuItem;
    itm4Col: TMenuItem;
    itm5Col: TMenuItem;
    itm6Col: TMenuItem;
    itm7Col: TMenuItem;
    N81: TMenuItem;
    FormSaver: TFormSaver;
    procedure FormActivate(Sender: TObject);
    procedure itmColClick(Sender: TObject);
  private
    SettingsFile: TIniFile;
  end;

var
  frmAsciiMain: TfrmAsciiMain;

implementation

{$R *.DFM}

procedure TfrmAsciiMain.FormActivate(Sender: TObject);
var
  i: Byte;
begin
  lstAscii.Align := alClient;

  lstAscii.Items.Clear;
  for i := 1 to 255 do
    lstAscii.Items.Add(IntToStr(i) + ' = ' + Chr(i));

  SettingsFile := TIniFile.Create(FormSaver.IniFile + '.INI');
  lstAscii.Columns := SettingsFile.ReadInteger('AsciiList', 'Columns', 4);
  SettingsFile.Free;
end;

procedure TfrmAsciiMain.itmColClick(Sender: TObject);
begin
  lstAscii.Columns := (Sender as TMenuItem).Tag;
  SettingsFile := TIniFile.Create(FormSaver.IniFile + '.INI');
  SettingsFile.WriteInteger('AsciiList', 'Columns', lstAscii.Columns);
  SettingsFile.Free;
end;

end.
