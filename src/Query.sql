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
/* 4. Seleccione los pedidos cuya fecha de venta fue entre el 27 de enero de 1997 y el 24 de marzo de 1997 */
SELECT * FROM 
dbo.Orders 
WHERE OrderDate 
BETWEEN ('1997-01-27 00:00:00.000') AND ('1997-03-24 00:00:00.000');
/* 5. Seleccione el nombre del producto, el precio unitario y las cantidades en stock de todos los productos que se han vendido en EE. UU */
SELECT P.ProductName, P.UnitPrice, P.UnitsInStock
FROM dbo.Products P
INNER JOIN dbo.[Order Details] OD ON (OD.ProductID = P.ProductID)
INNER JOIN dbo.Orders O ON (O.OrderID = OD.OrderID)
WHERE O.ShipCountry = 'USA';
/* 6. Seleccione los productos que pertenecen al proveedor New Orleans Cajun Delights */ 
SELECT * FROM 
dbo.Products P
INNER JOIN dbo.Suppliers S ON (S.SupplierID = P.SupplierID)
WHERE S.CompanyName = 'New Orleans Cajun Delights';
/* 7. Seleccione el total (suma) de productos del pedido 10248 */
SELECT SUM(OD.Quantity) FROM 
dbo.[Order Details] OD
WHERE OD.OrderID = 10248;
/* 8. Seleccione todos los pedidos del cliente Hanari Carnes */
SELECT * FROM dbo.Orders O
INNER JOIN dbo.Customers C ON (C.CustomerID = O.CustomerID)
WHERE C.CompanyName = 'Hanari Carnes';
/* 9. Seleccione el empleado, la categoría de producto y el producto de todos los empleados que procesaron el pedido en 1997 */
SELECT CONCAT (E.FirstName, ' ', E.LastName) Employee, 
C.CategoryName, P.ProductName FROM 
dbo.Orders O
INNER JOIN dbo.Employees E ON (E.EmployeeID = O.EmployeeID)
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
INNER JOIN dbo.Categories C ON (C.CategoryID = P.CategoryID)
WHERE O.OrderDate = '1997-01-01 00:00:00.000';
/* 10. Seleccione clientes cuyo país sea EE. UU., ESPAÑA, ITALIA */
SELECT * FROM dbo.Customers C
WHERE C.Country IN ('USA', 'SPAIN', 'ITALY')
ORDER BY C.Country;
/* 11. Seleccione el producto mas caro y mas barato */
SELECT * FROM dbo.Products P
WHERE P.UnitPrice 
IN (SELECT MAX(P.UnitPrice) FROM dbo.Products P)
UNION 
SELECT * FROM dbo.Products P
WHERE P.UnitPrice 
IN (SELECT MIN(P.UnitPrice) FROM dbo.Products P)



/* 16 */
SELECT * FROM dbo.Orders;
SELECT P.ProductName, O.OrderID, C.CompanyName FROM dbo.Orders O 
INNER JOIN dbo.Customers C ON (C.CustomerID = O.CustomerID)
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
WHERE ShipCountry = 'France';


