--Boletin 8.1

--Escribe el c�digo SQL necesario para realizar las siguientes operaciones sobre la base de datos "NorthWind�
--Consultas sobre una sola Tabla
use Northwind
go
--1. Nombre del pa�s y n�mero de clientes de cada pa�s, ordenados alfab�ticamente por el nombre del pa�s.
select country, count (CustomerID) as numeroclientes from Customers group by Country order By Country asc

--2. ID de producto y n�mero de unidades vendidas de cada producto
select ProductID, count(Quantity) as cantidad from [Order Details] group by ProductID


--3. ID del cliente y n�mero de pedidos que nos ha hecho.

select CustomerID, count(OrderID) as numeroDePedidos from Orders group by CustomerID


--4. ID del cliente, a�o y n�mero de pedidos que nos ha hecho cada a�o.




--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.





--6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.





--7. N�mero de pedidos registrados mes a mes de cada a�o.





--8. A�o y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShipDate), en d�as para cada a�o.





--9. ID del distribuidor y n�mero de pedidos enviados a trav�s de ese distribuidor.





--10. ID de cada proveedor y n�mero de productos distintos que nos suministra.



