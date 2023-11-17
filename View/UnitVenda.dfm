object frmVenda: TfrmVenda
  Left = 0
  Top = 0
  Caption = 'Venda - Gest'#227'o de Posto - Fortes'
  ClientHeight = 478
  ClientWidth = 766
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
  object lblLitros: TLabel
    Left = 276
    Top = 73
    Width = 51
    Height = 18
    Caption = 'LITROS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblPreco: TLabel
    Left = 29
    Top = 74
    Width = 45
    Height = 18
    Caption = 'PRE'#199'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblImposto: TLabel
    Left = 517
    Top = 73
    Width = 66
    Height = 18
    Caption = 'IMPOSTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBombaCombustivel: TLabel
    Left = 28
    Top = 18
    Width = 174
    Height = 18
    Caption = 'BOMBA ABASTECIMENTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 517
    Top = 17
    Width = 47
    Height = 18
    Caption = 'TOTAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtLitro: TEdit
    Left = 275
    Top = 97
    Width = 236
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = edtLitroExit
    OnKeyPress = edtLitroKeyPress
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 129
    Width = 734
    Height = 265
    ActivePage = TUltimasVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TUltimasVendas: TTabSheet
      Caption = 'Ultimas Vendas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object dbgUltimasVendas: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 232
        Align = alClient
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nCdVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cDescricao'
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dDataVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nLitros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nPreco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nValorImposto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nTotalVenda'
            Visible = True
          end>
      end
    end
  end
  object dblkBombaAbastecimento: TDBLookupComboBox
    Left = 29
    Top = 42
    Width = 241
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'nCdBombaAbastecimnento'
    ListField = 'cDescricao'
    ListSource = dsBombaAbastecimento
    ParentFont = False
    TabOrder = 2
    OnExit = dblkBombaAbastecimentoExit
  end
  object btnRegistrarVenda: TButton
    Left = 266
    Top = 400
    Width = 241
    Height = 57
    Caption = 'REGISTRAR VENDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnRegistrarVendaClick
  end
  object btnCancelarVenda: TButton
    Left = 513
    Top = 400
    Width = 241
    Height = 57
    Caption = 'CANCELAR VENDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelarVendaClick
  end
  object mskPreco: TMaskEdit
    Left = 28
    Top = 97
    Width = 241
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = ''
  end
  object mskTotal: TMaskEdit
    Left = 517
    Top = 41
    Width = 241
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = ''
  end
  object mskImposto: TMaskEdit
    Left = 517
    Top = 97
    Width = 241
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = ''
  end
  object cdsBombaAbastecimento: TClientDataSet
    PersistDataPacket.Data = {
      6F0000009619E0BD0100000018000000030000000000030000006F00166E4364
      426F6D626141626173746563696D6E656E746F04000100000000000E6E436443
      6F6D627573746976656C04000100000000000A6344657363726963616F010049
      00000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nCdBombaAbastecimnento'
        DataType = ftInteger
      end
      item
        Name = 'nCdCombustivel'
        DataType = ftInteger
      end
      item
        Name = 'cDescricao'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 316
    Top = 65526
    object cdsBombaAbastecimentonCdBombaAbastecimnento: TIntegerField
      FieldName = 'nCdBombaAbastecimnento'
    end
    object cdsBombaAbastecimentonCdCombustivel: TIntegerField
      FieldName = 'nCdCombustivel'
    end
    object cdsBombaAbastecimentocDescricao: TStringField
      FieldName = 'cDescricao'
      Size = 100
    end
  end
  object dsBombaAbastecimento: TDataSource
    DataSet = cdsBombaAbastecimento
    Left = 348
    Top = 65534
  end
  object cdsCombustivel: TClientDataSet
    PersistDataPacket.Data = {
      540000009619E0BD01000000180000000300000000000300000054000E6E4364
      436F6D627573746976656C0400010000000000066E56616C6F72080004000000
      00000B50657263496D706F73746F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nCdCombustivel'
        DataType = ftInteger
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
    Left = 244
    Top = 65526
    object cdsCombustivelnCdCombustivel: TIntegerField
      FieldName = 'nCdCombustivel'
    end
    object cdsCombustivelnValor: TFloatField
      FieldName = 'nValor'
    end
    object cdsCombustivelPercImposto: TFloatField
      FieldName = 'PercImposto'
    end
  end
  object cdsVendas: TClientDataSet
    PersistDataPacket.Data = {
      C40000009619E0BD010000001800000008000000000003000000C400086E4364
      56656E646104000100000000000A6344657363726963616F0100490000000100
      0557494454480200020064000A644461746156656E6461040006000000000007
      6E4C6974726F730800040000000000066E507265636F08000400000000000D6E
      56616C6F72496D706F73746F08000400000000000B6E546F74616C56656E6461
      0800040000000000156E4364426F6D626141626173746563696D656E746F0400
      0100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nCdVenda'
        DataType = ftInteger
      end
      item
        Name = 'cDescricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dDataVenda'
        DataType = ftDate
      end
      item
        Name = 'nLitros'
        DataType = ftFloat
      end
      item
        Name = 'nPreco'
        DataType = ftFloat
      end
      item
        Name = 'nValorImposto'
        DataType = ftFloat
      end
      item
        Name = 'nTotalVenda'
        DataType = ftFloat
      end
      item
        Name = 'nCdBombaAbastecimento'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 452
    Top = 246
    object cdsVendasnCdVenda: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'nCdVenda'
    end
    object cdsVendascDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cDescricao'
      Size = 100
    end
    object cdsVendasdDataVenda: TDateField
      DisplayLabel = 'Data Venda'
      FieldName = 'dDataVenda'
    end
    object cdsVendasnLitros: TFloatField
      DisplayLabel = 'Qtd. Litros'
      FieldName = 'nLitros'
      DisplayFormat = ' #,###0.00'
    end
    object cdsVendasnPreco: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'nPreco'
      DisplayFormat = ' #,###0.00'
    end
    object cdsVendasnValorImposto: TFloatField
      DisplayLabel = 'Valor Imposto'
      FieldName = 'nValorImposto'
      DisplayFormat = ' #,###0.00'
    end
    object cdsVendasnTotalVenda: TFloatField
      DisplayLabel = 'Total Venda'
      FieldName = 'nTotalVenda'
      DisplayFormat = ' #,###0.00'
    end
    object cdsVendasnCdBombaAbastecimento: TIntegerField
      FieldName = 'nCdBombaAbastecimento'
    end
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 504
    Top = 248
  end
end
