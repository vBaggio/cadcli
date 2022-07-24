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
  VCL.Grids,

  dmGeral, uCliente, uEndereco;

type TClienteDAO = class
  private
    FConn: TFDConnection;
    FQuery: TFDQuery;

    function gerarId :integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Find(ACliente: TCliente): boolean;
    function All(var AStringGrid: TStringGrid; paramstr: string): boolean;
    function Save(ACliente: TCliente): boolean;
    function Delete(AClienteId: integer): boolean;
end;

implementation

{ TClienteDAO }

constructor TClienteDAO.Create;
begin
  FConn := dtmGeral.connMemory;
end;

function TClienteDAO.Delete(AClienteId: integer): boolean;
begin
  try
    FConn.StartTransaction;

    Fconn.ExecSQL('DELETE FROM ENDERECOS WHERE idcliente = ' + intToStr(AClienteId));
    Fconn.ExecSQL('DELETE FROM CLIENTES WHERE idcliente = ' + intToStr(AClienteId));

    Fconn.Commit;
    Result := True;
  except
    FConn.RollBack;
  end;
end;

destructor TClienteDAO.Destroy;
begin
  inherited;
end;

function TClienteDAO.Find(ACliente: TCliente): boolean;
begin
  try
    FQuery := dtmGeral.Query;

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
        Enderecos.Add(TEndereco.Create);

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

function TClienteDAO.gerarId: integer;
begin
  Result := FConn.ExecSQLScalar('SELECT COALESCE(MAX(IdCliente), 0) + 1 FROM CLIENTES');
end;

function TClienteDAO.Save(ACliente: TCliente): boolean;
var LID: integer;
begin
  try
    FConn.StartTransaction;

    with ACliente do
    begin
      LID := IDCliente;

      if IDCliente = 0 then
      begin
        LID := Self.gerarId;
        Fconn.ExecSQL(
          'INSERT INTO CLIENTES                                       ' +
          ' (idcliente, nome, identidade, cpf, telefone, email)       ' +
          'VALUES                                                     ' +
          ' (:idcliente, :nome, :identidade, :cpf, :telefone, :email) ' ,
          [LID, Nome, Identidade, CPF, Telefone, Email]
        );
      end
      else
      begin
        FConn.ExecSQL(
          'UPDATE CLIENTES SET                                   ' +
          ' nome = :nome, identidade = :identidade, cpf = :cpf, ' +
          ' telefone = :telefone, email = :email                ' +
          'WHERE idcliente = :idcliente                         ' ,
          [Nome, Identidade, CPF, Telefone, Email, IDCliente]
        );

        FConn.ExecSQL('DELETE FROM ENDERECOS WHERE idcliente = ' + intToStr(IDCliente));
      end;

      var i:integer := 0;
      for var Endereco: TEndereco in Enderecos do
      begin
        Inc(i);
        with Endereco do
          Fconn.ExecSQL(
            'INSERT INTO ENDERECOS                                  ' +
            ' (idendereco, idcliente, cep, logradouro, numero,      ' +
            ' complemento, bairro, cidade, uf, pais)                ' +
            'VALUES                                                 ' +
            ' (:idendereco, :idcliente, :cep, :logradouro, :numero, ' +
            ' :complemento, :bairro, :cidade, :uf, :pais)           ' ,
            [i, LID, CEP, Logradouro, Numero, Complemento, Bairro, Cidade, UF, Pais]
        );
      end;
                    
    end;
    
    FConn.Commit;

    Result := True;
  except
    Fconn.Rollback;
  end;
end;

function TClienteDAO.All(var AStringGrid: TStringGrid; paramstr: string): boolean;
begin
var
  i: integer;
begin
  Result := False;

  try
    FQuery := dtmGeral.Query;

    with FQuery, AStringGrid do
    begin
      SQL.Add('SELECT * FROM clientes');

      if paramstr > '' then
        SQL.Add(' WHERE ' + paramstr);

      Open;

      if not (RecordCount > 0) then
      begin
        RowCount := 2;
        Exit;
      end;

      RowCount := RecordCount + 1;


      First;
      i := 1;
      while not Eof do
      begin
        Cells[0, i] := FieldByName('idcliente').AsString;
        Cells[1, i] := FieldByName('nome').AsString;
        Cells[2, i] := FieldByName('email').AsString;

        Next;
        Inc(i);
      end;

      Result := True;
    end;

  finally
    FreeAndNil(FQuery);
  end;
end;

end;

end.
