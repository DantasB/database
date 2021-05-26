select * 
from NotaFiscal nf
full outer join Pessoa
	on nf.Cd_Pessoa = Pessoa.Cd_Pessoa