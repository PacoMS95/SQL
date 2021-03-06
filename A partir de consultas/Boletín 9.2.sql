use Northwind
go

--1. N�mero de clientes de cada pa�s.

select count(CustomerID) as [N�mero de clientes], Country from Customers group by Country

--2. N�mero de clientes diferentes que compran cada producto.

select distinct count(C.CustomerID) as [N�mero de clientes], ProductName from Customers as C
inner join Orders as O on C.CustomerID = O.CustomerID inner join [Order Details] as OD on O.OrderID = OD.OrderID inner join Products as P on OD.ProductID=P.ProductID
group by ProductName
--3. N�mero de pa�ses diferentes en los que se vende cada producto.

select distinct count(country), ProductName from Customers inner join (...) group by ProductName

--4. Empleados que han vendido alguna vez �Gudbrandsdalsost�, �Lakkalik��ri�,
--�Tourti�re� o �Boston Crab Meat�.



--5. Empleados que no han vendido nunca �Chartreuse verte� ni �Ravioli Angelo�.
select * from Employees where EmployeeID not in(select E.EmployeeID from Employees as E 
inner join Orders as O on E.EmployeeID = O.EmployeeID
inner join [Order Details] as OD on O.OrderID = OD.OrderID 
inner join Products as P on OD.ProductID = P.ProductID
where ProductName like 'Chartreuse verte' or ProductName like 'Ravioli Angelo');

--6. N�mero de unidades de cada categor�a de producto que ha vendido cada
--empleado.

--7. Total de ventas (US$) de cada categor�a en el a�o 97.


select sum(OD.UnitPrice* OD.Quantity) as [total de Ventas en dollars], C.CategoryName
from Orders as O inner join [Order Details] as OD on O.OrderID = OD.OrderID
inner join Products as P on OD.ProductID = P.ProductID 
inner join Categories as C on P.CategoryID = C.CategoryID
where year(OrderDate) = '1997'
group by C.CategoryName

--8. Productos que han comprado m�s de un cliente del mismo pa�s, indicando el
--nombre del producto, el pa�s y el n�mero de clientes distintos de ese pa�s que
--lo han comprado.

--9. Total de ventas (US$) en cada pa�s cada a�o.

-- 10. Producto superventas (el que m�s ventas ha tenido en n�mero)
-- de cada a�o, indicando a�o, nombre del producto,
-- categor�a y cifra total de ventas.

select * from [Order Details]

go
create view VentasPorAnnio as select sum(Quantity) totalVentas, ProductName, year(OrderDate) as AnnioDeVenta, CategoryName
from Orders as O inner join [Order Details] as OD on O.OrderID = OD.OrderID
inner join Products as P on OD.ProductID = P.ProductID
inner join Categories as C on P.CategoryID = C.CategoryID
group by year(OrderDate), CategoryName, ProductName
-- se te olvid� agrupar por year(OrderDate)
go

create view Vista2 as select max(totalVentas) as CantidadVendida, AnnioDeVenta 
from VentasPorAnnio
group by AnnioDeVenta
go

select * from VentasPorAnnio as V1
inner join Vista2 as V2 on V1.AnnioDeVenta = V2.AnnioDeVenta and V1.totalVentas = V2.CantidadVendida

-- Se pueden poner varios equals en el on 

--11. Cifra de ventas de cada producto en el a�o 97 y su aumento o disminuci�n
--respecto al a�o anterior en US $ y en %

select count(O.OrderID) as [Cifra de ventas], ProductName from Orders as O 
inner join [Order Details] as OD on O.OrderID = OD.OrderID
inner join Products as P on OD.ProductID = P.ProductID
where year(OrderDate) = '1997' group by ProductName

--12. Mejor cliente (el que m�s nos compra) de cada pa�s.



--13. N�mero de productos diferentes que nos compra cada cliente.

--14. Clientes que nos compran m�s de cinco productos diferentes.

--15. Vendedores que han vendido una mayor cantidad que la media en US $ en el
--a�o 97.

--16. Empleados que hayan aumentado su cifra de ventas m�s de un 10% entre dos
--a�os consecutivos, indicando el a�o en que se produjo el aumento.