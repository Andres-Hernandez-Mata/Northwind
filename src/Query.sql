Use Northwind;
/* 1. Seleccionar clientes cuyo pais sea Estados Unidos (EE. UU.) */
SELECT * FROM 
dbo.Customers 
WHERE Country IN ('USA');
/* 2. Seleccionar productos cuya existencia esté entre 15 y 39 piezas */
SELECT * FROM 
dbo.Products 
WHERE UnitsInStock >= 15 AND UnitsInStock <= 39
ORDER BY UnitsInStock;
/* 3. Seleccione los proveedores cuyo cargo de contacto es gerente de marketing */
SELECT * FROM 
dbo.Suppliers 
WHERE ContactTitle LIKE '%Marketing%';
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
/* 12. Seleccione el pedido de envio mas barato, el envio medio y el envio mas caro */
SELECT MIN(OS.Subtotal) ExpensiveShipping, 
MAX(OS.Subtotal) CheapestShipping, 
AVG(OS.Subtotal) AverageShipping
FROM dbo.Orders O
INNER JOIN dbo.[Order Subtotals] OS ON (OS.OrderID = O.OrderID)
/* 13. Inserte un cliente completando todos los campos de la tabla */
INSERT INTO dbo.Customers ( 
CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode,
Country, Phone, Fax
) VALUES ('UANL', 'FCFM', 'LSTI', 'Manager', 'Pedro de Alba S/N, Niños Héroes', 
'San Nicolás', 'MTY', '66451', 'Mexico', '(81) 8329-4001',
'83294045');
SELECT * FROM dbo.Customers C WHERE C.CustomerID = 'UANL';
/* 14. Actualice el nombre del nuevo cliente pasando el número de identificación obtenido en el punto 13 */
UPDATE dbo.Customers SET CompanyName = 'FCFM.LSTI'
WHERE CustomerID = 'UANL';
SELECT * FROM dbo.Customers C WHERE C.CustomerID = 'UANL';
/* 15. Eliminar el cliente insertado en el punto 13 */
DELETE FROM dbo.Customers WHERE CustomerID = 'UANL';
SELECT * FROM dbo.Customers C WHERE C.CustomerID = 'UANL';
/* 16. Seleccione los productos cuyos pedidos (incluidos sus clientes) se enviaron a Francia */
SELECT P.ProductName, O.OrderID, C.CompanyName FROM dbo.Orders O 
INNER JOIN dbo.Customers C ON (C.CustomerID = O.CustomerID)
INNER JOIN dbo.[Order Details] OD ON (OD.OrderID = O.OrderID)
INNER JOIN dbo.Products P ON (P.ProductID = OD.ProductID)
WHERE ShipCountry = 'France';


