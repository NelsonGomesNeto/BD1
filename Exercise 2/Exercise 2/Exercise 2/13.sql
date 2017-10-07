select a.nome, a.idade from
	(select m.nome, m.idade, m.codcidade from medico m
	union
	select p.nome, p.idade, p.codcidade from paciente p
	union
	select f.nome, f.idade, f.codcidade from funcionario f) a
where a.codcidade = (select c.codcidade from cidade c where c.nome = 'Florianópolis')