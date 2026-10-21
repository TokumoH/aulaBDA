-- BASIC CONSOLE COMMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABLE>    => Show table structure
\c postgres;
CREATE DATABASE empresa;
\c empresa;
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

CREATE TABLE dependente
(
    fidenti TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    dt_nasc DATE, 
    sexo VARCHAR(15),
    relacionamento VARCHAR (15),
    PRIMARY KEY (fidenti, nome)
);

CREATE TABLE departamento
(
    numero D_NUM,
    nome VARCHAR(15) NOT NULL,
    gident TIPO_ID,
    dtinicio DATE,
    PRIMARY KEY (numero)
);

CREATE TABLE localizacoes
(
    dnumero D_NUM,
    localizacao VARCHAR(15),
    PRIMARY KEY (dnumero, localizacao)
);

CREATE TABLE projeto
(
    numero D_NUM,
    nome VARCHAR(15),
    localizacao VARCHAR(15),
    dnumero D_NUM,
    PRIMARY KEY (numero)
);

CREATE TABLE trabalha_em
(
    fidenti TIPO_ID,
    pnumero D_NUM,
    horas DECIMAL(5,2),
    PRIMARY KEY (fidenti, pnumero)
);