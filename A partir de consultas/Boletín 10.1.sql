--Bolet�nActualizaciones NorthWind
--ACTUALIZACIONES
--Usa la base de datos NorthWind
use Northwind
go
--    Inserta un nuevo cliente.

insert into Customers (CustomerID, CompanyName)
values ('QUEPA', 'Quepa Leto & Co')


-- V�ndele (hoy) tres unidades de "Pavlova�, diez de "Inlagd Sill� y 25 de "Filo Mix�. 
-- El distribuidor ser� Speedy Express y el vendedor Laura Callahan. 

-- CONSULTAR GOUMES

INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount) 
VALUES -- Y aqu� me pierdo.


--    Ante la bajada de ventas producida por la crisis, hemos de adaptar nuestros precios seg�n las siguientes reglas:
--        Los productos de la categor�a de bebidas (Beverages) que cuesten m�s de $10 reducen su precio en un d�lar.
--        Los productos de la categor�a L�cteos que cuesten m�s de $5 reducen su precio en un 10%.
--        Los productos de los que se hayan vendido menos de 200 unidades en el �ltimo a�o, reducen su precio en un 5%
--    Inserta un nuevo vendedor llamado Michael Trump. As�gnale los territorios de Louisville, Phoenix, Santa Cruz y Atlanta.
--    Haz que las ventas del a�o 97 de Robert King que haya hecho a clientes de los estados de California y Texas se le asignen al nuevo empleado.
--    Inserta un nuevo producto con los siguientes datos:
--        ProductID: 90
--        ProductName: Nesquick Power Max
--        SupplierID: 12
--        CategoryID: 3
--        QuantityPerUnit: 10 x 300g
--        UnitPrice: 2,40
--        UnitsInStock: 38
--        UnitsOnOrder: 0
--        ReorderLevel: 0
--        Discontinued: 0
--    Inserta un nuevo producto con los siguientes datos:
--        ProductID: 91
--        ProductName: Mecca Cola
--        SupplierID: 1
--        CategoryID: 1
--        QuantityPerUnit: 6 x 75 cl
--        UnitPrice: 7,35
--        UnitsInStock: 14
--        UnitsOnOrder: 0
--        ReorderLevel: 0
--        Discontinued: 0
--    Todos los que han comprado "Outback Lager" han comprado cinco a�os despu�s la misma cantidad de Mecca Cola al mismo vendedor
--    El pasado 20 de enero, Margaret Peacock consigui� vender una caja de Nesquick Power Max a todos los clientes que le hab�an comprado algo anteriormente. 
--	Los datos de env�o (direcci�n, transportista, etc) son los mismos de alguna de sus ventas anteriores a ese cliente).