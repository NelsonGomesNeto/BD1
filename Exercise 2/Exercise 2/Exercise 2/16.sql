select f.nome, f.rg
from funcionario f
where exists (select c.rg from consulta c where c.rg = f.rg)
-- (select p.rg from paciente p where p.rg = f.rg)