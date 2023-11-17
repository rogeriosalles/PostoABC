CREATE TABLE Combustivel (nCdCombustivel INT IDENTITY PRIMARY KEY NOT NULL
                         ,cDescricao VARCHAR(100)
						 ,nValor DECIMAL(12,4)
						 ,PercImposto DECIMAL(12,2));

						 

CREATE TABLE Empresa (nCdEmpresa INT IDENTITY PRIMARY KEY NOT NULL
                     ,cDescricao VARCHAR(100)
					 ,cNomeFantasia VARCHAR(100)
					 ,cCNPJ VARCHAR(18));

CREATE TABLE TanqueCombustivel (nCdTanqueCombustivel INT IDENTITY PRIMARY KEY NOT NULL
                              ,cDescricao VARCHAR(100)
							  ,nCapacidadeTanque DECIMAL(12,2) 
							  ,nCdEmpresa INT
							  ,nSaldo DECIMAL(12,2)
							  ,CONSTRAINT FK_nCdCombustivel FOREIGN KEY (nCdCombustivel) REFERENCES Combustivel(nCdCombustivel)
							  ,CONSTRAINT FK_nCdEmpresa FOREIGN KEY (nCdEmpresa) REFERENCES Empresa(nCdEmpresa));

CREATE TABLE BombaAbastecimento (nCdBombaAbastecimento INT IDENTITY PRIMARY KEY NOT NULL
                              ,cDescricao VARCHAR(100)
							  ,cNumeroSerie VARCHAR(50)
							  ,nCdTanqueCombustivel INT
							  ,nCdCombustivel INT
							  ,CONSTRAINT FK_nCdTanqueCombustivel FOREIGN KEY (nCdTanqueCombustivel) REFERENCES TanqueCombustivel(nCdTanqueCombustivel)
							  ,CONSTRAINT FK_nCdCombustivel FOREIGN KEY (nCdCombustivel) REFERENCES Combustivel(nCdCombustivel))

CREATE TABLE Venda (nCdVenda INT IDENTITY PRIMARY KEY NOT NULL
                   ,nCdBombaAbastecimento INT NOT NULL
				   ,dDataVenda DATETIME
				   ,dDataCancelamento DATETIME
				   ,nQuantidade DECIMAL(12,4)
				   ,nValorImposto DECIMAL(12,2)
				   ,nTotalVenda DECIMAL(12,4)
				   ,CONSTRAINT FK_nCdBombaAbastecimento FOREIGN KEY (nCdBombaAbastecimento) REFERENCES BombaAbastecimento(nCdBombaAbastecimento));