\c ebiki

drop table musica_album;

alter table musicas add column data_criacao date; -- Coluna adicionada depois
alter table musicas alter column data_criacao set not null,
    add column id_artista_principal int, -- Coluna adicionada depois
    alter column id_artista_principal set not null,
    add constraint fk_musicas_id_artista_principal foreign key (id_artista_principal) references artista (id) on delete restrict, -- Adicionando foreign key depois
    alter column data_criacao set default current_date, -- Adicionando tipo default
    drop column descricao,
    add column id_album, -- Adicionando novo atributo
    alter column id_album int,
    alter column id_album set not null, 
    add constraint fk_musicas_id_album foreign key (id_album) references album (id) on delete restrict;-- Adicionando foreign key
    
alter table reproducao alter column data_hora type timestamp; -- Alterando tipo de data_hora

