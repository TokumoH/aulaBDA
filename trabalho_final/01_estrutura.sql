drop database if exists ebiki;
create database ebiki;

\c ebiki;

create table genero
(
    id int generated always as identity,
    nome varchar(255)
);

create table musicas
(
    id int generated always as identity,
    nome varchar(255),
    cover varchar(255),
    duration interval,
    descricao varchar(255),
    arquivo varchar(255)
);

create table users
(
    id int generated always as identity,
    email varchar(255),
    nome varchar(255),
    senha varchar(255)
);

create table playlists
(
    id int generated always as identity,
    id_user int,
    nome varchar(255),
    cover varchar(255)
);

create table artista
(
    id int generated always as identity,
    nome varchar(255)
);

create table album
(
    id int generated always as identity,
    id_artista int,
    nome varchar(255),
    cover varchar(255)
);

create table reproducao
(
    id int generated always as identity,
    id_user int,
    id_musica int,
    data_hora date
);

create table musica_artista
(
    id_artista_feat  int,
    id_musica int
);

create table musica_playlist
(
    id_playlist int,
    id_musica int,
    data_adicao timestamp,
    posicao int
);

create table musica_album
(
    id_album int,
    id_musica int
);

create table musica_genero
(
    id_genero int,
    id_musica int
);

create table album_genero
(
    id_genero int,
    id_album int
);

create table artista_genero
(
    id_genero int,
    id_artista int
);

alter table genero add constraint pk_genero primary key (id);
alter table genero add constraint uq_genero_nome unique (nome);
alter table genero alter column nome set not null;

alter table musicas add constraint pk_musicas primary key (id);
alter table musicas add constraint uq_musicas_arquivo unique (arquivo);
alter table musicas alter column nome set not null;
alter table musicas alter column duration set not null;
alter table musicas alter column arquivo set not null;
alter table musicas add constraint ck_musicas_duration check (duration > interval '10 seconds');


alter table users add constraint pk_users primary key (id);
alter table users add constraint uq_users_email unique (email); -- Usando unique
alter table users alter column email set not null;
alter table users alter column nome set not null;
alter table users alter column senha set not null;
alter table users add constraint ck_users_email check (email like '_%@_%._%'); -- Usando check

alter table playlists add constraint pk_playlists primary key (id);
alter table playlists add constraint fk_playlists_id_user foreign key (id_user) references users (id) on delete cascade; -- On delete
alter table playlists alter column nome set not null,
    alter column id_user set not null;

alter table artista add constraint pk_artista primary key (id);
alter table artista alter column nome set not null;

alter table album add constraint pk_album primary key (id);
alter table album add constraint fk_album_id_artista foreign key (id_artista) references artista (id) on delete restrict; -- On delete
alter table album alter column nome set not null,
    alter column id_artista set not null;

alter table reproducao add constraint pk_reproducao primary key (id);
alter table reproducao add constraint fk_reproducao_id_user foreign key (id_user) references users (id) on delete cascade;
alter table reproducao add constraint fk_reproducao_id_musica foreign key (id_musica) references musicas (id) on delete cascade;
alter table reproducao alter column data_hora set not null,
    alter column data_hora set default current_timestamp,
    alter column id_user set not null,
    alter column id_musica set not null;
alter table reproducao add constraint ck_reproducao_data_hora check (data_hora <= current_timestamp); -- Usando check

alter table musica_artista add constraint fk_musica_artista_id_artista foreign key (id_artista_feat) references artista (id) on delete cascade; -- On delete
alter table musica_artista add constraint fk_musica_artista_id_musica foreign key (id_musica) references musicas (id) on delete cascade; -- On delete
alter table musica_artista add constraint pk_musica_artista primary key (id_artista_feat, id_musica);

alter table musica_playlist add constraint fk_musica_playlist_id_playlist foreign key (id_playlist) references playlists (id) on delete cascade; -- On delete
alter table musica_playlist add constraint fk_musica_playlist_id_musica foreign key (id_musica) references musicas (id) on delete cascade; -- On delete
alter table musica_playlist add constraint pk_musica_playlist primary key (id_playlist, id_musica);
alter table musica_playlist alter column data_adicao set not null,
    alter column data_adicao set default current_timestamp;
alter table musica_playlist alter column posicao set not null;
alter table musica_playlist add constraint uq_musica_playlist_posicao unique (id_playlist, posicao); -- Usando unique
alter table musica_playlist add constraint ck_musica_playlist_posicao check (posicao > 0); -- Usando check

alter table musica_album add constraint fk_musica_album_id_album foreign key (id_album) references album (id) on delete cascade; -- On delete
alter table musica_album add constraint fk_musica_album_id_musica foreign key (id_musica) references musicas (id) on delete cascade; -- On delete
alter table musica_album add constraint pk_musica_album primary key (id_album, id_musica);

alter table musica_genero add constraint fk_musica_genero_id_genero foreign key (id_genero) references genero (id) on delete restrict; -- On delete Restrict
alter table musica_genero add constraint fk_musica_genero_id_musica foreign key (id_musica) references musicas (id) on delete cascade; -- On delete Cascade
alter table musica_genero add constraint pk_musica_genero primary key (id_genero, id_musica);

alter table album_genero add constraint fk_album_genero_id_genero foreign key (id_genero) references genero (id) on delete restrict; -- On delete Restrict
alter table album_genero add constraint fk_album_genero_id_album foreign key (id_album) references album (id) on delete cascade; -- On delete Cascade
alter table album_genero add constraint pk_album_genero primary key (id_genero, id_album);

alter table artista_genero add constraint fk_artista_genero_id_genero foreign key (id_genero) references genero (id) on delete restrict; -- On delete Restrict
alter table artista_genero add constraint fk_artista_genero_id_artista foreign key (id_artista) references artista (id) on delete cascade; -- On delete Cascade
alter table artista_genero add constraint pk_artista_genero primary key (id_genero, id_artista);







