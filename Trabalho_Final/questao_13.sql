CREATE PROCEDURE topThree
AS
SELECT TOP 3 sum(Qt_Quantidade)as QuantidadeDeVendas, Cd_Produto
FROM Compra 
GROUP BY Cd_Produto
ORDER BY QuantidadeDeVendas desc

EXEC topThree

--INSERT SO PRA TESTAR SE TA CONTANDO 
INSERT INTO Compra (Cd_NF, Cd_Compra, Qt_Quantidade, In_ICMS, Vl_Unitario, Nm_SitTribut, Cd_Produto)
values (1, 7, 22, 0, 20, 'Isento',1)