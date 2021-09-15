
	SELECT CONCAT(FirstName, ' ', LastName, ' - ', EmployeeID) 
	AS EmpleadoID FROM Employees

	SELECT P.ProductName, C.CategoryName, S.CompanyName FROM Products P
	INNER JOIN Suppliers S ON (P.SupplierID = S.SupplierID)
	INNER JOIN Categories C ON (P.CategoryID = C.CategoryID)
	WHERE P.UnitPrice IN (10, 18, 19)
	ORDER BY C.CategoryName


	SELECT FirstName FROM Employees 
	WHERE FirstName LIKE '[a|m]%'
	ORDER BY FirstName


	SELECT ProductID, ProductName, UnitPrice FROM Products 
	WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products)
	UNION ALL
	SELECT ProductID, ProductName, UnitPrice FROM Products 
	WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products)
	
	SELECT TOP 15 CONCAT(E.FirstName, ' ', E.LastName) AS Empleado, O.OrderID,
	O.OrderDate, OS.Subtotal
	FROM Orders O 
	INNER JOIN Employees E ON (O.EmployeeID = E.EmployeeID)
	INNER JOIN [Order Subtotals] OS ON (O.OrderID = OS.OrderID)
	WHERE OrderDate BETWEEN '1996-01-01 00:00:00.000' AND '1996-12-31 00:00:00.000'
	ORDER BY OrderDate ASC

	SELECT O.CustomerID, O.ShipCountry, 
	ODE.ProductName, ODE.Quantity, OS.Subtotal
	FROM Orders O	
	INNER JOIN [Order Details Extended] ODE ON (O.OrderID = ODE.OrderID)
	INNER JOIN [Order Subtotals] OS ON (O.OrderID = OS.OrderID)
	WHERE OrderDate BETWEEN '1998-01-01 00:00:00.000' AND '1998-12-31 00:00:00.000'

	SELECT C.CustomerID, C.CompanyName, C.ContactTitle,
	C.Address, C.City,
		Region = CASE
         WHEN C.REGION IS NULL THEN 'Sin Region'         
        END,
	C.PostalCode,
	C.Country,
	C.Phone,
		FAX = CASE
		 WHEN FAX IS NULL THEN 'Sin Fax'
		END
    FROM Customers C
    WHERE Region IS NULL AND Fax IS NULL
    AND Country = 'Germany'		



