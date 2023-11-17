unit uBombaAbastecimento;

interface

uses data.win.ADODB,uEnumCrud;

type
  TBombaAbastecimento = class
    private
    FBombaAbastecimento: integer;
    FcDescricao: string;
    FcNumeroSerie: string;
    FnCdTanqueCombustivel: integer;
    FEnumerador: EnumTipoCrud;
    FnCdCombustivel: double;

    public
       property nCdBombaAbastecimento: integer read FBombaAbastecimento write FBombaAbastecimento;
       property cDescricao: string read FcDescricao write FcDescricao;
       property cNumeroSerie: string read FcNumeroSerie write FcNumeroSerie;
       property nCdTanqueCombustivel: integer read FnCdTanqueCombustivel write FnCdTanqueCombustivel;
       property Enumerador : EnumTipoCrud read FEnumerador  write FEnumerador ;
       property nCdCombustivel: double read FnCdCombustivel write FnCdCombustivel;
       function Listar: TADOQuery;
       function persistir: Boolean;

  end;

implementation

{ TBombaCombustivel }

uses uDAOBombaAbastecimento;

function TBombaAbastecimento.Listar: TADOQuery;
var
  daoBombaAbastecimento : TDAOBombaAbastecimento;
begin
  daoBombaAbastecimento := TDAOBombaAbastecimento.Create;

  result := daoBombaAbastecimento.Listar(Self);
end;

function TBombaAbastecimento.persistir: Boolean;
var
  daoBombaAbastecimento : TDAOBombaAbastecimento;
begin
  daoBombaAbastecimento := TDAOBombaAbastecimento.Create;

  case FEnumerador of
    Inserir:   result := daoBombaAbastecimento.Inserir(Self);
    Atualizar: result := daoBombaAbastecimento.Atualizar(Self);
    Excluir:   result := daoBombaAbastecimento.Excluir(Self);
  end;
end;

end.
