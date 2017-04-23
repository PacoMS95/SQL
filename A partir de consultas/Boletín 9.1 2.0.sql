--Boletin 9.1
USE Northwind
go
--Escribe las siguientes consultas sobre la base de datos NorthWind.

--DÍA 1:
--    Nombre de los proveedores y número de productos que nos vende cada uno
select CompanyName, count(UnitsOnOrder) as [Unidades vendidas] from Suppliers as S inner join Products as P on S.SupplierID=P.SupplierID group by CompanyName

--    Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.
select LastName, FirstName, HomePhone, City as [Ciudad donde trabaja] from Employees where City like 'New York' or City like 'Seattle' or City like 'Vermont' or City like 'Columbia'
or City like 'Los Angeles' or City like 'Redmond' or City like 'Atlanta'

-- También se podría haber formulado así (Más sencillo)
Select FirstName as Nombre, 
       LastName as Apellidos, 
	   City AS Ciudad, 
	   HomePhone AS Teléfono 
	   FROM Employees 
		WHERE City IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')


--    Número de productos de cada categoría y nombre de la categoría.
-- HE VISTO LA SOLUCIÓN Y NO ME GUSTA CÓMO ESTÁ PLANTEADA LA CONSULTA. YO PROPONGO: 
-- Número de productos por categoría y nombre de dichas categorías

select COUNT(ProductID), CategoryName from Categories as C inner join Products as P on C.CategoryID = P.CategoryID group by CategoryName

--    Nombre de la compañía de todos los clientes que hayan comprado queso de cabrales o tofu.

-- DE ESTA PASO

--    Empleados (ID, nombre, apellidos y teléfono) que han vendido algo a Bon app' o Meter Franken.

--DE ESTA TAMBIÉN

--    Empleados (ID, nombre, apellidos, mes y día de su cumpleaños) que no han vendido nunca nada a ningún cliente de Francia. *

select distinct E.EmployeeID, FirstName, LastName, month(BirthDate) as [Mes de nacimiento], day(BirthDate) as [Día de nacimiento] 
from Employees as E
inner join Orders as O on E.EmployeeID = O.EmployeeID 
where CustomerID not in (select Country from Customers where Country like 'France');

--DÍA 2:
--    Total de ventas en US$ de productos de cada categoría (nombre de la categoría).

select sum(OD.unitprice), CategoryName 
from [Order Details] as OD 
inner join Products as P on OD.ProductID = P.ProductID 
inner join Categories as C on P.CategoryID = C.CategoryID
group by CategoryName

--    Total de ventas en US$ de cada empleado cada año (nombre, apellidos, dirección).

--PAsooooo

--    Ventas de cada producto en el año 97. Nombre del producto y unidades.



--    Cuál es el producto del que hemos vendido más unidades en cada país. *

select distinct  ProductName as [Nombre del producto], max(UnitsOnOrder) as [Número de unidades vendidas], ShipCountry as [Lugar del pedido]
from Orders as O
inner join [Order Details] as OD on O.OrderID = OD.OrderID
inner join Products as P on OD.ProductID = P.ProductID
group by ShipCountry, ProductName


--    Empleados (nombre y apellidos) que trabajan a las órdenes de Andrew Fuller.

select FirstName, LastName from Employees where ReportsTo = 2

--    Número de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.

--* Se necesitan subconsultas