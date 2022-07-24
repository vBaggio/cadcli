object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'CadCli - Sistema para Cadastro de Clientes'
  ClientHeight = 316
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuMain
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object menuMain: TMainMenu
    Left = 520
    Top = 16
    object Cliente1: TMenuItem
      Caption = 'Clientes'
      object Cadastrar1: TMenuItem
        Caption = 'Listagem de Clientes'
        OnClick = Cadastrar1Click
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Email'
      object Email1: TMenuItem
        Caption = 'Disparar Email'
        OnClick = Email1Click
      end
      object ConfigurarEnvio1: TMenuItem
        Caption = 'Configurar'
        OnClick = ConfigurarEnvio1Click
      end
    end
  end
end
