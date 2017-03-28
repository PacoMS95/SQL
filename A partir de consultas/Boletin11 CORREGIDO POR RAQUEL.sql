USE Northwind
GO

--1.Deseamos incluir un producto en la tabla Products llamado "Cruzcampo lata” pero no estamos seguros si se 
-- ha insertado o no. El precio son 4,40, el proveedor es el 16, la categoría 1 y la cantidad por unidad es
--"Pack 6 latas” "Discontinued” toma el valor 0 y el resto de columnas se dejarán a NULL. Escribe un script
-- que compruebe si existe un producto con ese nombre. En caso afirmativo, actualizará el precio y en caso 
-- negativo insertarlo. 

SELECT * FROM Products

if EXISTS (SELECT * FROM Products
WHERE ProductName = 'Cruzcampo lata')
UPDATE Products SET UnitPrice='4.40' WHERE ProductName='Cruzcampo Lata'
ELSE
PRINT 'No hay ):'

INSERT INTO Products(ProductName,CategoryID,QuantityPerUnit,UnitPrice,Discontinued)
	VALUES('Cruzcampo lata','1','Pack 6 latas','4.40','0')



--DELETE FROM Products WHERE ProductName = 'Cruzcampo lata'

--2.Comprueba si existe una tabla llamada ProductSales. Esta tabla ha de tener de cada producto el ID, 
--el Nombre, el Precio unitario, el número total de unidades vendidas y el total de dinero facturado con 
--ese producto. Si no existe, créala

SELECT * FROM Products

SELECT OBJECT_ID('ProductSales')

		CREATE TABLE ProductSales (ProductID INT ,ProductName nvarchar, UnitPrice money, UnitsOnOrder smallint, TotalInvoiced money)


--Otra forma de hacerlo
IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'ProductSales')
		PRINT 'Existe'
ELSE
		CREATE TABLE ProductSales (ProductID INT ,ProductName nvarchar, UnitPrice money, UnitsOnOrder smallint, TotalInvoiced money)

DROP TABLE ProductSales

--3.Comprueba si existe una tabla llamada ShipShip. Esta tabla ha de tener de cada Transportista el ID, 
--el Nombre de la compañía, el número total de envíos que ha efectuado y el número de países diferentes 
--a los que ha llevado cosas. Si no existe, créala

--SELECT * FROM ShipShip

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'ShipShip')
	PRINT 'Existe'
ELSE
	CREATE TABLE ShipShip (ShipperID INT, CompanyName nvarchar, TotalShip smallint, Country nvarchar)

--DROP TABLE ShipShip

--4.Comprueba si existe una tabla llamada EmployeeSales. Esta tabla ha de tener de cada empleado su ID,
-- el Nombre completo, el número de ventas totales que ha realizado, el número de clientes diferentes a 
--los que ha vendido y el total de dinero facturado. Si no existe, créala

--MEJOR EXPLICADO POR ÁNGEL EN EL DOCUMENTO (ej4_bol11 CORREGIDO POR ÁNGEL.sql) QUE PUEDES ENCONTRAR EN EL REPO DE GITHUB

SELECT OBJECT_ID ('EmployeeSales')

CREATE TABLE EmployeeSales (EmployeeID INT, LastName nvarchar(20), FirstName nvarchar(10),TotalOrders smallint, NumberCustomers smallint, TotalInvoiced money)



--DROP TABLE EmployeeSales

--5.Entre los años 96 y 97 hay productos que han aumentado sus ventas y otros que las han disminuido. 
--Queremos cambiar el precio unitario según la siguiente tabla:

--Incremento de ventas			Incremento de precio

--Negativo								-10%

--Entre 0 y 10%							No varía

--Entre 10% y 50%							+5%

--Mayor del 50%					10% con un máximo de 2,25

SELECT * FROM Orders
 
SELECT COUNT(P.ProductID) AS Count, P.ProductName, P.UnitPrice, P.UnitsOnOrder, P.Discontinued, YEAR(O.OrderDate) AS Year
FROM [Order Details] AS OD
INNER JOIN Products AS P
ON P.ProductID=OD.ProductID
INNER JOIN Orders AS O
ON OD.OrderID=O.OrderID
WHERE YEAR(O.OrderDate) BETWEEN 1996 AND 1997
GROUP BY P.ProductName,  P.UnitPrice, P.UnitsOnOrder, P.Discontinued, O.OrderDate
