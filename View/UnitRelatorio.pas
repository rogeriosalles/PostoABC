unit UnitRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Data.Win.ADODB, Datasnap.DBClient;

type
  TfrmRelatorio = class(TForm)
    RelVenda: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    DataSource2: TDataSource;
    cdsVendas: TClientDataSet;
    cdsVendasnCdVenda: TIntegerField;
    cdsVendascDescricao: TStringField;
    cdsVendasdDataVenda: TDateField;
    cdsVendasnLitros: TFloatField;
    cdsVendasnPreco: TFloatField;
    cdsVendasnValorImposto: TFloatField;
    cdsVendasnTotalVenda: TFloatField;
    cdsVendasnCdBombaAbastecimento: TIntegerField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    cdsVendasDescTanque: TStringField;
    RLLabel9: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
  private


    { Private declarations }
  public
    { Public declarations }
    TotalVenda : double ;
     procedure ListarVendas;

  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses uControllerVenda ;

procedure TfrmRelatorio.ListarVendas;
var
  ControllerVenda : TControllerVenda;
  Query : TADOQuery;
begin
  ControllerVenda := TControllerVenda.Create;
  Query := ControllerVenda.ModeloVenda.Listar;
  try
    if Query.RecordCount > 0 then
    begin
      if cdsVendas.Active then
        cdsVendas.EmptyDataSet
      else
        cdsVendas.Active := True;

      while not Query.eof do
      begin
        cdsVendas.Append;
        cdsVendasnCdVenda.Value := Query.FieldByName('nCdVenda').Value;
        cdsVendascDescricao.Value := Query.FieldByName('cDescricao').Value;
        cdsVendasdDataVenda.Value := Trunc(Query.FieldByName('dDataVenda').Value);
        cdsVendasnLitros.Value    := Query.FieldByName('nLitros').Value;
        cdsVendasnPreco.Value     := Query.FieldByName('nPreco').Value;
        cdsVendasnValorImposto.Value := Query.FieldByName('nValorImposto').Value;
        cdsVendasnTotalVenda.Value   := Query.FieldByName('nTotalvenda').Value;
        cdsVendasDescTanque.Value   := Query.FieldByName('DescTanque').Value;
        cdsVendas.Post;

        Query.Next;
      end;
    end;
  finally
    FreeAndNil(ControllerVenda);
  end;

end;



end.
