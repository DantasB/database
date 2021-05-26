  SELECT  A.Nm_Pessoa FROM
  (SELECT Compra.Cd_Compra, NotaFiscal.Cd_NF, Produto.Cd_Produto, Pessoa.Cd_Pessoa, Nm_Pessoa FROM [CURSODB06].[dbo].[Compra] Compra
  INNER JOIN [CURSODB06].[dbo].PRODUTO Produto ON Compra.Cd_Produto = Produto.Cd_Produto
  INNER JOIN [CURSODB06].[dbo].[NotaFiscal] NotaFiscal ON Compra.Cd_NF = NotaFiscal.Cd_NF
  INNER JOIN [CURSODB06].[dbo].[Pessoa] Pessoa ON Pessoa.Cd_Pessoa = NotaFiscal.Cd_Pessoa) A
  JOIN [CURSODB06].[dbo].[Produto] Produto ON Produto.Cd_Produto = A.Cd_Produto
  GROUP BY A.Cd_Pessoa, A.Nm_Pessoa
  HAVING COUNT(DISTINCT A.Cd_Produto) >= (SELECT COUNT(DISTINCT Cd_Produto) FROM Produto)

  INSERT INTO [CURSODB06].[dbo].[Compra] (Qt_Quantidade, Cd_NF, Cd_Produto)
  values (2,1,2), (2,1,3), (2,1,4), (2,1,5)

  INSERT INTO [CURSODB06].[dbo].[Compra] (Qt_Quantidade, Cd_NF, Cd_Produto)
  values (2,2,1), (2,2,3), (2,2,4), (2,2,5)
