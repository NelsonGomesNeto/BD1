select e.nome as 'Especialidade', count(Medico.especialidade) as 'Quantidade de Médicos'
from especialidade e
inner join Medico on Medico.especialidade = e.codEsp
group by e.nome