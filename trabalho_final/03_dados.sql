-- =====================================================================
-- 03_dados.sql - Carga inicial de dados fictícios (banco ebiki)
-- Executar após 01_estrutura.sql e 02_alteracoes.sql, em banco recém-criado.
-- Os ids são gerados pelo banco (identity) e começam em 1; as chaves
-- estrangeiras abaixo usam esses ids, por isso a ordem dos inserts importa.
-- Todos os nomes, e-mails e hashes são fictícios.
-- =====================================================================

\c ebiki

-- ---------------------------------------------------------------------
-- users (6) - o usuário 6 não tem playlists nem reproduções (caso sem vínculo)
-- ---------------------------------------------------------------------
insert into users (email, nome, senha) values
    ('ana.souza@exemplo.com',     'Ana Souza',     '$2b$12$hashficticio0000000000000000000000000000000000001'),
    ('bruno.lima@exemplo.com',    'Bruno Lima',    '$2b$12$hashficticio0000000000000000000000000000000000002'),
    ('carla.mendes@exemplo.com',  'Carla Mendes',  '$2b$12$hashficticio0000000000000000000000000000000000003'),
    ('diego.alves@exemplo.com',   'Diego Alves',   '$2b$12$hashficticio0000000000000000000000000000000000004'),
    ('elisa.rocha@exemplo.com',   'Elisa Rocha',   '$2b$12$hashficticio0000000000000000000000000000000000005'),
    ('fabio.nunes@exemplo.com',   'Fábio Nunes',   '$2b$12$hashficticio0000000000000000000000000000000000006');

-- ---------------------------------------------------------------------
-- artista (7) - o artista 7 não tem álbuns nem músicas (caso sem vínculo)
-- ---------------------------------------------------------------------
insert into artista (nome) values
    ('Aurora Boreal'),    -- 1
    ('Os Andarilhos'),    -- 2
    ('Luna Vega'),        -- 3
    ('DJ Pulsar'),        -- 4
    ('Trio Maré'),        -- 5
    ('Caio Brasa'),       -- 6
    ('Banda Nova Era');   -- 7

-- ---------------------------------------------------------------------
-- genero (7) - o gênero 7 (Forró) não é usado (caso sem vínculo)
-- ---------------------------------------------------------------------
insert into genero (nome) values
    ('Rock'),         -- 1
    ('Pop'),          -- 2
    ('MPB'),          -- 3
    ('Eletrônica'),   -- 4
    ('Samba'),        -- 5
    ('Jazz'),         -- 6
    ('Indie');        -- 7

-- ---------------------------------------------------------------------
-- album (7) - o álbum 7 é um single (álbum de uma faixa, RN05)
-- ---------------------------------------------------------------------
insert into album (id_artista, nome, cover) values
    (1, 'Céu de Neon',     'capas/ceu_de_neon.jpg'),      -- 1
    (2, 'Estrada Aberta',  'capas/estrada_aberta.jpg'),   -- 2
    (3, 'Lua Cheia',       'capas/lua_cheia.jpg'),        -- 3
    (4, 'Frequência',      'capas/frequencia.jpg'),       -- 4
    (5, 'Maré Alta',       null),                         -- 5 (sem capa)
    (6, 'Brasa Viva',      'capas/brasa_viva.jpg'),       -- 6
    (1, 'Ondas de um Sentimento',        'capas/ondas_de_um_sentimento.jpg');         -- 7 (single)

-- ---------------------------------------------------------------------
-- musicas (12) - toda música tem artista principal e álbum
-- ---------------------------------------------------------------------
insert into musicas (nome, cover, duration, arquivo, data_criacao, id_artista_principal, id_album) values
    ('Luzes da Cidade',   'capas/ceu_de_neon.jpg',    interval '3 minutes 45 seconds', 'audio/luzes_da_cidade.mp3',   '2021-03-10', 1, 1),  -- 1
    ('Neon Azul',         'capas/ceu_de_neon.jpg',    interval '4 minutes 12 seconds', 'audio/neon_azul.mp3',         '2021-03-10', 1, 1),  -- 2
    ('Pé na Estrada',     'capas/estrada_aberta.jpg', interval '3 minutes 30 seconds', 'audio/pe_na_estrada.mp3',     '2019-08-22', 2, 2),  -- 3
    ('Poeira e Sol',      'capas/estrada_aberta.jpg', interval '5 minutes 1 second',   'audio/poeira_e_sol.mp3',      '2019-08-22', 2, 2),  -- 4
    ('Noite de Lua',      'capas/lua_cheia.jpg',      interval '4 minutes 5 seconds',  'audio/noite_de_lua.mp3',      '2022-11-05', 3, 3),  -- 5
    ('Sereno',            null,                       interval '3 minutes 18 seconds', 'audio/sereno.mp3',            '2022-11-05', 3, 3),  -- 6 (sem capa)
    ('Pulso',             'capas/frequencia.jpg',     interval '6 minutes 20 seconds', 'audio/pulso.mp3',             '2023-06-30', 4, 4),  -- 7
    ('Sinal Verde',       'capas/frequencia.jpg',     interval '5 minutes 45 seconds', 'audio/sinal_verde.mp3',       '2023-06-30', 4, 4),  -- 8
    ('Onda Forte',        null,                       interval '3 minutes 55 seconds', 'audio/onda_forte.mp3',        '2020-01-17', 5, 5),  -- 9 (sem capa)
    ('Ponto do Porto',  null,                       interval '4 minutes 40 seconds', 'audio/ponto_do_porto.mp3',  '2020-01-17', 5, 5),  -- 10 (sem capa)
    ('Fogo Lento',        'capas/brasa_viva.jpg',     interval '3 minutes 25 seconds', 'audio/fogo_lento.mp3',        '2024-09-12', 6, 6),  -- 11
    ('Ondas de um Sentimento',          'capas/recomeco.jpg',       interval '2 minutes 58 seconds', 'audio/ondas_de_um_sentimento.mp3',          '2025-02-14', 1, 7);  -- 12 (nunca reproduzida)

-- ---------------------------------------------------------------------
-- playlists (6) - a playlist 6 está vazia (RN03 permite)
-- ---------------------------------------------------------------------
insert into playlists (id_user, nome, cover) values
    (1, 'Favoritas da Ana',   'capas/pl_favoritas.jpg'),   -- 1
    (1, 'Treino',             'capas/pl_treino.jpg'),      -- 2
    (2, 'Viagem',             'capas/pl_viagem.jpg'),      -- 3
    (3, 'Relax',              null),                       -- 4 (sem capa)
    (4, 'Festa',              'capas/pl_festa.jpg'),       -- 5
    (5, 'Para Ouvir Depois',  null);                       -- 6 (vazia, sem capa)

-- ---------------------------------------------------------------------
-- musica_artista (6) - participações (feats); o principal nunca se repete aqui
-- ---------------------------------------------------------------------
insert into musica_artista (id_artista_feat, id_musica) values
    (3, 1),    -- Luna Vega em Luzes da Cidade
    (4, 2),    -- DJ Pulsar em Neon Azul
    (3, 7),    -- Luna Vega em Pulso
    (6, 9),    -- Caio Brasa em Onda Forte
    (1, 11),   -- Aurora Boreal em Fogo Lento
    (2, 12);   -- Os Andarilhos em Recomeço

-- ---------------------------------------------------------------------
-- musica_playlist (14) - posições únicas dentro de cada playlist
-- ---------------------------------------------------------------------
insert into musica_playlist (id_playlist, id_musica, data_adicao, posicao) values
    (1, 1,  '2026-09-01 10:15:00', 1),
    (1, 5,  '2026-09-01 10:16:30', 2),
    (1, 12, '2026-09-20 18:40:00', 3),
    (2, 7,  '2026-09-05 07:00:00', 1),
    (2, 8,  '2026-09-05 07:01:00', 2),
    (2, 9,  '2026-10-02 06:50:00', 3),
    (3, 3,  '2026-08-15 14:20:00', 1),
    (3, 4,  '2026-08-15 14:21:00', 2),
    (3, 10, '2026-08-16 09:05:00', 3),
    (4, 6,  '2026-10-10 22:30:00', 1),
    (4, 5,  '2026-10-10 22:31:00', 2),
    (5, 7,  '2026-10-25 20:00:00', 1),
    (5, 11, '2026-10-25 20:02:00', 2),
    (5, 2,  '2026-10-26 21:15:00', 3);

-- ---------------------------------------------------------------------
-- musica_genero (14) - toda música tem ao menos um gênero (RN06)
-- ---------------------------------------------------------------------
insert into musica_genero (id_genero, id_musica) values
    (2, 1),           -- Luzes da Cidade: Pop
    (2, 2), (4, 2),   -- Neon Azul: Pop e Eletrônica
    (1, 3),           -- Pé na Estrada: Rock
    (1, 4),           -- Poeira e Sol: Rock
    (3, 5),           -- Noite de Lua: MPB
    (3, 6), (6, 6),   -- Sereno: MPB e Jazz
    (4, 7),           -- Pulso: Eletrônica
    (4, 8),           -- Sinal Verde: Eletrônica
    (5, 9),           -- Onda Forte: Samba
    (5, 10),          -- Batuque do Porto: Samba
    (1, 11),          -- Fogo Lento: Rock
    (2, 12);          -- Ondas de um Sentimento: Rock

-- ---------------------------------------------------------------------
-- album_genero (7)
-- ---------------------------------------------------------------------
insert into album_genero (id_genero, id_album) values
    (2, 1),   -- Céu de Neon: Pop
    (1, 2),   -- Estrada Aberta: Rock
    (3, 3),   -- Lua Cheia: MPB
    (4, 4),   -- Frequência: Eletrônica
    (5, 5),   -- Maré Alta: Samba
    (1, 6),   -- Brasa Viva: Rock
    (2, 7);   -- Ondas de um Sentimento: Rock

-- ---------------------------------------------------------------------
-- artista_genero (8) - o artista 7 não tem gênero (caso sem vínculo)
-- ---------------------------------------------------------------------
insert into artista_genero (id_genero, id_artista) values
    (2, 1), (4, 1),   -- Aurora Boreal: Pop e Eletrônica
    (1, 2),           -- Os Andarilhos: Rock
    (3, 3), (6, 3),   -- Luna Vega: MPB e Jazz
    (4, 4),           -- DJ Pulsar: Eletrônica
    (5, 5),           -- Trio Maré: Samba
    (1, 6);           -- Caio Brasa: Rock

-- ---------------------------------------------------------------------
-- reproducao (30) - tabela de eventos; todas as datas no passado
-- (o usuário 6 e a música 12 não têm reproduções)
-- ---------------------------------------------------------------------
insert into reproducao (id_user, id_musica, data_hora) values
    (1, 1,  '2026-10-01 08:10:00'),
    (1, 1,  '2026-10-03 19:22:00'),
    (1, 1,  '2026-10-15 21:05:00'),
    (1, 5,  '2026-10-02 08:30:00'),
    (1, 5,  '2026-10-20 22:00:00'),
    (1, 7,  '2026-10-05 06:45:00'),
    (1, 2,  '2026-11-02 12:10:00'),
    (2, 3,  '2026-10-04 15:00:00'),
    (2, 3,  '2026-10-11 15:30:00'),
    (2, 4,  '2026-10-11 15:34:00'),
    (2, 10, '2026-10-18 10:00:00'),
    (2, 1,  '2026-11-05 09:40:00'),
    (2, 9,  '2026-11-06 17:25:00'),
    (3, 6,  '2026-10-07 23:10:00'),
    (3, 6,  '2026-10-08 23:15:00'),
    (3, 5,  '2026-10-08 23:20:00'),
    (3, 1,  '2026-10-21 13:00:00'),
    (3, 11, '2026-11-10 20:45:00'),
    (4, 7,  '2026-10-25 20:05:00'),
    (4, 7,  '2026-10-31 22:40:00'),
    (4, 8,  '2026-10-31 22:47:00'),
    (4, 11, '2026-11-01 01:10:00'),
    (4, 2,  '2026-11-08 19:30:00'),
    (4, 1,  '2026-11-12 18:00:00'),
    (5, 9,  '2026-10-09 11:00:00'),
    (5, 10, '2026-10-09 11:05:00'),
    (5, 4,  '2026-10-22 16:20:00'),
    (5, 1,  '2026-11-03 07:55:00'),
    (5, 7,  '2026-11-14 21:30:00'),
    (5, 6,  '2026-11-18 10:10:00');