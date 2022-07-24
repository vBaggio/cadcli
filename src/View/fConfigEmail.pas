unit fConfigEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  uEmailController;

type
  TfrmConfigEmail = class(TForm)
    edtServidor: TEdit;
    Label1: TLabel;
    edtPorta: TEdit;
    Label2: TLabel;
    edtUsuario: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    edtFromName: TEdit;
    Label5: TLabel;
    edtFromEmail: TEdit;
    Label6: TLabel;
    chkSSL: TCheckBox;
    chkTLS: TCheckBox;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FController: TEmailController;
    procedure carregarConfigs;
    procedure salvarConfigs;
  public
    { Public declarations }
  end;

var
  frmConfigEmail: TfrmConfigEmail;
  procedure call_configEmail;

implementation

{$R *.dfm}

procedure call_configEmail;
begin
  try
    frmConfigEmail := TfrmConfigEmail.Create(nil);
    frmConfigEmail.FController := TEmailController.Create;
    frmConfigEmail.ShowModal;
  finally
    FreeAndNil(frmConfigEmail);
  end;
end;

procedure TfrmConfigEmail.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigEmail.btnSalvarClick(Sender: TObject);
begin
  salvarConfigs;
end;

procedure TfrmConfigEmail.carregarConfigs;
begin
  with FController.ConfigEmail do
  begin
    edtServidor.Text  := Servidor;
    edtPorta.Text     := intToStr(Porta);
    edtUsuario.Text   := Usuario;
    edtSenha.Text     := Senha;
    edtFromName.Text  := FromName;
    edtFromEmail.Text := FromEmail;
    chkSSL.Checked    := SSL;
    chkTLS.Checked    := TLS;
  end;
end;

procedure TfrmConfigEmail.salvarConfigs;
begin
  with FController.ConfigEmail do
  begin
    Servidor  := edtServidor.Text;
    Porta     := strToIntDef(edtPorta.Text, 0);
    Usuario   := edtUsuario.Text;
    Senha     := edtSenha.Text;
    FromName  := edtFromName.Text;
    FromEmail := edtFromEmail.Text;
    SSL       := chkSSL.Checked;
    TLS       := chkTLS.Checked;
  end;

  var AErro:string := '';

  if not FController.salvarConfig(AErro) then
    ShowMessage(AErro)
  else
    Close;
end;

procedure TfrmConfigEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FController);
end;

procedure TfrmConfigEmail.FormShow(Sender: TObject);
begin
  carregarConfigs;
end;

end.
