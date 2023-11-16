unit uControllerCombustivel;

interface

uses data.Win.ADODB,System.SysUtils,uCombustivel;

type
  TControllerCombustivel = class
    private
    FModeloCombustivel: TCombustivel;

    public
      property ModeloCombustivel: TCombustivel read FModeloCombustivel write FModeloCombustivel;
      function Persistir: Boolean;
      function Listar: TADOQuery;
      constructor Create;
      destructor destroy; override;
  end;

implementation

{ TControllerCombustivel }

uses uDAOCombustivel;

constructor TControllerCombustivel.create;
begin
  FModeloCombustivel := TCombustivel.Create;
  inherited Create;
end;

destructor TControllerCombustivel.destroy;
begin
  FreeAndNil(FModeloCombustivel);
  inherited;
end;

function TControllerCombustivel.Listar: TADOQuery;
begin
  result := FModeloCombustivel.Listar;
end;

function TControllerCombustivel.Persistir: Boolean;
begin
  Result := FModeloCombustivel.Persistir;
end;

end.
