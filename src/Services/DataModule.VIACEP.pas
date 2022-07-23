unit DataModule.VIACEP;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope,

  uEndereco, uUtilities;

type
  TdmVIACEP = class(TDataModule)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    DataSetAdapter: TRESTResponseDataSetAdapter;
    mtbConsulta: TFDMemTable;
  private
    { Private declarations }
  public
    function consultarCEP(ACEP:string; AEndereco: TEndereco): boolean;
  end;

var
  dmVIACEP: TdmVIACEP;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmVIACEP }

function TdmVIACEP.consultarCEP(ACEP:string; AEndereco: TEndereco): boolean;
begin
  try
    RestClient.BaseURL := 'http://viacep.com.br/ws/' + ACEP + '/json/';
    RestRequest.Execute;

    Result := mtbConsulta.RecordCount > 0;

    if Result then
      with AEndereco, mtbConsulta do
      begin
        CEP         := SomenteNumeros(FieldByName('CEP').Value);
        Logradouro  := FieldByName('Logradouro').Value;
        Complemento := FieldByName('Complemento').Value;
        Bairro      := FieldByName('Bairro').Value;
        Cidade      := FieldByName('Localidade').Value;
        UF          := FieldByName('UF').Value;
        Pais        := 'BRASIL';

        Numero      := '';
      end;

  except
    Result := False;
  end;

end;

end.
