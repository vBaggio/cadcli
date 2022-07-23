unit fListaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids,

  uListaClientesController, Vcl.AppEvnts;

type
  TfrmListCli = class(TForm)
    pnlFoot: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    stgClientes: TStringGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atualizarGrid;
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FController :TListaClientesController;
  public
    { Public declarations }
  end;

var
  frmListCli: TfrmListCli;
  procedure call_listaclientes;

implementation

{$R *.dfm}

uses fCliente;

procedure call_listaclientes;
begin
  try
    frmListCli := TfrmListCli.Create(nil);
    frmListCli.FController := TListaClientesController.Create;
    frmListCli.ShowModal;
  finally
    FreeAndNil(frmListCli);
  end;
end;

procedure TfrmListCli.atualizarGrid;
begin
  FController.refreshClientes(stgClientes, '');
end;

procedure TfrmListCli.btnNovoClick(Sender: TObject);
begin
  call_cliente(0);
  atualizarGrid;
end;

procedure TfrmListCli.btnEditarClick(Sender: TObject);
begin
  var LId :integer := strToIntDef(stgClientes.Cells[0, stgClientes.Row], 0);

  if LId > 0 then
    call_cliente(LId);

  atualizarGrid;
end;

procedure TfrmListCli.btnExcluirClick(Sender: TObject);
begin
  var LId :integer := strToIntDef(stgClientes.Cells[0, stgClientes.Row], 0);

  if LId > 0 then
    if MessageDlg('Deseja Excluir o Cliente ' + stgClientes.Cells[0, stgClientes.Row] + ' ?' ,
        mtConfirmation, [mbOK, mbCancel], 0) = mrOk
    then
      FController.deletarCliente(LId);

  atualizarGrid;
end;

procedure TfrmListCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FController);
end;

procedure TfrmListCli.FormShow(Sender: TObject);
begin
  atualizarGrid;
end;

end.
