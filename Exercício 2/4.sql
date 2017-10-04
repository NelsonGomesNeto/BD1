select Medico.nome
from Medico
#where not exists(select Consulta.crm from Consulta where Medico.crm = Consulta.crm)
where Medico.crm not in (select Consulta.crm from Consulta)