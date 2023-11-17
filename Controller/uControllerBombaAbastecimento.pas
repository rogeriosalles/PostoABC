unit uControllerBombaAbastecimento;

interface

uses uEnumCrud,System.SysUtils,uBombaAbastecimento,data.Win.ADODB;

type
  TControllerBombaAbastecimento = class
    private
    FModeloBombaAbastecimento: TBombaAbastecimento;

    public
      function Listar: TADOQuery;
      function Persistir: Boolean;
      property ModeloBombaAbastecimento: TBombaAbastecimento read FModeloBombaAbastecimento write FModeloBombaAbastecimento;
      constructor Create;
      destructor destroy; override;

  end;

implementation

{ TControllerBombaCombustivel }

constructor TControllerBombaAbastecimento.Create;
begin
  FModeloBombaAbastecimento := TBombaAbastecimento.Create;
  inherited Create;
end;

destructor TControllerBombaAbastecimento.destroy;
begin
  FreeAndNil(FModeloBombaAbastecimento);
  inherited;
end;

function TControllerBombaAbastecimento.Listar: TADOQuery;
begin
  result := FModeloBombaAbastecimento.Listar;
end;

function TControllerBombaAbastecimento.Persistir: Boolean;
begin
  result := FModeloBombaAbastecimento.persistir;
end;

end.
