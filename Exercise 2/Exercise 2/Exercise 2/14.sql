select f.nome, f.rg
from funcionario f
where f.salario < 5300 and
	not exists (select p.* from paciente p where p.rg = f.rg)