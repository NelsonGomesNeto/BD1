select e.nome, count(m.especialidade) as 'Quantidade de M�dicos'
from especialidade e inner join medico m on m.especialidade = e.codesp
group by e.nome