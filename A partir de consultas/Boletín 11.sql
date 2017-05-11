--Boletin 11.0: Todas son funciones inline

--Sobre la base de datos LeoMetro
use LeoMetro
go

--    Crea una función inline que nos devuelva el número de estaciones que ha recorrido cada tren en un determinado periodo de tiempo.
-- 	  El principio y el fin de ese periodo se pasarán como parámetros

--select original:

select * from LM_Recorridos

-- funcion:

CREATE FUNCTION numeroEstacionesEnPeriodoDeTiempo ()
RETURNS TABLE AS
RETURN (SELECT )

--    Crea una función inline que nos devuelva el número de veces que cada usuario ha entrado en el metro en un periodo de tiempo. 
--	 El principio y el fin de ese periodo se pasarán como parámetros

--    Crea una función inline a la que pasemos la matrícula de un tren y una fecha de inicio y fin y nos devuelva una tabla con el
-- número de veces que ese tren ha estado en cada estación, además del ID, nombre y dirección de la estación

--    Crea una función inline que nos diga el número de personas que han pasado por una estacion en un periodo de tiempo.
-- Se considera que alguien ha pasado por una estación si ha entrado o salido del metro por ella. El principio y el fin de ese periodo se pasarán como parámetros

--	  Crea una función inline que nos devuelva los kilómetros que ha recorrido cada tren en un periodo de tiempo.El principio y el fin de ese periodo se pasarán como parámetros

