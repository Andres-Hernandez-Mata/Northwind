SELECT * FROM dbo.Customers;
SELECT * FROM dbo.Customers WHERE Country  = 'USA';

SELECT * FROM dbo.Products;
SELECT * FROM dbo.Products WHERE UnitsInStock BETWEEN 15 AND 39;

SELECT * FROM dbo.Suppliers;
SELECT * FROM dbo.Suppliers WHERE ContactTitle = 'Marketing Manager';

SELECT * FROM dbo.Orders;
SELECT * FROM dbo.Orders WHERE OrderDate BETWEEN ('1997-01-27 00:00:00.000') AND ('1997-03-24 00:00:00.000');

SELECT * FROM dbo.Orders;
SELECT * FROM dbo.Orders O 
INNER JOIN dbo.Customers C ON (C.CustomerID = O.CustomerID)
WHERE ShipCountry = 'France';

