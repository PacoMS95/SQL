-- EL SCRIPT DE CREACIÓN DE LEOBIKES ESTÁ EN EL USB --

USE LeoBikes
go

--Modifica las tablas necesarias para incluir las siguientes restricciones. Hazlo con Alter Table, no volviendo a crearlas. 

--a) Crea una nueva tabla LB_Avisos, para registrar los productos que están por debajo de su stock mínimo.
--Los datos a guardar serán el ID del producto, la fecha en que se creó el aviso, el stock mínimo y el stock actual. 

create table LB_avisos (
IDProducto char (9)
,fechaAviso date
,stockMinimo smallint
,stockActual smallint
, CONSTRAINT PK_IDProducto 
)

--b) Sobre la tabla LB_Productos añade un valor por defecto a las columnas Stock_Actual (0) y Stock_Minimo (0).

--LA SINTAXIS DE MODIFICACIÓN NO ES LA QUE VIENE EN W3S.

ALTER TABLE LB_Productos add constraint DF_Stock_Actual default 0 for Stock_Actual
go
ALTER TABLE LB_Productos add constraint DF_Stock_Minimo default 0 for Stock_Minimo
go

--c) Añade un valor por defecto a la columna SaldoPuntos de la tabla LB_Clientes con valor 0.


--Esta es parecida a la del ejercicio anterior
ALTER TABLE LB_Clientes add constraint DF_SaldoPuntos default 0 for SaldoPuntos
go

-- Añádele también una restricción para que su valor no pueda ser inferior a cero. 

--Esta sí es como viene en W3S
ALTER TABLE LB_Clientes add constraint CK_SaldoPuntos check (SaldoPuntos > 0)
go

--d. En la tabla LB_Avisos, añade un valor por defecto a la columna Fecha_Crea
--que sea la fecha actual. 

ALTER TABLE LB_Avisos add constraint DF_Fecha_Crea default current_timestamp for Fecha_Crea

--Añade una columna Fecha_Actualiza del mismo
--tipo que Fecha_Crea, pero que sí admita valores nulos. Esta nueva columna
--tendrá el mismo valor por defecto.

ALTER TABLE 

--e. En la misma tabla, añade una restricción llamada FK_Avisos_Productos que
--la relacione con LB_Productos. Las columnas a relacionar serán
--Cod_Producto en LB_Avisos y Codigo en LB_Productos. Tanto la
--actualización como el borrado se propagarán en cascada.

--f. En la misma tabla añade una restricción para que el valor de la nueva columna
--Fecha_Actualiza, si no es nulo, sea superior a Fecha_Crea.

--g. Añade una restricción a la tabla LB_Clientes para asegurar que el valor de la
--columna Descuento está entre 0 y 50.

--h. Añade una columna calculada a la tabla LB_Productos llamada Margen que
--contenga la diferencia entre Stock_Actual y Stock_Minimo.

