create database proyectobdd04;
go

use proyectobdd04;
go
--tabla juego probando git 
create table juego(
	idDesarrolladora int,
	idFranquicia int,
	idJuego int,
	nombre varchar(50),
	precio money,
	idGenero int,
	editores varchar(50),
	lanzamiento date,
	tamanioMB float,
	etiquetas varchar(25),
	tipoSO varchar(25),
	review varchar(50),
	descripcion varchar(100),
	constraint PK_juego primary key (idDesarrolladora,idFranquicia,idJuego)
);	
go

create table genero(
	idGenero int,
	descripcion varchar(25),
	constraint PK_genero primary key (idGenero)
);
go



----- SOY ADMIM



--a
 

 ---aAAAAAAAAAAA

create table usuario(
 NomYAp varchar (60) not null,
 email varchar (60) not null,
 fechNac date,
 usuario varchar (30) not null,
 idUsuario int primary key 
 )

 -- AGREGAR LA CLAVE FORANEA DESP DE AGREGAR LA TABLA LOGRO

 create table LogrosGanados(
 idUsuario int   not null, 
 idLogro int not null,
 descripcion varchar (20) not null
  CONSTRAINT pk_logrosGanados primary key (idUsuario, idLogro)
  
 )

 create table logro (
 idLogro int primary key, 
 descricpcion varchar (10))

  create table Logros_por_Juego(
  idLogro int not null, 
  idJuego int not null,
  CONSTRAINT pk_Logros_por_Juego primary key (idLogro, idJuego))

  --Agregar las FK desp de idDesarrolladora y idFranquicia
  
  
  
  
  -- tabla Juego_en_libreria
create table juego_en_libreria(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	hrsJugadas float,
	constraint PK_juego_en_libreria primary key (idUsuario, idJuego),
);
go

create table juegosDeseados(
	idUsuario int not null,
	idDesarrolladora int not null,
	idFranquicia int not null,
	idJuego int not null,
	constraint PK_juegosDeseados primary key (idUsuario, idJuego),
);
go

create table pais(
	idPais int not null,
	descripcion varchar(25) not null,
	constraint PK_pais primary key (idPais),
);
go

create table provincia(
	idPais int not null,
	idProvincia int not null,
	descripcion varchar(20) not null,
	constraint PK_provincia primary key (idProvincia),
);
go




