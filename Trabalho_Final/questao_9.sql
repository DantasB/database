BEGIN TRANSACTION insercaoVeiculo
    INSERT INTO [dbo].[Veiculo] (
		[Cd_Placa], 
		[Cd_Transportadora], 
		[Nm_Especie],
		[Nm_Marca],
		[Cd_UF]
		) 
		VALUES (
		N'LAB2048',
		1, 
		N'Conjugado',
		N'Volkswagen',
		1
		)
    IF(SELECT COUNT(Nm_Especie) from Veiculo where Nm_Especie=N'Conjugado') > 1
        BEGIN
        ROLLBACK TRANSACTION
        PRINT 'Apenas um veiculo conjugado permitido.'
        END
    ELSE
        BEGIN
        PRINT 'Inclusao bem sucedida'
        COMMIT TRANSACTION insercaoVeiculo
        END
