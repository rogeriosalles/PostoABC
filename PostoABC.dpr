program PostoABC;

uses
  Vcl.Forms,
  uEmpresa in 'Model\uEmpresa.pas',
  uCombustivel in 'Model\uCombustivel.pas',
  uBombaAbastecimento in 'Model\uBombaAbastecimento.pas',
  uTanqueCombustivel in 'Model\uTanqueCombustivel.pas',
  uVenda in 'Model\uVenda.pas',
  UnitBombaAbastecimento in 'View\UnitBombaAbastecimento.pas' {frmBombaAbastecimento},
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
  uControllerTanqueCombustivel in 'Controller\uControllerTanqueCombustivel.pas' {$R *.res},
  uControllerBombaAbastecimento in 'Controller\uControllerBombaAbastecimento.pas',
  uDAOBombaAbastecimento in 'DAO\uDAOBombaAbastecimento.pas',
  uDAOVenda in 'DAO\uDAOVenda.pas',
  uControllerVenda in 'Controller\uControllerVenda.pas',
  UnitRelatorio in 'View\UnitRelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.Run;
end.
