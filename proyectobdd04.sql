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

