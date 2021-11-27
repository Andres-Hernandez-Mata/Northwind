INSERT INTO ventas.Customers (CustomerID, CompanyName) VALUES ('HDZM', 'Hernandez')

INSERT INTO administracion.Products (ProductName, Discontinued) VALUES ('Teclado', 1)

SELECT * FROM ventas.Customers

SELECT * FROM administracion.Products WHERE ProductName = 'Teclado'


INSERT INTO administracion.Suppliers (CompanyName) VALUES ('LSTI')

SELECT * FROM Suppliers WHERE CompanyName = 'LSTI'
		

UPDATE ventas.Orders SET ShipRegion = 'JK' WHERE OrderID = 10248

SELECT * FROM ventas.Orders WHERE OrderID = 10248

	
UPDATE ventas.[Order Details] SET Discount = 0.15 WHERE OrderID = 10248

SELECT * FROM ventas.[Order Details] WHERE OrderID = 10248

