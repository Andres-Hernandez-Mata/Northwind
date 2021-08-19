Use Northwind;

/* 1. Seleccione cu�ntos productos de la categor�a de producto "Marisco" y "Productos l�cteos" se han vendido a una direcci�n en "Alemania". */
SELECT P.ProductName, C.CategoryName, O.ShipCountry, COUNT(P.ProductID) AS TotalEnvios
FROM dbo.Orders O
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
INNER JOIN dbo.Categories C ON (C.CategoryID = P.CategoryID)
WHERE C.CategoryName IN ('Seafood', 'Dairy Products') AND O.ShipCountry = 'Germany'
GROUP BY P.ProductName, C.CategoryName, O.ShipCountry, P.ProductID, C.CategoryID
ORDER BY C.CategoryID;

/* 2. Seleccione el nombre de la empresa para todos los clientes con una direcci�n en la ciudad 'Buenos Aires' y 'Madrid'. */
SELECT CompanyName, City FROM dbo.Customers 
WHERE City IN ('Buenos Aires', 'Madrid')
ORDER BY City DESC;

/* 3. Seleccione el uso del valor del subtotal (precio unitario y cantidad) en el detalle del pedido de venta para listar los pedidos del m�s grande al m�s peque�o. Para cada pedido mostrar el Nombre de la Empresa y el SubTotal y el peso total del pedido. */

