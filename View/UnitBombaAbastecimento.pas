unit UnitBombaAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls,uControllerBombaAbastecimento,uEnumCrud,
  Datasnap.DBClient,data.Win.ADODB,uControllerTanqueCombustivel;

type
  TfrmBombaAbastecimento = class(TForm)
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblTanqueCombustivel: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtNumeroSerie: TEdit;
    dblkTanqueCombustivel: TDBLookupComboBox;
    btnGravar: TButton;
    btnExcluir: TButton;
    btnLimpar: TButton;
    btnListar: TButton;
    DBGrid1: TDBGrid;
    cdsBombaAbastecimento: TClientDataSet;
    cdsTanqueCombustivel: TClientDataSet;
    dsBombaAbastecimento: TDataSource;
    dsTanqueCombustivel: TDataSource;
    cdsBombaAbastecimentonCdBombaAbastecimento: TIntegerField;
    cdsBombaAbastecimentocNumeroSerie: TStringField;
    cdsBombaAbastecimentonCdTanqueCombustivel: TIntegerField;
    cdsBombaAbastecimentocDescricao: TStringField;
    cdsTanqueCombustivelnCdTanqueCombustivel: TIntegerField;
    cdsTanqueCombustivelcDescricao: TStringField;
    dbLkCombustivel: TDBLookupComboBox;
    Combustivel: TLabel;
    cdsCombustivel: TClientDataSet;
    cdsCombustivelnCdCombustivel: TIntegerField;
    cdsCombustivelcDescricao: TStringField;
    dsCombustivel: TDataSource;
    cdsBombaAbastecimentonCdCombustivel: TIntegerField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure Gravar;
    procedure LimparTela;
    procedure EsconderListagem(Esconder: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBombaAbastecimento: TfrmBombaAbastecimento;

implementation

{$R *.dfm}

uses uControllerCombustivel;

procedure TfrmBombaAbastecimento.btnExcluirClick(Sender: TObject);
var
  ControllerBombaAbastecimento : TControllerBombaAbastecimento;
begin
  ControllerBombaAbastecimento := TControllerBombaAbastecimento.Create;
  ControllerBombaAbastecimento.ModeloBombaAbastecimento.Enumerador := Excluir;
  ControllerBombaAbastecimento.ModeloBombaAbastecimento.nCdBombaAbastecimento := StrToInt(edtCodigo.Text);
  try
    if ControllerBombaAbastecimento.ModeloBombaAbastecimento.persistir then
      ShowMessage('Registro excluido')
    else
      ShowMessage('Erro ao excluir');
  finally
    FreeAndNil(ControllerBombaAbastecimento);
    LimparTela;
  end;
end;

procedure TfrmBombaAbastecimento.btnGravarClick(Sender: TObject);
begin
  if edtDescricao.Text = '' then
  begin
    MessageDlg('Descrição da bomba de abastecimento não informada.',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  if dblkTanqueCombustivel.Text = '' then
  begin
    MessageDlg('Tanque de combustivel não foi selecionado.',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  if dbLkCombustivel.Text = '' then
  begin
    MessageDlg('Combustivel não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  Gravar;
  LimparTela;
end;

procedure TfrmBombaAbastecimento.btnListarClick(Sender: TObject);
var
  ControllerBombaAbastecimento : TControllerBombaAbastecimento;
  Query : TADOQuery;
begin
  ControllerBombaAbastecimento := TControllerBombaAbastecimento.Create;
  ControllerBombaAbastecimento.ModeloBombaAbastecimento.Enumerador := Listar;
  Query := ControllerBombaAbastecimento.Listar;

  if Query.RecordCount > 0 then
  begin
    if cdsBombaAbastecimento.Active then
      cdsBombaAbastecimento.EmptyDataSet
    else
      cdsBombaAbastecimento.Active := True;

    while not Query.Eof do
    begin
      cdsBombaAbastecimento.Append;
      cdsBombaAbastecimentonCdBombaAbastecimento.Value := Query.FieldByName('nCdBombaAbastecimento').Value;
      cdsBombaAbastecimentocDescricao.Value            := Query.FieldByName('cDescricao').Value;
      cdsBombaAbastecimentocNumeroSerie.Value          := Query.FieldByName('cNumeroSerie').Value;
      cdsBombaAbastecimentonCdTanqueCombustivel.Value  := Query.FieldByName('nCdTanqueCombustivel').Value;
      cdsBombaAbastecimentonCdCombustivel.Value        := Query.FieldByName('nCdCombustivel').Value;
      cdsBombaAbastecimento.Post;

      Query.Next;
    end;
    EsconderListagem(False);
    FreeAndNil(ControllerBombaAbastecimento);
    FreeAndNil(Query);
    Abort;
  end;

  EsconderListagem(True);

end;

procedure TfrmBombaAbastecimento.DBGrid1DblClick(Sender: TObject);
begin
  edtCodigo.text                 := IntToStr(cdsBombaAbastecimentonCdBombaAbastecimento.Value);
  edtNumeroSerie.Text            := cdsBombaAbastecimentocNumeroSerie.Value;
  dblkTanqueCombustivel.KeyValue := cdsBombaAbastecimentonCdTanqueCombustivel.Value;
  edtDescricao.Text              := cdsBombaAbastecimentocDescricao.Value;
  dbLkCombustivel.KeyValue       := cdsBombaAbastecimentonCdCombustivel.Value;

  EsconderListagem(true);
end;

procedure TfrmBombaAbastecimento.btnLimparClick(Sender: TObject);
begin
  LimparTela;
end;

procedure TfrmBombaAbastecimento.Gravar;
var
  ControllerBombaAbastecimento : TControllerBombaAbastecimento;
begin
  ControllerBombaAbastecimento := TControllerBombaAbastecimento.Create;
  try
    if edtCodigo.text = '' then
      ControllerBombaAbastecimento.ModeloBombaAbastecimento.Enumerador := Inserir
    else
    begin
      ControllerBombaAbastecimento.ModeloBombaAbastecimento.Enumerador := atualizar;
      ControllerBombaAbastecimento.ModeloBombaAbastecimento.nCdBombaAbastecimento := StrToInt(edtCodigo.Text);
    end;

    ControllerBombaAbastecimento.ModeloBombaAbastecimento.cDescricao           := edtDescricao.Text;
    ControllerBombaAbastecimento.ModeloBombaAbastecimento.cNumeroSerie         := edtNumeroSerie.Text;
    ControllerBombaAbastecimento.ModeloBombaAbastecimento.nCdTanqueCombustivel := dblkTanqueCombustivel.KeyValue;
    ControllerBombaAbastecimento.ModeloBombaAbastecimento.nCdCombustivel       := dbLkCombustivel.KeyValue;

    if ControllerBombaAbastecimento.ModeloBombaAbastecimento.persistir then
      ShowMessage('Registro inserido.')
    else
      ShowMessage('Erro ao inserir');

  finally
    FreeAndNil(ControllerBombaAbastecimento);
  end;

end;

procedure TfrmBombaAbastecimento.LimparTela;
begin
  edtCodigo.Text                 := '';
  edtDescricao.Text              := '';
  edtNumeroSerie.Text            := '';
  dblkTanqueCombustivel.KeyValue := 0;
  dbLkCombustivel.KeyValue       := 0;
  EsconderListagem(True);
end;

procedure TfrmBombaAbastecimento.EsconderListagem(Esconder: Boolean );
begin
  if Esconder then
    frmBombaAbastecimento.Height := 180
  else
    frmBombaAbastecimento.Height := 270;
end;

procedure TfrmBombaAbastecimento.FormShow(Sender: TObject);
var
  ControllerTanqueCombustivel : TControllerTanqueCombustivel;
  ControllerCombustivel : TControllerCombustivel;
  Query : TADOQuery;
begin

  {$REGION 'Popula lookup Tanque Combustivel'}
  ControllerTanqueCombustivel := TControllerTanqueCombustivel.Create;
  ControllerTanqueCombustivel.ModeloTanqueCombustivel.Enumerador := Listar;
  Query := ControllerTanqueCombustivel.ModeloTanqueCombustivel.listar;

  try
    if Query.RecordCount > 0 then
    begin
      if cdsTanqueCombustivel.Active then
        cdsTanqueCombustivel.EmptyDataSet
      else
        cdsTanqueCombustivel.Active := True;

      while not Query.Eof do
      begin
        cdsTanqueCombustivel.Append;
        cdsTanqueCombustivelnCdTanqueCombustivel.Value := Query.FieldByName('nCdTanqueCombustivel').Value;
        cdsTanqueCombustivelcDescricao.value           := Query.FieldByName('cDescricao').Value;
        cdsTanqueCombustivel.Post;

        Query.Next;
      end;

    end;
  finally
    FreeAndNil(ControllerTanqueCombustivel);
    FreeAndNil(Query);
  end;
  {$endregion}

  {$Region 'Popula Lookup Combustivel'}
  ControllerCombustivel := TControllerCombustivel.Create;
  try
    ControllerCombustivel.ModeloCombustivel.Enumerador := Listar;
    Query := ControllerCombustivel.ModeloCombustivel.Listar;
    while not Query.Eof do
    begin
      cdsCombustivel.Append;
      cdsCombustivelnCdCombustivel.Value := Query.FieldByName('nCdCombustivel').Value;
      cdsCombustivelcDescricao.Value := Query.FieldByName('cDescricao').Value;
      cdsCombustivel.Post;
      Query.Next;
    end;

  finally
    FreeAndNil(ControllerCombustivel);
    FreeAndNil(Query);
  end;

  {$EndRegion}

  frmBombaAbastecimento.Height := 180;
end;

end.
