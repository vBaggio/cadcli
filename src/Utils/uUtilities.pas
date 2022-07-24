unit uUtilities;

interface

uses
  System.SysUtils, System.StrUtils, System.MaskUtils;

  //fun��es de terceiros, peguei da internet
  function FormatarTelefone(Telefone : String): String;
  function SomenteNumeros(fField : String): String;
  function ValidarCPF(CPF: String): boolean;
  Function FormatarCPF(numtexto: String): String;
  function FormatarCEP(numtexto: String): String;

implementation

function FormatarTelefone(Telefone : String):String;
  function SomenteNumero(snum : String) : String;
  var s1, s2: string;
    i: Integer;
  begin
    s1 := snum;
    s2 := '';
    for i := 1 to Length(s1) do
      if s1[i] in ['0'..'9'] then
        s2 := s2 + s1[i];
    result := s2;
  end;
var sTel : String;
    bZero : Boolean;
    iDigitos : Integer;
begin
   //Obs: mascara prev� tratamento apenas para n�meros brasileiros
   //Obs2: Esta fun��o n�o leva em conta o c�digo do pa�s (Ex: 55, ou +55)

   sTel := SomenteNumero(Telefone); //Remove qualquer formata��o que o usu�rio possa ter colocado.
   if sTel='' then
    Result := ''
   else
   begin
     if sTel[1]='0' then //Verifica se foi adicionado o 0 no in�cio do n�mero
     begin
       bZero:= True;
       sTel := Trim( copy(sTel,2,Length(sTel)) ); //Remove para fazer a formata��o depois adiciona
     end
     else
       bZero := False;
     iDigitos := Length(sTel);
     //Formata de acordo com a quantidade de n�meros encontrados.
     case iDigitos of
       8 : Result := FormatMaskText('9999-9999;0;_',sTel); //8 digitos SEM DDD (ex: 34552318)
       9 : Result := FormatMaskText('99999-9999;0;_',sTel); //9 digitos SEM DDD (ex: 991916889)
      10 : Result := FormatMaskText('(99)9999-9999;0;_',sTel); //8 Digitos (convencional, ex: 7734552318)
      11 : Result := FormatMaskText('(99)99999-9999;0;_',sTel); //9 Digitos (novos n�meros, ex: 77991916889)
      12 : Result := FormatMaskText('99(99)9999-9999;0;_',sTel); //Se foram 12 digitos poss�velmente digitou a operadora tamb�m
      13 : Result := FormatMaskText('99(99)99999-9999;0;_',sTel); //Se foram 13 digitos poss�velmente digitou a operadora tamb�m
     else
       Result := Telefone; //Mant�m na forma que o usu�rio digitou
     end;
     if bZero then //Para ficar com a prefer�ncia do usu�rio, se ele digitou o "0" eu mantenho.
       Result := '0'+Result;
   end;
end;

function SomenteNumeros(fField : String): String;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(fField) do
       if fField [I] In ['0'..'9'] Then
            Result := Result + fField [I];
end;

function ValidarCPF(CPF: string): Boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
  // length - retorna o tamanho da string (CPF � um n�mero formado por 11 d�gitos)
  if
    ((CPF = '00000000000') or (CPF = '11111111111') or
    (CPF = '22222222222') or (CPF = '33333333333') or
    (CPF = '44444444444') or (CPF = '55555555555') or
    (CPF = '66666666666') or (CPF = '77777777777') or
    (CPF = '88888888888') or (CPF = '99999999999') or
    (length(CPF) <> 11))
   then
   begin
     ValidarCPF := false;
     exit;
   end;

// try - protege o c�digo para eventuais erros de convers�o de tipo na fun��o StrToInt
  try
{ *-- C�lculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-�simo caractere do CPF em um n�mero
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um n�mero no respectivo caractere num�rico

{ *-- C�lculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then ValidarCPF := true
    else ValidarCPF := false;
  except
    ValidarCPF := false
  end;
end;

function FormatarCPF(numtexto: String): String;
begin
  Result := FormatmaskText('000\.000\.000\-00;0;',numtexto);
end;

function FormatarCEP(numtexto: String): String;
begin
  Result := FormatmaskText('!99999-999;0;',numtexto);
end;
end.
