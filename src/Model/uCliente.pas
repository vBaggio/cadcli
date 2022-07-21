unit uCliente;

interface

uses
  System.SysUtils, System.Generics.Collections,
  uEndereco;


type TCliente = class
  private
    FIDCliente  :integer;
    FNome       :string;
    FCPF        :string;
    FIdentidade :string;
    FTelefone   :string;
    FEmail      :string;
    FEnderecos  :TEndList;

    procedure SetNome(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetIdentidade(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetEmail(const Value: string);

  public
    constructor Create(AId: integer = 0);
    destructor Destroy; override;

  published
    property IDCliente  :integer   read FIDCliente;
    property Nome       :string    read FNome        write SetNome;
    property Identidade :string    read FIdentidade  write SetIdentidade;
    property CPF        :string    read FCPF         write SetCPF;
    property Telefone   :string    read FTelefone    write SetTelefone;
    property Email      :string    read FEmail       write SetEmail;
    property Enderecos  :TEndList  read FEnderecos;

    function addEndereco(AEndereco: TEndereco): boolean;
    function removerEndereco(AEndereco: TEndereco): boolean;
end;

type TCliList = class(TObjectList<TCliente>)
end;

implementation

{ TCliente }

constructor TCliente.Create(AId: integer);
begin
  FIDCliente := AId;
  FEnderecos := TEndList.Create;
end;

destructor TCliente.Destroy;
begin
  FEnderecos.Free;
  inherited;
end;

function TCliente.addEndereco(AEndereco: TEndereco): boolean;
begin
  try
    FEnderecos.Add(AEndereco);
    Result := true;
  except
    Result := false;
  end;
end;

function TCliente.removerEndereco(AEndereco: TEndereco): boolean;
begin
  try
    FEnderecos.Remove(AEndereco);
    Result := true;
  finally
    Result := false;
  end;
end;

procedure TCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TCliente.SetIdentidade(const Value: string);
begin
  FIdentidade := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
