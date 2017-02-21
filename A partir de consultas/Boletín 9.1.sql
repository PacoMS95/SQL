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

select (UnitPrice * UnitsOnOrder) as [Total recaudado con productos], CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID

--    Total de dinero en ventas de cada empleado cada año (nombre, apellidos, dirección).



--    Ventas de cada producto en el año 97. Nombre del producto y unidades.

--    Cuál es el producto del que hemos vendido más unidades en cada país. *

--    Empleados (nombre y apellidos) que trabajan a las órdenes de Andrew Fuller.

--    Número de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.

--* Se necesitan subconsultas