--Lenguaje SQL. Consultas
--Escribe el código SQL necesario para realizar las siguientes operaciones sobre la base de datos “NorthWind”
use Northwind
go
--Consultas sobre una sola Tabla

--1. Nombre de la compañía y dirección completa (dirección, cuidad, país) de todos los
--clientes que no sean de los Estados Unidos.

select CompanyName,Address,City,Country from Customers where Country != 'USA' --NOTA: poner los Strings entre comillas simples

--2. La consulta anterior ordenada por país y ciudad.

select CompanyName,Address,City,Country from Customers where Country != 'USA' order by Country, City

--3. Nombre, Apellidos, Ciudad y Edad de todos los empleados, ordenados por antigüedad en
--la empresa.

select FirstName, LastName, City, (year(CURRENT_TIMESTAMP - BirthDate)-1900) from Employees 

--4. Nombre y precio de cada producto, ordenado de mayor a menor precio.

select ProductName, UnitPrice from Products order by UnitPrice desc

--5. Nombre de la compañía y dirección completa de cada proveedor de algún país de
--América del Norte.

select CompanyName, Address, City, Country from Customers where Country = 'USA' or Country = 'Mexico' or Country = 'Canada'

--6. Nombre del producto, número de unidades en stock y valor total del stock, de los
--productos que no sean de la categoría 4.

select ProductName, UnitsInStock, (UnitsInStock * UnitPrice) as precioStock from Products where CategoryID != 4

--7. Clientes (Nombre de la Compañía, dirección completa, persona de contacto) que no
--residan en un país de América del Norte y que la persona de contacto no sea el
--propietario de la compañía

select CompanyName, ContactName, Address, City, Country from Customers where Country != 'USA' or Country != 'Mexico' or Country != 'Canada' and ContactTitle != 'Owner'

-- A PARTIR DE AQUÍ SE USAN FUNCIONES DE AGREGADO

--8. ID del cliente y número de pedidos realizados por cada cliente, ordenado de mayor a
--menor número de pedidos.

select CustomerID, count(OrderID) as NumeroPedidos from Orders group by CustomerID order by NumeroPedidos desc

--9. Número de pedidos enviados a cada ciudad, incluyendo el nombre de la ciudad.

select ShipCity, count(OrderID) as [Numero de pedidos por ciudad] from Orders group by ShipCity

--10. Número de productos de cada categoría.

select CategoryID, count(CategoryID) as [Numero de productos de cada categoría] from Products group by CategoryID