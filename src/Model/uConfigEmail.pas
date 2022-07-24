unit uConfigEmail;

interface

type TConfigEmail = class
  private
    FServidor: string;
    FFromName: string;
    FFromEmail: string;
    FSenha: string;
    FSSL: boolean;
    FTLS: boolean;
    FUsuario: string;
    FPorta: integer;

    procedure SetFromEmail(const Value: string);
    procedure SetFromName(const Value: string);
    procedure SetPorta(const Value: integer);
    procedure SetSenha(const Value: string);
    procedure SetServidor(const Value: string);
    procedure SetSSL(const Value: boolean);
    procedure SetTLS(const Value: boolean);
    procedure SetUsuario(const Value: string);

  public
    constructor Create;
    destructor Destroy; override;

  published
    property Servidor: string read FServidor write SetServidor;
    property Porta: integer read FPorta write SetPorta;
    property Usuario: string read FUsuario write SetUsuario;
    property Senha: string read FSenha write SetSenha;
    property FromName: string read FFromName write SetFromName;
    property FromEmail: string read FFromEmail write SetFromEmail;
    property SSL: boolean read FSSL write SetSSL;
    property TLS: boolean read FTLS write SetTLS;
end;

implementation

{ TConfigEmail }

constructor TConfigEmail.Create();
begin

end;

destructor TConfigEmail.Destroy;
begin

  inherited;
end;

procedure TConfigEmail.SetFromEmail(const Value: string);
begin
  FFromEmail := Value;
end;

procedure TConfigEmail.SetFromName(const Value: string);
begin
  FFromName := Value;
end;

procedure TConfigEmail.SetPorta(const Value: integer);
begin
  FPorta := Value;
end;

procedure TConfigEmail.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TConfigEmail.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

procedure TConfigEmail.SetSSL(const Value: boolean);
begin
  FSSL := Value;
end;

procedure TConfigEmail.SetTLS(const Value: boolean);
begin
  FTLS := Value;
end;

procedure TConfigEmail.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
