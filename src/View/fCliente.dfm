object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Cliente'
  ClientHeight = 373
  ClientWidth = 409
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
    Top = 9
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 8
    Top = 58
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel
    Left = 298
    Top = 9
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 107
    Top = 57
    Width = 52
    Height = 13
    Caption = 'Identidade'
  end
  object Label6: TLabel
    Left = 206
    Top = 58
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object edtNome: TEdit
    Left = 8
    Top = 28
    Width = 282
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtFone: TEdit
    Left = 298
    Top = 28
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = edtFoneExit
  end
  object edtIdentidade: TEdit
    Left = 108
    Top = 76
    Width = 92
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object edtEmail: TEdit
    Left = 206
    Top = 76
    Width = 190
    Height = 21
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 117
    Width = 388
    Height = 206
    Caption = 'Endereco'
    TabOrder = 5
    object Label10: TLabel
      Left = 214
      Top = 145
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label11: TLabel
      Left = 13
      Top = 18
      Width = 20
      Height = 13
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 13
      Top = 104
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label4: TLabel
      Left = 13
      Top = 61
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label7: TLabel
      Left = 85
      Top = 106
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object Label8: TLabel
      Left = 237
      Top = 104
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label9: TLabel
      Left = 13
      Top = 145
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label13: TLabel
      Left = 248
      Top = 145
      Width = 19
      Height = 13
      Caption = 'Pa'#237's'
    end
    object edtNumero: TEdit
      Left = 13
      Top = 121
      Width = 66
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edtCompl: TEdit
      Left = 85
      Top = 121
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object edtLogradouro: TEdit
      Left = 13
      Top = 79
      Width = 363
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edtBairro: TEdit
      Left = 237
      Top = 121
      Width = 139
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edtCidade: TEdit
      Left = 13
      Top = 162
      Width = 192
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edtUF: TEdit
      Left = 214
      Top = 162
      Width = 28
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 6
    end
    object edtPais: TEdit
      Left = 248
      Top = 162
      Width = 128
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
    end
    object edtCEP: TMaskEdit
      Left = 13
      Top = 34
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99999-999;0;'
      MaxLength = 9
      TabOrder = 0
      Text = ''
      OnExit = edtCEPExit
    end
  end
  object btnSalvar: TButton
    Left = 304
    Top = 329
    Width = 92
    Height = 36
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 206
    Top = 329
    Width = 92
    Height = 36
    Caption = 'Cancelar'
    TabOrder = 7
    TabStop = False
    OnClick = btnCancelarClick
  end
  object edtCPF: TMaskEdit
    Left = 8
    Top = 76
    Width = 94
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!999.999.999-99;0;'
    MaxLength = 14
    TabOrder = 2
    Text = ''
  end
  object chkEmail: TCheckBox
    Left = 8
    Top = 338
    Width = 150
    Height = 17
    Caption = 'Disparar Email ao Salvar'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
end
