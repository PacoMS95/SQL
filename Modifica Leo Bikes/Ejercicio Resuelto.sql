-- EL SCRIPT DE CREACI�N DE LEOBIKES EST� EN EL USB --

USE LeoBikes
go

--Modifica las tablas necesarias para incluir las siguientes restricciones. Hazlo con Alter Table, no volviendo a crearlas. 

--a) Crea una nueva tabla LB_Avisos, para registrar los productos que est�n por debajo de su stock m�nimo.
--Los datos a guardar ser�n el ID del producto, la fecha en que se cre� el aviso, el stock m�nimo y el stock actual. 

create table LB_avisos (
IDProducto char (9)
,fechaAviso 
,stockMinimo
,stockActual
, CONSTRAINT PK_IDProducto 
)

--b) Sobre la tabla LB_Productos a�ade un valor por defecto a las columnas Stock_Actual (0) y Stock_Minimo (0).


--c) A�ade un valor por defecto a la columna SaldoPuntos de la tabla LB_Clientes con valor 0.
-- A��dele tambi�n una restricci�n para que su valor no pueda ser inferior a cero. 


