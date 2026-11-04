-- BASIC CONSOLE COMMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show tables
-- \d <TABLE>    => Show table structure
-- \l            => List databases
\c postgres;
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
\c empresa;
CREATE DOMAIN TIPO_ID AS CHAR(4);

CREATE DOMAIN D_NUM AS INTEGER
CHECK (VALUE > 0 AND VALUE < 21);

CREATE TABLE departamento
(
    numero D_NUM,
    nome VARCHAR(15) NOT NULL,
    gident TIPO_ID,
    dtinicio DATE,
    numero_func INTEGER,
    PRIMARY KEY (numero)
);
CREATE TABLE funcionario
(
ident TIPO_ID,
nome VARCHAR(15) NOT NULL,
sobrenome VARCHAR(15) NOT NULL,
endereco VARCHAR(30),
dtnasc DATE,
salario DECIMAL(10,2),
sexo VARCHAR(15),
supident TIPO_ID,
dnumero D_NUM NOT NULL,
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

CREATE TABLE chamada
(
    prontuario VARCHAR(15),
    nome       VARCHAR(50),
    time_coracao varchar(50),
    PRIMARY KEY (prontuario)
);

ALTER TABLE funcionario ADD CONSTRAINT fk_funcionario_gerente
    FOREIGN KEY (supident) REFERENCES funcionario(ident);

ALTER TABLE funcionario ADD CONSTRAINT fk_funcionario_departamento
    FOREIGN KEY (dnumero) REFERENCES departamento(numero);


ALTER TABLE funcionario
ALTER supident SET DEFAULT 5;

ALTER TABLE funcionario
ALTER sexo TYPE VARCHAR(1);

ALTER TABLE departamento
DROP dnumero;

ALTER TABLE funcionario
DROP dnumero RESTRICT; -- Nao deixa deletar se tiver uma foreign key apontando para a coluna que queremos deletar.

ALTER TABLE funcionario
DROP numero CASCADE; -- Deleta a coluna e todas as foreign keys que apontam para ela.

--UPDATE CHAMADA SET time_coracao = 'time' WHERE prontuario = 'bi';