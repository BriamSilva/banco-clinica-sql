--- VIEW QUE RETORNA TODAS AS INFORMAÇÕES DO MEDICO ---
CREATE VIEW VerMedicos 
AS 
SELECT 
MED.ID AS 'MEDICO' ,MED.NOME AS 'NOME_MEDICO' ,MED.CRM AS 'CRM_MEDICO',
US.ID AS 'ID_MEDICO', US.EMAIL AS 'EMAIL_MEDICO', US.SENHA AS 'SENHA_MEDICO',US.TIPO_USUARIO AS 'TIPO_USUARIO_MEDICO',
ESP.ID AS 'ID_ESPECIALIDADE',ESP.NOME AS 'ESPECIALIDADE_MEDICO',
CLI.ID AS 'ID_CLINICA',CLI.NOME_FANTASIA AS 'CLINICA',CLI.ENDERECO AS 'ENDERECO',CLI.NUMERO AS 'NUMERO', CLI.RAZAO_SOCIAL AS 'RAZAO_SOCIAL'
FROM Medico AS MED
LEFT JOIN Usuario			AS US	ON MED.ID_USUARIO		= US.ID
LEFT JOIN Clinica			AS CLI	ON MED.ID_CLINICA		= CLI.ID
LEFT JOIN Especialidade		AS ESP	ON MED.ID_ESPECIALIDADE = ESP.ID;


--- VIEW QUE RETORNA TODAS AS INFORMAÇÕES DO PACIENTE ---
CREATE VIEW VerPacientes
AS
SELECT 
PAC.ID AS 'PACIENTE' ,PAC.NOME AS 'NOME_PACIENTE', PAC.CPF AS 'CPF_PACIENTE', PAC.RG AS 'RG_PACIENTE', PAC.TELEFONE AS 'TELEFONE_PACIENTE', PAC.DATA_NASCIMENTO AS 'DATA_NASCIMENTO_PACIENTE',
US.ID AS 'ID_PACIENTE', US.EMAIL AS 'EMAIL_PACIENTE',US.SENHA AS 'SENHA_PACIENTE',US.TIPO_USUARIO AS 'TIPO_USUARIO_PACIENTE'
FROM Paciente AS PAC
LEFT JOIN Usuario			AS US	ON PAC.ID_USUARIO	= US.ID;


--- VIEW QUE RETORNA TODAS AS INFORMAÇÕES DA CONSULTA ---
CREATE VIEW VerConsultas
AS
SELECT CON.ID AS 'CONSULTA',CON.DESCRICAO AS 'DESCRICAO', CON.DATA_CONSULTA AS 'DATA' , CON.STATUS_CONSULTA AS 'STATUS',
MED.*,PAC.*
FROM Consulta AS CON
LEFT JOIN VerMedicos		AS MED ON CON.ID_MEDICO		= MED.MEDICO
LEFT JOIN VerPacientes		AS PAC ON CON.ID_PACIENTE	= PAC.PACIENTE;


--- VIEW QUE RETORNA TODAS AS INFORMAÇÕES DO USUARIO ---
CREATE VIEW VerUsuarios
AS
SELECT US.ID AS 'ID',US.EMAIL AS 'EMAIL',US.SENHA AS 'SENHA'
FROM Usuario AS US
WHERE US.TIPO_USUARIO != 100;


-- Função que retorna a idade do usuario --
CREATE FUNCTION CalcularIdade (@ANO AS INT)
RETURNS INT 
AS
BEGIN
RETURN YEAR(GETDATE()) - @ANO;
END
