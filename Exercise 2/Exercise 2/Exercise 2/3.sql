select e.nome as 'Especialidade', count(Medico.especialidade) as 'Quantidade de M�dicos'
from especialidade e
inner join Medico on Medico.especialidade = e.codEsp
group by e.nome