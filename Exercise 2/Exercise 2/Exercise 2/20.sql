select e.nome, count(m.especialidade) as 'Quantidade de Médicos'
from especialidade e inner join medico m on m.especialidade = e.codesp
group by e.nome