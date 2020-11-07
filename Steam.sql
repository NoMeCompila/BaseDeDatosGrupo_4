----------------------------------------------------------------------------------------------------
---------------------------- PROYECTO LABORATORIO Base de Datos I - 2020 ---------------------------
------------------------------- SIMULACION DE BASE DE DATOS DE STEAM -------------------------------
---------------------------------------------- GRUPO 4 ---------------------------------------------
----------------------------------------------------------------------------------------------------

create database Steam; --nombre de la base de datos
go

/*
use Steam;
go
*/

--GENERO: genero del juego (aventura, plataforma, shooter, moba, etc)
create table genero(
	idGenero int not null,
	descripcion varchar(25) not null,
	constraint PK_genero primary key (idGenero)
);
go

--DESARROLLADORA: persona o empresa que desarrolla el juego (valve, blizzard, ubisoft, etc)
create table desarrolladora(
	idDesarrolladora int not null,
	nombre varchar(25) unique,
	juegosLanzados int not null,
	contacto varchar(50) not null, -- edited. varchar50
	seguidores int not null,
	constraint PK_desarrolladora primary key (idDesarrolladora)
);

--FRANQUICIA: franquicias que pueden tener uno o varios juegos
create table franquicia(
	idDesarrolladora int not null,
	idFranquicia int not null unique, -- edited. tiene que ser unico
	descripcion varchar(25) not null,
	constraint PK_franquicia primary key (idDesarrolladora,idFranquicia),
	constraint FK_franquicia_desarrolladora foreign key (idDesarrolladora) references desarrolladora(idDesarrolladora)
);
go

--JUEGO: tabla principal donde se guardan todos los datos del producto juego y se dan a 
--conocer todas sus caracteristicas
create table juego(
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	nombre varchar(50), -- edited. pueden haber juegos con mismo nombre
	precio money not null check(precio >= 0),
	idGenero int not null,
	editores varchar(50) null,
	lanzamiento date, -- edited. la fecha de lanzamiento puede ser en el futuro
	tamanioMB float not null, -- edited. check tamaño??
	etiquetas varchar(50) null, -- edited. varchar50
	tipoSO varchar(25) not null, 
	review varchar(50) not null,
	descripcion varchar(200) not null,
	constraint PK_juego primary key (idDesarrolladora,idFranquicia,idJuego),
	constraint FK_juego_franquicia foreign key (idDesarrolladora,idFranquicia) references franquicia(idDesarrolladora,idFranquicia),
	constraint FK_juego_genero foreign key (idGenero) references genero (idGenero)
);
go
-----------------------------todo lo que se necesita para crear la tabla jeugo----------------------------------






--------------------------------------------todo lo referente a un usuario--------------------------------------------
 --PAIS: tabla que guarda los datos de los paises
 create table pais(
	idPais int not null,
	descripcion varchar(30) not null unique, -- para que el nombre de los paises no se repitan
	constraint PK_pais primary key (idPais)
);
go

 --PROVINCIA: tabla que guarda los datos de las provincias
create table provincia(
	idPais int not null,
	idProvincia int not null,
	descripcion varchar(50) not null,
	constraint PK_provincia primary key (idPais, idProvincia),
	constraint FK_provincia_pais foreign key (idPais) references pais(idPais)
);
go

--USUARIO: tabla que guarda los datos de cada usuario
create table usuario(
	idUsuario int not null,
	usuario varchar (30) not null unique,-- el nombre de usuario debe ser único
	nomYApe varchar (60) not null,
	email varchar (60) not null check(email like '%@%.com'),--para verificar que se esta ingreasando un correo electrónico
	fechNac date check (datediff(year,fechNac,getdate()) >= 16),
	idPais int not null,
	idProvincia int not null,
	constraint PK_usuario primary key (idUsuario),
	constraint FK_usuario_provincia foreign key (idPais, idProvincia) references provincia(idPais, idProvincia)
);
 go

 --LOGRO: tabla que guarda los datos de cada logro que tiene un juego
 create table logro(
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	idLogro int not null,
	descripcion varchar(50) not null unique,
	constraint PK_logro primary key (idDesarrolladora, idFranquicia, idJuego, idLogro),
	constraint FK_logro_juego foreign key (idDesarrolladora, idFranquicia, idJuego) references juego(idDesarrolladora, idFranquicia, idJuego)
);
go

--LOGROS GANADOS: tabal que guarda el progreso de cadda usuario y posee la cantidad de logros que estos consiguen. edited.
 create table logrosGanados(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	idLogro int not null,
	constraint PK_logrosGanados primary key (idUsuario, idDesarrolladora,idFranquicia,idJuego,idLogro),
	constraint FK_logrosGanados_usuario foreign key (idUsuario) references usuario(idUsuario),
	constraint FK_logrosGanados_logro foreign key (idDesarrolladora,idFranquicia,idJuego,idLogro) references logro(idDesarrolladora,idFranquicia,idJuego,idLogro)
 );
 go
  
-- JUEGOS EN LIBRERIA: todos los juegos que un usuario posee en su libreria. edited.
create table juegoEnLibreria(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	hrsJugadas float null, -- puede tener un juego y no haberlo jugado por eso 'null' y luego controla
	constraint PK_juegoEnLibreria primary key (idUsuario,idDesarrolladora,idFranquicia,idJuego),
	constraint FK_juegoEnLibreria_usuario foreign key (idUsuario) references usuario(idUsuario),
	constraint FK_juegoEnLibreria_juego foreign key (idDesarrolladora,idFranquicia,idJuego) references juego(idDesarrolladora,idFranquicia,idJuego)
);
go

--JUEGOS_DESEADOS: muetra una lista donde se almacenan los juegos que un usuario posiblemente compre en un futuro. edited.
create table juegosDeseados(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	constraint PK_juegoDeseado primary key (idUsuario,idDesarrolladora,idFranquicia,idJuego),
	constraint FK_juegoDeseado_usuario foreign key (idUsuario) references usuario(idUsuario),
	constraint FK_juegoDeseado_juego foreign key (idDesarrolladora,idFranquicia,idJuego) references juego(idDesarrolladora,idFranquicia,idJuego)
);
go

-----------------------------------------------------------VENTAS----------------------------------------------------------------
--TIPO DE PAGO: en esta tabla se almacena de que forma se pago el juego (en efectivo, tarjetra de credito, etc)
create table tipoPago(
	idTipoPago int not null,
	descripcion varchar(20) not null,
	constraint PK_tipoPago primary key (idTipoPago)
);
go

--VENTA CABECERA: aspectos generales de una venta. edited.
create table ventaCabecera(
	nroFactura int not null,
	fechaYHora datetime not null check(fechaYHora <= getdate()),
	idUsuario int not null,
	idTipoPago int not null,
	total money not null check (total >= 0), -- puede ser gratis el juego
	constraint PK_ventaCabecera primary key (nroFactura),
	constraint FK_ventaCabecera_usuario foreign key (idUsuario) references usuario(idUsuario),
	constraint FK_ventaCabecera_tipoPago foreign key (idTipoPago) references tipoPago(idTipoPago)
);
go

--VENTA DETALLE
create table ventaDetalle(
	nroFactura int not null,
	idVenta int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	constraint PK_ventaDetalle primary key (nroFactura, idVenta),
	constraint FK_ventaDetalle_factura foreign key (nroFactura) references ventaCabecera(nroFactura),
	constraint FK_ventaDetalle_juego foreign key (idDesarrolladora,idFranquicia,idJuego) references juego(idDesarrolladora,idFranquicia,idJuego)
);
go