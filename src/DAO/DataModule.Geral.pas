unit DataModule.Geral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.SQLite, Data.DB, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.SQLiteVDataSet, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.DApt,
  FireDAC.Stan.StorageBin;

type
  TdmGeral = class(TDataModule)
    driverSQLite: TFDPhysSQLiteDriverLink;
    lsqlMemory: TFDLocalSQL;
    connMemory: TFDConnection;
    mtbClientes: TFDMemTable;
    mtbEnderecos: TFDMemTable;
    mtbClientesIdCliente: TIntegerField;
    mtbClientesNome: TStringField;
    mtbClientesIdentidade: TStringField;
    mtbClientesCPF: TStringField;
    mtbClientesTelefone: TStringField;
    mtbClientesEmail: TStringField;
    mtbEnderecosIdEndereco: TIntegerField;
    mtbEnderecosIdCliente: TIntegerField;
    mtbEnderecosCEP: TStringField;
    mtbEnderecosLogradouro: TStringField;
    mtbEnderecosNumero: TStringField;
    mtbEnderecosComplemento: TStringField;
    mtbEnderecosBairro: TStringField;
    mtbEnderecosCidade: TStringField;
    mtbEnderecosUF: TStringField;
    mtbEnderecosPais: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    var FQuery: TFDQuery;
    function getQuery :TFDQuery;
  public
    property Query: TFDQuery read getQuery;
  end;

var
  dmGeral: TdmGeral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmGeral }

procedure TdmGeral.DataModuleCreate(Sender: TObject);
begin
  connMemory.Connected := true;
  lsqlMemory.Active := true;
end;

function TdmGeral.getQuery: TFDQuery;
begin

  Self.FQuery := TFDQuery.Create(nil);
  Self.FQuery.Connection := connMemory;

  Result := Self.FQuery;
end;

end.
