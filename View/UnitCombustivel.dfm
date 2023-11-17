object frmCombustive: TfrmCombustive
  Left = 0
  Top = 0
  Caption = 'Cadastro - Combustivel'
  ClientHeight = 366
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescricao: TLabel
    Left = 16
    Top = 58
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblValor: TLabel
    Left = 16
    Top = 104
    Width = 48
    Height = 13
    Caption = 'Valor Litro'
  end
  object lblCodigo: TLabel
    Left = 16
    Top = 12
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblPercImposto: TLabel
    Left = 142
    Top = 104
    Width = 67
    Height = 13
    Caption = 'Perc. Imposto'
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 77
    Width = 433
    Height = 21
    TabOrder = 0
  end
  object mskValor: TMaskEdit
    Left = 16
    Top = 123
    Width = 120
    Height = 21
    TabOrder = 1
    Text = ''
  end
  object btnGravar: TButton
    Left = 16
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = btnGravarClick
  end
  object btnExcluir: TButton
    Left = 97
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 31
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object dbGridListaCombustiveis: TDBGrid
    Left = 8
    Top = 208
    Width = 433
    Height = 129
    DataSource = dsListar
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGridListaCombustiveisDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nCdCombustivel'
        Title.Caption = 'C'#243'digo'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDescricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nValor'
        Title.Caption = 'Valor'
        Width = 77
        Visible = True
      end>
  end
  object btnBuscar: TButton
    Left = 178
    Top = 163
    Width = 121
    Height = 25
    Caption = 'Listar Combustiveis'
    TabOrder = 6
    OnClick = btnBuscarClick
  end
  object mskPercImposto: TMaskEdit
    Left = 142
    Top = 123
    Width = 120
    Height = 21
    TabOrder = 7
    Text = ''
  end
  object cdsListar: TClientDataSet
    PersistDataPacket.Data = {
      730000009619E0BD01000000180000000400000000000300000073000E6E4364
      436F6D627573746976656C08000400000000000A6344657363726963616F0100
      490000000100055749445448020002001400066E56616C6F7208000400000000
      000B50657263496D706F73746F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nCdCombustivel'
        DataType = ftFloat
      end
      item
        Name = 'cDescricao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nValor'
        DataType = ftFloat
      end
      item
        Name = 'PercImposto'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 136
    object cdsListarnCdCombustivel: TFloatField
      FieldName = 'nCdCombustivel'
    end
    object cdsListarcDescricao: TStringField
      FieldName = 'cDescricao'
    end
    object cdsListarnValor: TFloatField
      FieldName = 'nValor'
    end
    object cdsListarPercImposto: TFloatField
      FieldName = 'PercImposto'
    end
  end
  object dsListar: TDataSource
    DataSet = cdsListar
    Left = 400
    Top = 136
  end
end
