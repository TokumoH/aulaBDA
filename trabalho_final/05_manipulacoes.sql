

update genero set nome = 'Euro Beat' where id = 5; -- Update individual

update musicas set cover ='capas/padrao.jpeg' where cover is null;

update musicas set duration + interval '10 seconds' where id_album = 2;

delete from genero where nome = 'Indie';

delete from reproducao where data_hora >= (current_timestamp - interval '2 months');

delete from users where id = 4;

delete from genero where nome = 'Rock';