unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TfrmMain = class(TForm)
    menuMain: TMainMenu;
    Cliente1: TMenuItem;
    Cadastrar1: TMenuItem;
    Configuraes1: TMenuItem;
    Email1: TMenuItem;
    Cadastrar2: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

end.