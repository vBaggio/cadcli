unit fEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,

  uEmailController;

type
  TfrmEmail = class(TForm)
    edtDestinatario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtAssunto: TEdit;
    memoMsg: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    openDlg: TOpenDialog;
    edtFile: TEdit;
    btnSearch: TSpeedButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnExcluir: TSpeedButton;
    btnAdd: TSpeedButton;
    btnConfig: TButton;
    lstAnexos: TListBox;
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfigClick(Sender: TObject);
  private
    FController: TEmailController;
  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;
  procedure call_Email(ADestinatario: string = ''; AAssunto: string = ''; AMensagem: TStringList = nil; AAnexos:TStringList = nil);

implementation

{$R *.dfm}

uses
  fConfigEmail;

procedure call_Email(ADestinatario: string = ''; AAssunto: string = ''; AMensagem: TStringList = nil; AAnexos: TStringList = nil);
begin
  try
    frmEmail := TfrmEmail.Create(nil);

    with frmEmail do
    begin
      FController := TEmailController.Create;

      edtDestinatario.Text := ADestinatario;
      edtAssunto.Text := AAssunto;

      if Assigned(AMensagem) then
        memoMsg.Lines := AMensagem;

      if Assigned(AAnexos) then
        lstAnexos.Items := AAnexos;

      ShowModal;
    end;
  finally
    FreeAndNil(frmEmail);
  end;
end;

procedure TfrmEmail.btnAddClick(Sender: TObject);
begin
  if edtFile.Text > '' then
    lstAnexos.Items.Add(edtFile.Text);
  edtFile.Text := '';
end;

procedure TfrmEmail.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmail.btnConfigClick(Sender: TObject);
begin
  call_configEmail;
  FController.carregarConfig;
end;

procedure TfrmEmail.btnExcluirClick(Sender: TObject);
begin
  lstAnexos.DeleteSelected;
end;

procedure TfrmEmail.btnSalvarClick(Sender: TObject);
begin
  var Erro:string := '';

  if not FController.enviarEmail(Erro, edtDestinatario.Text, edtAssunto.Text, memoMsg.Lines, lstAnexos.Items) then
    ShowMessage(Erro)
  else
  begin
    ShowMessage('Email Enviado');
    Close;
  end;

end;

procedure TfrmEmail.btnSearchClick(Sender: TObject);
begin
  if opendlg.Execute then
    edtFile.Text := opendlg.FileName;
  openDlg.FileName := '';
end;

procedure TfrmEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FController);
end;

end.
