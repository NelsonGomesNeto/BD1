select a.numeroA
from ambulatorio a
where a.andar not in (2, 4) and a.capacidade > 50