-- EL SCRIPT DE CREACIÓN DE LEOBIKES ESTÁ EN EL USB --

USE LeoBikes
go

--Modifica las tablas necesarias para incluir las siguientes restricciones. Hazlo con Alter Table, no volviendo a crearlas. 

--a) Crea una nueva tabla LB_Avisos, para registrar los productos que están por debajo de su stock mínimo.
--Los datos a guardar serán el ID del producto, la fecha en que se creó el aviso, el stock mínimo y el stock actual. 

create table LB_avisos (
IDProducto char (9)
,fechaAviso 
,stockMinimo
,stockActual
, CONSTRAINT PK_IDProducto 
)

--b) Sobre la tabla LB_Productos añade un valor por defecto a las columnas Stock_Actual (0) y Stock_Minimo (0).


--c) Añade un valor por defecto a la columna SaldoPuntos de la tabla LB_Clientes con valor 0.
-- Añádele también una restricción para que su valor no pueda ser inferior a cero. 


