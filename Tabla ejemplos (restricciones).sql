CREATE TABLE Ejemplos
GO
USE Ejemplos
GO

--1.	DatosRestrictivos. Columnas:
--a.	ID Es un SmallInt autonum�rico que se rellenar� con n�meros impares.. No admite nulos. Clave primaria
--b.	Nombre: Cadena de tama�o 15. No puede empezar por "N� ni por "X� A�ade una restiricci�n UNIQUE. No admite nulos
--c.	Numpelos: Int con valores comprendidos entre 0 y 145.000
--d.	TipoRopa: Car�cter con uno de los siguientes valores: "C�, "F�, "E�, "P�, "B�, �N�
--e.	NumSuerte: TinyInt. Tiene que ser un n�mero divisible por 3.
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
--a.	NombreRelacionado: Cadena de tama�o 15. Define una FK para relacionarla con la columna "Nombre� de la tabla DatosRestrictivos.
--�Deber�amos poner la misma restricci�n que en la columna correspondiente?
--�Qu� ocurrir�a si la ponemos?
--�Y si no la ponemos?
--b.	PalabraTabu: Cadena de longitud max 20. No admitir� los valores "Barcenas�, "Gurtel�, "P�nica�, "Bankia� ni "sobre�. Tampoco admitir� ninguna palabra terminada en "eo�
--c.	NumRarito: TinyInt menor que 20. No admitir� n�meros primos.
--d.	NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
--�Puede tener valores menores que 20?



GO

--3.	DatosAlMogollon. Columnas:
--a.	ID. SmallInt. No admitir� m�ltiplos de 5. Definirlo como PK
--b.	LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
--c.	OtroNumero. Ser� mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
--d.	NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
--e.	Etiqueta. Cadena de 3 caracteres. No puede tener los valores "pao�, "peo�, "pio� ni "puo�


GO