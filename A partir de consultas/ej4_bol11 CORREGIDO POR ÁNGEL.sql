use LeoMetro
go

--4. Crea una función inline que nos diga el número de personas que han pasado por una estacion en un periodo de tiempo.
--Se considera que alguien ha pasado por una estación si ha entrado o salido del metro por ella. El principio y el
--fin de ese periodo se pasarán como parámetros

--consulta
select * from LM_Viajes

select count(TB.IDPasajero) AS CantidadPersonas from (
	select distinct IDPasajero, IDEstacionEntrada, IDEstacionSalida from LM_Viajes
	where (IDEstacionEntrada = 4 or IDEstacionSalida = 4)
	and (MomentoEntrada between DATETIMEFROMPARTS(2017, 2, 26, 0, 0, 0, 0) AND DATETIMEFROMPARTS(2017, 2, 27, 0, 0, 0, 0)
	or MomentoSalida between DATETIMEFROMPARTS(2017, 2, 26, 0, 0, 0, 0) AND DATETIMEFROMPARTS(2017, 2, 27, 0, 0, 0, 0))
) AS TB

--funcion
go
CREATE FUNCTION PasajerosEnEstacionIntervalo (@estacion as varchar(2), @inicio as datetime, @final as datetime)
RETURNS TABLE AS
RETURN(
	select count(TB.IDPasajero) AS CantidadPersonas from (
	select distinct IDPasajero from LM_Viajes
	where (IDEstacionEntrada = @estacion or IDEstacionSalida = @estacion)
	and (MomentoEntrada between @inicio AND @final
	or MomentoSalida between @inicio AND @final)
	) AS TB
)
go

--consultamos la funcion

declare @inicial datetime
declare @final datetime
declare @estacion varchar(2)

set @inicial = datetimefromparts(2017,2,26,0,0,0,0)
set @final = datetimefromparts(2017,2,27,0,0,0,0)
set @estacion = '4'

select * from PasajerosEnEstacionIntervalo (@estacion, @inicial, @final)