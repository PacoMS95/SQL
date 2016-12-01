CREATE DATABASE Ejemplos
GO
USE Ejemplos
GO

--1.	DatosRestrictivos. Columnas:
--a.	ID Es un SmallInt autonumérico que se rellenará con números impares.. No admite nulos. Clave primaria
--b.	Nombre: Cadena de tamaño 15. No puede empezar por "N” ni por "X” Añade una restiricción UNIQUE. No admite nulos
--c.	Numpelos: Int con valores comprendidos entre 0 y 145.000
--d.	TipoRopa: Carácter con uno de los siguientes valores: "C”, "F”, "E”, "P”, "B”, ”N”
--e.	NumSuerte: TinyInt. Tiene que ser un número divisible por 3.
--f.	Minutos: TinyInt Con valores comprendidos entre 20 y 85 o entre 120 y 185.

-- PARA LA CONSTRAINT DE PRIMARY KEY:

--CREATE TABLE table_name
--( 
--  column1 datatype [ NULL | NOT NULL ],
--  column2 datatype [ NULL | NOT NULL ],
--  ...
--  CONSTRAINT constraint_name PRIMARY KEY (column1, column2, ... column_n)
--);

--RECUERDA: LAS RESTRICCIONES (CONSTRAINTS) SE ESCRIBEN AL FINAL

CREATE TABLE DatosRestrictivos (
ID smallint IDENTITY (1,2) NOT NULL --Con identity no se permiten añadir más datos
, Nombre nvarchar(15)
, Numpelos int
, TipoRopa char(1) 
, NumSuerte tinyint
, Minutos tinyint
, CONSTRAINT PK_ID PRIMARY KEY (ID)
, CONSTRAINT CK_Nombre check (Nombre like '[^NX]%')
, CONSTRAINT CK_Numpelos check (Numpelos like '[0 - 145000]')
, CONSTRAINT CK_TipoRopa check (TipoRopa like '[CFEPBN]')
, CONSTRAINT CK_NumSuerte check (NumSuerte % 3 = 0)
, CONSTRAINT CK_Minutos check (Minutos BETWEEN 20 AND 85 OR Minutos BETWEEN 120 AND 185)
)
GO

--2.	DatosRelacionados. Columnas:

--a.	NombreRelacionado: Cadena de tamaño 15. Define una FK para relacionarla con la columna "Nombre” de la tabla DatosRestrictivos.
--¿Deberíamos poner la misma restricción que en la columna correspondiente?
--¿Qué ocurriría si la ponemos?
--¿Y si no la ponemos?
--b.	PalabraTabu: Cadena de longitud max 20. No admitirá los valores "Barcenas”, "Gurtel”, "Púnica”, "Bankia” ni "sobre”. Tampoco admitirá ninguna palabra terminada en "eo”
--c.	NumRarito: TinyInt menor que 20. No admitirá números primos.
--d.	NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
--¿Puede tener valores menores que 20?

CREATE TABLE DatosRelacionados (
NombreRelacionado smallint 
, PalabraTabu nvarchar(20)
, NumRarito tinyint
, NumMasGrande smallint
, CONSTRAINT fk_NombreRelacionado FOREIGN KEY (NombreRelacionado) REFERENCES DatosRestrictivos (ID) -- Foreign key va siempre con Primary Key y tienen que ser del mismo tipo
, CONSTRAINT CK_PalabraTabu check (PalabraTabu like '[^Barcenas]' and PalabraTabu like '[^Gurtel]' and PalabraTabu like '[^Púnica]'and PalabraTabu like '[^Bankia]' and PalabraTabu like '[^sobre]' and PalabraTabu like '[%eo]')
, CONSTRAINT CK_NumRarito check (NumRarito < 20 and NumRarito not like '2' and NumRarito not like '3' and NumRarito not like '5' and NumRarito not like '7' and NumRarito not like '11'  and NumRarito not like '13'  and NumRarito not like '17'  and NumRarito not like '19')
, CONSTRAINT CK_NumMasgrande check (NumMasgrande like '[NumRarito - 1000]')
, CONSTRAINT PK_NumMasgrande PRIMARY KEY (NumMasgrande)
)
GO

--3.	DatosAlMogollon. Columnas:
--a.	ID. SmallInt. No admitirá múltiplos de 5. Definirlo como PK
--b.	LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
--c.	OtroNumero. Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
--d.	NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
--e.	Etiqueta. Cadena de 3 caracteres. No puede tener los valores "pao”, "peo”, "pio” ni "puo”

CREATE TABLE DatosAlMogollon (
ID Smallint
, LimiteSuperior smallint
, OtroNumero smallint
, NumeroQueVinoDelMasAlla smallint
, Etiqueta nchar (3)
, CONSTRAINT fk_ID PRIMARY KEY (ID)
, CONSTRAINT CK_ID check (ID % 5 = 0) 
, CONSTRAINT UC_LimiteSuperior unique (LimiteSuperior)
, CONSTRAINT CK_LimiteSuperior check (LimiteSuperior like '[1500-2000]')
, CONSTRAINT CK_OtroNumero check (OtroNumero > ID and OtroNumero < LimiteSuperior)
, CONSTRAINT UC_OtroNumero unique (OtroNumero)
, CONSTRAINT FK_NumeroQueVinoDelMasAlla FOREIGN KEY (NumeroQueVinoDelMasAlla) REFERENCES DatosRelacionados (NumMasGrande)
, CONSTRAINT CK_Etiqueta check (etiqueta like '[^pao]' and etiqueta like '[^peo]' and etiqueta like '[^pio]' and etiqueta like '[^puo]')
) 
GO