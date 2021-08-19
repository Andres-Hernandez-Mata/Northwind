Use Northwind;

/* 1. Seleccione cuántos productos de la categoría de producto "Marisco" y "Productos lácteos" se han vendido a una dirección en "Alemania". */
SELECT P.ProductName, C.CategoryName, O.ShipCountry, COUNT(P.ProductID) AS TotalEnvios
FROM dbo.Orders O
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
INNER JOIN dbo.Categories C ON (C.CategoryID = P.CategoryID)
WHERE C.CategoryName IN ('Seafood', 'Dairy Products') AND O.ShipCountry = 'Germany'
GROUP BY P.ProductName, C.CategoryName, O.ShipCountry, P.ProductID, C.CategoryID
ORDER BY C.CategoryID;

/* 2. Seleccione el nombre de la empresa para todos los clientes con una dirección en la ciudad 'Buenos Aires' y 'Madrid'. */
SELECT CompanyName, City FROM dbo.Customers 
WHERE City IN ('Buenos Aires', 'Madrid')
ORDER BY City DESC;

/* 3. Seleccione el uso del valor del subtotal (precio unitario y cantidad) en el detalle del pedido de venta para listar los pedidos del más grande al más pequeño. Para cada pedido mostrar el Nombre de la Empresa y el SubTotal y el peso total del pedido. */
SELECT C.CompanyName, OS.Subtotal, O.Freight FROM Orders O 
INNER JOIN [Order Subtotals] OS ON (OS.OrderID = O.OrderID)
INNER JOIN Customers C ON (C.CustomerID = O.CustomerID)
ORDER BY OS.Subtotal DESC;

/* 4. Seleccione OrderDate, el ProductName y el UnitPrice del pedido realizado por CustomerID CHOPS. */

SELECT O.CustomerID, P.ProductName, P.UnitPrice, O.OrderDate FROM Orders O
INNER JOIN [Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN Products P ON (P.ProductID = OD.ProductID)
WHERE O.CustomerID = 'CHOPS';

/* 5. Mostrar la cantidad de productos por categoría, seleccionando el nombre de la categoría y el número de productos de esta categoría, así como la contabilidad de su precio para el stock de todos los productos y su existencia. */
SELECT C.CategoryName, COUNT(P.CategoryID) AS QuantityProducts,
SUM(P.UnitPrice) AS AccountingPrice, SUM(P.UnitsInStock) AS UnitsInStock
FROM Products P
INNER JOIN Categories C ON (C.CategoryID = P.CategoryID)
GROUP BY C.CategoryName

/* 6. Seleccione el nombre del producto y el nombre de la empresa para todos los clientes que pidieron el nombre del producto "Flotemysost" y "Filo Mix". */
SELECT P.ProductName, C.CompanyName FROM Orders O
INNER JOIN [Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN Products P ON (P.ProductID = OD.ProductID)
INNER JOIN Customers C ON (C.CustomerID = O.CustomerID)
WHERE P.ProductName IN ('Flotemysost', 'Filo Mix');

/* 7. Mostrar los productos que pertenecen a la categoría condimentos y productos lácteos. */
SELECT P.* FROM Products P 
INNER JOIN Categories C ON (C.CategoryID = P.CategoryID)
WHERE C.CategoryName IN ('Condiments', 'Dairy Products')
ORDER BY P.ProductID

/* 8. Seleccione todos los clientes que no tienen Región y un FAX, del País de Alemania. */
SELECT * FROM Customers
WHERE Region IS NULL AND Fax IS NULL
AND Country = 'Germany';

/* 9. Seleccione la descripción del producto para el cultivo "fr" para el producto. */

/* 10. Muestra el número, el máximo y el mínimo por categoría de precio. */

