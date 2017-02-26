--Boletin 9.1

--Escribe las siguientes consultas sobre la base de datos NorthWind.
use Northwind
go
--    Nombre de los proveedores y n�mero de productos que nos vende cada uno



--select S.CompanyName, P.ProductName from Suppliers as S inner join Products as P on S.SupplierID = P.SupplierID 


select S.CompanyName, count(P.ProductName) as [numero de productos] from Suppliers as S inner join Products as P on S.SupplierID = P.SupplierID group by S.CompanyName
-- Numero de products por nombre de categor�a

select CategoryName, count(ProductID) from Products as P inner join Categories as C on C.CategoryID = P.CategoryID group by CategoryName
--    Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.

select City, LastName, FirstName, HomePhone from Employees where City like 'New York' or City like 'Seattle' or City like 'Vermont' or City like 'Columbia' or City like 'Los Angeles' or City like 'Redmond' or City like 'Atlanta'
-- m�s simple con IN

select City, LastName, FirstName, HomePhone from Employees where City in ('New York', 'Seattle', 'Vermont', 'Columbia' , 'Los Angeles' , 'Redmond' , 'Atlanta')

--    N�mero de productos de cada categor�a y nombre de la categor�a.


select count(ProductID) as [numero de productos], CategoryName from Products as P  inner join Categories as C on P.CategoryID = C.CategoryID group by CategoryName;


--    Nombre de la compa��a de todos los clientes que hayan comprado queso de cabrales o tofu.

select CompanyName as [nombre de la compa��a] from Suppliers as S inner join Products as P on S.SupplierID = P.SupplierID where ProductName in ('Tofu', 'Queso Cabrales')

--    Empleados (ID, nombre, apellidos y tel�fono) que han vendido algo a Bon app' o Meter Franken. -- ESTE SE HACE CONCATENANDO INNER JOINS. PUEDES HACERLO DE ARRIBA ABAJO O AL REV�S, YA DEPENDE DE COMO TE GUSTE M�S

select E.EmployeeID, FirstName, LastName, HomePhone from Employees as E inner join Orders as O on E.EmployeeID = O.EmployeeID inner join Customers as C on O.CustomerID = C.CustomerID where CompanyName like 'bon%' OR CompanyName like 'Meter Franken'

-- lo suyo es que uses distinct despu�s del select, porque si te das cuentas se repiten los empleados. No est� del todo mal, pero t� sabes.

--    Empleados (ID, nombre, apellidos, mes y d�a de su cumplea�os) que no han vendido nunca nada a ning�n cliente de Francia. (NO HACE FALTA SUBCONSULTAS AUNQUE EN EL ENUNCIADO ORIGINAL S� LA PED�AN)

select CustomerID from Customers where Country in ('France') except select EmployeeID,LastName,FirstName, MONTH(BirthDate) as mesDeNacimiento, day(BirthDate) from Employees

--    Total de dinero en ventas de productos de cada categor�a (nombre de la categor�a). 
--> Traducido a tu idioma: la suma del dinero obtenido en todas las ventas ordenadas por nombre de categor�a

select sum(UnitPrice * UnitsOnOrder) as [Total recaudado con productos], CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID group by CategoryName

<<<<<<< HEAD
=======
--select (UnitPrice * UnitsOnOrder) as [Total recaudado con productos], CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID


>>>>>>> origin/master

--    Total de dinero en ventas de cada empleado cada a�o (nombre, apellidos, direcci�n).
--> Traducido: la suma del dinero obtenido por cada empleado, mostr�ndose su nombre, apellidos y su direcci�n

-- Como hay tres tablas que relacionar pero, como no se hace con subconsultas, se opta por un inner join doble. El segundo inner join se coloca literalmente despu�s del primer inner join.

<<<<<<< HEAD
select sum(UnitPrice*Quantity*100*Discount)as Dinero, LastName, FirstName, Address from [Order Details] as OD inner join Orders as O on OD.OrderID = O.OrderID inner join Employees as E on O.EmployeeID = E.EmployeeID group by LastName, Address, FirstName
=======



>>>>>>> origin/master
--    Ventas de cada producto en el a�o 97. Nombre del producto y unidades.



<<<<<<< HEAD
--    Cu�l es el producto del que hemos vendido m�s unidades en cada pa�s. *


=======


--    Cu�l es el producto del que hemos vendido m�s unidades en cada pa�s. *



>>>>>>> origin/master
--    Empleados (nombre y apellidos) que trabajan a las �rdenes de Andrew Fuller.





--    N�mero de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.




<<<<<<< HEAD
--* Se necesitan subconsultas
=======

--* Se necesitan subconsultas



>>>>>>> origin/master
