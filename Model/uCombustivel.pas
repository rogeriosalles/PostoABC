unit uCombustivel;

interface

uses uEnumCrud,data.Win.ADODB,uControllerConection,System.SysUtils;

type
  TCombustivel = class
    private
    FnCdCombustivel: integer;
    FcDescricao: string;
    FnValor: double;
    FEnumerador: EnumTipoCrud;

    public
      property nCdCombustivel: integer read FnCdCombustivel write FnCdCombustivel;
      property cDescricao: string read FcDescricao write FcDescricao;
      property nValor: double read FnValor write FnValor;
      property Enumerador: EnumTipoCrud read FEnumerador write FEnumerador;

      function persistir : Boolean;
      function Listar : TADOQuery;

  end;

implementation

{ TCombustivel }

uses uDAOCombustivel;

function TCombustivel.Listar: TADOQuery;
var
  daoCombustivel : TDAOCombustivel;
begin
  daoCombustivel := TDAOCombustivel.Create;

  result := daoCombustivel.Listar(self);
end;

function TCombustivel.persistir: Boolean;
var
  daoCombustivel : TDAOCombustivel;
begin
  daoCombustivel := TDAOCombustivel.Create;

  case FEnumerador of
    Inserir:   result := daoCombustivel.Inserir(Self);
    Atualizar: result := daoCombustivel.Atualizar(Self);
    Excluir:   result := daoCombustivel.Excluir(Self);
  end;

end;

end.
