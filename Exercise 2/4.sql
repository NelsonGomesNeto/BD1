select medico.nome
from medico
#where not exists(select Consulta.crm from Consulta where Medico.crm = Consulta.crm)
where medico.crm not in (select consulta.crm from consulta)