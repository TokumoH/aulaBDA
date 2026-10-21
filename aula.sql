-- BASIC CONSOLE COMMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABLE>    => Show table structure

CREATE DATABASE empresa;

CREATE DOMAIN TIPO_ID AS CHAR(4);

CREATE DOMAIN D_NUM AS INTEGER
CHECK (VALUE > 0 AND VALUE < 21);

CREATE TABLE FUNCIONARIO
(
ident TIPO_ID,
nome VARCHAR(15) NOT NULL,
sobrenome VARCHAR(15) NOT NULL,
endereco VARCHAR(30),
dtnasc DATE,
salario DECIMAL(10,2),
sexo BOOLEAN,
supident TIPO_ID,
dnumero TIPO_ID NOT NULL,
PRIMARY KEY (ident)
);

