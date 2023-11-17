unit UnitCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls,uEnumCrud,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,data.Win.ADODB;

type
  TfrmCombustive = class(TForm)
    lblDescricao: TLabel;
    lblValor: TLabel;
    edtDescricao: TEdit;
    mskValor: TMaskEdit;
    btnGravar: TButton;
    btnExcluir: TButton;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    dbGridListaCombustiveis: TDBGrid;
    btnBuscar: TButton;
    cdsListar: TClientDataSet;
    dsListar: TDataSource;
    cdsListarnCdCombustivel: TFloatField;
    cdsListarnValor: TFloatField;
    cdsListarcDescricao: TStringField;
    mskPercImposto: TMaskEdit;
    lblPercImposto: TLabel;
    cdsListarPercImposto: TFloatField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dbGridListaCombustiveisDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Gravar;
    procedure EsconderListagem(Esconder: Boolean);
    procedure LimparTela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCombustive: TfrmCombustive;

implementation

{$R *.dfm}

uses uControllerCombustivel;


procedure TfrmCombustive.EsconderListagem(Esconder : Boolean);
begin
  if Esconder then
    frmCombustive.Height := 240
  else
    frmCombustive.Height := 390;
end;

procedure TfrmCombustive.FormShow(Sender: TObject);
begin
  frmCombustive.Height := 240;
end;

procedure TfrmCombustive.Gravar;
var
  ControllerCombustivel : TControllerCombustivel;
begin
  ControllerCombustivel := TControllerCombustivel.create;
  try
    if edtCodigo.Text <> '' then
    begin
      ControllerCombustivel.ModeloCombustivel.Enumerador := atualizar;
      ControllerCombustivel.ModeloCombustivel.nCdCombustivel := strtoint(edtCodigo.Text);
    end
    else
      ControllerCombustivel.ModeloCombustivel.Enumerador := Inserir;

    ControllerCombustivel.ModeloCombustivel.cDescricao := edtDescricao.Text;
    ControllerCombustivel.ModeloCombustivel.nValor := StrToFloat(mskValor.Text);
    ControllerCombustivel.ModeloCombustivel.PercImposto := StrToFloat(mskPercImposto.Text);

    if ControllerCombustivel.Persistir then
      ShowMessage('Registro inserido.')
    else
      ShowMessage('Erro ao inserir registro.');

  finally
    FreeAndNil(ControllerCombustivel);
  end;

end;

procedure TfrmCombustive.btnBuscarClick(Sender: TObject);
var
  ControllerCombustivel : TControllerCombustivel;
  Query : TADOQuery;
begin
  ControllerCombustivel := TControllerCombustivel.Create;
  ControllerCombustivel.ModeloCombustivel.Enumerador := Listar;
  Query := ControllerCombustivel.Listar;

  if Query.RecordCount > 0 then
  begin
    if cdsListar.Active then
      cdsListar.EmptyDataSet
    else
      cdsListar.Active := True;

    while not Query.Eof do
    begin
      cdsListar.Append;
      cdsListarnCdCombustivel.Value := Query.FieldByName('nCdCombustivel').Value;
      cdsListarcDescricao.Value     := Query.FieldByName('cDescricao').Value;
      cdsListarnValor.Value         := Query.FieldByName('nValor').Value;
      cdsListarPercImposto.Value    := Query.FieldByName('PercImposto').Value;
      cdsListar.Post;

      Query.Next;
    end;

    EsconderListagem(False);
    Abort;
  end;

  EsconderListagem(True);
end;

procedure TfrmCombustive.btnExcluirClick(Sender: TObject);
var
  ControllerCombustivel : TControllerCombustivel;
begin
  if edtCodigo.Text = '' then
    Abort;

  ControllerCombustivel := TControllerCombustivel.create;
  try
    ControllerCombustivel.ModeloCombustivel.Enumerador := Excluir;
    ControllerCombustivel.ModeloCombustivel.nCdCombustivel := StrToInt(edtCodigo.Text);

    if ControllerCombustivel.Persistir then
      ShowMessage('Registro excluido.')
    else
      ShowMessage('Erro ao excluir registro.');
  finally
    FreeAndNil(ControllerCombustivel);
  end;

  LimparTela;
end;

procedure TfrmCombustive.btnGravarClick(Sender: TObject);
begin

  if edtDescricao.Text = '' then
  begin
    MessageDlg('Descrição do combustivel não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  if mskValor.Text = '' then
  begin
    MessageDlg('Valor do combustivel não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  Gravar;
  LimparTela;

end;

procedure TfrmCombustive.LimparTela;
begin
  edtCodigo.Text      := '';
  edtDescricao.Text   := '';
  mskValor.Text       := '';
  mskPercImposto.Text := '';
end;

procedure TfrmCombustive.dbGridListaCombustiveisDblClick(Sender: TObject);
begin
  edtCodigo.text    := FloatToStr(cdsListarnCdCombustivel.Value);
  edtDescricao.Text := cdsListarcDescricao.Value;
  mskValor.Text     := FloatToStr(cdsListarnValor.Value);
  mskPercImposto.Text := FloatToStr(cdsListarPercImposto.Value);

  EsconderListagem(True);
end;

end.
