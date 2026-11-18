\c bi3032281_ifsp;

select * from curso;

select aluno.nome, aluno.matricula from aluno;

select * from aluno order by id_aluno ASC;

select * from disciplina order by carga_horaria DESC, nome ASC;

select * from aluno where id_curso = 1;

select * from disciplina where carga_horaria >= 80;

select * from aluno where data_nascimento <= '2005-01-01';

select * from aluno where aluno.nome like 'A%';

select * from aluno where data_nascimento is null;

select * from aluno where id_curso in (1,3);

select * from disciplina where carga_horaria between 60 and 80;

select a.nome, c.nome from (aluno as a join curso as c on a.id_curso = c.id_curso);

select d.nome,d.carga_horaria, c.nome from (disciplina as d join curso as c on d.id_curso = c.id_curso);

select a.nome, a.matricula from (aluno as a join 
(select * from curso where nome = 'Engenharia de Computação') 
as c on a.id_curso = c.id_curso);

select count(*) as total_alunos from aluno;

select max(carga_horaria),min(carga_horaria) from disciplina;

select avg(carga_horaria) from disciplina;

select c.nome, (select count(*) from aluno as a where a.id_curso = c.id_curso) as quantidade_alunos from curso as c;


select c.nome, coalesce((select sum(d.carga_horaria) 
from disciplina as d where d.id_curso = c.id_curso),0) as total_horas_curso from curso as c;

select c.nome, (select sum(a.id_curso) from aluno as a where (select count(*) from aluno) >= 3 and a.id_curso = c.id_curso) from curso as c;