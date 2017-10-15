Questão 1
SELECT Paciente.*
FROM Paciente
WHERE
	Paciente.rg IS NOT NULL AND Paciente.rg IN
		(SELECT Consulta.rg FROM Consulta WHERE Consulta.coddoenca =
			(SELECT Doenca.coddoenca FROM Doenca WHERE Doenca.nome = 'Sarampo'))

Questão 2
SELECT Medico.*
FROM Medico
WHERE idade > 40 and
	Medico.especialidade =
		(SELECT Especialidade.codEsp FROM Especialidade WHERE Especialidade.nome = 'Ortopedia')

Questão 3
select e.nome as 'Especialidade', count(Medico.especialidade) as 'Quantidade de Médicos'
from especialidade e
inner join Medico on Medico.especialidade = e.codEsp
group by e.nome

Questão 4
select m.nome
from medico m
where not exists(select Consulta.crm from Consulta where m.crm = Consulta.crm)
-- where m.crm not in (select consulta.crm from consulta)

Questão 5
select c.*
from consulta c
where c.crm in (select medico.crm from medico where medico.crm not in (46, 79))

Questão 6
select a.*
from ambulatorio a
where a.andar = 4 and (a.capacidade = 50 or a.numeroA > 10)

Questão 7
select m.nome, c.data
from medico m inner join consulta c on m.crm = c.crm
order by m.nome

Questão 8
select m.crm, c.data
from medico m inner join consulta c on m.crm = c.crm and c.rg in (22, 25)

Questão 9
select a.numeroA
from ambulatorio a
where a.andar not in (2, 4) and a.capacidade > 50

Questão 10
select a.numeroA, a.capacidade, m.nome
from ambulatorio a inner join medico m on m.numeroA = a.numeroA
where a.andar = 5

Questão 11
select m.nome, p.nome, c.data
from consulta c
	inner join medico m on m.crm = c.crm
	inner join paciente p on p.rg = c.rg

Questão 12
select p.nome
from consulta c
	inner join paciente p on p.rg = c.rg
	inner join medico m on m.crm = c.crm
where m.nome in ('João Carlos Santos', 'Maria Souza') and
	(select d.nome from doenca d where d.coddoenca = c.coddoenca) = 'Pneumonia'

Questão 13
select a.nome, a.idade from
	(select m.nome, m.idade, m.codcidade from medico m
	union
	select p.nome, p.idade, p.codcidade from paciente p
	union
	select f.nome, f.idade, f.codcidade from funcionario f) a
where a.codcidade = (select c.codcidade from cidade c where c.nome = 'Florianópolis')

Questão 14
select f.nome, f.rg
from funcionario f
where f.salario < 5300 and
	not exists (select p.* from paciente p where p.rg = f.rg)

Questão 15
select a.numeroA
from ambulatorio a
where not exists (select m.numeroA from medico m where m.numeroA = a.numeroA)

Questão 16
select f.nome, f.rg
from funcionario f
where exists (select c.rg from consulta c where c.rg = f.rg)
-- (select p.rg from paciente p where p.rg = f.rg)

Questão 17
select f.nome
from funcionario f
where not exists (select c.rg from consulta c where c.rg = f.rg)

Questão 18
select c.nome
from cidade c
where (select sum(f.salario) from funcionario f where f.codcidade = c.codcidade) > 17000

Questão 19
select a.nome, c.nome
from
	(select m.nome, m.codcidade from medico m
	union
	select p.nome, p.codcidade from paciente p) a
	inner join cidade c on a.codcidade = c.codcidade

Questão 20
select e.nome, count(m.especialidade) as 'Quantidade de Médicos'
from especialidade e inner join medico m on m.especialidade = e.codesp
group by e.nome

