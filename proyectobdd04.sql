--MIO

create database proyectobdd04;--nombre de la base de datos
go

use proyectobdd04;
go

--GENERO: genero del juego aventura, plataforma, shooter, moba, etc
create table genero(
	idGenero int not null,
	descripcion varchar(25) not null,
	constraint PK_genero primary key (idGenero)
);
go

--DESARROLLADORA: persona o empresa que desarrolla el juego por ejemplo blizzard, riot, ubisoft. etc
create table desarrolladora(
	idDesarrolladora int not null,
	nombre varchar(25) unique,
	juegosLanzados int not null,
	contacto varchar(250) not null,
	seguidores int not null,
	constraint PK_desarrolladora primary key (idDesarrolladora)
);

--FRANQUICIA: tabla para guardar las distintas franquicias que pueden tener uno o varios juegos 
create table franquicia(
	idDesarrolladora int not null,
	idFrancquicia int not null,
	descripcion varchar(25) not null,
	constraint PK_franquicia primary key (idDesarrolladora,idFrancquicia),
	constraint FK_desarrolladora foreign key (idDesarrolladora) references desarrolladora(idDesarrolladora)
);
go

--JUEGO: tabla principal donde se guardan todos los datos del producto juego y se dan a 
--conocer todas sus caracteristicas
create table juego(
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	nombre varchar(50) unique,--el nombre del juego debe ser unico
	precio money not null,
	idGenero int not null,
	editores varchar(50) null,
	lanzamiento date check (lanzamiento <= getdate()),--la fecha de lanzamiento debe ser gual o menor a la fecha actual
	tamanioMB float check (tamanioMB between 10 and 100.000),--tamaño minimo del jeugo debe ser de 10 mb y el maximo de 100.000 mb
	etiquetas varchar(25) null ,
	tipoSO varchar(25) check (tipoSO in ('Windows', 'MacOS','Android','IOs')),--verifica que los SO ingresados sean correctos
	review varchar(50) not null,
	descripcion varchar(100) not null,
	constraint PK_juego primary key (idDesarrolladora,idFranquicia,idJuego),
	constraint FK_genero foreign key (idGenero) references genero (idGenero),
	constraint FK_desarrolladora_franquicia foreign key (idDesarrolladora,idFranquicia) references franquicia(idDesarrolladora,idFrancquicia)
);
go
-----------------------------todo lo que se necesita para crear la tabla jeugo----------------------------------






--------------------------------------------todo lo referente a un usuario--------------------------------------------
 --PAIS: tabla que guarda los datos de los paises
 create table pais(
	idPais int not null,
	descripcion varchar(25) not null unique,--para que el nombre de los paises no se repitan
	constraint PK_pais primary key (idPais),
);
go

 --PROVINCIA: tabla que guarda los datos de las provincias
create table provincia(
	idPais int not null,
	idProvincia int not null,
	descripcion varchar(20) not null,
	constraint PK_provincia primary key (idProvincia),

	constraint FK_pais foreign key (idPais) references pais (idPais)
);
go

alter table provincia
	drop constraint PK_provincia

alter table provincia
	add constraint PK_pais_provincia primary key (idPais,idProvincia)

--LOGRO: tabla que guarda los datos de cada logro	
 create table logro (
 idLogro int primary key, 
 descricpcion varchar (10) unique)--para que los logros sean unicos y no se repitan
go

--USUARIO: tabla que guarda los datos de cada usuario
create table usuario(
 NomYAp varchar (60) not null,
 email varchar (60) not null check(email like '%@%.com'),--para verificar que se esta ingreasando un correo electrónico
 fechNac date,
 usuario varchar (30) not null unique,--el  nombre de usuario debe ser único
 idUsuario int primary key
 )
 go

--LOGROSGANADOS: tabal que guarda el progreso de cadda usuario y posee la cantidad de logros que estos consiguen
 create table LogrosGanados(
 idUsuario int   not null, 
 idLogro int not null,
 descripcion varchar (20) not null-- (1) VERIFCAR CREO QUE ESTA DE MAS
 CONSTRAINT pk_logrosGanados primary key (idUsuario, idLogro)

 constraint FK_logro foreign key (idLogro) references logro(idLogro),
 constraint FK_usuario foreign key (idUsuario) references usuario(idUsuario)

 );
 go

-----------------------------------Alteraciones a las tablas para unirlas por claves foraneas--------------------
alter table usuario																								--
	add idProvincia int not null;																				--
go																												--
																												--
alter table usuario																								--
	add idPais int not null;																					--
go																												--
																												--
alter table usuario																								--
	add constraint FK_pais_provincia foreign key (idPais,idProvincia) references provincia (idPais,idProvincia);--
go																												--
------------------------------------------------------------------------------------------------------------------

--------------------------Logros y lista de juegos adquiridos y deseados de un usuario------------------------------
--LOGROS_POR_JUEGO: esta tabla sirve para saber todos los losgros que posee cada juego y guardar esa informacion
create table Logros_por_Juego(
	idLogro int not null, 
	idJuego int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,


	CONSTRAINT pk_Logros_por_Juego primary key (idLogro, idJuego),
	constraint fk_juego_desarrolladora_franquicia 
		foreign key (idDesarrolladora,idFranquicia,idJuego)
		references juego(idDesarrolladora,idFranquicia,idJuego),
	constraint FK_logro_por_juego foreign key (idLogro) references logro(idLogro) 
 );
go
  
-- tabla Juego_en_libreria: almacena todos los juegos que un usuario posee en su libreria
create table juego_en_libreria(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	hrsJugadas float null,--puede tener un juego y no haberlo jugado por eso 'null' y luego controla
	constraint PK_juego_en_libreria primary key (idUsuario, idJuego),
	constraint fk_juego_desarrolladora_franquiciaL 
		foreign key (idDesarrolladora,idFranquicia,idJuego)
		references juego(idDesarrolladora,idFranquicia,idJuego),
	constraint FK_usuario_libreria foreign key (idUsuario) references usuario(idUsuario)
);
go

--JUEGOS_DESEADOS: muetra una lista donde se almacenan los juegos que un usuario posiblemente compre en un futuro
create table juegosDeseados(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	constraint PK_juegosDeseados primary key (idUsuario, idJuego),
	constraint fk_juego_desarrolladora_franquiciaD 
		foreign key (idDesarrolladora,idFranquicia,idJuego)
		references juego(idDesarrolladora,idFranquicia,idJuego),
	constraint FK_usuario_deseos foreign key (idUsuario) references usuario(idUsuario)
);
go

-----------------------------------------------------------VENTAS----------------------------------------------------------------
--TIPOPAGO: en esta tabla se almacena de que forma se pago el juego por ej. en efectivo, tarjetra de credito, etc
create table TipoPago(
	idPago int primary key,
	descripcion varchar(20) not null unique --para que no se repitan los tipos de pago
);
go

--VENTACABECERA: aspectos generales de una venta
create table ventaCabecera(
	nroFactura int not null,
	fechaYHora datetime not null,
	idUsuario int not null,
	idPago int not null,
	total money null,-- (2) REVISAR: pueden haber juegos gratis por eso le cambie a null
	constraint PK_ventaCabecera primary key(nroFactura),
	constraint FK_tipo_pago foreign key (idPago) references TipoPago(idPago)	
);
go



--VENTADETALLE
create table ventaDetalle(
	nroFactura int not null,
	idVenta int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	constraint PK_ventaDetalle primary key(idVenta),
	constraint fk_juego_desarrolladora_franquiciaDetalle 
		foreign key (idDesarrolladora,idFranquicia,idJuego)
		references juego(idDesarrolladora,idFranquicia,idJuego),
	constraint fk_factura foreign key (nroFactura) references ventaCabecera (nroFactura)
);
go


alter table ventaCabecera
	add constraint FK_usuarioC foreign key (idUsuario) references usuario (idUsuario);
go

alter table usuario
	add constraint CHK_edad check ((year(getdate()-year(fechNac))  >= 16))
