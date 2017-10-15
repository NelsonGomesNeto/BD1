select c.*
from consulta c
where c.crm in (select medico.crm from medico where medico.crm not in (46, 79))