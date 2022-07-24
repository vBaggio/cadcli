unit uEmailController;

interface

uses
  System.SysUtils, System.Classes,
  uConfigEmail, uConfigEmailDAO, uEnviarEmail;

type TEmailController = class
  private
    FConfigEmail: TConfigEmail;
    FConfigEmailDAO: TConfigEmailDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function carregarConfig(): Boolean;
    function salvarConfig(var AErro: string): Boolean;
    function enviarEmail(var AErro: string; ADestinatario, AAssunto: string; AMensagem, AAnexos: TStrings): Boolean;

    property ConfigEmail: TConfigEmail read FConfigEmail write FConfigEmail;
end;

implementation

{ TConfigEmailController }

constructor TEmailController.Create;
begin
  FConfigEmail := TConfigEmail.Create;
  FConfigEmailDAO := TConfigEmailDAO.Create;
  Self.carregarConfig();
end;

destructor TEmailController.Destroy;
begin
  FreeAndNil(FConfigEmailDAO);
  FreeAndNil(FConfigEmail);
  inherited;
end;

function TEmailController.enviarEmail(var AErro: string; ADestinatario, AAssunto: string; AMensagem, AAnexos: TStrings): Boolean;
begin
  try
    Result := TEnviarEmail.enviarEmail(FConfigEmail, ADestinatario, AAssunto, AMensagem, AAnexos);
  except
    on E: Exception do
    begin
      AErro := E.Message;
      Result := False;
    end;
  end;
end;

function TEmailController.carregarConfig(): boolean;
begin
  Result := FConfigEmailDAO.Find(FConfigEmail);
end;

function TEmailController.salvarConfig(var AErro: string): Boolean;
begin
  try
    Result := FConfigEmailDAO.Save(FConfigEmail);
  except
    Result := False;
    if AErro = '' then
      AErro := 'Erro ao gravar dados';
  end;
end;

end.
