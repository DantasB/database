--RODAR POR PARTES
CREATE TRIGGER change_payment
ON Duplicata AFTER UPDATE AS IF UPDATE (Vl_Pagamento)
BEGIN
UPDATE
    Duplicata
SET Duplicata.Dt_Pagamento = GETDATE()
FROM
    Duplicata,
    Inserted
WHERE
    Duplicata.Cd_Duplicata = Inserted.Cd_Duplicata
END

--

SELECT
    Dt_Pagamento
FROM
    Duplicata
WHERE Cd_Duplicata = 1

--

UPDATE Duplicata
   SET Vl_Pagamento = 9
 WHERE Cd_Duplicata = 1

--
SELECT
    Dt_Pagamento
FROM
    Duplicata
WHERE Cd_Duplicata = 1