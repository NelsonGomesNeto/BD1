select a.numeroA, a.capacidade, m.nome
from ambulatorio a inner join medico m on m.numeroA = a.numeroA
where a.andar = 5