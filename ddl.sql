 /*
*
* ARQUIVO COM OS INSERT HARDCODE DO PROJETO.
*
*/
-- INSERT TAMANHO
  insert into tamanho values(1, 'PP');
  insert into tamanho values(2, 'P');
  insert into tamanho values(3, 'M');
  insert into tamanho values(4, 'G');
  insert into tamanho values(5, 'GG');
  insert into tamanho values(6, '0-3 meses');
  insert into tamanho values(7, '3-6 meses');
  insert into tamanho values(8, '6-9 meses');
  insert into tamanho values(9, '1-2 anos');
  insert into tamanho values(10, '3-4 anos');
  insert into tamanho values(11, '5-6 anos');
  insert into tamanho values(12, '7-8 anos');
  insert into tamanho values(13, '8-10 anos');
  insert into tamanho values(14, '10-12 anos');
-- INSERT CATEGORIA
  insert into categoria values(1, 'Roupas');
  insert into categoria values(2, 'Acessórios');
  insert into categoria values(3, 'Utilidades');
  insert into categoria values(4, 'Brinquedos');

-- INSERT SUBCATEGORIA
-- ROUPAS
  insert into subcategoria values (1,	'Blusas', 1);
  insert into subcategoria values (2,	'Bodies', 1);
  insert into subcategoria values (3,	'Macacão', 1);
  insert into subcategoria values (4,	'Conjuntos', 1);
  insert into subcategoria values (5,	'Calça', 1);
  insert into subcategoria values (6,	'Fantasia', 1);
  insert into subcategoria values (7,	'Pijamas', 1);
  insert into subcategoria values (8,	'Vestidos', 1);
  insert into subcategoria values (9,	'Saias', 1);
  insert into subcategoria values (10,	'Bermudas', 1);
  insert into subcategoria values (11,	'Shorts', 1);
  insert into subcategoria values (12,	'Blusas de Moletons', 1);
  insert into subcategoria values (13,	'Camisetas', 1);
  insert into subcategoria values (14,	'Casacos e jaquetas', 1);
  insert into subcategoria values (15, 'Biquini', 1);
  insert into subcategoria values (16,	'Maio', 1);
  insert into subcategoria values (17,	'Sunga', 1);
  insert into subcategoria values (18,	'Saída de praia', 1);
  insert into subcategoria values (19,	'Óculos de sol', 1);
  insert into subcategoria values (20,	'Boné', 1);
  insert into subcategoria values (21,	'Chapéu', 1);
  insert into subcategoria values (22,	'Meia', 1);
  insert into subcategoria values (23,	'Luvas', 1);
  insert into subcategoria values (24,	'Touca', 1);
  insert into subcategoria values (25,	'Tênis', 1);
  insert into subcategoria values (26,	'Sapatilha', 1);
  insert into subcategoria values (27,	'Botas e coturnos', 1);
  insert into subcategoria values (28,	'Chinelo', 1);
  insert into subcategoria values (29,	'Mocassins', 1);
  insert into subcategoria values (30,	'Sandália', 1);
-- ACESSORIO
  insert into subcategoria values (31,	'Babás Eletrônicas', 2);
  insert into subcategoria values (32,	'Bebês Conforto', 2);
  insert into subcategoria values (33,	'Berços', 2);
  insert into subcategoria values (34,	'Cadeira para Automóvel', 2);
  insert into subcategoria values (35,	'Carrinhos de Bebê', 2);
  insert into subcategoria values (36,	'Cadeiras de Descanso', 2);
  insert into subcategoria values (37,	'Enxoval', 2);
  insert into subcategoria values (38,	'Camas', 2);
  insert into subcategoria values (39,	'Colchões e Colchonetes', 2);
  insert into subcategoria values (40,	'Cômodas', 2);
  insert into subcategoria values (41,	'Decoração', 2);
  insert into subcategoria values (42,	'Guarda Roupas', 2);
  insert into subcategoria values (43,	'luminárias', 2);
-- UTILIDADES
  insert into subcategoria values (44,	'Banheiras', 3);
  insert into subcategoria values (45,	'Fraldas de pano', 3);
  insert into subcategoria values (46,	'Fraldas não usadas', 3);
  insert into subcategoria values (47,	'Fraldas descartáveis novas', 3);
  insert into subcategoria values (48,	'Babadores', 3);
  insert into subcategoria values (49,	'Bodies e Culotes', 3);
  insert into subcategoria values (50,	'Mamadeiras', 3);
-- BRINQUEDO
  insert into subcategoria values (51,  'Bicicletas', 4);
  insert into subcategoria values (52,	'Bonecos e personagens', 4);
  insert into subcategoria values (53,	'Games e eletrônicos', 4);
  insert into subcategoria values (54,	'Carrinhos', 4);
  insert into subcategoria values (55,	'Piscinas e boias', 4);
  insert into subcategoria values (56,	'Lego', 4);
  insert into subcategoria values (57,	'Jogos', 4);
  insert into subcategoria values (58,	'Pelucia', 4);
  insert into subcategoria values (59,	'Pistas e autoramas', 4);
  insert into subcategoria values (60,	'Quebra cabeça', 4);
  insert into subcategoria values (61,	'Instrumentos musicais', 4);
  insert into subcategoria values (62,	'Patinetes, patins e skates', 4);
  insert into subcategoria values (63,	'Colecionáveis', 4);
  insert into subcategoria values (64,	'Livros',	4);
--
-- INSERT MARCA
  insert into marca values(1, 'NIKE');
  insert into marca values(2, 'ADIDAS');
--
commit;
