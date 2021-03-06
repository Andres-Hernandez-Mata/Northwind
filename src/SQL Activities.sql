Use Northwind;

/* 1. Seleccione cu?ntos productos de la categor?a de producto "Marisco" y "Productos l?cteos" se han vendido a una direcci?n en "Alemania". */
SELECT P.ProductName, C.CategoryName, O.ShipCountry, COUNT(P.ProductID) AS TotalEnvios
FROM dbo.Orders O
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
INNER JOIN dbo.Categories C ON (C.CategoryID = P.CategoryID)
WHERE C.CategoryName IN ('Seafood', 'Dairy Products') AND O.ShipCountry = 'Germany'
GROUP BY P.ProductName, C.CategoryName, O.ShipCountry, P.ProductID, C.CategoryID
ORDER BY C.CategoryID;

/* 2. Seleccione el nombre de la empresa para todos los clientes con una direcci?n en la ciudad 'Buenos Aires' y 'Madrid'. */
SELECT CompanyName, City FROM dbo.Customers 
WHERE City IN ('Buenos Aires', 'Madrid')
ORDER BY City DESC;

/* 3. Seleccione el uso del valor del subtotal (precio unitario y cantidad) en el detalle del pedido de venta para listar los pedidos del m?s grande al m?s peque?o. Para cada pedido mostrar el Nombre de la Empresa y el SubTotal y el peso total del pedido. */
SELECT C.CompanyName, OS.Subtotal, O.Freight FROM Orders O 
INNER JOIN [Order Subtotals] OS ON (OS.OrderID = O.OrderID)
INNER JOIN Customers C ON (C.CustomerID = O.CustomerID)
ORDER BY OS.Subtotal DESC;

/* 4. Seleccione OrderDate, el ProductName y el UnitPrice del pedido realizado por CustomerID CHOPS. */
SELECT O.CustomerID, P.ProductName, P.UnitPrice, O.OrderDate FROM Orders O
INNER JOIN [Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN Products P ON (P.ProductID = OD.ProductID)
WHERE O.CustomerID = 'CHOPS'
ORDER BY O.OrderDate DESC;

/* 5. Mostrar la cantidad de productos por categor?a, seleccionando el nombre de la categor?a y el n?mero de productos de esta categor?a, as? como la contabilidad de su precio para el stock de todos los productos y su existencia. */
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

/* 7. Mostrar los productos que pertenecen a la categor?a condimentos y productos l?cteos. */
SELECT P.* FROM Products P 
INNER JOIN Categories C ON (C.CategoryID = P.CategoryID)
WHERE C.CategoryName IN ('Condiments', 'Dairy Products')
ORDER BY P.ProductID

/* 8. Seleccione todos los clientes que no tienen Regi?n y un FAX, del Pa?s de Alemania. */
SELECT * FROM Customers
WHERE Region IS NULL AND Fax IS NULL
AND Country = 'Germany';

/* 9. Seleccione la descripci?n del producto para el cultivo "fr" para el producto. */

/* 10. Muestra el n?mero, el m?ximo y el m?nimo por categor?a de precio. */
SELECT P.ProductName, C.CategoryName, MIN(P.UnitPrice) AS Minimum, MAX(P.UnitPrice) AS Maximum
FROM Products P
INNER JOIN Categories C ON (P.CategoryID = C.CategoryID)
GROUP BY P.ProductName, C.CategoryName, C.CategoryID

/* 11. Mostrar las cuentas de los pedidos que cada empleado ha realizado (mostrar el nombre y el apellido en una sola columna y el n?mero de pedidos). */
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS Employee, COUNT(O.EmployeeID) AS NumberOrders
FROM Employees E
INNER JOIN Orders O ON (E.EmployeeID = O.EmployeeID)
GROUP BY E.FirstName, E.LastName

/* 12. Muestra el nombre del empleado, el cliente y los productos de su pedido cuyo descuento en su ticket es superior a 10. */
SELECT E.FirstName AS Employee, C.CompanyName AS Customer, P.ProductName AS Product FROM Orders O
INNER JOIN Employees E ON (E.EmployeeID = O.EmployeeID)
INNER JOIN Customers C ON (C.CustomerID = O.CustomerID)
INNER JOIN [Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN Products P ON (P.ProductID = OD.ProductID)
WHERE OD.Discount > .10
ORDER BY E.FirstName

/* 13. Mostrar los productos cuyo precio oscila entre 20 y 60 d?lares. */
SELECT * FROM Products
WHERE UnitPrice BETWEEN 20 AND 60
ORDER BY UnitPrice;

/* 14. Cree un procedimiento almacenado que inserte dos clientes, actualice uno de ellos y borre s?lo uno. */

CREATE PROCEDURE Clients
AS
BEGIN
	INSERT INTO Customers ( 
	CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode,
	Country, Phone, Fax
	) VALUES ('UANL1', 'FCFM1', 'LSTI1', 'Manager', 'Pedro de Alba S/N, Ni?os H?roes', 
	'San Nicol?s', 'MTY', '66451', 'Mexico', '(81) 8329-4001',
	'83294045'), ('UANL2', 'FCFM2', 'LSTI2', 'Manager', 'Pedro de Alba S/N, Ni?os H?roes', 
	'San Nicol?s', 'MTY', '66451', 'Mexico', '(81) 8329-4001',
	'83294045');
	UPDATE Customers SET ContactTitle = 'Programmer' WHERE CustomerID = 'UANL1';
	DELETE Customers WHERE CustomerID = 'UANL2';
END

EXEC Clients;


