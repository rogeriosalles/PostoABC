object frmTanqueCombustivel: TfrmTanqueCombustivel
  Left = 0
  Top = 0
  Caption = 'Cadastro - Tanque Combustivel'
  ClientHeight = 325
  ClientWidth = 403
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
    Top = 13
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblDescricao: TLabel
    Left = 16
    Top = 53
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblCapacidade: TLabel
    Left = 143
    Top = 96
    Width = 56
    Height = 13
    Caption = 'Capacidade'
  end
  object Combustivel: TLabel
    Left = 16
    Top = 97
    Width = 58
    Height = 13
    Caption = 'Combustivel'
  end
  object lblSaldo: TLabel
    Left = 273
    Top = 94
    Width = 26
    Height = 13
    Caption = 'Saldo'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 28
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edtDescricao: TEdit
    Left = 16
    Top = 69
    Width = 375
    Height = 21
    TabOrder = 1
  end
  object edtCapacidade: TEdit
    Left = 143
    Top = 113
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtSaldo: TEdit
    Left = 270
    Top = 113
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Button1: TButton
    Left = 16
    Top = 155
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object btnExcluir: TButton
    Left = 97
    Top = 155
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnListar: TButton
    Left = 292
    Top = 155
    Width = 103
    Height = 25
    Caption = 'Listar Tanques'
    TabOrder = 6
    OnClick = btnListarClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 198
    Width = 375
    Height = 120
    DataSource = dsTanqueCombustivel
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object dbCmbCombustivel: TDBComboBox
    Left = 16
    Top = 113
    Width = 121
    Height = 21
    DataField = 'cDescricao'
    DataSource = dsCombustivel
    TabOrder = 8
  end
  object btnLimpar: TButton
    Left = 178
    Top = 155
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 9
    OnClick = btnLimparClick
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
    Left = 280
    Top = 240
    object cdsTanqueCombustivelnCdTanqueCombustivel: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'nCdTanqueCombustivel'
    end
    object cdsTanqueCombustivelcDescricao: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 44
      FieldName = 'cDescricao'
      Size = 100
    end
  end
  object dsTanqueCombustivel: TDataSource
    DataSet = cdsTanqueCombustivel
    Left = 328
    Top = 240
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
    Left = 120
    Top = 264
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
    Left = 184
    Top = 264
  end
end
