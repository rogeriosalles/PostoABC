object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o de Posto - FORTES'
  ClientHeight = 569
  ClientWidth = 1042
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Menu: TMainMenu
    Left = 8
    Top = 8
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Cadastros1: TMenuItem
        Caption = 'Cadastros'
        object Combustivel1: TMenuItem
          Caption = 'Combustivel'
          OnClick = Combustivel1Click
        end
        object anquedeCombustivel1: TMenuItem
          Caption = 'Tanque de Combustivel'
          OnClick = anquedeCombustivel1Click
        end
        object BombadeAbastecimento1: TMenuItem
          Caption = 'Bomba de Abastecimento'
          OnClick = BombadeAbastecimento1Click
        end
      end
      object Abastecimento1: TMenuItem
        Caption = 'Abastecimento'
        OnClick = Abastecimento1Click
      end
      object Relatrios1: TMenuItem
        Caption = 'Relat'#243'rios'
        object Abastecimentos1: TMenuItem
          Caption = 'Abastecimentos'
          OnClick = Abastecimentos1Click
        end
      end
    end
  end
end
