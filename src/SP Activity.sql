SELECT * FROM Customers;

ALTER PROCEDURE SPCustomers (
		@CustomerID		VARCHAR(5),
		@CompanyName	VARCHAR(40) = NULL,
		@ContactName	VARCHAR(30) = NULL,
		@ContactTitle	VARCHAR(30) = NULL,
		@Address		VARCHAR(60) = NULL,
		@City			VARCHAR(15) = NULL,
		@Region			VARCHAR(15) = NULL,
		@PostalCode		VARCHAR(10) = NULL,
		@Country		VARCHAR(15) = NULL,
		@Phone			VARCHAR(24) = NULL,
		@Fax			VARCHAR(24) = NULL,
		@Accion			CHAR(15)    = NULL
	)
AS
BEGIN
	
	IF @Accion = 'SELECT'
	BEGIN
		IF EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
			SELECT *
			FROM Customers
			WHERE CustomerID = @CustomerID
		ELSE
			SELECT CONCAT('El cliente ', @CustomerID, ' no se encuentra en la base de datos') AS Mensaje
	END

	ELSE IF @Accion = 'INSERT'
	BEGIN
		IF NOT EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
			INSERT INTO Customers
			VALUES (
				@CustomerID,
				@CompanyName,
				@ContactName,	
				@ContactTitle,
				@Address,
				@City,
				@Region,
				@PostalCode,
				@Country,
				@Phone,
				@Fax
				)
		ELSE
			SELECT CONCAT('El cliente ', @CustomerID, ' ya existe en la base de datos') AS Mensaje
	END

	ELSE IF @Accion = 'UPDATE'
	BEGIN
		IF EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
			UPDATE Customers			
			SET	CompanyName  = @CompanyName,
				ContactName  = @ContactName,	
				ContactTitle = @ContactTitle,
				Address      = @Address,
				City         = @City,
				Region       = @Region,
				PostalCode   = @PostalCode,
				Country      = @Country,
				Phone        = @Phone,
				Fax          = @Fax
			WHERE CustomerID = @CustomerID
		ELSE
			SELECT CONCAT('El cliente ', @CustomerID, ' no se encuentra en la base de datos') AS Mensaje
	END

	ELSE IF @Accion = 'DELETE'
	BEGIN
		IF EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
			DELETE
			FROM Customers
			WHERE CustomerID = @CustomerID
		ELSE
			SELECT CONCAT('El cliente ', @CustomerID, ' no se encuentra en la base de datos') AS Mensaje
	END

	ELSE IF @Accion = '' OR @Accion IS NULL 
	BEGIN
		SELECT 'Favor de seleccionar una de las siguientes acciones SELECT, INSERT, UPDATE O DELETE' AS Mensaje
	END

	EXEC ('DROP VIEW IF EXISTS Exercise')
	EXEC ('CREATE VIEW Exercise AS
		SELECT E.FirstName AS Employee, C.CompanyName AS Customer, P.ProductName AS Product,
		OD.Discount FROM Employees E
		INNER JOIN Orders O ON (O.EmployeeID = E.EmployeeID)
		INNER JOIN Customers C ON (C.CustomerID = O.CustomerID)
		INNER JOIN [Order Details] OD ON (OD.OrderID = O.OrderID)
		INNER JOIN Products P ON (P.ProductID = OD.ProductID)
		WHERE OD.Discount > .10')

END


EXEC SPCustomers 'LSTI', 'UANL', 'FCFM', 'Owner', 'Mataderos  2312',
	'M?xico N.L', 'SP', '05023', '05023', '(5) 555-3932', '(5) 555-3745', 'INSERT';

SELECT * FROM Exercise
