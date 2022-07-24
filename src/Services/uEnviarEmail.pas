unit uEnviarEmail;

interface

uses
  System.SysUtils, System.StrUtils, System.Classes,
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,

  uConfigEmail, uCliente;

type TEnviarEmail = class
  public
    class function enviarEmail(AConfigEmail: TConfigEmail;
      ADestinatario, AAssunto: string; AMensagem, AAnexos: TStrings): boolean;
end;

implementation

{ TEnviarEmail }

class function TEnviarEmail.enviarEmail(AConfigEmail: TConfigEmail;
  ADestinatario, AAssunto: string; AMensagem, AAnexos: TStrings): boolean;
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
begin
  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create();
  IdSMTP := TIdSMTP.Create();
  IdMessage := TIdMessage.Create();

  try
    if AConfigEmail.SSL then
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23
    else
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1_2;

    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do servidor SMTP (TIdSMTP)
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;

    if AConfigEmail.TLS then
      IdSMTP.UseTLS := utUseImplicitTLS
    else
      IdSMTP.UseTLS := utNoTLSSupport;

    IdSMTP.AuthType := satDefault;
    IdSMTP.Host := AConfigEmail.Servidor;
    IdSMTP.Port := AConfigEmail.Porta;
    IdSMTP.Username := AConfigEmail.Usuario;
    IdSMTP.Password := AConfigEmail.Senha;

    // Configuração da mensagem (TIdMessage)
    IdMessage.From.Address := AConfigEmail.FromEmail;
    IdMessage.From.Name := AConfigEmail.FromName;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := ADestinatario;
    IdMessage.Subject := AAssunto;
    IdMessage.Encoding := meMIME;

    // Configuração do corpo do email (TIdText)
    IdText := TIdText.Create(IdMessage.MessageParts);

    IdText.Body := AMensagem;
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    // Anexos
    for var i := 0 to AAnexos.Count-1 do
       TIdAttachmentFile.Create(IdMessage.MessageParts, AAnexos[i]);

    // Conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        raise Exception.Create('Erro na Autenticação');
        Exit;
      end;
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      Result := True;
    except
      On E:Exception do
      begin
        raise Exception.Create('Erro ao enviar Mensagem');
      end;
    end;
  finally
    // desconecta do servidor
    IdSMTP.Disconnect;
    // liberação da DLL
    UnLoadOpenSSLLibrary;
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;


end.
