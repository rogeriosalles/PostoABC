unit UnitVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask,data.Win.ADODB,uEnumCrud,
  Datasnap.DBClient;

type
  TfrmVenda = class(TForm)
    edtLitro: TEdit;
    PageControl1: TPageControl;
    TUltimasVendas: TTabSheet;
    dbgUltimasVendas: TDBGrid;
    lblLitros: TLabel;
    lblPreco: TLabel;
    lblImposto: TLabel;
    dblkBombaAbastecimento: TDBLookupComboBox;
    lblBombaCombustivel: TLabel;
    lblTotal: TLabel;
    btnRegistrarVenda: TButton;
    btnCancelarVenda: TButton;
    mskPreco: TMaskEdit;
    mskTotal: TMaskEdit;
    mskImposto: TMaskEdit;
    cdsBombaAbastecimento: TClientDataSet;
    dsBombaAbastecimento: TDataSource;
    cdsBombaAbastecimentonCdBombaAbastecimnento: TIntegerField;
    cdsBombaAbastecimentonCdCombustivel: TIntegerField;
    cdsBombaAbastecimentocDescricao: TStringField;
    cdsCombustivel: TClientDataSet;
    cdsCombustivelnCdCombustivel: TIntegerField;
    cdsCombustivelnValor: TFloatField;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    cdsVendasnCdVenda: TIntegerField;
    cdsVendascDescricao: TStringField;
    cdsVendasdDataVenda: TDateField;
    cdsVendasnLitros: TFloatField;
    cdsVendasnPreco: TFloatField;
    cdsVendasnValorImposto: TFloatField;
    cdsVendasnTotalVenda: TFloatField;
    cdsVendasnCdBombaAbastecimento: TIntegerField;
    cdsCombustivelPercImposto: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure edtLitroKeyPress(Sender: TObject; var Key: Char);
    procedure dblkBombaAbastecimentoExit(Sender: TObject);
    procedure edtLitroExit(Sender: TObject);
    procedure btnRegistrarVendaClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
  private
    procedure LimparTela;
    procedure Gravar;
    procedure ListarVendas;
    { Private declarations }
  public
    { Public declarations }
    Total : double;
    Preco : double;
    Imposto : double;
  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}

uses uControllerBombaAbastecimento,uControllerConection,uControllerCombustivel,uControllerVenda;

procedure TfrmVenda.btnCancelarVendaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVenda.btnRegistrarVendaClick(Sender: TObject);
begin
  if dblkBombaAbastecimento.Text = '' then
  begin
    MessageDlg('Bomba de abastecimento não foi selecionado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort
  end;

  if edtLitro.Text = '' then
  begin
    MessageDlg('A quantidade de litro não foi informada.',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  Gravar;
  ListarVendas;
end;

procedure TfrmVenda.Gravar;
var
  ControllerVenda : TControllerVenda;
begin
  ControllerVenda := TControllerVenda.Create;
  try
    ControllerVenda.ModeloVenda.Enumerador := Inserir;
    ControllerVenda.ModeloVenda.nCdBombaAbastecimento := dblkBombaAbastecimento.KeyValue;
    ControllerVenda.ModeloVenda.nLitros := StrToFloat(edtLitro.Text);
    ControllerVenda.ModeloVenda.nPreco  := Preco;
    ControllerVenda.ModeloVenda.nValorImposto := Imposto;
    ControllerVenda.ModeloVenda.nTotalVenda := Total;
    ControllerVenda.ModeloVenda.dDataVenda := now;

    if ControllerVenda.ModeloVenda.Persistir then
      Showmessage('Venda Finalizada')
    else
      ShowMessage('Erro ao gerar venda');

  finally
    FreeAndNil(ControllerVenda);
    ListarVendas;
  end;
end;

procedure TfrmVenda.ListarVendas;
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
        cdsVendasdDataVenda.Value := Query.FieldByName('dDataVenda').Value;
        cdsVendasnLitros.Value    := Query.FieldByName('nLitros').Value;
        cdsVendasnPreco.Value     := Query.FieldByName('nPreco').Value;
        cdsVendasnValorImposto.Value := Query.FieldByName('nValorImposto').Value;
        cdsVendasnTotalVenda.Value   := Query.FieldByName('nTotalvenda').Value;
        Query.Next;
      end;


    end;
  finally
    FreeAndNil(ControllerVenda);
  end;
end;

procedure TfrmVenda.dblkBombaAbastecimentoExit(Sender: TObject);
begin
  cdsCombustivel.Locate('nCdCombustivel',cdsBombaAbastecimentonCdCombustivel.Value,[]);
  Preco := cdsCombustivelnValor.Value;
  mskPreco.Text := FormatFloat('R$ #,0.00 ',cdsCombustivelnValor.Value);
end;

procedure TfrmVenda.edtLitroExit(Sender: TObject);
begin
  if edtLitro.Text <> '' then
  begin
    Total := (StrToFloat(edtLitro.text) * cdsCombustivelnValor.Value);
    mskTotal.Text := FormatFloat( 'R$ #,0.00 ',Total);

    Imposto := (Total * cdsCombustivelPercImposto.Value) / 100;
    mskImposto.Text := FormatFloat( 'R$ #,0.00 ',Imposto);
  end;
end;

procedure TfrmVenda.edtLitroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',','.',#8]) then
    key :=#0;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
var
  ControllerBombaAbastecimento : TControllerBombaAbastecimento;
  ControllerCombustivel : TControllerCombustivel ;
  Query : TADOQuery;
begin
  {$REGION 'Lista as bombas de abastecimento'}
  ControllerBombaAbastecimento := TControllerBombaAbastecimento.Create;
  ControllerBombaAbastecimento.ModeloBombaAbastecimento.Enumerador := Listar;
  Query := ControllerBombaAbastecimento.ModeloBombaAbastecimento.Listar;

  try
    if Query.RecordCount > 0 then
    begin
      if cdsBombaAbastecimento.Active then
        cdsBombaAbastecimento.EmptyDataSet
      else
        cdsBombaAbastecimento.Active := true;

      while not Query.eof do
      begin
        cdsBombaAbastecimento.Append;
        cdsBombaAbastecimentonCdBombaAbastecimnento.Value := Query.FieldByName('nCdBombaAbastecimento').Value;
        cdsBombaAbastecimentonCdCombustivel.Value         := Query.FieldByName('nCdCombustivel').Value;
        cdsBombaAbastecimentocDescricao.Value             := Query.FieldByName('cDescricao').Value;
        cdsBombaAbastecimento.Post;
        Query.Next;
      end;
    end;
  finally
    FreeAndNil(ControllerBombaAbastecimento);
    FreeAndNil(Query);
  end;
  {$ENDREGION}

  {$REGION 'Lista os combustiveis com os valores e ids'}
  ControllerCombustivel := TControllerCombustivel.Create;
  ControllerCombustivel.ModeloCombustivel.Enumerador := Listar;
  Query := ControllerCombustivel.ModeloCombustivel.Listar;

  try
    if Query.RecordCount > 0 then
    begin
      if cdsCombustivel.Active then
        cdsCombustivel.EmptyDataSet
      else
        cdsCombustivel.Active := true;

      while not Query.eof do
      begin
        cdsCombustivel.Append;
        cdsCombustivelnCdCombustivel.Value := Query.FieldByName('nCdCombustivel').Value;
        cdsCombustivelnValor.Value         := Query.FieldByName('nValor').Value;
        cdsCombustivelPercImposto.Value    := Query.FieldByName('PercImposto').Value;
        cdsCombustivel.Post;
        Query.Next;
      end;
    end;
  finally
    FreeAndNil(ControllerCombustivel);
    FreeAndNil(Query);
  end;
  {$ENDREGION}

  ListarVendas;
end;

procedure TfrmVenda.LimparTela;
begin
  edtLitro.Text := '';
  mskPreco.Text := '';
  mskTotal.Text := '';
  mskImposto.Text := '';

  dblkBombaAbastecimento.KeyValue := 0;
end;

end.
