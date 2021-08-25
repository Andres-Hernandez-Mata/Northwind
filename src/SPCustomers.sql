SELECT * FROM Customers;

CREATE PROCEDURE SPCustomers (
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
		@Accion			CHAR(15)
	)
AS
BEGIN
	
	IF @Accion = 'SELECT'
	BEGIN
		SELECT *
		FROM Customers
	END

	ELSE IF @Accion = 'INSERT'
	BEGIN
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
	END

	ELSE IF @Accion = 'UPDATE'
	BEGIN
		UPDATE Customers
		SET CustomerID   = @CustomerID,
			CompanyName  = @CompanyName,
			ContactName  = @ContactName,	
			ContactTitle = @ContactTitle,
			Address      = @Address,
			City         = @City,
			Region       = @Region,
			PostalCode   = @PostalCode,
			Country      = @Country,
			Phone        = @Phone,
			Fax          = @Fax
	END

	ELSE IF @Accion = 'DELETE'
	BEGIN
		DELETE
		FROM Customers
		WHERE CustomerID = @CustomerID
	END

END