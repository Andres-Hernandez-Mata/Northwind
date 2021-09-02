
DROP TABLE dbo.FacturasProveedor;

CREATE TABLE Proveedores(
	idProveedor int IDENTITY(1,1) NOT NULL,
	razonSocial varchar(60) NOT NULL,
	rfc varchar(13) NOT NULL,
	direccion varchar(60) NOT NULL,
	telefono varchar(20),
	email varchar(30),
	CONSTRAINT idPoveedor PRIMARY KEY (idProveedor),
	CONSTRAINT rfc UNIQUE (rfc)
)

SELECT * FROM Proveedores

CREATE TABLE FacturasProveedor(
	idFactura int IDENTITY(1,1) NOT NULL,
	proveedorRfc varchar(13) NOT NULL,
	folioFiscal varchar(255) NOT NULL,
	fechaEmision date NOT NULL,
	descripcion varchar(255) NOT NULL,
	estatus varchar(5) NOT NULL,
	total float NOT NULL,
	formaPago int NOT NULL,
	metodoPago varchar(255) NOT NULL,
	usoCfdi varchar(255) NOT NULL,
	claveProducto int NOT NULL,
	claveUnidad varchar(255) NOT NULL,
	CONSTRAINT idFactura PRIMARY KEY (idFactura),	
	CONSTRAINT proveedorRfcFacturasProveedor FOREIGN KEY (proveedorRfc)
    REFERENCES Proveedores(rfc)
)

SELECT * FROM FacturasProveedor

CREATE TABLE FacturasRechazadas(
	idError int IDENTITY(1,1) NOT NULL,
	folioFiscal varchar(255) NOT NULL,
	proveedorRfc varchar(13) NOT NULL,
	fechaRechazo datetime DEFAULT GETDATE() NOT NULL,
	descripcionError varchar(255) NOT NULL,
	CONSTRAINT idError PRIMARY KEY (idError),	
	CONSTRAINT proveedorRfcFacturasRechazadas FOREIGN KEY (proveedorRfc)
    REFERENCES Proveedores(rfc)
)

SELECT * FROM FacturasRechazadas

CREATE TABLE DatosValidacionFacturas(
	idDato int IDENTITY(1,1) NOT NULL,
	valor varchar(255) NOT NULL,
	descripcion varchar(255) NOT NULL,
	estatus varchar(5) NOT NULL,
	CONSTRAINT idDato PRIMARY KEY (idDato)
)

SELECT * FROM DatosValidacionFacturas