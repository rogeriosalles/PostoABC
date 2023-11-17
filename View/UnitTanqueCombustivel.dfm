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
    Left = 16
    Top = 96
    Width = 56
    Height = 13
    Caption = 'Capacidade'
  end
  object lblSaldo: TLabel
    Left = 146
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
    Left = 16
    Top = 113
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtSaldo: TEdit
    Left = 143
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
    Columns = <
      item
        Expanded = False
        FieldName = 'nCdTanqueCombustivel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cDescricao'
        Visible = True
      end>
  end
  object btnLimpar: TButton
    Left = 178
    Top = 155
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 8
    OnClick = btnLimparClick
  end
  object cdsTanqueCombustivel: TClientDataSet
    PersistDataPacket.Data = {
      A30000009619E0BD010000001800000006000000000003000000A300146E4364
      54616E717565436F6D627573746976656C04000100000000000A634465736372
      6963616F01004900000001000557494454480200020064000E6E4364436F6D62
      7573746976656C04000100000000000B6E436170616369646164650800040000
      000000066E53616C646F08000400000000000A6E4364456D7072657361040001
      00000000000000}
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
      end
      item
        Name = 'nCdCombustivel'
        DataType = ftInteger
      end
      item
        Name = 'nCapacidade'
        DataType = ftFloat
      end
      item
        Name = 'nSaldo'
        DataType = ftFloat
      end
      item
        Name = 'nCdEmpresa'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 208
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
    object cdsTanqueCombustivelnCdCombustivel: TIntegerField
      FieldName = 'nCdCombustivel'
    end
    object cdsTanqueCombustivelnCapacidade: TFloatField
      FieldName = 'nCapacidade'
    end
    object cdsTanqueCombustivelnSaldo: TFloatField
      FieldName = 'nSaldo'
    end
    object cdsTanqueCombustivelnCdEmpresa: TIntegerField
      FieldName = 'nCdEmpresa'
    end
  end
  object dsTanqueCombustivel: TDataSource
    DataSet = cdsTanqueCombustivel
    Left = 112
    Top = 208
  end
end
