select f.nome
from funcionario f
where not exists (select c.rg from consulta c where c.rg = f.rg)