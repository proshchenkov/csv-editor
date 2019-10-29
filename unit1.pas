unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids,
  Menus, ComCtrls, ExtCtrls, StdCtrls, LazFileUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    OpenDialog1: TOpenDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
  private

  public

  end;

var
  Form1: TForm1;
  a: integer = 1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if (a = 1) then
      StringGrid1.LoadFromCSVFile(OpenDialog1.FileName, ',', False);
    if (a = 2) then
      StringGrid1.LoadFromCSVFile(OpenDialog1.FileName, ';', False);
    if (a = 3) then
      StringGrid1.LoadFromCSVFile(OpenDialog1.FileName, #9, False);
  end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if (a = 1) then
      StringGrid1.SaveToCSVFile(SaveDialog1.FileName, ',', False);
    if (a = 2) then
      StringGrid1.SaveToCSVFile(SaveDialog1.FileName, ';', False);
    if (a = 3) then
      StringGrid1.SaveToCSVFile(SaveDialog1.FileName, #9, False);
  end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  StringGrid1.RowCount := StringGrid1.RowCount + 1;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  StringGrid1.ColCount := StringGrid1.ColCount + 1;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  StringGrid1.RowCount := StringGrid1.RowCount - 1;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  StringGrid1.ColCount := StringGrid1.ColCount - 1;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
    a := 1;
  if RadioButton2.Checked then
    a := 2;
  if RadioButton3.Checked then
    a := 3;
end;

procedure TForm1.StringGrid1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text :=
    ' ' + StringGrid1.Col.ToString + ' ' + StringGrid1.Row.ToString;
end;

procedure TForm1.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  StatusBar1.Panels[0].Text :=
    ' ' + StringGrid1.Col.ToString + ' ' + StringGrid1.Row.ToString;
end;

end.
