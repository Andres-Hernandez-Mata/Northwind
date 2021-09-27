SELECT * FROM Customers

	CREATE SCHEMA ventas
	CREATE SCHEMA administracion 

	CREATE LOGIN vendedor
	WITH PASSWORD = 'vendedor'			
	CREATE LOGIN administrador
	WITH PASSWORD = 'administrador'

	CREATE USER vendedor FOR LOGIN vendedor
	WITH DEFAULT_SCHEMA = ventas	CREATE USER administrador FOR LOGIN administrador
	WITH DEFAULT_SCHEMA = administracion	SELECT * FROM ventas.Customers	
	GRANT SELECT ON OBJECT::ventas.Orders
	TO vendedor
	GRANT INSERT ON OBJECT::ventas.Orders
	TO vendedor
	GRANT SELECT ON OBJECT::ventas.[Order Details]
	TO vendedor
	GRANT INSERT ON OBJECT::ventas.[Order Details]
	TO vendedor
	GRANT SELECT ON OBJECT::ventas.Customers
	TO vendedor

	SELECT * INTO administracion.Categories FROM dbo.Categories
	SELECT * INTO administracion.CustomerCustomerDemo FROM dbo.CustomerCustomerDemo
	SELECT * INTO administracion.CustomerDemographics FROM dbo.CustomerDemographics
	SELECT * INTO administracion.Employees FROM dbo.Employees
	SELECT * INTO administracion.EmployeeTerritories FROM dbo.EmployeeTerritories	
	SELECT * INTO administracion.Products FROM dbo.Products
	SELECT * INTO administracion.Proveedores FROM dbo.Proveedores
	SELECT * INTO administracion.Region FROM dbo.Region
	SELECT * INTO administracion.Shippers FROM dbo.Shippers
	SELECT * INTO administracion.Suppliers FROM dbo.Suppliers
	SELECT * INTO administracion.Territories FROM dbo.Territories
	
	GRANT SELECT
	ON SCHEMA::ventas
	TO vendedor
	WITH GRANT OPTION
	GO

	GRANT SELECT, INSERT, UPDATE
	ON SCHEMA::ventas
	TO administrador
	WITH GRANT OPTION
	GO

	SELECT * FROM dbo.Customers

	INSERT INTO dbo.Employees (LastName, FirstName) VALUES ('Hernandez', 'Andres')

	INSERT INTO ventas.Customers (CustomerID, CompanyName) VALUES ('HDZM', 'Hernandez')

	SELECT * FROM ventas.Customers


