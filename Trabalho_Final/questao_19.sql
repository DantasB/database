ALTER TABLE NotaFiscal
ADD XML_InfComp XML;

DECLARE @myXML XML;
SET @myXML = '
<NotaFiscal>
	<AgumonFlamenguista>True</AgumonFlamenguista>
	<DeVerdade>Nao</DeVerdade>
	<MaisInformacoes>NAO HA MAIS INFORMACOES</MaisInformacoes>
</NotaFiscal>
';
INSERT INTO NotaFiscal (Dt_Emissao, Cd_NumeroSerie, Ds_Informacao, Cd_PJ, Cd_Pessoa, Tp_EntradaSaida, Dt_EntradaSaida, Tp_FreteConta, Cd_Transportadora, Cd_CFOP, Nu_Via, Dt_LimiteEmissao, XML_InfComp)
values (CAST('2020-01-23' AS DATE),717420,'OXML',1,3,1,CAST('2020-01-23' AS DATE),1,1,1100,1,CAST('2020-01-25' AS DATE), @myXML)

SELECT *
FROM NotaFiscal