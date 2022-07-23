unit uListaClientesController;

interface

uses
  System.SysUtils, VCL.Grids,

  uClienteDAO;

type TListaClientesController = class

  private
    FClienteDAO :TClienteDAO;

  public
    constructor Create;
    destructor Destroy; override;

    function refreshClientes(var AStringGrid: TStringGrid; paramstr: string = ''): boolean;
    function deletarCliente(AId: integer): boolean;
end;

implementation

{ TListaClientesController }

constructor TListaClientesController.Create;
begin
  FClienteDAO := TClienteDAO.Create;
end;

function TListaClientesController.deletarCliente(AId: integer): boolean;
begin
  Result := FClienteDAO.Delete(AId);
end;

destructor TListaClientesController.Destroy;
begin
  FreeAndNil(FClienteDAO);
  inherited;
end;

function TListaClientesController.refreshClientes(var AStringGrid: TStringGrid; paramstr: string = ''): boolean;

  procedure ClearAStringGrid;
  var
    i: integer;
  begin
    for I := 0 to AStringGrid.ColCount - 1 do
      AStringGrid.Cols[I].Clear;
  end;

  procedure SetCabecalho;
  begin
  with AStringGrid do
    begin
      ColCount := 3;
      Cells[0,0] := 'ID';
      Cells[1,0] := 'Nome';
      Cells[2,0] := 'Email';
      ColWidths[0] := 50;
      ColWidths[1] := 360;
      ColWidths[2] := 240;
      setFocus;
    end;
  end;

begin
  ClearAStringGrid;
  SetCabecalho;

  FClienteDAO.All(AStringGrid, paramstr);
end;

end.
