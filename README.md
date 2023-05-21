# Banco de Dados da Clínica Médica

Este é um banco de dados SQL projetado para uma clínica médica, criado com o objetivo de estudo e aplicação prática em um ambiente acadêmico. O banco de dados foi desenvolvido para armazenar informações relevantes sobre pacientes, médicos, agendamentos de consultas e históricos médicos.

## Entidades Principais

O banco de dados consiste nas seguintes entidades principais:

1. **Paciente**: Armazena informações sobre os pacientes da clínica, incluindo nome, data de nascimento, gênero, endereço, número de telefone e informações de contato.

2. **Médico**: Contém detalhes sobre os médicos da clínica, como nome, especialidade, número de registro, informações de contato e horários de disponibilidade.

3. **Consulta**: Registra os agendamentos de consultas entre os pacientes e os médicos. Inclui informações como data e hora da consulta, paciente associado, médico responsável e observações adicionais.

4. **CLINICA**: Histórico médico resumido ou quaisquer outros campos relevantes para o contexto da clínica médica.

## Relacionamentos

O banco de dados utiliza relacionamentos para estabelecer as conexões entre as entidades:

- Um paciente pode ter várias consultas agendadas e um histórico médico.
- Um médico pode ser responsável por várias consultas e ter várias especialidades.
- Cada consulta é associada a um único paciente e a um médico específico.
- O histórico médico de um paciente é exclusivo para esse paciente.

## Diagrama de Entidade-Relacionamento (ER)

Aqui está um exemplo básico de um diagrama ER que ilustra a estrutura do banco de dados da clínica:

```
+----------------+     +--------------+     +--------------+ 
|   Paciente     |     |   Consulta   |     |   Médico     |
+----------------+     +--------------+     +--------------+
| ID (PK)        |     | ID (PK)      |     | ID (PK)      |
| ID_USUARIO(FK) |-----| ID_PACIENTE(FK)|   | Nome         |
| NOME           |     | ID-MEDICO(FK)|     | CRM          |
| CPF            |     | Data         |     | ID_CLINICA   |
| RG             |     | DESCRIÇÃO    |     | ID_ESPECIALIDADE|
| Telefone       |     | STATUS(FK)   |     |              |
| DATA_NASCIMENTO|     |              |     |              |
+----------------+     +--------------+     +--------------+

+------------------+    
| CLINICA          |
+------------------+
| ID (PK)          |
| NOME FANTASIA    |
| ENDEREÇO         |
| NUMERO           |
| CEP              |
| RAZAO SOCIAL     |
+------------------+
```

## Exemplo de Consultas SQL

Aqui estão alguns exemplos de consultas SQL que podem ser realizadas no banco de dados:

- Selecionar todos os pacientes:
  ```sql
  SELECT * FROM Paciente;
  ```

- Encontrar consultas agendadas para um determinado médico:
  ```sql
  SELECT * FROM Consulta WHERE Medico_ID = <ID_do_Medico>;
  ```

- Atualizar o endereço de um paciente:
  ```sql
  UPDATE Paciente SET Endereço = 'Novo Endereço' WHERE ID = <ID_do_Paciente