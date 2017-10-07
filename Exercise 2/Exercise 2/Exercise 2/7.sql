select m.nome, c.data
from medico m inner join consulta c on m.crm = c.crm
order by m.nome