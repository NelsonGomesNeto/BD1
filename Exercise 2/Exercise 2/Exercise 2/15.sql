select a.numeroA
from ambulatorio a
where not exists (select m.numeroA from medico m where m.numeroA = a.numeroA)