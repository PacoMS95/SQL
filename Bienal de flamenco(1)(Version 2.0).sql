-- Creamos y usamos la tabla
CREATE DATABASE [Bienal de flamenco V2.0]
GO
USE [Bienal de flamenco V2.0]
GO

-- EMPRESA --
CREATE TABLE Empresa (
CIF char(9)
, nombre NVARCHAR (30)
, direccion NVARCHAR (60) not null
, CONSTRAINT PK_Empresa PRIMARY KEY (nombre)
)

GO
-- TRABAJADOR --
create table Trabajador (
datosPersonales NVARCHAR (140)
, trabajo NVARCHAR (50) NOT NULL
, datosPerfil NVARCHAR (60)
, CIF char(9)
, CONSTRAINT FK_CIF FOREIGN KEY (CIF) REFERENCES Empresa(CIF)
, CONSTRAINT PK_DatosPersonales PRIMARY KEY (datosPersonales)
)

GO
-- ESPECTÁCULO --
CREATE TABLE Espectaculo (
nombreFechaHoraEspectaculo NVARCHAR (140)
, CONSTRAINT PK_nombreFechaHoraEspectaculo PRIMARY KEY (nombreFechaHoraEspectaculo)
)

GO
-- ESPACIO --
CREATE TABLE Espacio (
nombre NVARCHAR (30)
, direccion NVARCHAR (50) NOT NULL
, tipo NVARCHAR (20) NOT NULL
, aforo SMALLINT NOT NULL
, CONSTRAINT PK_nombre PRIMARY KEY (nombre)
)

GO
-- EntradaOLocalidad --
CREATE TABLE EntradaOLocalidad (
espectaculoRecintoDiaHora NVARCHAR (140)
, nombreFechaHoraEspectaculo NVARCHAR (140) NOT NULL
, CONSTRAINT FK_nombreFechaHoraEspectaculo FOREIGN KEY (nombreFechaHoraEspectaculo) REFERENCES Espectaculo (nombreFechaHoraEspectaculo)
, CONSTRAINT PK_espectaculoRecintoDiaHora PRIMARY KEY (espectaculoRecintoDiaHora)
)

GO
-- Zona --
CREATE TABLE Zona (
IDZona SMALLINT
, espectaculoRecintoDiaHora NVARCHAR (140) NOT NULL
, CONSTRAINT FK_espectaculoRecintoDiaHora FOREIGN KEY (espectaculoRecintoDiaHora) REFERENCES EntradaOLocalidad(espectaculoRecintoDiaHora)
, CONSTRAINT PK_IDZona PRIMARY KEY (IDZona)
)

GO
-- Fila --
CREATE TABLE Fila (
IDFila SMALLINT PRIMARY KEY
, IDZona SMALLINT NOT NULL
,CONSTRAINT FK_IDZona FOREIGN KEY (IDZona) REFERENCES Zona (IDZona) on delete no action on update cascade
)

GO
-- Responsable -- 
CREATE TABLE Responsable (
DNIResponsable VARCHAR(9)
, tareaAsignada NVARCHAR (140) NOT NULL
, 
)

GO
-- Artista --
CREATE TABLE Artista (
DNIArtista VARCHAR(9) PRIMARY KEY
, trabajo NVARCHAR (50)
)

GO
-- Representante --
CREATE TABLE Representante (
DNIRepresentante VARCHAR(9) PRIMARY KEY
, otrosDatos NVARCHAR (140)
)

GO
-- Trabajador_espectaculo
CREATE TABLE Trabajador_espectaculo (
datosPersonalesNombreFechaHoraEspectaculo
)

GO
-- Espectaculo_espacio --
CREATE TABLE Espectaculo_espacio

GO
-- Representante_artista --
CREATE TABLE Representante_artista

GO
-- Numerada --
CREATE TABLE Numerada

GO
-- NoNumerada --
CREATE TABLE NoNumerada

GO