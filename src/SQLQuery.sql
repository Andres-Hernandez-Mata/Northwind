Use Northwind;

/* 1. Seleccione cuántos productos de la categoría de producto "Marisco" y "Productos lácteos" se han vendido a una dirección en "Alemania". */
SELECT P.CategoryID, P.ProductName, C.CategoryName, O.ShipCountry, SUM(P.CategoryID) AS TotalEnvios 
FROM dbo.Products P
INNER JOIN dbo.Categories C ON (C.CategoryID = P.CategoryID)
INNER JOIN dbo.[Order Details] OD ON (OD.ProductID = P.ProductID)
INNER JOIN dbo.Orders O ON (O.OrderID = OD.OrderID)
WHERE C.CategoryName IN ('Seafood', 'Dairy Products') AND O.ShipCountry = 'Germany'
GROUP BY P.ProductName, C.CategoryName, O.ShipCountry, P.CategoryID
ORDER BY P.CategoryID;

SELECT P.ProductName, C.CategoryName, O.ShipCountry, COUNT(P.ProductID) AS TotalEnvios
FROM dbo.Orders O
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
INNER JOIN dbo.Categories C ON (C.CategoryID = P.CategoryID)
WHERE C.CategoryName IN ('Seafood', 'Dairy Products') AND O.ShipCountry = 'Germany'
GROUP BY P.ProductName, C.CategoryName, O.ShipCountry, P.ProductID, C.CategoryID
ORDER BY C.CategoryID;


/*Camembert Pierrot 10*/
SELECT * FROM dbo.Orders;
SELECT * FROM dbo.Categories;
