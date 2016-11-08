CREATE DATABASE [Bienal de flamenco]
GO
USE [Bienal de Flamenco]
GO

CREATE TABLE Empresa (
CIF char(9) NOT NULL PRIMARY KEY
, nombre NVARCHAR (30) NOT NULL
, direccion NVARCHAR (60) NOT NULL
)

CREATE TABLE Trabajador (
datosPersonales NVARCHAR (140) NOT NULL PRIMARY KEY
, trabajo NVARCHAR (30) NOT NULL
, datosPerfil NVARCHAR (60)
, CIF char (9)
, FOREIGN KEY (CIF) REFERENCES Empresa(CIF)
)


CREATE TABLE Espectaculo (
nombreFechaHoraEspectaculo NVARCHAR (140) NOT NULL PRIMARY KEY
)

CREATE TABLE Espacio (
nombre NVARCHAR (30) NOT NULL PRIMARY KEY
, direccion NVARCHAR (50) NOT NULL
, tipo NVARCHAR (20) NOT NULL
, aforo SMALLINT NOT NULL
)

CREATE TABLE EntradaOLocalidad (
espectaculoRecintoDiaHora NVARCHAR (140) NOT NULL PRIMARY KEY
, nombreFechaHoraEspectaculo NVARCHAR (140) NOT NULL
, FOREIGN KEY (nombreFechaHoraEspectaculo) REFERENCES Espectaculo(nombreFechaHoraEspectaculo)
)

CREATE TABLE Zona (
IDZona SMALLINT NOT NULL PRIMARY KEY
, espectaculoRecintoDiaHora NVARCHAR (140) NOT NULL
, FOREIGN KEY (espectaculoRecintoDiaHora) REFERENCES EntradaOLocalidad(espectaculoRecintoDiaHora)
)

-- POR QUÉ DIATRES HABIENDO DEFINIDO COMO PRIMARY KEY EN ENTRADAOLOCALIDAD LA CLAVE ESPECTÁCULORECINTODIAHORA NO ME LA RECONOCE (EJECUTAR
-- INMEDIATAMENTE ARRIBA PARA VER EL ERROR 1776)
-- RESPUESTA: se ejecuta pasito a pasito y tienes que ponerlas en orden

CREATE TABLE Fila (
IDFila SMALLINT NOT NULL PRIMARY KEY
, IDZona SMALLINT NOT NULL
, FOREIGN KEY (IDZona) REFERENCES Zona (IDZona)
)

CREATE TABLE Responsable (
DNIResponsable VARCHAR(9) NOT NULL PRIMARY KEY
, tareaAsignada NVARCHAR (140) NOT NULL
)

CREATE TABLE Artista (
DNIArtista VARCHAR(9) NOT NULL PRIMARY KEY
, trabajo NVARCHAR (50)
)

CREATE TABLE Representante (
DNIRepresentante VARCHAR(9) NOT NULL PRIMARY KEY
, otrosDatos NVARCHAR (140)
)

-- Cómo se hace para poner una columna que sea PK y FK a la vez?
CREATE TABLE Trabajador_espectaculo(
datosPersonalesNombreFechaHoraEspectaculo 
)

CREATE TABLE Espectaculo_espacio (

)

CREATE TABLE Espectáculo_responsable(

)