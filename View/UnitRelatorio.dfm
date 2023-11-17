object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  Caption = 'frmRelatorio'
  ClientHeight = 841
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RelVenda: TRLReport
    Left = 32
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 99
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 264
        Top = 40
        Width = 157
        Height = 16
        Caption = 'RELAT'#211'RIO DE VENDAS'
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 137
      Width = 718
      Height = 96
      DataFields = 'dDataVenda'
      object RLBand2: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 33
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText1: TRLDBText
          Left = 55
          Top = 9
          Width = 114
          Height = 16
          DataField = 'cDescricao'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 3
          Top = 9
          Width = 44
          Height = 16
          DataField = 'nCdVenda'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 402
          Top = 9
          Width = 59
          Height = 16
          DataField = 'nLitros'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 543
          Top = 9
          Width = 80
          Height = 16
          DataField = 'nValorImposto'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 479
          Top = 9
          Width = 45
          Height = 16
          DataField = 'nPreco'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 629
          Top = 9
          Width = 87
          Height = 16
          DataField = 'nTotalVenda'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 321
          Top = 9
          Width = 75
          Height = 16
          DataField = 'dDataVenda'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 185
          Top = 9
          Width = 129
          Height = 16
          DataField = 'DescTanque'
          DataSource = DataSource2
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 58
        Width = 718
        Height = 32
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 629
          Top = 7
          Width = 84
          Height = 16
          DataField = 'nTotalVenda'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Info = riSum
          Text = ''
        end
        object RLDBResult2: TRLDBResult
          Left = 543
          Top = 7
          Width = 80
          Height = 16
          DataField = 'nValorImposto'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Info = riSum
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 400
          Top = 7
          Width = 61
          Height = 16
          DataField = 'nValorImposto'
          DataSource = DataSource2
          DisplayMask = ' #,###0.00'
          Info = riSum
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        GreenBarColor = clWindow
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel2: TRLLabel
          Left = 3
          Top = 3
          Width = 44
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'C'#243'digo'
        end
        object RLLabel3: TRLLabel
          Left = 55
          Top = 3
          Width = 45
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Bomba'
        end
        object RLLabel4: TRLLabel
          Left = 321
          Top = 3
          Width = 72
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Data Venda'
        end
        object RLLabel5: TRLLabel
          Left = 400
          Top = 3
          Width = 61
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Qtd Litros'
        end
        object RLLabel6: TRLLabel
          Left = 479
          Top = 3
          Width = 49
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Pre'#231'o'
        end
        object RLLabel7: TRLLabel
          Left = 543
          Top = 3
          Width = 50
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Imposto'
        end
        object RLLabel8: TRLLabel
          Left = 640
          Top = 3
          Width = 32
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Total'
        end
        object RLLabel9: TRLLabel
          Left = 185
          Top = 3
          Width = 46
          Height = 16
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Tanque'
        end
      end
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsVendas
    Left = 176
    Top = 328
  end
  object cdsVendas: TClientDataSet
    PersistDataPacket.Data = {
      E30000009619E0BD010000001800000009000000000003000000E300086E4364
      56656E646104000100000000000A6344657363726963616F0100490000000100
      0557494454480200020064000A644461746156656E6461040006000000000007
      6E4C6974726F730800040000000000066E507265636F08000400000000000D6E
      56616C6F72496D706F73746F08000400000000000B6E546F74616C56656E6461
      0800040000000000156E4364426F6D626141626173746563696D656E746F0400
      0100000000000A4465736354616E717565010049000000010005574944544802
      00020064000000}
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
      end
      item
        Name = 'DescTanque'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 136
    Top = 327
    object cdsVendasnCdVenda: TIntegerField
      FieldName = 'nCdVenda'
    end
    object cdsVendascDescricao: TStringField
      FieldName = 'cDescricao'
      Size = 100
    end
    object cdsVendasdDataVenda: TDateField
      FieldName = 'dDataVenda'
    end
    object cdsVendasnLitros: TFloatField
      FieldName = 'nLitros'
    end
    object cdsVendasnPreco: TFloatField
      FieldName = 'nPreco'
    end
    object cdsVendasnValorImposto: TFloatField
      FieldName = 'nValorImposto'
    end
    object cdsVendasnTotalVenda: TFloatField
      FieldName = 'nTotalVenda'
    end
    object cdsVendasnCdBombaAbastecimento: TIntegerField
      FieldName = 'nCdBombaAbastecimento'
    end
    object cdsVendasDescTanque: TStringField
      FieldName = 'DescTanque'
      Size = 100
    end
  end
end
