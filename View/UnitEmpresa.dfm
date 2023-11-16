object frmEmpresa: TfrmEmpresa
  Left = 0
  Top = 0
  Caption = 'Cadastro - Empresa'
  ClientHeight = 149
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescricao: TLabel
    Left = 16
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblNomeFantasia: TLabel
    Left = 16
    Top = 55
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object lblCNPJ: TLabel
    Left = 320
    Top = 54
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 27
    Width = 425
    Height = 21
    TabOrder = 0
  end
  object edtNomeFantasia: TEdit
    Left = 16
    Top = 74
    Width = 298
    Height = 21
    TabOrder = 1
  end
  object mskCNPJ: TMaskEdit
    Left = 320
    Top = 74
    Width = 121
    Height = 21
    TabOrder = 2
    Text = ''
  end
  object btnGravar: TButton
    Left = 16
    Top = 116
    Width = 97
    Height = 25
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 119
    Top = 116
    Width = 97
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
  end
end
