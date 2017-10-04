select *
from consulta
where consulta.crm not in (select medico.crm from medico where medico.crm not in (46, 79))