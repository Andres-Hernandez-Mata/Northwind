CREATE PROCEDURE AdventureWorksLT2017 
AS
BEGIN

	IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'desarrollo')
	BEGIN
		EXEC ('CREATE SCHEMA desarrollo;');
		CREATE LOGIN desarrollador
		WITH PASSWORD = 'desarrollador';

		CREATE USER desarrollador FOR LOGIN desarrollador
		WITH DEFAULT_SCHEMA = desarrollo;
	END;

	IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'qa')
	BEGIN
		EXEC ('CREATE SCHEMA qa;');
		CREATE LOGIN tester
		WITH PASSWORD = 'tester';

		CREATE USER tester FOR LOGIN tester
		WITH DEFAULT_SCHEMA = qa;
	END;

	IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'productivo')
	BEGIN
		EXEC ('CREATE SCHEMA productivo;');
	END;			

	SELECT * INTO desarrollo.Address FROM SalesLT.Address
	SELECT * INTO desarrollo.Customer FROM SalesLT.Customer
	SELECT * INTO desarrollo.CustomerAddress FROM SalesLT.CustomerAddress
	SELECT * INTO desarrollo.Product FROM SalesLT.Product
	SELECT * INTO desarrollo.ProductCategory FROM SalesLT.ProductCategory
	SELECT * INTO desarrollo.ProductDescription FROM SalesLT.ProductDescription
	SELECT * INTO desarrollo.ProductModel FROM SalesLT.ProductModel
	SELECT * INTO desarrollo.ProductModelProductDescription FROM SalesLT.ProductModelProductDescription
	SELECT * INTO desarrollo.SalesOrderDetail FROM SalesLT.SalesOrderDetail
	SELECT * INTO desarrollo.SalesOrderHeader FROM SalesLT.SalesOrderHeader

	SELECT * INTO qa.Address FROM SalesLT.Address
	SELECT * INTO qa.Customer FROM SalesLT.Customer
	SELECT * INTO qa.CustomerAddress FROM SalesLT.CustomerAddress
	SELECT * INTO qa.Product FROM SalesLT.Product
	SELECT * INTO qa.ProductCategory FROM SalesLT.ProductCategory
	SELECT * INTO qa.ProductDescription FROM SalesLT.ProductDescription
	SELECT * INTO qa.ProductModel FROM SalesLT.ProductModel
	SELECT * INTO qa.ProductModelProductDescription FROM SalesLT.ProductModelProductDescription
	SELECT * INTO qa.SalesOrderDetail FROM SalesLT.SalesOrderDetail
	SELECT * INTO qa.SalesOrderHeader FROM SalesLT.SalesOrderHeader

	SELECT * INTO productivo.Address FROM SalesLT.Address
	SELECT * INTO productivo.Customer FROM SalesLT.Customer
	SELECT * INTO productivo.CustomerAddress FROM SalesLT.CustomerAddress
	SELECT * INTO productivo.Product FROM SalesLT.Product
	SELECT * INTO productivo.ProductCategory FROM SalesLT.ProductCategory
	SELECT * INTO productivo.ProductDescription FROM SalesLT.ProductDescription
	SELECT * INTO productivo.ProductModel FROM SalesLT.ProductModel
	SELECT * INTO productivo.ProductModelProductDescription FROM SalesLT.ProductModelProductDescription
	SELECT * INTO productivo.SalesOrderDetail FROM SalesLT.SalesOrderDetail
	SELECT * INTO productivo.SalesOrderHeader FROM SalesLT.SalesOrderHeader

	GRANT SELECT, INSERT, UPDATE, DELETE
	ON SCHEMA::desarrollo
	TO desarrollador

	GRANT SELECT, INSERT, UPDATE, DELETE
	ON SCHEMA::qa
	TO tester

	ALTER TABLE SalesLT.Customer
	ALTER COLUMN EmailAddress VARCHAR(100) MASKED WITH (FUNCTION = 'default()');

	ALTER TABLE SalesLT.Customer
	ALTER COLUMN Phone VARCHAR(100) MASKED WITH (FUNCTION = 'default()');

	ALTER TABLE SalesLT.SalesOrderHeader
	ALTER COLUMN AccountNumber VARCHAR(100) MASKED WITH (FUNCTION = 'default()');

END

EXEC AdventureWorksLT2017

	SELECT * FROM SalesLT.Customer

	ALTER AUTHORIZATION ON DATABASE::AdventureWorksLT2017 TO dba;
	SELECT name as [DB Name],
    suser_sname(owner_sid) as [Owner] 
	FROM sys.databases
	WHERE name='AdventureWorksLT2017'


	ALTER TABLE tblCliente  ADD C_RUT_encriptado varbinary(MAX) 
