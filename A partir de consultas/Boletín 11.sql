--Boletin 11.0: Todas son funciones inline

--Sobre la base de datos LeoMetro
use LeoMetro
go

--    Crea una funci�n inline que nos devuelva el n�mero de estaciones que ha recorrido cada tren en un determinado periodo de tiempo.
-- 	  El principio y el fin de ese periodo se pasar�n como par�metros

--select original:

select * from LM_Recorridos

-- funcion:

CREATE FUNCTION numeroEstacionesEnPeriodoDeTiempo ()
RETURNS TABLE AS
RETURN (SELECT )

--    Crea una funci�n inline que nos devuelva el n�mero de veces que cada usuario ha entrado en el metro en un periodo de tiempo. 
--	 El principio y el fin de ese periodo se pasar�n como par�metros

--    Crea una funci�n inline a la que pasemos la matr�cula de un tren y una fecha de inicio y fin y nos devuelva una tabla con el
-- n�mero de veces que ese tren ha estado en cada estaci�n, adem�s del ID, nombre y direcci�n de la estaci�n

--    Crea una funci�n inline que nos diga el n�mero de personas que han pasado por una estacion en un periodo de tiempo.
-- Se considera que alguien ha pasado por una estaci�n si ha entrado o salido del metro por ella. El principio y el fin de ese periodo se pasar�n como par�metros

--	  Crea una funci�n inline que nos devuelva los kil�metros que ha recorrido cada tren en un periodo de tiempo.El principio y el fin de ese periodo se pasar�n como par�metros

