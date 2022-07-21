unit fListaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmListCli = class(TForm)
    dbgClientes: TDBGrid;
    pnlFoot: TPanel;
    btnNovo: TButton;
    Button1: TButton;
    Button2: TButton;
    dsClientes: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListCli: TfrmListCli;

implementation

{$R *.dfm}

end.
