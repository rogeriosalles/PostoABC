unit uDAOVenda;

interface

uses uControllerConection,Data.Win.ADODB,System.SysUtils,uVenda;

type
  TDAOVenda = class
    private

    public
      function Inserir(ModeloVenda : TVenda): Boolean;
      function Atualizar(ModeloVenda : TVenda): Boolean;
      function Excluir(ModeloVenda : TVenda): Boolean;
      function Listar(): TADOQuery;
  end;
implementation

{ TDAOVenda }

function TDAOVenda.Atualizar(ModeloVenda: TVenda): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('UPDATE Venda SET nCdBombaAbastecimento = :nCdBombaAbastecimento, dDataVenda = :dDataVenda, nLitros = :nLitros, nValorImposto = :nValorImposto, nTotalVenda = :nTotalVenda, nPreco = :nPreco  ');
      Query.SQL.Add('WHERE nCdVenda = :nCdVenda');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdBombaAbastecimento').Value := ModeloVenda.nCdBombaAbastecimento;
      Query.Parameters.ParamByName('dDataVenda').Value            := ModeloVenda.dDataVenda;
      Query.Parameters.ParamByName('nLitros').Value               := ModeloVenda.nLitros;
      Query.Parameters.ParamByName('nValorImposto').Value         := ModeloVenda.nValorImposto;
      Query.Parameters.ParamByName('nTotalVenda').Value           := ModeloVenda.nTotalVenda;
      Query.Parameters.ParamByName('nPreco').Value                := ModeloVenda.nPreco;
      Query.Parameters.ParamByName('nCdVenda').Value              := ModeloVenda.nCdVenda;

      //Executa a query
      Query.ExecSQL;
    finally
      FreeAndNil(Query);
    end;
    Result := True;
  except
    Result := False;
  end;

end;

function TDAOVenda.Excluir(ModeloVenda: TVenda): Boolean;
var
  Query : TADOQuery;
begin
  try
    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('DELETE FROM Venda');
      Query.SQL.Add('WHERE nCdVenda = :nCdVenda');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdVenda').Value := ModeloVenda.nCdVenda;

      //Executa a query
      Query.ExecSQL;
    finally
      FreeAndNil(Query);
    end;
    Result := True;
  except
    Result := False;
  end;

end;

function TDAOVenda.Inserir(ModeloVenda: TVenda): Boolean;
var
  Query : TADOQuery;
begin
  try
    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('INSERT INTO Venda (nCdBombaAbastecimento,dDataVenda,nLitros,nValorImposto,nTotalVenda,nPreco)' );
      Query.SQL.Add('           VALUES (:nCdBombaAbastecimento,:dDataVenda,:nLitros,:nValorImposto,:nTotalVenda,:nPreco)');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdBombaAbastecimento').Value := ModeloVenda.nCdBombaAbastecimento;
      Query.Parameters.ParamByName('dDataVenda').Value            := ModeloVenda.dDataVenda;
      Query.Parameters.ParamByName('nLitros').Value               := ModeloVenda.nLitros;
      Query.Parameters.ParamByName('nValorImposto').Value         := ModeloVenda.nValorImposto;
      Query.Parameters.ParamByName('nTotalVenda').Value           := ModeloVenda.nTotalVenda;
      Query.Parameters.ParamByName('nPreco').Value                := ModeloVenda.nPreco;

      //Executa a query
      Query.ExecSQL;
    finally
      FreeAndNil(Query);
    end;
    Result := True;
  except
    Result := False;
  end;

end;

function TDAOVenda.Listar: TADOQuery;
var
  Query : TADOQuery;
begin
  Query := TControllerConection.getInstance().daoConection.CriarQuery;
  Query.Close;
  Query.SQL.Add('select nCdVenda ,ba.cDescricao	,dDataVenda ,nLitros ,nPreco ,nValorImposto ,nTotalVenda,ba.nCdBombaAbastecimento,tc.cDescricao DescTanque');
  Query.SQL.Add('  from venda');
  Query.SQL.Add('       inner join BombaAbastecimento ba on ba.nCdBombaAbastecimento = Venda.nCdBombaAbastecimento');
  Query.SQL.Add('       inner join TanqueCombustivel tc on tc.nCdTanqueCombustivel = ba.nCdTanqueCombustivel');
  Query.Open;
  Result := Query;

end;

end.
