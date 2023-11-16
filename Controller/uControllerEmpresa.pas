unit uControllerEmpresa;

interface

uses uEmpresa,uDAOEmpresa,System.SysUtils,data.Win.ADODB;

type
  TControllerEmpresa = Class
  private
    FModelEmpresa: TEmpresa;

  public
    property ModelEmpresa: TEmpresa read FModelEmpresa write FModelEmpresa;
    function Persistir: Boolean;
    function Listar: TADOQuery;

    constructor Create;
    destructor destroy; override;
  End;

implementation

{ TControllerEmpresa }

constructor TControllerEmpresa.Create;
begin
  FModelEmpresa := TEmpresa.Create;

  inherited Create;
end;

destructor TControllerEmpresa.destroy;
begin
  FreeAndNil(FModelEmpresa);
  inherited;
end;

function TControllerEmpresa.Listar: TADOQuery;
begin
  Result := FModelEmpresa.Listar;
end;

function TControllerEmpresa.Persistir: Boolean;
begin
  Result := FModelEmpresa.persistir;
end;

end.
