SELECT * FROM Customers

CREATE SCHEMA ventas
CREATE SCHEMA administracion 

CREATE LOGIN vendedor
WITH PASSWORD = 'vendedor'	


	CREATE LOGIN dba
	WITH PASSWORD = 'dba'

	CREATE USER dba FOR LOGIN dba
	WITH DEFAULT_SCHEMA = dbo

	GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO dba;



CREATE LOGIN administrador
WITH PASSWORD = 'administrador'

CREATE USER vendedor FOR LOGIN vendedor
WITH DEFAULT_SCHEMA = ventas
CREATE USER administrador FOR LOGIN administrador
WITH DEFAULT_SCHEMA = administracion

SELECT * FROM ventas.Customers
	
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


SELECT * FROM Suppliers WHERE CompanyName = 'LSTI'


SELECT * FROM SYS.sysprocesses

SELECT program_name AS Software, 
login_time AS 'Fecha Hora',
loginame AS Usuario,
COUNT(dbid) AS 'Numero de Conexiones',
status AS Estatus
, cmd as Accion, spid
FROM SYS.sysprocesses
WHERE loginame = 'sdb_user'
GROUP BY dbid, login_time, loginame,
program_name, status, cmd, spid
ORDER BY COUNT( dbid ) DESC

	SELECT * FROM Orders, [Order Details], 
	Products, Suppliers, Shippers, Categories

KILL 66

sp_who2


	SELECT login_time, loginame, status, spid FROM sys.sysprocesses
	WHERE loginame = 'sdb_user' and status in ('sleeping')

	IF EXISTS (SELECT login_time, loginame, status, spid FROM sys.sysprocesses
		WHERE loginame = 'sdb_user' and status in ('sleeping'))
	BEGIN
		DECLARE @id_session INT
		SELECT @id_session = spid FROM sys.sysprocesses
			WHERE loginame = 'sdb_user' and status in ('sleeping')
		BEGIN
			EXEC ('Kill ' + @id_session)
		END
	End


SELECT * FROM Membership;

GRANT UNMASK TO sdb_user
DENY UNMASK TO sa



	CREATE DATABASE Empresa

	CREATE TABLE DatosSensibles(
		idCliente int identity primary key not null,
		nombreCliente varchar (50) not null,
		apellidoCliente varchar (50) not null,
		edad int not null,
		direccion nvarchar (100)
	)

	CREATE LOGIN CEO WITH PASSWORD = '<@CEO@>'
    MUST_CHANGE, 
	CHECK_EXPIRATION = ON,
	CHECK_POLICY = ON;

	CREATE LOGIN Trabajador WITH PASSWORD = '<@Trabajador@>'
    MUST_CHANGE, 
	CHECK_EXPIRATION = ON,
	CHECK_POLICY = ON;

	CREATE USER CEO FOR LOGIN CEO
    WITH DEFAULT_SCHEMA = Admin;

	CREATE USER Trabajador FOR LOGIN Trabajador
    WITH DEFAULT_SCHEMA = Empleado;

	GRANT SELECT ON OBJECT::ventas.Customers
	TO vendedor

	GRANT SELECT, INSERT, UPDATE, DELETE ON OBJECT::dbo.DatosSensibles
	TO CEO
	GRANT INSERT ON OBJECT::dbo.DatosSensibles
	TO Trabajador


		USE Northwind

		CREATE SERVER AUDIT [Audit-20211009-061147]
		TO FILE 
		(	FILEPATH = N'D:\Auditor'
			,MAXSIZE = 0 MB
			,MAX_ROLLOVER_FILES = 2147483647
			,RESERVE_DISK_SPACE = OFF
		) WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE)

		BACKUP DATABASE [Northwind] TO DISK = 'D:\Auditor\BackupNorthwind.bak'

		CREATE DATABASE AUDIT SPECIFICATION [DatabaseAuditSpecification-20211009-062452]
	FOR SERVER AUDIT [Audit-20211009-061147]
	ADD (SELECT ON DATABASE::[Northwind] BY [dbo]),
	ADD (INSERT ON DATABASE::[Northwind] BY [dbo]),
	ADD (UPDATE ON DATABASE::[Northwind] BY [dbo]),
	ADD (DELETE ON DATABASE::[Northwind] BY [dbo])

	SELECT * FROM dbo.Categories WHERE CategoryName = 'Monitores'
	INSERT INTO dbo.Categories VALUES ('Monitores', '', '')
	UPDATE dbo.Categories SET Description = 'LG' WHERE CategoryName = 'Monitores'
	DELETE FROM dbo.Categories WHERE CategoryName = 'Monitores'

	RESTORE DATABASE [Northwind] FROM  DISK = N'D:\Auditor\BackupNorthwind.bak' 
	WITH  FILE = 1,  NOUNLOAD,  STATS = 5


	ALTER PROCEDURE SPEncriptacion
	AS
	BEGIN
		DROP TABLE IF EXISTS tiposEncriptacion
		
		CREATE TABLE tiposEncriptacion(
			id INT NOT NULL IDENTITY,
			desCrypt VARCHAR(MAX) NOT NULL,
			desMask VARCHAR(MAX) NOT NULL
		)

		INSERT INTO tiposEncriptacion VALUES ('Simétrica', 'Advanced Encryption Standard'), 
		('Asimétrica', 'Rivest, Shamin y Adleman'), ('Flujo', 'Audio y Video'), 
		('Bloques', 'DES Bloques'), ('Estándar de cifrado avanzado', 'AES Estándar');

		SELECT CONVERT(VARBINARY(MAX), ENCRYPTBYPASSPHRASE('FCFM', desCrypt)) AS Encriptacion
		FROM tiposEncriptacion

		ALTER TABLE tiposEncriptacion  
		ALTER COLUMN desMask ADD MASKED WITH (FUNCTION = 'partial(1,"XXXX",1)');

		SELECT * FROM tiposEncriptacion

	END


	GRANT EXECUTE ON OBJECT::dbo.VerInformacion TO sdb_user

	GRANT ALTER, SELECT
	ON SCHEMA::dbo
	TO sdb_user



	CREATE PROCEDURE OcultarInformacion
	AS
	BEGIN
		DROP TABLE IF EXISTS lsbd_EncryMask
		
		CREATE TABLE lsbd_EncryMask(
			id INT NOT NULL IDENTITY,
			infoEncryNombre VARCHAR(MAX) NOT NULL,
			infoMaskDireccion VARCHAR(MAX) MASKED WITH (FUNCTION = 'partial(1, "XXXXX", 1)') NOT NULL,
			infoMaskTelefono VARCHAR(MAX) MASKED WITH (FUNCTION = 'default()') NOT NULL,
			infoMaskEmail VARCHAR(MAX) MASKED WITH (FUNCTION = 'email()') NOT NULL
		);
		
		IF NOT EXISTS (SELECT * FROM lsbd_EncryMask)
		BEGIN
			INSERT INTO lsbd_EncryMask(infoEncryNombre, infoMaskDireccion, infoMaskTelefono,
			infoMaskEmail) VALUES 
			('Andres', 'San Pedro', '8181378772', 'andres@gmail.com'), 
			('Juan', 'Santa Catarina', '8181984162', 'juan@gmail.com'),
			('Angel', 'Monterrey', '8681883164', 'angel@hotmail.com'),
			('Luis', 'China Nuevo Leon', '8486483149', 'luis@uanl.com'),
			('Missael', 'Guadalupe', '8746389151', 'missael@uanl.com');
		END		

		SELECT id, CONVERT(VARBINARY(MAX), ENCRYPTBYPASSPHRASE('LSTI', infoEncryNombre)) 
		AS infoEncryNombre, infoMaskDireccion, infoMaskTelefono, infoMaskEmail
		FROM lsbd_EncryMask

	END

	
GRANT UNMASK TO system_user
REVOKE UNMASK TO sdb_user


SELECT system_user;

SELECT * FROM lsbd_EncryMask



USE Northwind EXEC sp_changedbowner 'sa'


GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON OBJECT::dbo.lsbd_EncryMask
TO sdb_user

GRANT UPDATE,INSERT,DELETE,SELECT,ALTER ON dbo.lsbd_EncryMask TO sdb_user;

GRANT EXECUTE ON OBJECT::dbo.VerInformacion  
    TO sdb_user;  


	DROP TABLE lsbd_EncryMask

	CREATE DATABASE AdventureWorksLT2019


	RESTORE DATABASE AdventureWorksLT2019 FROM 
	DISK = N'D:\MS Teams\Seguridad en Base de Datos\SQL\AdventureWorksLT2019\AdventureWorksLT2019.bak'
	WITH  FILE = 1,  NOUNLOAD,  STATS = 5

	RESTORE DATABASE [Northwind] FROM  DISK = N'D:\Auditor\BackupNorthwind.bak' 
	

	ALTER AUTHORIZATION ON DATABASE::AdventureWorksLT2017 TO dba;


	EXEC SP_CHANGEDBOWNER dba

	EXEC sp_changedbowner 'dba'

	ALTER ROLE [db_owner] ADD MEMBER [dba]



