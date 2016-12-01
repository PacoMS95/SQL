CREATE DATABASE LBA
go
USE LBA
go

--use master
--go
--drop database LBA

CREATE TABLE LBA_Paises(
ID char(3)
, Denominacion Varchar(25) NOT NULL
, UE bit NOT NULL
, CONSTRAINT PK_ID PRIMARY KEY (ID)
)
go

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
go


CREATE TABLE LBA_Canchas(
ID tinyint IDENTITY (1,1) NOT NULL
, Denominacion varchar (30) NOT NULL
, DIRECCION varchar (30)
, LOCALIDAD varchar (25) NOT NULL
, CONSTRAINT PK_ID PRIMARY KEY (ID)
)
go

CREATE TABLE LBA_Equipos (
Codigo char (3) NOT NULL
, Nombre varchar(30) NOT NULL
, Fecha_Fundacion date
, Localidad varchar (25) NOT NULL
, ID_Cancha tinyint NOT NULL
, CONSTRAINT PK_Codigo PRIMARY KEY (Codigo)
, CONSTRAINT FK_LBA_Canchas FOREIGN KEY (ID_Cancha) REFERENCES LBA_Canchas(ID) on delete no action on update cascade
)
go

CREATE TABLE LBA_Partidos(
ID smallint IDENTITY (1,1)
, Fecha_Hora SMALLDATETIME NOT NULL
, Id_Local char (3)
, ID_Visitante char (3)
, CONSTRAINT PK_ID PRIMARY KEY (ID) 
, CONSTRAINT FK_Id_Local FOREIGN KEY (Id_Local) REFERENCES LBA_EQUIPOS(Codigo)
, CONSTRAINT FK_ID_Visitante FOREIGN KEY (ID_Visitante) REFERENCES LBA_EQUIPOS(Codigo)
)
go

CREATE TABLE LBA_Juega(
 Licencia char (10)
, ID_Partido smallint 
, Minutos Int
, Tiros1 tinyint
, Tiros2 tinyint
, Tiros3 tinyint
, Puntos1 tinyint
, Puntos2 tinyint
, Puntos3 tinyint
, Personales tinyint
, CONSTRAINT PK_Licencia PRIMARY KEY (Licencia, ID_Partido)
, CONSTRAINT FK_Licencia FOREIGN KEY (Licencia) references LBA_Jugadores(Licencia)
, CONSTRAINT FK_ID_Partido FOREIGN KEY (ID_Partido) references LBA_Partidos(ID)
)
go

--Restricciones: 

--1. La edad de un jugador no puede ser inferior a quince años ni superior a cincuenta. 
	
--ALTER TABLE LBA_Jugadores ADD CONSTRAINT CK_Edad_Jugador check ((CURRENT_TIMESTAMP - FechaNac) >  15 and (CURRENT_TIMESTAMP - FechaNac) <  50)
-- La dejo en comentario porque CURRENT_TIMESTAMP está en smalldatetime y FechaNac está en date. Hay que hacer casteo

ALTER TABLE LBA_Jugadores ADD CONSTRAINT CK_Edad_Jugador check (YEAR())

--2. Crea una restricción en la tabla LBA_Jugadores para asegurarte que el dorsal está comprendido entre 0 y 99 y otra para asegurarte que el valor de la posición es válido. Los valores válidos son B, A, P, E y L. 



--3. La fecha de fundación del equipo ha de ser anterior a la actual. 



--4. Crea una restricción en la tabla LBA_Juega para asegurar que el número de minutos, si no es nulo, es positivo y menor que 40 



--5. Crea una restricción en la tabla LBA_Juega para asegurar que el número de tiros de un jugador es menor o igual que los aciertos que les corresponden. Recuerda que las columnas Puntos1, 2 y 3 contiene el número de puntos, y para hallar los aciertos hay que dividir por su valor. 



--6. Las columnas Puntos_Local y Puntos_Visitante de la tabla LBA_Partidos deben estar a NULL hasta que se celebre el partido.