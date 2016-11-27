CREATE DATABASE [Bienal de flamenco V2.0]
go
USE [Bienal de flamenco V2.0]
go

CREATE TABLE Empresa (
CIF char(9)
, nombre NVARCHAR (30)
, direccion NVARCHAR (60) not null
, CONSTRAINT PK_Empresa PRIMARY KEY (nombre)
)

create table Trabajador (
datosPersonales NVARCHAR (140)
, trabajo NVARCHAR (50) NOT NULL
, datosPerfil NVARCHAR (60)
, CIF char(9)
, CONSTRAINT FK_CIF FOREIGN KEY (CIF) REFERENCES Empresa(CIF)
, CONSTRAINT PK_DatosPersonales PRIMARY KEY (datosPersonales)
)

CREATE TABLE Espectaculo (
CONSTRAINT nombreFechaHoraEspectaculo NVARCHAR (140) NOT NULL PRIMARY KEY
)

CREATE TABLE Espacio (
nombre NVARCHAR (30) NOT NULL PRIMARY KEY
, direccion NVARCHAR (50) NOT NULL
, tipo NVARCHAR (20) NOT NULL
, aforo SMALLINT NOT NULL
)

CREATE TABLE EntradaOLocalidad (
espectaculoRecintoDiaHora NVARCHAR (140) PRIMARY KEY
, nombreFechaHoraEspectaculo NVARCHAR (140) NOT NULL
, FOREIGN KEY (nombreFechaHoraEspectaculo) REFERENCES Espectaculo (nombreFechaHoraEspectaculo)
)

CREATE TABLE Zona (
IDZona SMALLINT PRIMARY KEY
, espectaculoRecintoDiaHora NVARCHAR (140) NOT NULL
, FOREIGN KEY (espectaculoRecintoDiaHora) REFERENCES EntradaOLocalidad(espectaculoRecintoDiaHora)
)

CREATE TABLE Fila (
IDFila SMALLINT PRIMARY KEY
, IDZona SMALLINT NOT NULL
,CONSTRAINT FK_IDZona FOREIGN KEY (IDZona) REFERENCES Zona (IDZona) on delete no action on update cascade
)

CREATE TABLE Responsable (
DNIResponsable VARCHAR(9) PRIMARY KEY
, tareaAsignada NVARCHAR (140) NOT NULL
)

CREATE TABLE Artista (
DNIArtista VARCHAR(9) PRIMARY KEY
, trabajo NVARCHAR (50)
)

CREATE TABLE Representante (
DNIRepresentante VARCHAR(9) PRIMARY KEY
, otrosDatos NVARCHAR (140)
)

CREATE TABLE Trabajador_espectaculo (
datosPersonalesNombreFechaHoraEspectaculo
)