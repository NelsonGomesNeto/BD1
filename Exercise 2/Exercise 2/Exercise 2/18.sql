select c.nome
from cidade c
where (select sum(f.salario) from funcionario f where f.codcidade = c.codcidade) > 17000