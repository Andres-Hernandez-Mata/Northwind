/* 1. Seleccionar clientes cuyo pais sea Estados Unidos (EE. UU.) */
SELECT * FROM 
dbo.Customers 
WHERE Country = 'USA';
/* 2. Seleccionar productos cuya existencia esté entre 15 y 39 piezas */
SELECT * FROM 
dbo.Products 
WHERE UnitsInStock BETWEEN 15 AND 39;
/* 3. Seleccione los proveedores cuyo cargo de contacto es gerente de marketing */
SELECT * FROM 
dbo.Suppliers 
WHERE ContactTitle = 'Marketing Manager';






/* 4 */
SELECT * FROM dbo.Orders;
SELECT * FROM dbo.Orders WHERE OrderDate BETWEEN ('1997-01-27 00:00:00.000') AND ('1997-03-24 00:00:00.000');
/* 5 */
SELECT * FROM dbo.Products;
SELECT P.ProductName, P.UnitPrice, P.UnitsInStock FROM dbo.Products P;
/* 7 */
SELECT SUM(OD.Quantity) FROM dbo.[Order Details] OD
WHERE OD.OrderID = 10248;
SELECT COUNT(P.ProductID) FROM dbo.Products P;
SELECT SUM(P.ProductID) FROM dbo.Products P;
/* 16 */
SELECT * FROM dbo.Orders;
SELECT P.ProductName, O.OrderID, C.CompanyName FROM dbo.Orders O 
INNER JOIN dbo.Customers C ON (C.CustomerID = O.CustomerID)
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
WHERE ShipCountry = 'France';

SELECT * FROM dbo.Products;
SELECT * FROM dbo.[Order Details];

