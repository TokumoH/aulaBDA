
-- PARTE A
\c postgres;
DROP DATABASE IF EXISTS bi3032281_ifsp;

CREATE DATABASE bi3032281_ifsp;

\c bi3032281_ifsp;

CREATE TABLE curso
(
    id_curso INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL
);

CREATE TABLE aluno
(
    id_aluno INTEGER,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    id_curso INTEGER NOT NULL,
    data_nascimento DATE
);

CREATE TABLE disciplina
(
    id_disciplina INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL,
    id_curso INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT ck_curso_carga_horaria CHECK (carga_horaria > 0);
ALTER TABLE curso ADD CONSTRAINT pk_curso PRIMARY KEY (id_curso);

ALTER TABLE disciplina ADD CONSTRAINT ck_disciplina_carga_horaria CHECK (carga_horaria > 0);
ALTER TABLE disciplina ADD CONSTRAINT pk_disciplina PRIMARY KEY (id_disciplina);
ALTER TABLE disciplina ADD CONSTRAINT fk_disciplina_curso FOREIGN KEY (id_curso) REFERENCES curso (id_curso);

ALTER TABLE aluno ADD CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso);
ALTER TABLE aluno ADD CONSTRAINT pk_aluno PRIMARY KEY (id_aluno);
ALTER TABLE aluno ADD CONSTRAINT uq_aluno_matricula UNIQUE (matricula);


--Parte B
ALTER TABLE aluno ADD COLUMN email VARCHAR (120);
ALTER TABLE aluno ADD COLUMN telefone VARCHAR (20);
ALTER TABLE aluno ALTER nome TYPE VARCHAR(150);
ALTER TABLE aluno RENAME COLUMN telefone TO celular;
ALTER TABLE aluno DROP COLUMN celular;
ALTER TABLE aluno DROP CONSTRAINT uq_aluno_matricula;
ALTER TABLE aluno ADD CONSTRAINT uq_aluno_matricula UNIQUE (matricula);

ALTER TABLE curso ADD COLUMN modalidade VARCHAR(20) DEFAULT 'Presencial';
ALTER TABLE curso ADD CONSTRAINT ck_modalidade CHECK (modalidade IN ('Presencial', 'EAD', 'Hibrido'));

ALTER TABLE disciplina ADD COLUMN ementa VARCHAR(500);

--Parte C
DROP TABLE curso;

DROP TABLE aluno;
DROP TABLE disciplina;
DROP TABLE curso;
