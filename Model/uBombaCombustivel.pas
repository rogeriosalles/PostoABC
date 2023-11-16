unit uBombaCombustivel;

interface

type
  TBombaCombustivel = class
    private
    FnCdBombaCombustivel: integer;
    FcDescricao: string;
    FcNumeroSerie: string;
    FnCdTanqueCombustivel: integer;

    public
       property nCdBombaCombustivel: integer read FnCdBombaCombustivel write FnCdBombaCombustivel;
       property cDescricao: string read FcDescricao write FcDescricao;
       property cNumeroSerie: string read FcNumeroSerie write FcNumeroSerie;
       property nCdTanqueCombustivel: integer read FnCdTanqueCombustivel write FnCdTanqueCombustivel;

  end;

implementation

end.
