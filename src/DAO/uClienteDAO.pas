unit uClienteDAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.SQLite, Data.DB, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.SQLiteVDataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.DApt,
  FireDAC.Stan.StorageBin,
  System.Generics.Collections,

  DataModule.Geral, uCliente, uEndereco;

type TClienteDAO = class
  private
    FConn: TFDConnection;
    FQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;

    function Find(ACliente: TCliente): boolean;
    function FindAll(var Amtb: TFDMemTable; AFiltroStr: string = ''): boolean;
end;

implementation

{ TClienteDAO }

constructor TClienteDAO.Create;
begin
  FConn := dmGeral.connMemory;
end;

destructor TClienteDAO.Destroy;
begin
  inherited;
end;

function TClienteDAO.Find(ACliente: TCliente): boolean;
begin
  try
    FQuery := dmGeral.Query;

    with FQuery, ACliente do
    begin
      SQL.Add('SELECT * FROM CLIENTES WHERE idcliente = ' + intToStr(ACliente.IDCliente));
      Open;

      if RecordCount = 0 then
        Exit;

      Nome       := FieldByName('Nome').AsString;
      Identidade := FieldByName('Identidade').AsString;
      CPF        := FieldByName('CPF').AsString;
      Telefone   := FieldByName('Telefone').AsString;
      Email      := FieldByName('Email').AsString;

      Enderecos.Limpar;

      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ENDERECOS WHERE idcliente = ' + intToStr(ACliente.IDCliente));
      Open;

      var count: integer := 0;
      while not Eof do
      begin
        Enderecos.Add(TEndereco.Create(FieldByName('IdEndereco').AsInteger));

        with Enderecos.Items[count] do
        begin
          CEP         := FieldByName('CEP').AsString;
          Logradouro  := FieldByName('Logradouro').AsString;
          Numero      := FieldByName('Numero').AsString;
          Complemento := FieldByName('Complemento').AsString;
          Bairro      := FieldByName('Bairro').AsString;
          Cidade      := FieldByName('Cidade').AsString;
          UF          := FieldByName('UF').AsString;
          Pais        := FieldByName('Pais').AsString;
        end;

        Inc(count);
        Next;
      end;

      Result := true;
    end;

  finally
    FreeAndNil(FQuery);
  end;
end;

function TClienteDAO.FindAll(var Amtb: TFDMemTable;
  AFiltroStr: string): boolean;
begin

end;

end.
