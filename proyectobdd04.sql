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

create table ventaDetalle(
	--nroFactura int not null,
	idVenta int not null,
	--idDesarrolladora int not null,
	--idFranquicia int not null,
	--idJuego int not null,
	constraint PK_ventaDetalle primary key(idVenta)
	--Agregar despues las efe kas

);
go

create table ventaCabecera(
	nroFactura int not null,
	fechaYHora datetime not null,
	--idUsuario int not null,
	--idPago int not null,
	total money not null,
	constraint PK_ventaCabecera primary key(nroFactura)
	--Agregar despues las efe kas
);
go

create table TipoPago(
	idPago int primary key,
	descripcion varchar(20) not null,
);
go

