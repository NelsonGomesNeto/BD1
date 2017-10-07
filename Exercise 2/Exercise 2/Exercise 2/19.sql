select a.nome, c.nome
from
	(select m.nome, m.codcidade from medico m
	union
	select p.nome, p.codcidade from paciente p) a
	inner join cidade c on a.codcidade = c.codcidade