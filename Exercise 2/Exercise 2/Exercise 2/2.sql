SELECT Medico.*
FROM Medico
WHERE idade > 40 and
	Medico.especialidade =
		(SELECT Especialidade.codEsp FROM Especialidade WHERE Especialidade.nome = 'Ortopedia')