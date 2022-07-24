object frmConfigEmail: TfrmConfigEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Par'#226'metros envio de email'
  ClientHeight = 368
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Servidor'
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label3: TLabel
    Left = 8
    Top = 98
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object Label4: TLabel
    Left = 8
    Top = 146
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label5: TLabel
    Left = 8
    Top = 194
    Width = 83
    Height = 13
    Caption = 'Nome Remetente'
  end
  object Label6: TLabel
    Left = 8
    Top = 244
    Width = 80
    Height = 13
    Caption = 'Email Remetente'
  end
  object edtServidor: TEdit
    Left = 8
    Top = 27
    Width = 246
    Height = 21
    TabOrder = 0
  end
  object edtPorta: TEdit
    Left = 8
    Top = 72
    Width = 246
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 117
    Width = 246
    Height = 21
    TabOrder = 2
  end
  object edtSenha: TEdit
    Left = 8
    Top = 165
    Width = 246
    Height = 21
    TabOrder = 3
  end
  object edtFromName: TEdit
    Left = 8
    Top = 213
    Width = 246
    Height = 21
    TabOrder = 4
  end
  object edtFromEmail: TEdit
    Left = 8
    Top = 263
    Width = 246
    Height = 21
    TabOrder = 5
  end
  object chkSSL: TCheckBox
    Left = 8
    Top = 290
    Width = 97
    Height = 17
    Caption = 'SSL'
    TabOrder = 6
  end
  object chkTLS: TCheckBox
    Left = 144
    Top = 290
    Width = 97
    Height = 17
    Caption = 'TLS'
    TabOrder = 7
  end
  object btnCancelar: TButton
    Left = 8
    Top = 324
    Width = 92
    Height = 36
    Caption = 'Cancelar'
    TabOrder = 8
    TabStop = False
    OnClick = btnCancelarClick
  end
  object btnSalvar: TButton
    Left = 163
    Top = 324
    Width = 92
    Height = 36
    Caption = 'Salvar'
    TabOrder = 9
    OnClick = btnSalvarClick
  end
end
