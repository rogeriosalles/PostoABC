object frmBombaAbastecimento: TfrmBombaAbastecimento
  Left = 0
  Top = 0
  Caption = 'Cadastro - Bomba de Abastecimento'
  ClientHeight = 275
  ClientWidth = 435
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
  object lblCodigo: TLabel
    Left = 16
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblDescricao: TLabel
    Left = 16
    Top = 51
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblTanqueCombustivel: TLabel
    Left = 270
    Top = 8
    Width = 112
    Height = 13
    Caption = 'Tanque de Combustivel'
  end
  object Label4: TLabel
    Left = 143
    Top = 8
    Width = 39
    Height = 13
    Caption = 'N'#186' S'#233'rie'
  end
  object Combustivel: TLabel
    Left = 270
    Top = 51
    Width = 58
    Height = 13
    Caption = 'Combustivel'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 70
    Width = 248
    Height = 21
    TabOrder = 1
  end
  object edtNumeroSerie: TEdit
    Left = 143
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object dblkTanqueCombustivel: TDBLookupComboBox
    Left = 270
    Top = 27
    Width = 145
    Height = 21
    KeyField = 'nCdTanqueCombustivel'
    ListField = 'cDescricao'
    ListSource = dsTanqueCombustivel
    TabOrder = 3
  end
  object btnGravar: TButton
    Left = 16
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnExcluir: TButton
    Left = 97
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnLimpar: TButton
    Left = 178
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btnLimparClick
  end
  object btnListar: TButton
    Left = 259
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 7
    OnClick = btnListarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 143
    Width = 409
    Height = 120
    DataSource = dsBombaAbastecimento
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nCdBombaAbastecimento'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cNumeroSerie'
        Title.Caption = 'Numero de Serie'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDescricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 218
        Visible = True
      end>
  end
  object dbLkCombustivel: TDBLookupComboBox
    Left = 270
    Top = 70
    Width = 145
    Height = 21
    KeyField = 'nCdCombustivel'
    ListField = 'cDescricao'
    ListSource = dsCombustivel
    TabOrder = 9
  end
  object cdsBombaAbastecimento: TClientDataSet
    PersistDataPacket.Data = {
      AC0000009619E0BD010000001800000005000000000003000000AC00156E4364
      426F6D626141626173746563696D656E746F04000100000000000C634E756D65
      726F53657269650100490000000100055749445448020002003200146E436454
      616E717565436F6D627573746976656C04000100000000000A63446573637269
      63616F01004900000001000557494454480200020064000E6E4364436F6D6275
      73746976656C04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nCdBombaAbastecimento'
        DataType = ftInteger
      end
      item
        Name = 'cNumeroSerie'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nCdTanqueCombustivel'
        DataType = ftInteger
      end
      item
        Name = 'cDescricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nCdCombustivel'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 208
    object cdsBombaAbastecimentonCdBombaAbastecimento: TIntegerField
      FieldName = 'nCdBombaAbastecimento'
    end
    object cdsBombaAbastecimentocNumeroSerie: TStringField
      FieldName = 'cNumeroSerie'
      Size = 50
    end
    object cdsBombaAbastecimentonCdTanqueCombustivel: TIntegerField
      FieldName = 'nCdTanqueCombustivel'
    end
    object cdsBombaAbastecimentocDescricao: TStringField
      FieldName = 'cDescricao'
      Size = 100
    end
    object cdsBombaAbastecimentonCdCombustivel: TIntegerField
      FieldName = 'nCdCombustivel'
    end
  end
  object cdsTanqueCombustivel: TClientDataSet
    PersistDataPacket.Data = {
      560000009619E0BD0100000018000000020000000000030000005600146E4364
      54616E717565436F6D627573746976656C04000100000000000A634465736372
      6963616F01004900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nCdTanqueCombustivel'
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
    Left = 256
    Top = 168
    object cdsTanqueCombustivelnCdTanqueCombustivel: TIntegerField
      FieldName = 'nCdTanqueCombustivel'
    end
    object cdsTanqueCombustivelcDescricao: TStringField
      FieldName = 'cDescricao'
      Size = 100
    end
  end
  object dsBombaAbastecimento: TDataSource
    DataSet = cdsBombaAbastecimento
    Left = 112
    Top = 208
  end
  object dsTanqueCombustivel: TDataSource
    DataSet = cdsTanqueCombustivel
    Left = 304
    Top = 176
  end
  object cdsCombustivel: TClientDataSet
    PersistDataPacket.Data = {
      500000009619E0BD01000000180000000200000000000300000050000E6E4364
      436F6D627573746976656C04000100000000000A6344657363726963616F0100
      4900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
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
    Left = 232
    Top = 223
    object cdsCombustivelnCdCombustivel: TIntegerField
      FieldName = 'nCdCombustivel'
    end
    object cdsCombustivelcDescricao: TStringField
      FieldName = 'cDescricao'
      Size = 100
    end
  end
  object dsCombustivel: TDataSource
    DataSet = cdsCombustivel
    Left = 272
    Top = 223
  end
end
