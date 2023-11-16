unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,uControllerConection,
   Data.DB, Data.Win.ADODB;

type
  TfrmPrincipal = class(TForm)
    Menu: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastros1: TMenuItem;
    anquedeCombustivel1: TMenuItem;
    BombadeAbastecimento1: TMenuItem;
    Abastecimento1: TMenuItem;
    Combustivel1: TMenuItem;
    Relatrios1: TMenuItem;
    Abastecimentos1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Combustivel1Click(Sender: TObject);
    procedure anquedeCombustivel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    nCdEmpresa : Integer;
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uControllerEmpresa,UnitEmpresa,UnitCombustivel,UnitTanqueCombustivel;

procedure TfrmPrincipal.anquedeCombustivel1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmTanqueCombustivel,frmTanqueCombustivel);
  frmTanqueCombustivel.ShowModal;
  FreeAndNil(frmTanqueCombustivel);
end;

procedure TfrmPrincipal.Combustivel1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCombustive,frmCombustive);
  frmCombustive.ShowModal;
  FreeAndNil(frmCombustive);

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  ControllerEmpresa : TControllerEmpresa;
  Query : TADOQuery;
begin
  TControllerConection.getInstance().daoConection.getConection.Connected := true;
  ControllerEmpresa := TControllerEmpresa.Create;
  Query := TADOQuery.Create(nil);
  Query.Close;

  Query := ControllerEmpresa.Listar;
  try
    if Query.RecordCount = 0 then
    begin
      Application.CreateForm(TfrmEmpresa,frmEmpresa);
      frmEmpresa.ShowModal;
      FreeAndNil(frmPrincipal) ;
    end
    else
      nCdEmpresa := Query.FieldByName('nCdEmpresa').Value;
  finally
    FreeAndNil(ControllerEmpresa);
  end;

end;

end.
