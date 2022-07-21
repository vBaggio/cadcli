unit uEndereco;

interface

uses
  System.SysUtils, System.Generics.Collections;

type TEndereco = class
  private
    FCEP         :string;
    FLogradouro  :string;
    FNumero      :string;
    FComplemento :string;
    FBairro      :string;
    FCidade      :string;
    FUF          :string;
    FIDEndereco  :integer;
    FPais        :string;

    procedure SetCEP(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetPais(const Value: string);

  public
    constructor Create(AIdEndereco: integer = 0);
    destructor  Destroy; override;

  published
    property IDEndereco  :integer  read FIDEndereco;
    property CEP         :string   read FCEP          write SetCEP;
    property Logradouro  :string   read FLogradouro   write SetLogradouro;
    property Numero      :string   read FNumero       write SetNumero;
    property Complemento :string   read FComplemento  write SetComplemento;
    property Bairro      :string   read FBairro       write SetBairro;
    property Cidade      :string   read FCidade       write SetCidade;
    property UF          :string   read FUF           write SetUF;
    property Pais        :string   read FPais         write SetPais;
end;

type TEndList = class(TObjectList<TEndereco>)
  public
    procedure Limpar;
end;

implementation

{ TEndereco }

constructor TEndereco.Create(AIdEndereco: integer);
begin
  FIdEndereco := AIdEndereco;
end;

destructor TEndereco.Destroy;
begin
  inherited;
end;

procedure TEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TEndereco.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEndereco.SetPais(const Value: string);
begin
  FPais := Value;
end;

procedure TEndereco.SetUF(const Value: string);
begin
  FUF := Value;
end;

{ TEndList }

procedure TEndList.Limpar;
begin
  Self.Clear;
end;

end.
