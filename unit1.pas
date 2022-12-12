unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  FileCtrl, EditBtn;

type

  { TForm1 }

  TForm1 = class(TForm)
    DirectoryEdit1: TDirectoryEdit;
    FileListBox1: TFileListBox;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  DirectoryEdit1.Directory := Application.Location;

  FileListBox1.Directory := DirectoryEdit1.Directory;
end;

procedure TForm1.DirectoryEdit1Change(Sender: TObject);
begin
  //FileListBox1.Mask:='*.PNG;*.bmp;*.jpg';
  FileListBox1.Directory := DirectoryEdit1.Directory;
  FileListBox1.Refresh;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
  try
    Image1.Picture.LoadFromFile(FileListBox1.FileName);
  except
     on E:Exception do ShowMessage(E.Message);
  end;

end;

end.


