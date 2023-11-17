unit uDAOCombustivel;

interface

uses uCombustivel,System.SysUtils,data.Win.ADODB,uControllerConection;

type
  TDAOCombustivel = class
    private

    public
      function Inserir(ModeloCombustivel   : TCombustivel): Boolean;
      function Atualizar(ModeloCombustivel : TCombustivel): Boolean;
      function Excluir(ModeloCombustivel   : TCombustivel): Boolean;
      function Listar(ModeloCombustivel    : TCombustivel): TADOQuery;
  end;

implementation

{ TDAOCombustivel }

function TDAOCombustivel.Atualizar(ModeloCombustivel: TCombustivel): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('UPDATE Combustivel SET cDescricao = :Descricao, nValor = :Valor, PercImposto = :PercImposto');
      Query.SQL.Add('WHERE nCdCombustivel = :nCdCombustivel');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('Descricao').Value      := ModeloCombustivel.cDescricao;
      Query.Parameters.ParamByName('valor').Value          := ModeloCombustivel.nValor;
      Query.Parameters.ParamByName('nCdCombustivel').Value := ModeloCombustivel.nCdCombustivel;
      Query.Parameters.ParamByName('PercImposto').Value    := ModeloCombustivel.PercImposto;

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

function TDAOCombustivel.Excluir(ModeloCombustivel: TCombustivel): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('DELETE FROM Combustivel');
      Query.SQL.Add('WHERE nCdCombustivel = :nCdCombustivel');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdCombustivel').Value := ModeloCombustivel.nCdCombustivel;

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

function TDAOCombustivel.Inserir(ModeloCombustivel: TCombustivel): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('INSERT INTO Combustivel (cDescricao,nValor,PercImposto) VALUES (:Descricao,:Valor,:PercImposto)');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('Descricao').Value   := ModeloCombustivel.cDescricao;
      Query.Parameters.ParamByName('valor').Value       := ModeloCombustivel.nValor;
      Query.Parameters.ParamByName('PercImposto').Value := ModeloCombustivel.PercImposto;

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

function TDAOCombustivel.Listar(ModeloCombustivel: TCombustivel): TADOQuery;
var
  Query : TADOQuery;
begin
  Query := TControllerConection.getInstance().daoConection.CriarQuery;
  Query.Close;
  Query.SQL.Add('SELECT * FROM Combustivel');
  Query.Open;
  Result := Query;
end;

end.
