unit uClienteController;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, VCL.Forms,
  uUtilities, uCliente, uEndereco, uClienteDAO,
  dmViacep, fEmail;

type TClienteController = class
  private
    FCliente :TCliente;
    FClienteDAO: TClienteDAO;

  public
    constructor Create(AId: integer = 0);
    destructor Destroy; override;

    property Cliente: TCliente read FCliente write FCliente;

    function carregarCliente(AId: integer): boolean;
    function salvarCliente(var AErro:string): boolean;

    function consultarCEP(ACEP: string): boolean;
    function enviarEmail: boolean;
end;

implementation

{ TClienteController }

function TClienteController.consultarCEP(ACEP: string): boolean;
begin
  Result := dtmVIACEP.consultarCEP(ACEP, FCliente.Enderecos.Items[0]);
end;

constructor TClienteController.Create(AId: integer = 0);
begin
  FClienteDAO := TClienteDAO.Create;

  if not carregarCliente(AId) then
    raise Exception.Create('Erro ao carregar Cliente');
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FClienteDAO);
  inherited;
end;

function TClienteController.enviarEmail: boolean;
var Anexo, Mensagem: TStringList;
begin
  var LPath := ExtractFilePath(Application.ExeName) + 'temp\';

   if not TDirectory.Exists(LPath) then
    TDirectory.CreateDirectory(LPath);

  LPath := FCliente.toXML(LPath);

  if not FileExists(LPath) then
    raise Exception.Create('Erro ao serializar xml.');


  try
    Mensagem := TStringList.Create;

    with Mensagem, FCliente do
    begin
      Add('CADASTRO DE CLIENTE');
      Add('Nome: ' + Nome);
      Add('Identidade: ' + Identidade);
      Add('CPF: ' + FormatarCPF(CPF));
      Add('Telefone: ' + FormatarTelefone(Telefone));
      Add('Email: ' + Email);
    end;

    with Mensagem, FCliente.Enderecos.Items[0] do
    begin
      Add('ENDEREÇO');
      Add('CEP: ' + FormatarCEP(CEP));
      Add('Logradouro: ' + Logradouro);
      Add('Numero: ' + Numero);
      Add('Complemento: ' + Complemento);
      Add('Bairro: ' + Bairro);
      Add('Cidade: ' + Cidade);
      Add('UF: ' + UF);
      Add('Pais: ' + Pais);
    end;

    Anexo := TStringList.Create;
    Anexo.Add(LPath);

    call_email(FCliente.Email, 'Cadastro de Cliente', Mensagem, Anexo);
  finally
    Mensagem.Free;
    Anexo.Free;
  end;

end;

function TClienteController.salvarCliente(var AErro:string): boolean;
begin
  try
    AErro := 'Erro ao gravar dados';

    if not ValidarCPF(FCliente.CPF) then
    begin
      AErro := 'CPF Inválido';
      Exit;
    end;

    if FCliente.Nome = '' then
    begin
      AErro := 'Preencha o nome';
      Exit;
    end;

    Result := FClienteDAO.Save(FCliente);

    if Result then
      AErro := '';
  except
    Result := False;
  end;

end;

function TClienteController.carregarCliente(AId: integer): boolean;
begin
  FCliente := TCliente.Create(AId);

  if Aid = 0 then
    FCliente.addEndereco(TEndereco.Create)
  else
    Result := FClienteDao.Find(FCliente);
end;

end.
