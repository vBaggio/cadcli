unit uClienteController;

interface

uses
  System.SysUtils,

  uCliente, uEndereco, uClienteDAO;

type TClienteController = class
  private
    FCliente :TCliente;
    FClienteDAO: TClienteDAO;

  public
    constructor Create(AId: integer = 0);
    destructor Destroy; override;
end;

implementation

{ TClienteController }

constructor TClienteController.Create(AId: integer = 0);
begin
  FCliente := TCliente.Create(AId);
  FClienteDAO := TClienteDAO.Create;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(FClienteDAO);
  FreeAndNil(FCliente);
  inherited;
end;

end.
