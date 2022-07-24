unit fCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient,

  uClienteController;

type
  TfrmCliente = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtFone: TEdit;
    Label3: TLabel;
    edtBairro: TEdit;
    Label4: TLabel;
    edtIdentidade: TEdit;
    Label5: TLabel;
    edtEmail: TEdit;
    Label6: TLabel;
    edtCidade: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtUF: TEdit;
    Label9: TLabel;
    edtNumero: TEdit;
    Label10: TLabel;
    edtCompl: TEdit;
    Label11: TLabel;
    edtLogradouro: TEdit;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    edtPais: TEdit;
    Label13: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtCEP: TMaskEdit;
    edtCPF: TMaskEdit;
    chkEmail: TCheckBox;
    procedure edtFoneExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController: TClienteController;
    procedure CarregarDados;
    procedure CarregarEndereco;
    procedure SalvarDados;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;
  procedure call_cliente(AId: integer = 0);

implementation

{$R *.dfm}

uses
  uUtilities;

procedure call_cliente(AId: integer);
begin
  try
    frmCliente := TfrmCliente.Create(nil);
    frmCliente.FController := TClienteController.Create(Aid);

    frmCliente.chkEmail.Checked := AId = 0;
    if frmCliente.chkEmail.Checked  then
      frmCliente.Caption := 'Novo Cliente'
    else
      frmCliente.Caption := 'Atualização de Cadastro';

    frmCliente.ShowModal;
  finally
    FreeAndNil(frmCliente);
  end;
end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
begin
  SalvarDados;
end;

procedure TfrmCliente.Button1Click(Sender: TObject);
begin
  FController.enviarEmail;
end;

procedure TfrmCliente.CarregarDados;
begin
  with FController.Cliente do
  begin
    edtNome.Text       := Nome;
    edtFone.Text       := FormatarTelefone(Telefone);
    edtCPF.Text        := CPF;
    edtIdentidade.Text := Identidade;
    edtEmail.Text      := Email;
  end;

  CarregarEndereco;
end;

procedure TfrmCliente.CarregarEndereco;
begin
  edtCEP.Text        := '';
  edtLogradouro.Text := '';
  edtNumero.Text     := '';
  edtCompl.Text      := '';
  edtBairro.Text     := '';
  edtCidade.Text     := '';
  edtUF.Text         := '';
  edtPais.Text       := '';

  if FController.Cliente.Enderecos.Count > 0 then
    with FController.Cliente.Enderecos.Items[0] do
    begin
      edtCEP.Text        := CEP;
      edtLogradouro.Text := Logradouro;
      edtNumero.Text     := Numero;
      edtCompl.Text      := Complemento;
      edtBairro.Text     := Bairro;
      edtCidade.Text     := Cidade;
      edtUF.Text         := UF;
      edtPais.Text       := Pais;
    end;
end;

procedure TfrmCliente.SalvarDados;
var erro:string;
begin
  with FController.Cliente do
  begin
    Nome       := edtNome.Text;
    Telefone   := SomenteNumeros(edtFone.Text);
    CPF        := edtCPF.Text;
    Identidade := edtIdentidade.Text;
    Email      := edtEmail.Text ;

    with Enderecos.Items[0] do
    begin
      CEP         := edtCEP.Text ;
      Logradouro  := edtLogradouro.Text;
      Numero      := edtNumero.Text ;
      Complemento := edtCompl.Text;
      Bairro      := edtBairro.Text;
      Cidade      := edtCidade.Text ;
      UF          := edtUF.Text;
      Pais        := edtPais.Text;
    end;
  end;

  if not FController.salvarCliente(Erro) then
    ShowMessage(Erro)
  else
  begin
    if chkEmail.Checked then
      FController.enviarEmail;

    Close;
  end;
end;

procedure TfrmCliente.edtCEPExit(Sender: TObject);
begin
  if MessageDlg('Consultar CEP por API ?' ,
    mtConfirmation, [mbOK, mbCancel], 0) = mrOk
  then
    if FController.consultarCEP(edtCEP.Text) then
    begin
      CarregarEndereco;

      edtNumero.SetFocus;
    end
    else
      ShowMessage('Erro ao consultar CEP');
end;

procedure TfrmCliente.edtFoneExit(Sender: TObject);
begin
  edtFone.Text := FormatarTelefone(edtFone.Text);
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FController);
end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
  CarregarDados;
end;


end.
