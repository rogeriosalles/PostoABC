unit UnitEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,uEmpresa,uControllerEmpresa,uEnumCrud;

type
  TfrmEmpresa = class(TForm)
    lblDescricao: TLabel;
    lblNomeFantasia: TLabel;
    lblCNPJ: TLabel;
    edtDescricao: TEdit;
    edtNomeFantasia: TEdit;
    mskCNPJ: TMaskEdit;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnGravarClick(Sender: TObject);
  private
    procedure ValidarCampos;
    procedure GravarEmpresa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses uDAOEmpresa;

procedure TfrmEmpresa.GravarEmpresa();
var
  ControllerEmpresa : TControllerEmpresa;
begin
  ControllerEmpresa := TControllerEmpresa.Create;

  try
    ControllerEmpresa.ModelEmpresa.Enumerador := Inserir;
    ControllerEmpresa.ModelEmpresa.cDescricao := edtDescricao.Text;
    ControllerEmpresa.ModelEmpresa.cNomeFantasia := edtNomeFantasia.Text;
    ControllerEmpresa.ModelEmpresa.cCNPJ := mskCNPJ.Text;

   if ControllerEmpresa.Persistir then
     ShowMessage('Registro inserido!!')
   else
     ShowMessage('Erro ao gerar registro');

  finally
    FreeAndNil(ControllerEmpresa);
  end;

end;

procedure TfrmEmpresa.btnGravarClick(Sender: TObject);
begin
  ValidarCampos;
  GravarEmpresa;
  Close;
end;

procedure TfrmEmpresa.ValidarCampos();
begin
  if Trim(edtDescricao.Text) = '' then
  begin
    MessageDlg('Descrição da empresa não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  if Trim(edtNomeFantasia.Text) = '' then
  begin
    MessageDlg('Nome fantasia não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

  if Trim(mskCNPJ.Text) = '' then
  begin
    MessageDlg('CNPJ não informado',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
    Abort;
  end;

end;

end.
