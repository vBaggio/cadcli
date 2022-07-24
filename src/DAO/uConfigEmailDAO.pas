unit uConfigEmailDAO;

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
  VCL.Grids,

  dmGeral, uConfigEmail;

type TConfigEmailDAO = class
  private
    FConn: TFDConnection;
    FQuery: TFDQuery;

    function gerarId :integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Find(AConfig: TConfigEmail): boolean;
    function Save(AConfig: TConfigEmail): boolean;
    function Delete(AConfigId: integer): boolean;
end;

implementation

{ TConfigEmailDAO }

constructor TConfigEmailDAO.Create;
begin
  FConn := dtmGeral.connMemory;
end;

destructor TConfigEmailDAO.Destroy;
begin

  inherited;
end;

function TConfigEmailDAO.Delete(AConfigId: integer): boolean;
begin
  Fconn.ExecSQL('DELETE FROM CONFIGEMAIL WHERE idconfigemail = ' + intToStr(AConfigId));
  Result := True;
end;

function TConfigEmailDAO.Find(AConfig: TConfigEmail): boolean;
begin
  try
    FQuery := dtmGeral.Query;

        with FQuery, AConfig do
    begin
      SQL.Add('SELECT * FROM CONFIGEMAIL WHERE idconfigemail = 1');
      Open;

      if RecordCount = 0 then
        Exit;

      Servidor  := FieldByName('Servidor').AsString;
      Porta     := FieldByName('Porta').AsInteger;
      Usuario   := FieldByName('Usuario').AsString;
      Senha     := FieldByName('Senha').AsString;
      FromName  := FieldByName('FromName').AsString;
      FromEmail := FieldByName('FromEmail').AsString;
      SSL       := FieldByName('SSL').AsBoolean;
      TLS       := FieldByName('TLS').AsBoolean;

      Result := True;
    end;

  finally
    FreeAndNil(FQuery);
  end;
end;

function TConfigEmailDAO.gerarId: integer;
begin
  Result := FConn.ExecSQLScalar('SELECT COALESCE(MAX(IdConfigEmail), 0) + 1 FROM CONFIGEMAIL');
end;

function TConfigEmailDAO.Save(AConfig: TConfigEmail): boolean;
begin
  try
    FConn.StartTransaction;

    FConn.ExecSQL('DELETE FROM CONFIGEMAIL WHERE IdConfigEmail = 1');

    with AConfig do
    FConn.ExecSQL(
      'INSERT INTO CONFIGEMAIL ' +
      ' (IdConfigEmail, Servidor, Porta, Usuario, Senha, FromName, FromEmail, SSL, TLS) ' +
      'VALUES ' +
      ' (:IdConfigEmail, :Servidor, :Porta, :Usuario, :Senha, :FromName, :FromEmail, :SSL, :TLS) ' ,
      [1, Servidor, Porta, Usuario, Senha, FromName, FromEmail, SSL, TLS]
    );

    FConn.Commit;
    Result := True;
  except
    FConn.Rollback;
  end;
end;

end.
