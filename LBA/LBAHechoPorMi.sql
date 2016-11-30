CREATE DATABASE LBA
go
USE LBA
go

CREATE TABLE LBA_Paises(
ID char(3)
, Denominacion Varchar(25) NOT NULL
, UE bit NOT NULL
, CONSTRAINT PK_ID PRIMARY KEY (ID)
)

CREATE TABLE LBA_Jugadores(
Licencia char(10)
, Nombre varchar (20) NOT NULL
, Apellidos varchar (30) NOT NULL
, FechaNac date
, Dorsal tinyint NOT NULL
, Posicion char(1)
, Nacionalidad char(3) NOT NULL
, CONSTRAINT PK_Licencia PRIMARY KEY(Licencia)
, CONSTRAINT FK_Nacionalidad FOREIGN KEY (Nacionalidad) REFERENCES LBA_Paises(ID) on delete no action on update cascade
)

CREATE TABLE LBA_Canchas(
ID tinyint IDENTITY (1,1) NOT NULL
, Denominacion varchar (30) NOT NULL
, DIRECCION varchar (30)
, LOCALIDAD varchar (25) NOT NULL
, CONSTRAINT PK_ID PRIMARY KEY (ID)
)

CREATE TABLE LBA_Equipos (
Codigo char (3) NOT NULL
, Nombre varchar(30) NOT NULL
, Fecha_Fundacion date
, Localidad (25) NOT NULL
, ID_Cancha tinyint NOT NULL
, CONSTRAINT PK_Codigo PRIMARY KEY (Codigo)
, CONSTRAINT FK_LBA_Canchas FOREIGN KEY (ID_Cancha) REFERENCES LBA_Canchas(ID) on delete no action on update cascade
)

CREATE TABLE LBA_Partidos(
ID smallint IDENTITY (1,1)
, Fecha_Hora SMALLDATETIME NOT NULL
, Id_Local char (3)
, ID_Visitante char (3)
, CONSTRAINT PK_ID PRIMARY KEY (ID) 
, CONSTRAINT FK_Id_Local FOREIGN KEY (Id_Local) REFERENCES LBA_EQUIPOS(ID)
, CONSTRAINT FK_ID_Visitante FOREIGN KEY (ID_Visitante) REFERENCES LBA_EQUIPOS(ID)
)

CREATE TABLE LBA_Juega(
, Licencia char (10)
, 
, 
, 

)



COMPROBAR SI ESTÁ BIEN SEGÚN ÁLVARO.
