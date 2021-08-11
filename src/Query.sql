/* 1 */
SELECT * FROM dbo.Customers;
SELECT * FROM dbo.Customers WHERE Country  = 'USA';
/* 2 */
SELECT * FROM dbo.Products;
SELECT * FROM dbo.Products WHERE UnitsInStock BETWEEN 15 AND 39;
/* 3 */
SELECT * FROM dbo.Suppliers;
SELECT * FROM dbo.Suppliers WHERE ContactTitle = 'Marketing Manager';
/* 4 */
SELECT * FROM dbo.Orders;
SELECT * FROM dbo.Orders WHERE OrderDate BETWEEN ('1997-01-27 00:00:00.000') AND ('1997-03-24 00:00:00.000');
/* 16 */
SELECT * FROM dbo.Orders;
SELECT P.ProductName, O.OrderID, C.CompanyName FROM dbo.Orders O 
INNER JOIN dbo.Customers C ON (C.CustomerID = O.CustomerID)
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
WHERE ShipCountry = 'France';

SELECT * FROM dbo.Products;
SELECT * FROM dbo.[Order Details];

