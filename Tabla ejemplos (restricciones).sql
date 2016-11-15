CREATE TABLE Ejemplos
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


--CREATE TABLE table_name
--( 
--  column1 datatype [ NULL | NOT NULL ],
--  column2 datatype [ NULL | NOT NULL ],
--  ...
--  CONSTRAINT constraint_name PRIMARY KEY (column1, column2, ... column_n)
--);

--RECUERDA: LAS RESTRICCIONES (CONSTRAINTS) SE ESCRIBEN AL FINAL

CREATE TABLE DatosRestrictivos (
ID smallint IDENTITY (1,2) NOT NULL
, Nombre nvarchar(15)
, Numpelos int
, TipoRopa char(1) 
, NumSuerte tinyint
, CONSTRAINT PK_ID PRIMARY KEY (ID)
, CONSTRAINT CK_Nombre check (Nombre like '[^NX]%')
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



GO

--3.	DatosAlMogollon. Columnas:
--a.	ID. SmallInt. No admitirá múltiplos de 5. Definirlo como PK
--b.	LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
--c.	OtroNumero. Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
--d.	NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
--e.	Etiqueta. Cadena de 3 caracteres. No puede tener los valores "pao”, "peo”, "pio” ni "puo”


GO