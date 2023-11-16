unit uDAOEmpresa;

interface

uses  uControllerConection, data.Win.ADODB,System.SysUtils,uEmpresa;

type
  TDAOEmpresa = class
  private

  public
    function Inserir(ModelEmpresa : TEmpresa): Boolean;
    function Atualizar(ModelEmpresa : TEmpresa): Boolean;
    function Excluir(ModelEmpresa : TEmpresa): Boolean;
    function Listar(ModelEmpresa : TEmpresa): TADOQuery;
  end;

implementation

{ TADOEmpresa }

function TDAOEmpresa.Atualizar(ModelEmpresa: TEmpresa): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('UPDATE Empresa SET cDescricao = :Descricao, cNomeFantasia = :NomeFantasia, cCNPJ = :CNPJ)');
      Query.SQL.Add('WHERE nCdEmpresa = :nCdEmpresa');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('Descricao').Value    := ModelEmpresa.cDescricao;
      Query.Parameters.ParamByName('NomeFantasia').Value := ModelEmpresa.cNomeFantasia;
      Query.Parameters.ParamByName('CNPJ').Value         := ModelEmpresa.cCNPJ;
      Query.Parameters.ParamByName('nCdEmpresa').Value   := ModelEmpresa.nCdEmpresa;

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

function TDAOEmpresa.Excluir(ModelEmpresa: TEmpresa): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('DELETE FROM Empresa)');
      Query.SQL.Add('WHERE nCdEmpresa = :nCdEmpresa');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('nCdEmpresa').Value   := ModelEmpresa.nCdEmpresa;

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

function TDAOEmpresa.Inserir(ModelEmpresa: TEmpresa): Boolean;
var
  Query : TADOQuery;
begin
  try

    try
      Query := TControllerConection.getInstance().daoConection.CriarQuery;
      Query.SQL.Add('INSERT INTO Empresa(cDescricao, cNomeFantasia, cCNPJ) VALUES (:Descricao,:NomeFantasia,:CNPJ)');
      //Passa por parametro os valores por ser mais seguro
      Query.Parameters.ParamByName('Descricao').Value    := ModelEmpresa.cDescricao;
      Query.Parameters.ParamByName('NomeFantasia').Value := ModelEmpresa.cNomeFantasia;
      Query.Parameters.ParamByName('CNPJ').Value         := ModelEmpresa.cCNPJ;
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

function TDAOEmpresa.Listar(ModelEmpresa: TEmpresa): TADOQuery;
var
  Query : TADOQuery;
begin
  Query := TControllerConection.getInstance().daoConection.CriarQuery;
  Query.SQL.Add('SELECT * FROM EMPRESA');
  Query.Open;

  Result := Query;
end;

end.
