select Medico.nome
from Medico
where not exists(select Consulta.crm from Consulta where Medico.crm = Consulta.crm)