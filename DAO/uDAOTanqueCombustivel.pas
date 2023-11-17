unit uDAOTanqueCombustivel;

interface

uses uTanqueCombustivel,data.Win.ADODB,uControllerConection,System.SysUtils;

type
  TDAOTanqueCombustivel = class
    private

    public
      function Inserir(ModeloTanqueCombustivel : TTanqueCombustivel): Boolean;
      function Excluir(ModeloTanqueCombustivel : TTanqueCombustivel): Boolean;
      function Atualizar(ModeloTanqueCombustivel : TTanqueCombustivel): Boolean;
      function Listar(ModeloTanqueCombustivel : TTanqueCombustivel): TADOQuery;
  end;

implementation

{ TDAOTanqueCombustivel }


function TDAOTanqueCombustivel.Listar(ModeloTanqueCombustivel: TTanqueCombustivel): TADOQuery;
var
  Query : TADOQuery;
begin
  Query := TControllerConection.getInstance().daoConection.CriarQuery;
  Query.SQL.Add('SELECT * FROM TanqueCombustivel');
  Query.Open;

  Result := Query;

end;

function TDAOTanqueCombustivel.Atualizar(ModeloTanqueCombustivel: TTanqueCombustivel): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('UPDATE TanqueCombustivel SET cDescricao = :cDescricao, nCapacidadeTanque = :nCapacidadeTanque,nCdEmpresa = :nCdEmpresa');
      Query.SQL.Add('WHERE nCdTanqueCombustivel = :nCdTanqueCombustivel');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('cDescricao').Value         := ModeloTanqueCombustivel.cDescricao;
      Query.Parameters.ParamByName('nCapacidadeTanque').Value := ModeloTanqueCombustivel.nCapacidadeTanque;
      Query.Parameters.ParamByName('nCdEmpresa').Value        := ModeloTanqueCombustivel.nCdEmpresa;
      Query.Parameters.ParamByName('nCdTanqueCombustivel').Value := ModeloTanqueCombustivel.nCdTanqueCombustivel;

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

function TDAOTanqueCombustivel.Excluir(ModeloTanqueCombustivel: TTanqueCombustivel): Boolean;
var
  Query : TADOQuery;
begin
  try
    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('DELETE FROM TanqueCombustivel');
      Query.SQL.Add('WHERE nCdTanqueCombustivel = :nCdTanqueCombustivel');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdTanqueCombustivel').Value   := ModeloTanqueCombustivel.nCdTanqueCombustivel;

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

function TDAOTanqueCombustivel.Inserir(ModeloTanqueCombustivel: TTanqueCombustivel): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('INSERT INTO TanqueCombustivel(cDescricao, nCapacidadeTanque, nCdEmpresa) VALUES (:cDescricao, :nCapacidadeTanque,:nCdEmpresa)');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('cDescricao').Value         := ModeloTanqueCombustivel.cDescricao;
      Query.Parameters.ParamByName('nCapacidadeTanque').Value := ModeloTanqueCombustivel.nCapacidadeTanque;
      Query.Parameters.ParamByName('nCdEmpresa').Value        := ModeloTanqueCombustivel.nCdEmpresa;
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

end.
