program PostoABC;

uses
  Vcl.Forms,
  uEmpresa in 'Model\uEmpresa.pas',
  uCombustivel in 'Model\uCombustivel.pas',
  uBombaCombustivel in 'Model\uBombaCombustivel.pas',
  uTanqueCombustivel in 'Model\uTanqueCombustivel.pas',
  uVenda in 'Model\uVenda.pas',
  UnitBombaAbastecimento in 'View\UnitBombaAbastecimento.pas' {Form1},
  UnitCombustivel in 'View\UnitCombustivel.pas' {frmCombustive},
  UnitEmpresa in 'View\UnitEmpresa.pas' {frmEmpresa},
  UnitPrincipal in 'View\UnitPrincipal.pas' {frmPrincipal},
  UnitTanqueCombustivel in 'View\UnitTanqueCombustivel.pas' {frmTanqueCombustivel},
  UnitVenda in 'View\UnitVenda.pas' {frmVenda},
  uControllerConection in 'Controller\uControllerConection.pas',
  uDAOConection in 'DAO\uDAOConection.pas',
  uDAOEmpresa in 'DAO\uDAOEmpresa.pas',
  uControllerEmpresa in 'Controller\uControllerEmpresa.pas',
  uEnumCrud in 'Model\uEnumCrud.pas',
  uDAOCombustivel in 'DAO\uDAOCombustivel.pas',
  uControllerCombustivel in 'Controller\uControllerCombustivel.pas',
  uDAOTanqueCombustivel in 'DAO\uDAOTanqueCombustivel.pas',
  uControllerTanqueCombustivel in 'Controller\uControllerTanqueCombustivel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
