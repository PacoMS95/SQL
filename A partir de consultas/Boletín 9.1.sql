--Boletin 9.1

--Escribe las siguientes consultas sobre la base de datos NorthWind.
use Northwind
go
--    Nombre de los proveedores y número de productos que nos vende cada uno



--select S.CompanyName, P.ProductName from Suppliers as S inner join Products as P on S.SupplierID = P.SupplierID 


select S.CompanyName, count(P.ProductName) as [numero de productos] from Suppliers as S inner join Products as P on S.SupplierID = P.SupplierID group by S.CompanyName
-- Numero de products por nombre de categoría

select CategoryName, count(ProductID) from Products as P inner join Categories as C on C.CategoryID = P.CategoryID group by CategoryName
--    Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.

select City, LastName, FirstName, HomePhone from Employees where City like 'New York' or City like 'Seattle' or City like 'Vermont' or City like 'Columbia' or City like 'Los Angeles' or City like 'Redmond' or City like 'Atlanta'
-- más simple con IN

select City, LastName, FirstName, HomePhone from Employees where City in ('New York', 'Seattle', 'Vermont', 'Columbia' , 'Los Angeles' , 'Redmond' , 'Atlanta')

--    Número de productos de cada categoría y nombre de la categoría.


select count(ProductID) as [numero de productos], CategoryName from Products as P  inner join Categories as C on P.CategoryID = C.CategoryID group by CategoryName;


--    Nombre de la compañía de todos los clientes que hayan comprado queso de cabrales o tofu.

select CompanyName as [nombre de la compañía] from Suppliers as S inner join Products as P on S.SupplierID = P.SupplierID where ProductName in ('Tofu', 'Queso Cabrales')

--    Empleados (ID, nombre, apellidos y teléfono) que han vendido algo a Bon app' o Meter Franken. -- ESTE SE HACE CONCATENANDO INNER JOINS. PUEDES HACERLO DE ARRIBA ABAJO O AL REVÉS, YA DEPENDE DE COMO TE GUSTE MÁS

select E.EmployeeID, FirstName, LastName, HomePhone from Employees as E inner join Orders as O on E.EmployeeID = O.EmployeeID inner join Customers as C on O.CustomerID = C.CustomerID where CompanyName like 'bon%' OR CompanyName like 'Meter Franken'

-- lo suyo es que uses distinct después del select, porque si te das cuentas se repiten los empleados. No está del todo mal, pero tú sabes.

--    Empleados (ID, nombre, apellidos, mes y día de su cumpleaños) que no han vendido nunca nada a ningún cliente de Francia. (NO HACE FALTA SUBCONSULTAS AUNQUE EN EL ENUNCIADO ORIGINAL SÍ LA PEDÍAN)

select CustomerID from Customers where Country in ('France') except select EmployeeID,LastName,FirstName, MONTH(BirthDate) as mesDeNacimiento, day(BirthDate) from Employees

--    Total de dinero en ventas de productos de cada categoría (nombre de la categoría). 
--> Traducido a tu idioma: la suma del dinero obtenido en todas las ventas ordenadas por nombre de categoría

select sum(UnitPrice * UnitsOnOrder) as [Total recaudado con productos], CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID group by CategoryName


--select (UnitPrice * UnitsOnOrder) as [Total recaudado con productos], CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID


--    Total de dinero en ventas de cada empleado cada año (nombre, apellidos, dirección).
--> Traducido: la suma del dinero obtenido por cada empleado, mostrándose su nombre, apellidos y su dirección

-- Como hay tres tablas que relacionar pero, como no se hace con subconsultas, se opta por un inner join doble. El segundo inner join se coloca literalmente después del primer inner join.

select sum(UnitPrice*Quantity*100*Discount)as Dinero, LastName, FirstName, Address from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID inner join Employees as E on O.EmployeeID = E.EmployeeID group by LastName, Address, FirstName

--    Ventas de cada producto en el año 97. Nombre del producto y unidades



--    Cuál es el producto del que hemos vendido más unidades en cada país. *
-- Cuál es la cantidad de productos que se han vendido 

select P.ProductID from Products as P 

select ProductID, sum(Quantity) as CantidadVendida from [Order Details] group by ProductID order by ProductID

-- Buscamos las máximas ventas por cada país.

select max([Order Details].Quantity) from [Order Details]

-- Las ventas de cada país
select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID where ProductID = 1 group by OD.ProductID, O.ShipCountry order by ProductID 

select max(select sum(OD.Quantity) from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID group by OD.ProductID, O.ShipCountry order by ProductID as ventaPorPais) from ventaPorPais




--select ProductID, Quantity from [Order Details] where ProductID = 51

select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID where OD.ProductID = 1 group by OD.ProductID, O.ShipCountry order by ProductID

SELECT P.ProductID, P.ProductName FROM Products as P



SELECT P.ProductName, (select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID where OD.ProductID = 1 group by OD.ProductID, O.ShipCountry order by ProductID) FROM Products as P


SELECT P.ProductID, P.ProductName FROM Products as P ORDER BY P.ProductID

select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID group by OD.ProductID, O.ShipCountry order by ProductID

SELECT P.ProductID, P.ProductName, (select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID where OD.ProductID = P.ProductID group by OD.ProductID, O.ShipCountry) FROM Products as P

select sum(OD.Quantity) as CantidadVendida from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID group by O.ShipCountry

SELECT P.ProductID, P.ProductName, (select sum(OD.Quantity) as CantidadVendida from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID WHERE P.ProductID = OD.ProductID group by O.ShipCountry) FROM Products as P

select sum(OD.Quantity) as CantidadVendida from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID group by OD.ProductID, O.ShipCountry

select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID group by OD.ProductID, O.ShipCountry order by ProductID

select OD.ProductID, sum(OD.Quantity) as CantidadVendida, O.ShipCountry from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID group by OD.ProductID, O.ShipCountry order by CantidadVendida desc
--    Empleados (nombre y apellidos) que trabajan a las órdenes de Andrew Fuller.





--    Número de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.



--* Se necesitan subconsultas
