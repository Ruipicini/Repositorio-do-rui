-- Banco de dados
CREATE DATABASE IF NOT EXISTS agenda_siso;
USE agenda_siso;

-- Tabela Pacientes
CREATE TABLE IF NOT EXISTS pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    genero VARCHAR(20),
    data_nascimento DATE,
    email VARCHAR(150),
    celular VARCHAR(20),
    rg VARCHAR(20),
    cpf VARCHAR(20),
    logradouro VARCHAR(255),
    numero INT,
    complemento VARCHAR(100),
    cep VARCHAR(20),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Tabela Clinica (necessária para Profissional)
CREATE TABLE IF NOT EXISTS clinica (
    id_clinica INT AUTO_INCREMENT PRIMARY KEY,
    nome_clinica VARCHAR(255)
);

-- Tabela Profissional
CREATE TABLE IF NOT EXISTS profissional (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    id_clinica INT,
    FOREIGN KEY (id_clinica) REFERENCES clinica(id_clinica)
);

-- Tabela Agendamentos
CREATE TABLE IF NOT EXISTS agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    inicio TIME NOT NULL,
    fim TIME NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id)
);
select*from pacientes;
-- T
-- Todos os pacientes
SELECT id, nome_completo FROM pacientes;

-- Um paciente específico
SELECT * FROM pacientes WHERE id = 1;

-- Histórico odontograma de um paciente
SELECT * FROM odontograma WHERE id_paciente = 1;

-- Agendamentos de um paciente
SELECT * FROM agendamentos WHERE id_paciente = 1;
