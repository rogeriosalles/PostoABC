unit uVenda;

interface

type
  TVenda = class
    private
    FnCdVenda: integer;
    FnCdBombaCombustivel: integer;
    FdDataVenda: TDate;
    FdDataCancelamento: TDate;
    FnQuantidade: double;
    FnValorImposto: double;
    FnTotalVenda: double;

    public
      property nCdVenda: integer read FnCdVenda write FnCdVenda;
      property nCdBombaCombustivel: integer read FnCdBombaCombustivel write FnCdBombaCombustivel;
      property dDataVenda: TDate read FdDataVenda write FdDataVenda;
      property dDataCancelamento: TDate read FdDataCancelamento write FdDataCancelamento;
      property nQuantidade: double read FnQuantidade write FnQuantidade;
      property nValorImposto: double read FnValorImposto write FnValorImposto;
      property nTotalVenda: double read FnTotalVenda write FnTotalVenda;

  end;

implementation

end.
