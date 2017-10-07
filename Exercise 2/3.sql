select Especialidade.nome, count(Medico.especialidade)
from Especialidade
inner join Medico on Medico.especialidade = Especialidade.codEsp
group by Especialidade