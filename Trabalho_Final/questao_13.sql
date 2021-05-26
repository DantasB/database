CREATE PROCEDURE topThree
AS
SELECT TOP 3 sum(Qt_Quantidade) AS QuantidadeDeVendas, Cd_Produto
FROM Compra
GROUP BY Cd_Produto
ORDER BY QuantidadeDeVendas DESC

EXEC topThree

--INSERT SO PRA TESTAR SE TA CONTANDO
INSERT INTO Compra (Cd_NF, Qt_Quantidade, Cd_Produto)
values (1, 22, 1)