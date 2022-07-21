object frmListCli: TfrmListCli
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Listagem de Clientes'
  ClientHeight = 350
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgClientes: TDBGrid
    Left = 0
    Top = 0
    Width = 645
    Height = 284
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlFoot: TPanel
    Left = 0
    Top = 284
    Width = 645
    Height = 66
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 233
    ExplicitWidth = 572
    DesignSize = (
      645
      66)
    object btnNovo: TButton
      Left = 513
      Top = 6
      Width = 120
      Height = 50
      Anchors = [akRight, akBottom]
      Caption = 'Novo'
      TabOrder = 0
      ExplicitLeft = 440
    end
    object Button1: TButton
      Left = 387
      Top = 6
      Width = 120
      Height = 50
      Anchors = [akRight, akBottom]
      Caption = 'Editar Selecionado'
      TabOrder = 1
      ExplicitLeft = 314
    end
    object Button2: TButton
      Left = 261
      Top = 6
      Width = 120
      Height = 50
      Anchors = [akRight, akBottom]
      Caption = 'Excluir Selecionado'
      TabOrder = 2
      ExplicitLeft = 188
    end
  end
  object dsClientes: TDataSource
    Left = 584
    Top = 24
  end
end
