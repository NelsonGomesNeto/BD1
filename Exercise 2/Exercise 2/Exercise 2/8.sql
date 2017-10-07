select m.crm, c.data
from medico m inner join consulta c on m.crm = c.crm and c.rg in (22, 25)