--Boletin 9.1
USE Northwind
go
--Escribe las siguientes consultas sobre la base de datos NorthWind.

--D�A 1:
--    Nombre de los proveedores y n�mero de productos que nos vende cada uno
select CompanyName, count(UnitsOnOrder) as [Unidades vendidas] from Suppliers as S inner join Products as P on S.SupplierID=P.SupplierID group by CompanyName

--    Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.
select LastName, FirstName, HomePhone, City as [Ciudad donde trabaja] from Employees where City like 'New York' or City like 'Seattle' or City like 'Vermont' or City like 'Columbia'
or City like 'Los Angeles' or City like 'Redmond' or City like 'Atlanta'

-- Tambi�n se podr�a haber formulado as� (M�s sencillo)
Select FirstName as Nombre, 
       LastName as Apellidos, 
	   City AS Ciudad, 
	   HomePhone AS Tel�fono 
	   FROM Employees 
		WHERE City IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')


--    N�mero de productos de cada categor�a y nombre de la categor�a.
-- HE VISTO LA SOLUCI�N Y NO ME GUSTA C�MO EST� PLANTEADA LA CONSULTA. YO PROPONGO: 
-- N�mero de productos por categor�a y nombre de dichas categor�as

select COUNT(ProductID), CategoryName from Categories as C inner join Products as P on C.CategoryID = P.CategoryID group by CategoryName

--    Nombre de la compa��a de todos los clientes que hayan comprado queso de cabrales o tofu.

-- DE ESTA PASO

--    Empleados (ID, nombre, apellidos y tel�fono) que han vendido algo a Bon app' o Meter Franken.

--DE ESTA TAMBI�N

--    Empleados (ID, nombre, apellidos, mes y d�a de su cumplea�os) que no han vendido nunca nada a ning�n cliente de Francia. *

select distinct E.EmployeeID, FirstName, LastName, month(BirthDate) as [Mes de nacimiento], day(BirthDate) as [D�a de nacimiento] 
from Employees as E
inner join Orders as O on E.EmployeeID = O.EmployeeID 
where CustomerID not in (select Country from Customers where Country like 'France');

--D�A 2:
--    Total de ventas en US$ de productos de cada categor�a (nombre de la categor�a).

select sum(OD.unitprice), CategoryName 
from [Order Details] as OD 
inner join Products as P on OD.ProductID = P.ProductID 
inner join Categories as C on P.CategoryID = C.CategoryID
group by CategoryName

--    Total de ventas en US$ de cada empleado cada a�o (nombre, apellidos, direcci�n).

--PAsooooo

--    Ventas de cada producto en el a�o 97. Nombre del producto y unidades.



--    Cu�l es el producto del que hemos vendido m�s unidades en cada pa�s. *

select distinct  ProductName as [Nombre del producto], max(UnitsOnOrder) as [N�mero de unidades vendidas], ShipCountry as [Lugar del pedido]
from Orders as O
inner join [Order Details] as OD on O.OrderID = OD.OrderID
inner join Products as P on OD.ProductID = P.ProductID
group by ShipCountry, ProductName


--    Empleados (nombre y apellidos) que trabajan a las �rdenes de Andrew Fuller.

select FirstName, LastName from Employees where ReportsTo = 2

--    N�mero de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.

--* Se necesitan subconsultas