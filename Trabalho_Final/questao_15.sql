INSERT INTO Duplicata (Cd_Duplicata, Dt_Vencimento, Vl_Valor, Cd_NF, Dt_Pagamento, Vl_Pagamento)
VALUES (9, CAST(DATEADD(day, 15, GETDATE()) AS DATETIME), 40, 1, NULL, NULL),
	   (10, CAST(DATEADD(day, -15, GETDATE()) AS DATETIME), 50, 2, NULL, NULL)

SELECT *
FROM Duplicata

SELECT *
FROM Duplicata
WHERE Duplicata.Dt_Vencimento >= CAST(DATEADD(day, 30, GETDATE()) AS DATETIME)
UNION
SELECT *
FROM Duplicata
WHERE Duplicata.Dt_Vencimento <= CAST(DATEADD(day, -30, GETDATE()) AS DATETIME)
