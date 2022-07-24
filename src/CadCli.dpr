program CadCli;

uses
  Vcl.Forms,
  fMain in 'View\fMain.pas' {frmMain},
  uCliente in 'Model\uCliente.pas',
  fCliente in 'View\fCliente.pas' {frmCliente},
  uEndereco in 'Model\uEndereco.pas',
  dmGeral in 'DAO\dmGeral.pas' {dtmGeral: TDataModule},
  uClienteController in 'Controller\uClienteController.pas',
  uClienteDAO in 'DAO\uClienteDAO.pas',
  fListaClientes in 'View\fListaClientes.pas' {frmListCli},
  uUtilities in 'Utils\uUtilities.pas',
  uListaClientesController in 'Controller\uListaClientesController.pas',
  dmViacep in 'Services\dmViacep.pas' {dtmVIACEP: TDataModule},
  uConfigEmail in 'Model\uConfigEmail.pas',
  uEnviarEmail in 'Services\uEnviarEmail.pas',
  uConfigEmailDAO in 'DAO\uConfigEmailDAO.pas',
  fConfigEmail in 'View\fConfigEmail.pas' {frmConfigEmail},
  uEmailController in 'Controller\uEmailController.pas',
  fEmail in 'View\fEmail.pas' {frmEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmGeral, dtmGeral);
  Application.CreateForm(TdtmVIACEP, dtmVIACEP);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmConfigEmail, frmConfigEmail);
  Application.CreateForm(TfrmEmail, frmEmail);
  Application.Run;
end.
