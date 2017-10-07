select p.nome
from consulta c
	inner join paciente p on p.rg = c.rg
	inner join medico m on m.crm = c.crm
where m.nome in ('João Carlos Santos', 'Maria Souza') and
	(select d.nome from doenca d where d.coddoenca = c.coddoenca) = 'Pneumonia'