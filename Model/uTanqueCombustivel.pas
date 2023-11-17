unit uTanqueCombustivel;

interface

uses data.Win.ADODB,uEnumCrud;


type
  TTanqueCombustivel = class
    private
      FnCdTanqueCombustivel: integer;
      FcDescricao: string;
      FnCapacidadeTanque: double;
      FnCdCombustivel: integer;
      FnCdEmpresa: integer;
      FEnumerador: EnumTipoCrud;
      FnSaldo: Double;
    public
      property nCdTanqueCombustivel: integer read FnCdTanqueCombustivel write FnCdTanqueCombustivel;
      property cDescricao: string read FcDescricao write FcDescricao;
      property nCapacidadeTanque: double read FnCapacidadeTanque write FnCapacidadeTanque;
      property nSaldo: Double read FnSaldo write FnSaldo;
      property nCdEmpresa: integer read FnCdEmpresa write FnCdEmpresa;
      property Enumerador: EnumTipoCrud read FEnumerador write FEnumerador;

      function Listar: TADOQuery;
      function persistir: Boolean;
  end;

implementation

uses uDAOTanqueCombustivel;


function TTanqueCombustivel.Listar: TADOQuery;
var
  daoTanqueCombustivel : TDAOTanqueCombustivel;
begin
  daoTanqueCombustivel := TDAOTanqueCombustivel.Create;

  result := daoTanqueCombustivel.Listar(self);
end;

function TTanqueCombustivel.persistir: Boolean;
var
  daoTanqueCombustivel : TDAOTanqueCombustivel;
begin
  daoTanqueCombustivel := TDAOTanqueCombustivel.Create;

  case FEnumerador of
    Inserir:   result := daoTanqueCombustivel.Inserir(Self);
    Atualizar: result := daoTanqueCombustivel.Atualizar(Self);
    Excluir:   result := daoTanqueCombustivel.Excluir(Self);
  end;

end;

end.
