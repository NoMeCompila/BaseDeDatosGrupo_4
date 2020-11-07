use proyectobdd04;
go

--genero
--datos validos
insert into genero (idGenero, descripcion) values(1,'Acción')
insert into genero (idGenero, descripcion) values(2,'Aventura')
insert into genero (idGenero, descripcion) values(3,'Carreras')
insert into genero (idGenero, descripcion) values(4,'Casual')
insert into genero (idGenero, descripcion) values(5,'Deportes')
insert into genero (idGenero, descripcion) values(6,'Lucha')

--datos erroneos
insert into genero (idGenero, descripcion) values(5,'Terror')

--desarrolladora
--datos validos
insert into desarrolladora (idDesarrolladora, nombre, juegosLanzados, contacto, seguidores)
values(1,'NetherRealm Studios',4,'NetherRealmStudios@gmail.com',50000)
insert into desarrolladora (idDesarrolladora, nombre, juegosLanzados, contacto, seguidores)
values(2,'2K Boston',2,'2KB@outlook.com',30000)
insert into desarrolladora (idDesarrolladora, nombre, juegosLanzados, contacto, seguidores)
values(3,'Valve',50,'valve.com',3000000)
insert into desarrolladora (idDesarrolladora, nombre, juegosLanzados, contacto, seguidores)
values(4,'GRASSHOPPER MANUFACTURE',10,'GRASSHOPPER.com',25000)
insert into desarrolladora (idDesarrolladora, nombre, juegosLanzados, contacto, seguidores)
values(5,'SEGA',100,'sega.com',100000)
--datos no validos
insert into desarrolladora (idDesarrolladora, nombre, juegosLanzados, contacto, seguidores)
values(6,'SEGA',200,'sega.com',100000)

--franquicia
--datos validos
insert into franquicia(idDesarrolladora,idFrancquicia,descripcion)
values (3,1,'Half-Life series')

insert into franquicia(idDesarrolladora,idFrancquicia,descripcion)
values (5,2,'Sonic saga')

insert into franquicia(idDesarrolladora,idFrancquicia,descripcion)
values(4,3,'Mortal Kombat series')

insert into franquicia(idDesarrolladora,idFrancquicia,descripcion)
values(2,4,'bioshock')

update franquicia
	set descripcion = 'Let It Die series'
	where idFrancquicia = 3

update franquicia
	set descripcion = 'Bioshock Series'
	where idFrancquicia = 4

insert into franquicia(idDesarrolladora,idFrancquicia,descripcion)
values (1,5,'Mortal Kombat series')

--datos erroneos
insert into franquicia(idDesarrolladora,idFrancquicia,descripcion)
values(1,3)

select * from franquicia

--JUEGO
--datos validos
insert into juego (idDesarrolladora, idFranquicia,idJuego, nombre, precio,idGenero,editores,lanzamiento,tamanioMB,etiquetas,tipoSO,review,descripcion)
values(1,5,1,'Mortal Kombat X',224.99,6,'Warner Bros','20150414',36000,'Accion-Multijugador-Pelea','Windows','5 estrellas','violencia o gore frecuentes, contenido general para adultos')



--Pais
insert into pais (idPais, descripcion) values(1, 'Japon')
insert into pais  (idPais, descripcion) values (2, 'USA')
insert into pais  (idPais, descripcion) values (3, 'Argentina')
insert into pais  (idPais, descripcion) values (4, 'Brasil')
insert into pais  (idPais, descripcion) values (5, 'España')


---Datos válidos de provincias
insert into provincia(idPais, idProvincia, descripcion) values (1,1, 'Tokio')
insert into provincia(idPais, idProvincia, descripcion) values (2,1, 'Washington DC')
insert into provincia(idPais, idProvincia, descripcion) values (3,1, 'Buenos Aires')
insert into provincia(idPais, idProvincia, descripcion) values (4,1, 'Brasilia')
insert into provincia(idPais, idProvincia, descripcion) values (5,1, 'Madrid')

--datos erróneos
insert into provincia(idPais, idProvincia, descripcion) values (2,1, 'Washington DC')

--logro
insert into logro(idLogro, descricpcion) values (1, 'First victory') 
insert into logro(idLogro, descricpcion) values (2, '¡10 mil clicks!')
insert into logro(idLogro, descricpcion) values (3, '2 hs seguidas jugando')
insert into logro(idLogro, descricpcion) values (4, 'gana 5 veces seguidas')



--usuario
insert into usuario(NomYAp, email, fechNac, usuario, idUsuario,idProvincia,idPais)
values ('Fernando Caballero','cabafer1@gmail.com','19980124','fer1',1,1,3)

insert into usuario(NomYAp, email, fechNac, usuario, idUsuario,idProvincia,idPais)
values ('Agustina Warenycia','agus22@gmail.com','19990322','Agus1',2,1,1)

insert into usuario(NomYAp, email, fechNac, usuario, idUsuario,idProvincia,idPais)
values ('Jonatan Fernandez','jonif@gmail.com','19980404','JoniF',3,1,5)

insert into usuario(NomYAp, email, fechNac, usuario, idUsuario,idProvincia,idPais)
values ('Nicolas Luckestik','nico@gmail.com','19970101', 'nico1',5,1,2)

insert into usuario(NomYAp, email, fechNac, usuario, idUsuario,idProvincia,idPais)
values ('Tomas Collar','tomasC@gmail.com','19980705','TomasC',4,1,4)

select * from usuario

--LogrosGanados

insert into LogrosGanados(idUsuario,idLogro)
values (3,1)

--Logros_por_Juego
insert into Logros_por_Juego (idLogro,idJuego,idDesarrolladora,idFranquicia)
values(1,1,1,5)

--juego_en_libreria
--valores
insert into juego_en_libreria(idUsuario,idDesarrolladora,idFranquicia,idJuego,hrsJugadas)
values (3,1,5,1,10)

--juegos deseados
insert into juegosDeseados (idUsuario, idDesarrolladora, idFranquicia,idJuego) values  (4, 1, 5, 1)

--Tipos de pagos
insert into TipoPago(idPago, descripcion) values (1,'tarjeta')
insert into TipoPago(idPago, descripcion) values (2,'efectivo')

--ventaCabecera
insert into ventaCabecera(nroFactura,fechaYHora,idUsuario,idPago,total)
values (1,'20190101 00:00:00.000',3,1,224.99)

--ventaDetalle
insert into ventaDetalle(nroFactura,idVenta,idDesarrolladora,idFranquicia,idJuego)
values (1,1,1,5,1)

