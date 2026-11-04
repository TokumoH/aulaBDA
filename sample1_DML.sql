-- ISERT, UPDATE, DELETE

-- SINTAX INSERT COMMAND 
INSERT INTO tabela (col1, col2, ..., coln) VALUES (val1, val2, ..., valn);
-- Se omitirmos a lista de colunas, devemos fornecer valores para todas as colunas da tabela, na ordem em que foram definidas.


-- EXEMPLO TABLE DEPARTAMENTO
INSERT INTO departamento (nome, numero) VALUES ('FINANCEIRO', 1);
INSERT INTO departamento (nome, numero) VALUES ('MARKETING', 2);
INSERT INTO departamento (nome, numero) VALUES ('RH', 3);

--EXEMPLO TABLE FUNCIONARIO
INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero) 
    VALUES (1, 'JOAO', 'PEDRO', 'RUA A', '1990-01-01', 3000.00, 'M', NULL, 1);
INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero) 
    VALUES (2, 'MARIA', 'ANTONIETA', 'RUA B', '1992-02-02', 3500.00, 'F', 1, 2);
INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero) 
    VALUES (3, 'CARLOS', 'SAINZ','RUA C', '1988-03-03', 4000.00, 'M', 1, 3);

-- SEE INSTER REGISTERS
SELECT * FROM tabela ORDER BY coluna