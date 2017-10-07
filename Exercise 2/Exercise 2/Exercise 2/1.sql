SELECT Paciente.*
FROM Paciente
WHERE
	Paciente.rg IS NOT NULL AND Paciente.rg IN
		(SELECT Consulta.rg FROM Consulta WHERE Consulta.coddoenca = 
			(SELECT Doenca.coddoenca FROM Doenca WHERE Doenca.nome = 'Sarampo'))