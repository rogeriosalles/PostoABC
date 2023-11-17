unit UnitTanqueCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uEnumCrud, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,data.Win.ADODB,UnitPrincipal;

type
  TfrmTanqueCombustivel = class(TForm)
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblCapacidade: TLabel;
    lblSaldo: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtCapacidade: TEdit;
    edtSaldo: TEdit;
    Button1: TButton;
    btnExcluir: TButton;
    btnListar: TButton;
    DBGrid1: TDBGrid;
    cdsTanqueCombustivel: TClientDataSet;
    dsTanqueCombustivel: TDataSource;
    cdsTanqueCombustivelnCdTanqueCombustivel: TIntegerField;
    cdsTanqueCombustivelcDescricao: TStringField;
    btnLimpar: TButton;
    cdsTanqueCombustivelnCdCombustivel: TIntegerField;
    cdsTanqueCombustivelnCapacidade: TFloatField;
    cdsTanqueCombustivelnSaldo: TFloatField;
    cdsTanqueCombustivelnCdEmpresa: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
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
  frmTanqueCombustivel: TfrmTanqueCombustivel;

implementation

{$R *.dfm}

uses uControllerTanqueCombustivel,uControllerCombustivel;

procedure TfrmTanqueCombustivel.LimparTela;
begin
  edtCodigo.Text := '';
  edtDescricao.Text := '';
  edtCapacidade.Text := '';
  edtSaldo.Text := '';
end;


procedure TfrmTanqueCombustivel.btnExcluirClick(Sender: TObject);
var
  ControllerTanqueCombustivel : TControllerTanqueCombustivel;
begin
  ControllerTanqueCombustivel := TControllerTanqueCombustivel.Create;

  try
    ControllerTanqueCombustivel.ModeloTanqueCombustivel.Enumerador := Excluir;
    ControllerTanqueCombustivel.ModeloTanqueCombustivel.nCdTanqueCombustivel := StrToInt(edtCodigo.text);

    if ControllerTanqueCombustivel.ModeloTanqueCombustivel.persistir then
      ShowMessage('Registro excluido.')
    else
      ShowMessage('Erro ao excluir');

    LimparTela;
  finally
    FreeAndNil(ControllerTanqueCombustivel);
  end;

end;

procedure TfrmTanqueCombustivel.btnLimparClick(Sender: TObject);
begin
  LimparTela;
end;

procedure TfrmTanqueCombustivel.EsconderListagem(Esconder : Boolean);
begin
  if Esconder then
    frmTanqueCombustivel.Height := 230
  else
    frmTanqueCombustivel.Height := 390;
end;

procedure TfrmTanqueCombustivel.btnListarClick(Sender: TObject);
var
  ControllerTanqueCombustivel : TControllerTanqueCombustivel;
  Query : TADOQuery;
begin
  ControllerTanqueCombustivel := TControllerTanqueCombustivel.Create;
  ControllerTanqueCombustivel.ModeloTanqueCombustivel.Enumerador := Listar;
  Query := ControllerTanqueCombustivel.Listar;

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
      cdsTanqueCombustivelcDescricao.Value           := Query.FieldByName('cDescricao').Value;
      cdsTanqueCombustivelnCapacidade.Value          := Query.FieldByName('nCapacidadeTanque').Value;
      //cdsTanqueCombustivelnSaldo.Value               := Query.FieldByName('nSaldo').Value;
      cdsTanqueCombustivelnCdEmpresa.Value           := Query.FieldByName('nCdEmpresa').Value;
      cdsTanqueCombustivel.Post;
      Query.Next;
    end;

    EsconderListagem(False);
    Abort;
  end;

  EsconderListagem(True);

end;

procedure TfrmTanqueCombustivel.Button1Click(Sender: TObject);
begin
  if edtDescricao.Text = '' then
  begin
    MessageDlg('Descrição do tanque de combustivel não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  if edtCapacidade.Text = '' then
  begin
    MessageDlg('Capacidade do tanque de combustivel não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  Gravar;
  LimparTela;
end;

procedure TfrmTanqueCombustivel.DBGrid1DblClick(Sender: TObject);
begin
  edtCodigo.text := IntToStr(cdsTanqueCombustivelnCdTanqueCombustivel.value);
  edtDescricao.Text := cdsTanqueCombustivelcDescricao.Value;
  edtCapacidade.Text := FloatToStr(cdsTanqueCombustivelnCapacidade.Value);
  edtSaldo.Text      := FloatToStr(cdsTanqueCombustivelnSaldo.Value);

  EsconderListagem(true);
end;

procedure TfrmTanqueCombustivel.FormShow(Sender: TObject);
begin
  frmTanqueCombustivel.Height := 240;
end;

procedure TfrmTanqueCombustivel.Gravar;
var
  ControllerTanqueCombustivel : TControllerTanqueCombustivel;
begin
  ControllerTanqueCombustivel := TControllerTanqueCombustivel.Create;

  try
    if edtCodigo.Text = '' then
      ControllerTanqueCombustivel.ModeloTanqueCombustivel.Enumerador := Inserir
    else
    begin
      ControllerTanqueCombustivel.ModeloTanqueCombustivel.Enumerador := Atualizar;
      ControllerTanqueCombustivel.ModeloTanqueCombustivel.nCdTanqueCombustivel := StrToInt(edtcodigo.Text);
    end;

    ControllerTanqueCombustivel.ModeloTanqueCombustivel.cDescricao := edtDescricao.Text;
    ControllerTanqueCombustivel.ModeloTanqueCombustivel.nCapacidadeTanque := StrToFloat(edtCapacidade.Text);
    ControllerTanqueCombustivel.ModeloTanqueCombustivel.nCdEmpresa := frmPrincipal.nCdEmpresa;

    if ControllerTanqueCombustivel.ModeloTanqueCombustivel.persistir then
      ShowMessage('Registro Inserido')
    else
      ShowMessage('Erro ao gerar registro');
  finally
    FreeAndNil(ControllerTanqueCombustivel)
  end;

end;

end.
