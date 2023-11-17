unit uDAOBombaAbastecimento;

interface

uses data.win.ADODB,System.SysUtils,uBombaAbastecimento,uControllerConection;

type
  TDAOBombaAbastecimento = class
    private

    public
      function Inserir(ModeloBombaAbastecimento   : TBombaAbastecimento): Boolean;
      function Excluir(ModeloBombaAbastecimento   : TBombaAbastecimento): Boolean;
      function Atualizar(ModeloBombaAbastecimento : TBombaAbastecimento): Boolean;
      function Listar(ModeloBombaAbastecimento    : TBombaAbastecimento): TADOQuery;
  end;

implementation

{ TDAOBombaCombustivel }

function TDAOBombaAbastecimento.Atualizar(ModeloBombaAbastecimento: TBombaAbastecimento): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('UPDATE BombaAbastecimento SET cDescricao = :Descricao, cNumeroSerie = :cNumeroSerie, nCdTanqueCombustivel = :nCdTanqueCombustivel, nCdCombustivel = :nCdCombustivel');
      Query.SQL.Add('WHERE nCdBombaAbastecimento = :nCdBombaAbastecimento');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('Descricao').Value             := ModeloBombaAbastecimento.cDescricao;
      Query.Parameters.ParamByName('cNumeroSerie').Value          := ModeloBombaAbastecimento.cNumeroSerie;
      Query.Parameters.ParamByName('nCdTanqueCombustivel').Value  := ModeloBombaAbastecimento.nCdTanqueCombustivel;
      Query.Parameters.ParamByName('nCdCombustivel').Value        := ModeloBombaAbastecimento.nCdCombustivel;
      Query.Parameters.ParamByName('nCdBombaAbastecimento').Value := ModeloBombaAbastecimento.nCdBombaAbastecimento;
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

function TDAOBombaAbastecimento.Excluir(ModeloBombaAbastecimento: TBombaAbastecimento): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('DELETE FROM BombaAbastecimento');
      Query.SQL.Add('WHERE nCdBombaAbastecimento = :nCdBombaAbastecimento');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdBombaAbastecimento').Value   := ModeloBombaAbastecimento.nCdBombaAbastecimento;

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

function TDAOBombaAbastecimento.Inserir(ModeloBombaAbastecimento: TBombaAbastecimento): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('INSERT INTO BombaAbastecimento (cDescricao, cNumeroSerie, nCdTanqueCombustivel,nCdCombustivel) VALUES (:cDescricao, :cNumeroSerie, :nCdTanqueCombustivel,:nCdCombustivel)');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('cDescricao').Value           := ModeloBombaAbastecimento.cDescricao;
      Query.Parameters.ParamByName('cNumeroSerie').Value         := ModeloBombaAbastecimento.cNumeroSerie;
      Query.Parameters.ParamByName('nCdTanqueCombustivel').Value := ModeloBombaAbastecimento.nCdTanqueCombustivel;
      Query.Parameters.ParamByName('nCdCombustivel').Value       := ModeloBombaAbastecimento.nCdCombustivel;
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

function TDAOBombaAbastecimento.Listar(ModeloBombaAbastecimento: TBombaAbastecimento): TADOQuery;
var
  Query : TADOQuery;
begin
  Query := TControllerConection.getInstance().daoConection.CriarQuery;
  Query.SQL.Add('SELECT * FROM BombaAbastecimento');
  Query.Open;

  Result := Query;

end;

end.
