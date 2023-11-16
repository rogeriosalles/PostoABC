unit uControllerTanqueCombustivel;

interface

uses uTanqueCombustivel,data.Win.ADODB,System.SysUtils;

type
  TControllerTanqueCombustivel = class
    private
      FModeloTanqueCombustivel: TTanqueCombustivel;
    public
      property ModeloTanqueCombustivel: TTanqueCombustivel read FModeloTanqueCombustivel write FModeloTanqueCombustivel;

      function Persistir: Boolean;
      function Listar : TADOQuery;

      constructor Create;
      destructor destroy; override;
  end;

implementation

{ TControllerTanqueCombustivel }

constructor TControllerTanqueCombustivel.Create;
begin
  FModeloTanqueCombustivel := TTanqueCombustivel.Create;
  inherited Create;
end;

destructor TControllerTanqueCombustivel.destroy;
begin
  FreeAndNil(FModeloTanqueCombustivel);
  inherited;
end;

function TControllerTanqueCombustivel.Listar: TADOQuery;
begin
  result := FModeloTanqueCombustivel.Listar;
end;

function TControllerTanqueCombustivel.Persistir: Boolean;
begin
  result := FModeloTanqueCombustivel.persistir;
end;

end.
