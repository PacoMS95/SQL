--Boletin 8.1

--Escribe el código SQL necesario para realizar las siguientes operaciones sobre la base de datos "NorthWind”
--Consultas sobre una sola Tabla
use Northwind
go
--1. Nombre del país y número de clientes de cada país, ordenados alfabéticamente por el nombre del país.
select country, count (CustomerID) as numeroclientes from Customers group by Country order By Country asc

--2. ID de producto y número de unidades vendidas de cada producto
select ProductID, count(Quantity) as cantidad from [Order Details] group by ProductID


--3. ID del cliente y número de pedidos que nos ha hecho.

select CustomerID, count(OrderID) as numeroDePedidos from Orders group by CustomerID


--4. ID del cliente, año y número de pedidos que nos ha hecho cada año.

select CustomerID,  year(OrderDate), count(OrderID) from Orders group by CustomerID, year(OrderDate)

--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.

select ProductID, max (UnitPrice) as [Precio unitario], sum(UnitPrice * Quantity) as [total facturado] from [Order Details] group by ProductID order by [total facturado] desc

--6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.

select SupplierID, sum(UnitPrice*UnitsInStock) from Products group by SupplierID

--7. Número de pedidos registrados mes a mes de cada año.

select count(OrderID) as [numero de pedidos], MONTH(OrderDate) as [mes del año], year(OrderDate) as año from Orders group by MONTH(OrderDate), year(OrderDate) order by year(OrderDate) asc

--8. Año y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShipDate), en días para cada año.

select year(OrderDate) as [año de envío], avg(datediff(DAY, OrderDate,ShippedDate)) as [Diferencias en días (media) entre pedido y envío] from Orders group by year(OrderDate)

--todo tiene que aparecer en group by o ser una función de agregado

--9. ID del distribuidor y número de pedidos enviados a través de ese distribuidor.

select SupplierID, count(UnitsOnOrder) [Conteo de unidades pedidas] from Products group by SupplierID

--10. ID de cada proveedor y número de productos distintos que nos suministra.

select count(ProductName) as [numero de productos distintos] ,SupplierID from Products group by SupplierID