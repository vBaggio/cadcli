object frmListCli: TfrmListCli
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Listagem de Clientes'
  ClientHeight = 536
  ClientWidth = 645
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
  object pnlFoot: TPanel
    Left = 0
    Top = 470
    Width = 645
    Height = 66
    Align = alBottom
    TabOrder = 0
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
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 387
      Top = 6
      Width = 120
      Height = 50
      Anchors = [akRight, akBottom]
      Caption = 'Editar Selecionado'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 261
      Top = 6
      Width = 120
      Height = 50
      Anchors = [akRight, akBottom]
      Caption = 'Excluir Selecionado'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object stgClientes: TStringGrid
    Left = 0
    Top = 0
    Width = 645
    Height = 470
    Align = alClient
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
    TabOrder = 1
    ExplicitLeft = 8
    ColWidths = (
      83
      64
      64)
  end
end
