
INSERT INTO Duplicata (Dt_Vencimento, Vl_Valor, Cd_NF, Dt_Pagamento, Vl_Pagamento)
VALUES (CAST('2022-01-01' AS DATETIME), 40, 3, CAST('2021-09-09' AS DATETIME), 40)

INSERT INTO Duplicata (Dt_Vencimento, Vl_Valor, Cd_NF, Dt_Pagamento, Vl_Pagamento)
VALUES (CAST('2021-01-01' AS DATETIME), 50, 2, NULL, NULL)

INSERT INTO Duplicata (Dt_Vencimento, Vl_Valor, Cd_NF, Dt_Pagamento, Vl_Pagamento)
VALUES (CAST('2022-01-01' AS DATETIME), 40, 1, NULL, NULL)

SELECT *
FROM Duplicata

CREATE VIEW Cliente_Com_Duplicata_Vencida AS (
	SELECT DISTINCT
		Pessoa.Cd_Pessoa,
		Pessoa.Nm_Pessoa
	FROM Pessoa
	LEFT JOIN NotaFiscal on Pessoa.Cd_Pessoa = NotaFiscal.Cd_Pessoa
	INNER JOIN (
		SELECT Cd_NF
		FROM Duplicata
		WHERE Duplicata.Dt_Vencimento <= SYSUTCDATETIME()
			AND Duplicata.Dt_Pagamento IS NULL
	) AS Duplicata_Vencida on NotaFiscal.Cd_NF = Duplicata_Vencida.Cd_NF
)
