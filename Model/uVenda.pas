unit uVenda;

interface

uses uEnumCrud,data.Win.ADODB;

type
  TVenda = class
    private
      FnCdVenda: integer;
      FnCdBombaAbastecimento: integer;
      FdDataVenda: TDateTime;
      FdDataCancelamento: TDateTime;
      FnLitros: double;
      FnValorImposto: double;
      FnTotalVenda: double;
      FEnumerador: EnumTipoCrud;
      FnPreco: Double;

    public
      property nCdVenda: integer read FnCdVenda write FnCdVenda;
      property nCdBombaAbastecimento: integer read FnCdBombaAbastecimento write FnCdBombaAbastecimento;
      property dDataVenda: TDateTime read FdDataVenda write FdDataVenda;
      property dDataCancelamento: TDateTime read FdDataCancelamento write FdDataCancelamento;
      property nLitros: double read FnLitros write FnLitros;
      property nValorImposto: double read FnValorImposto write FnValorImposto;
      property nTotalVenda: double read FnTotalVenda write FnTotalVenda;
      property nPreco: Double read FnPreco write FnPreco;
      property Enumerador: EnumTipoCrud read FEnumerador write FEnumerador;

      function Persistir : Boolean;
      function Listar : TADOQuery;

  end;

implementation

{ TVenda }

uses uDAOVenda;

function TVenda.Listar: TADOQuery;
var
  daoVenda : TDAOVenda;
begin
  daoVenda := TDAOVenda.Create;

  result := daoVenda.Listar;
end;

function TVenda.Persistir: Boolean;
var
  daoVenda : TDAOVenda;
begin
  daoVenda := TDAOVenda.Create;

  case FEnumerador of
    Inserir:   result := daoVenda.Inserir(Self);
    Atualizar: result := daoVenda.Atualizar(Self);
    Excluir:   result := daoVenda.Excluir(Self);
  end;
end;

end.
