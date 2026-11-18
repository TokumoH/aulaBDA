\c bi3032281_ifsp

INSERT INTO curso (id_curso, nome, carga_horaria) VALUES (1, 'Engenharia de Computação', 3600), 
(2, 'Análise e Desenvolvimento de Sistemas', 2400), 
(3, 'Redes de Computadores', 2000), 
(4, 'Gestão da Tecnologia da Informação', 2000);

INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso)
VALUES (1, 'Ana Souza', '2026001', '2005-03-15', 1),
(2, 'Bruno Lima', '2026002', '2004-07-22', 1), 
(3, 'Carla Mendes', '2026003', '2006-01-10', 2), 
(4, 'Diego Santos', '2026004', '2003-11-05', 2), 
(5, 'Elisa Rocha', '2026005', '2005-09-18', 3),
(6, 'Felipe Alves', '2026006', '2004-04-30', 3),
(7, 'Gabriela Costa', '2026007', '2006-06-12', 1),
(8, 'Henrrique Martins', '2026008', NULL, 2),
(9, 'Isabela Oliveira', '2026009', '2005-12-01', 1),
(10, 'João Pereira', '2026010', NULL, 3);

INSERT INTO disciplina (id_disciplina, nome, carga_horaria, id_curso)
VALUES (1, 'Algoritmos', 80, 1),
(2, 'Banco de Dados I', 80, 1),
(3, 'Arquitetura de Computadores', 60, 1),
(4, 'Programação Web', 80, 2),
(5, 'Engenharia de Software', 60, 2),
(6, 'Banco de Dados', 60, 2),
(7, 'Redes de Computadores I', 80, 3),
(8, 'Segurança de Redes', 60, 3),
(9, 'Sistemas Operacionais', 60, 3);

insert into aluno (id_aluno, nome, matricula, data_nascimento, id_curso) values (11, 'Lucas Ferreira', '2026001', '2005-08-20', 1);
-- ERRO:  duplicar valor da chave viola a restrição de unicidade "uq_aluno_matricula"
-- DETALHE:  Chave (matricula)=(2026001) já existe.


insert into disciplina (id_disciplina, nome, carga_horaria, id_curso) values (10, 'Inteligência Artificial', 80, 99); --nao deveria aceitar pq nao tem curso 99;
-- ERRO:  inserção ou atualização em tabela "disciplina" viola restrição de chave estrangeira "fk_disciplina_curso"
-- DETALHE:  Chave (id_curso)=(99) não está presente na tabela "curso".
