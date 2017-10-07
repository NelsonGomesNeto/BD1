select m.nome
from medico m
where not exists(select Consulta.crm from Consulta where m.crm = Consulta.crm)
-- where m.crm not in (select consulta.crm from consulta)