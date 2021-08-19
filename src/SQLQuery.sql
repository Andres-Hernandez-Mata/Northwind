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




