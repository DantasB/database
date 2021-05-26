INSERT INTO NotaFiscal
           (
				Dt_Emissao,
				Cd_NumeroSerie,
				Ds_Informacao,
				Cd_PJ,
				Tp_EntradaSaida,
				Dt_EntradaSaida,
				Tp_FreteConta,
				Cd_Transportadora,
				Cd_CFOP,
				Nu_Via,
				Dt_LimiteEmissao
		   )
     VALUES
		(
			CAST('2021-03-02T00:00:00.000' AS DateTime),
			321,
			'Xpto',
			1,
			0,
			CAST('2021-03-04T00:00:00.000' AS DateTime),
			0,
			3,
			'3232',
			23444,
			CAST('2021-03-06T00:00:00.000' AS DateTime)
		 )
GO