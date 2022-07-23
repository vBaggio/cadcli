unit uClienteController;

interface

uses
  System.SysUtils,

  uCliente, uEndereco, uClienteDAO, DataModule.VIACEP;

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
end;

implementation

{ TClienteController }

function TClienteController.consultarCEP(ACEP: string): boolean;
begin
  Result := dmVIACEP.consultarCEP(ACEP, FCliente.Enderecos.Items[0]);
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

function TClienteController.salvarCliente(var AErro:string): boolean;
begin
  //validar dados

  Result := FClienteDAO.Save(FCliente);
end;

function TClienteController.carregarCliente(AId: integer): boolean;
begin
  FCliente := TCliente.Create(AId);

  if Aid = 0 then
    FCliente.addEndereco(TEndereco.Create(0))
  else
    Result := FClienteDao.Find(FCliente);
end;

end.
