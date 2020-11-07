-- Lote de datos de la tabla Juego--

insert into juego(idDesarrolladora,idFranquicia,idJuego, nombre,precio,
					idGenero,editores,lanzamiento,tamanioMB,etiquetas,tipoSO,review,descripcion)
values
(1,1,1,'Mortal Kombat X',224.99,5,'Warner Bros','2015-04-14',36000,'Accion, Sangriento, Multijugador','Windows','Muy positivas','Reúne un aspecto cinematográfico y una mecánica de juego nunca vistos.'),
(1,1,2,'Mortal Kombat 11',1199.99,5,'Warner Bros','2019-04-23',21000,'Accion, Sangriento, Multijugador','Windows','Muy positivas','Mortal Kombat ha regresado mejor que nunca en esta entrega de la icónica saga.'),
(3,2,3,'Half-Life',129.99,1,'Valve','1998-11-08',400,'FPS, Disparos, Clasico','Windows, MacOS, Linux','Extremadamente positivas','Mezcla acción y aventuras con tecnología avanzada en un mundo terriblemente realista en el que los jugadores deberán esforzarse por sobrevivir.'),
(3,2,4,'Half-Life 2',129.99,1,'Valve','2004-11-16',6500,'FPS, Clasico, Disparos','Windows, MacOS','Extremadamente positivas','Continuación de Half-Life 1'),
(3,3,5,'Counter-Strike',129.99,1,'Valve','2000-11-01',500,'FPS, Multijugador, Disparos','Windows, MacOS, Linux','Extremadamente positivas',' Videojuego de disparos en primera persona simula guerra antiterrorista más realista como juego por equipos.'),
(3,3,6,'Counter-Strike Global Offensive',0,1,'Valve','2012-08-21',15000,'FPS, Multijugador, Disparos','Windows, MacOS, Linux','Muy positivas','Ampliará la jugabilidad de acción por equipos que fue pionera en su primer lanzamiento, con nuevos mapas y armas.'),
(2,4,7,'BioShock',359.99,1,'2K','2007-08-21',8000,'FPS, Ciencia Ficcion, Terror','Windows','Muy positivas','BioShock es un shooter distinto a todos los que has jugado antes, lleno de armas y tácticas nunca vistas.'),
(2,8,8,'NBA 2k20',2699.00,4,'2K','2019-09-05',80000,'Baloncesto, Simuladores, Multijugador','Windows','Variadas','El juego anual de baloncesto regresa con NBA 2K20, con los mejores gráficos, las mecánicas más realistas, modos de juego innovadores y un control y personalización del jugador sin igual.'),
(4,5,9,'LET IT DIE',0,1,'GungHo','2018-09-26',40000,'Gratis, Sangriento, Multijugador','Windows','Mayormente positivas','Juego de acción y supervivencia que enfrenta a fuertes contra débiles en una velocidad de FPS fluida como el agua y ultra alta definición.'),
(5,6,10,'Sonic The Hedgehog',67.99,2,'SEGA','2010-10-26',50,'Clasico, Un jugador, Plataforma','Windows, MacOs, Linux','Positivas','Supera determinados niveles y obstáculos en escenarios 2-D, cada uno con una ambientación diferente.'),
(5,6,11,'Sonic Mania',279.99,2,'SEGA','2017-08-29',400,'Clasico, Plataforma, 2D','Windows','Muy positivas','Es una nueva aventura de Sonic, Tails y Knuckles con Jefes finales únicos, gloriosos escenarios en 2D y el clásico modo de juego de la saga.'),
(5,6,12,'Team Sonic Racing',1450.99,3,'SEGA','2019-05-21',32000,'Multijugador, Plataforma, Cooperativo','Windows','Mayormente positivas','Combina lo mejor de los juegos para recreativas y los juegos de carreras competitivos y te permite enfrentarte a tus amigos en espectaculares carreras multijugador con tematica de Sonic Saga.'),
(5,7,13,'Yakuza',279.99,1,'SEGA','2018-08-01',10000,'Mundo abierto, Un jugador, Crimen','Windows','Muy positivas','La legendaria serie japonesa de SEGA por fin en PC. Lucha a lo bestia en Tokio y Osaka en el papel de los jóvenes yakuza Kiryu y Majima.'),
(5,7,14,'Yakuza Kiwami 2',899.99,1,'SEGA','2019-05-09',42000,'Aventura, Mundo abierto, Un jugador','Windows','Extremadamente positivas','Kazuma Kiryu, el Dragón de Dojima, debe enfrentarse a Ryuji Goda, el Dragón de Kansai, en una guerra entre dos clanes rivales, ahora en 4K y con FPS desbloqueados.');

select * from juego;