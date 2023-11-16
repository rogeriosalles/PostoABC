unit uEmpresa;

INTERFACE

uses uEnumCrud,data.Win.ADODB,uControllerConection,System.SysUtils;

Type
  TEmpresa = Class
  private
    FnCdEmpresa : integer;
    FcDescricao: string;
    FcNomeFantasia: string;
    FcCNPJ: string;
    FEnumerador: EnumTipoCrud;
  public
    property nCdEmpresa: Integer read FnCdEmpresa write FnCdEmpresa;
    property cDescricao: string read FcDescricao write FcDescricao;
    property cNomeFantasia: string read FcNomeFantasia write FcNomeFantasia;
    property cCNPJ: string read FcCNPJ write FcCNPJ;
    property Enumerador: EnumTipoCrud read FEnumerador write FEnumerador;

    function persistir : Boolean;
    function Listar : TADOQuery;
end;

implementation

{ TEmpresa }
uses uDAOEmpresa;

function TEmpresa.Listar: TADOQuery;
var
  daoEmpresa : TDAOEmpresa;
begin
  try
    daoEmpresa := TDAOEmpresa.Create;
    result := daoEmpresa.Listar(Self);
  finally
    FreeAndNil(daoEmpresa);
  end;
end;

function TEmpresa.persistir: Boolean;
var
  daoEmpresa : TDAOEmpresa;
begin
  daoEmpresa := TDAOEmpresa.Create;

  case FEnumerador of
    Inserir:   result := daoEmpresa.Inserir(Self);
    Atualizar: result := daoEmpresa.Atualizar(Self);
    Excluir:   result := daoEmpresa.Excluir(Self);
  end;
end;

end.
