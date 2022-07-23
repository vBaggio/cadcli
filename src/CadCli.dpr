program CadCli;

uses
  Vcl.Forms,
  fMain in 'View\fMain.pas' {frmMain},
  uCliente in 'Model\uCliente.pas',
  fCliente in 'View\fCliente.pas' {frmCliente},
  uEndereco in 'Model\uEndereco.pas',
  DataModule.Geral in 'DAO\DataModule.Geral.pas' {dmGeral: TDataModule},
  uClienteController in 'Controller\uClienteController.pas',
  uClienteDAO in 'DAO\uClienteDAO.pas',
  fListaClientes in 'View\fListaClientes.pas' {frmListCli},
  uUtilities in 'Utils\uUtilities.pas',
  uListaClientesController in 'Controller\uListaClientesController.pas',
  DataModule.VIACEP in 'Services\DataModule.VIACEP.pas' {dmVIACEP: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmGeral, dmGeral);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmVIACEP, dmVIACEP);
  Application.Run;
end.
