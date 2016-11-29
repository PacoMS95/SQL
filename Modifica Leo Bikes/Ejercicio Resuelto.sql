-- EL SCRIPT DE CREACI�N DE LEOBIKES EST� EN EL USB --

USE LeoBikes
go

--Modifica las tablas necesarias para incluir las siguientes restricciones. Hazlo con Alter Table, no volviendo a crearlas. 

--a) Crea una nueva tabla LB_Avisos, para registrar los productos que est�n por debajo de su stock m�nimo.
--Los datos a guardar ser�n el ID del producto, la fecha en que se cre� el aviso, el stock m�nimo y el stock actual. 

create table LB_avisos (
IDProducto char (9)
,fechaAviso date
,stockMinimo smallint
,stockActual smallint
, CONSTRAINT PK_IDProducto 
)

--b) Sobre la tabla LB_Productos a�ade un valor por defecto a las columnas Stock_Actual (0) y Stock_Minimo (0).

--LA SINTAXIS DE MODIFICACI�N NO ES LA QUE VIENE EN W3S.

ALTER TABLE LB_Productos add constraint DF_Stock_Actual default 0 for Stock_Actual
go
ALTER TABLE LB_Productos add constraint DF_Stock_Minimo default 0 for Stock_Minimo
go

--c) A�ade un valor por defecto a la columna SaldoPuntos de la tabla LB_Clientes con valor 0.


--Esta es parecida a la del ejercicio anterior
ALTER TABLE LB_Clientes add constraint DF_SaldoPuntos default 0 for SaldoPuntos
go

-- A��dele tambi�n una restricci�n para que su valor no pueda ser inferior a cero. 

--Esta s� es como viene en W3S
ALTER TABLE LB_Clientes add constraint CK_SaldoPuntos check (SaldoPuntos > 0)
go

--d. En la tabla LB_Avisos, a�ade un valor por defecto a la columna Fecha_Crea
--que sea la fecha actual. 

ALTER TABLE LB_Avisos add constraint DF_Fecha_Crea default current_timestamp for Fecha_Crea

--A�ade una columna Fecha_Actualiza del mismo
--tipo que Fecha_Crea, pero que s� admita valores nulos. Esta nueva columna
--tendr� el mismo valor por defecto.

ALTER TABLE 

--e. En la misma tabla, a�ade una restricci�n llamada FK_Avisos_Productos que
--la relacione con LB_Productos. Las columnas a relacionar ser�n
--Cod_Producto en LB_Avisos y Codigo en LB_Productos. Tanto la
--actualizaci�n como el borrado se propagar�n en cascada.

--f. En la misma tabla a�ade una restricci�n para que el valor de la nueva columna
--Fecha_Actualiza, si no es nulo, sea superior a Fecha_Crea.

--g. A�ade una restricci�n a la tabla LB_Clientes para asegurar que el valor de la
--columna Descuento est� entre 0 y 50.

--h. A�ade una columna calculada a la tabla LB_Productos llamada Margen que
--contenga la diferencia entre Stock_Actual y Stock_Minimo.

