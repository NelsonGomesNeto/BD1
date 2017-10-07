select m.nome, p.nome, c.data
from consulta c
	inner join medico m on m.crm = c.crm
	inner join paciente p on p.rg = c.rg