	
CREATE TABLE Proveedores(
	idProveedor int IDENTITY(1,1) NOT NULL,
	razonSocial varchar(60) NOT NULL,
	rfc varchar(13) NOT NULL,
	direccion varchar(60) NOT NULL,
	telefono varchar(20),
	email varchar(30),
	CONSTRAINT idPoveedor PRIMARY KEY (idProveedor)	
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
	CONSTRAINT idFactura PRIMARY KEY (idFactura)	
)

SELECT * FROM FacturasProveedor

CREATE TABLE FacturasRechazadas(
	idError int IDENTITY(1,1) NOT NULL,
	folioFiscal varchar(255) NOT NULL,
	proveedorRfc varchar(13) NOT NULL,
	fechaRechazo datetime DEFAULT GETDATE() NOT NULL,
	descripcionError varchar(255) NOT NULL,
	CONSTRAINT idError PRIMARY KEY (idError)
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


ALTER PROCEDURE Facturas AS
BEGIN
	/* Borrar el contenido de todas las tablas */
	DELETE FROM Proveedores
	DELETE FROM FacturasProveedor
	DELETE FROM FacturasRechazadas
	DELETE FROM DatosValidacionFacturas

	/* 1. Generar inserts de forma manual con datos ficticios para la tabla de Proveedores tomando como referencia el rfc de los inserts para FacturasProveedor */
	INSERT INTO Proveedores (razonSocial,rfc,direccion) VALUES 
		('Arcos Dorados, C.A.','NOCI880504LT5','Obere Str. 57'), 
		('Carlos Fernández, E. I. R.','FCT690317MW6','Avda. de la Constitución 2222'),
		('Chascomús, S.A. de C.V.','SRM980701STA','Mataderos  2312'),
		('Importaciones PFV.','TLE1211165V0','120 Hanover Sq.'),
		('Grupo Fernández, S.A.','YEGJ5604277XA','Forsterstr. 57'),
		('PepsiCo, Inc.','TACR630510Q14','Cerrito 333'),
		('Juan Fernández','IHS0009013W2','Obere Str. 57'),
		('Banco Bilbao Vizcaya Argentaria S.A.','REF960307LI1','Avda. de la Constitución 2222'),
		('Restaurantes McDonalds S.A.','PFA160506KF3','Mataderos  2312'),
		('Grupo Hernández, S.A.','FMA991109GT7','120 Hanover Sq.'),
		('BMW Ibérica S.A.','JANM570414JP8','Forsterstr. 57'),
		('Air Europa Líneas Aéreas S.A.','LIN080507S67','Cerrito 333'),		
		('Punto FA S.L.','OCE050214NX3','Avda. de la Constitución 2222'),
		('Asociados S.A.','MAJR50050165A','Mataderos  2312'),
		('Grupo López, S.A.','MMI950125KG8','120 Hanover Sq.');

	/* 2. Corregir los errores de sintaxis y copiar los inserts que vienen en el txt DatosFacturas y pegar los dentro del procedimiento */
	INSERT INTO FacturasProveedor (proveedorRfc,folioFiscal,fechaEmision,descripcion,estatus,total,formaPago,metodoPago,usoCfdi,claveProducto,claveUnidad) VALUES 
		('NOCI880504LT5','8A917F1F-1308-4468-81D8-CB308CEF34D7',CONVERT(DATE, '09/09/20'),'MANTENIMIENTO MES DE SEPTIEMBRE','',18001.47,'03','PUE','P01','80131502','E48'),
		('NOCI880504LT5','D9C22F37-D82C-41F7-A16C-C0F8BB54F622',CONVERT(DATE, '09/09/20'),'Pago','',0,'03','PUE','P01','84111506','ACT'),
		('NOCI880504LT5','2646EBA1-47A6-4B16-81A7-D996949D840C',CONVERT(DATE, '09/09/20'),'RENTA MES DE SEPTIEMBRE','',11095.35,'03','PUE','P01','80131502','E48'),
		('FCT690317MW6','21EF03C0-0329-F94A-8556-B9A9396A2444',CONVERT(DATE, '09/09/20'),'Pago','',0,'03','PPD','P01','84111506','ACT'),
		('FCT690317MW6','3C96BCB0-E7CB-4B4E-ACFA-622CEBEA171F',CONVERT(DATE, '09/09/20'),'RENTA DEL MES ABRIL 2020','',53337.84,'99','PPD','G03','80131500','E48'),
		('FCT690317MW6','E1935A56-A266-D449-ADF5-2FA3DE9762C1',CONVERT(DATE, '01/09/20'),'RENTA DEL MES SEPTIEMBRE 2020','',152393.84,'99','PPD','G03','80131500','E48'),
		('SRM980701STA','25d93860-1d81-4d2d-b5c5-ec72895067f1',CONVERT(DATE,'01/09/20'),'SERVICIOS ADMINISTRATIVOS (RED,AGUA,LUZ) SEPTIEMBRE 2020','',273528.97,'99','PPD','G03','80101500','E48'),
		('SRM980701STA','2b69d9da-2f49-43bb-b0d9-5e84b4d33b41',CONVERT(DATE, '04/09/20'),'SERVICIOS ADMINISTRATIVOS JULIO 2020','',60920.46,'99','PPD','G03','80101500','NA'),
		('YEGJ5604277XA','391CE067-A741-4BA9-B103-97D08A5EA97D',CONVERT(DATE, '09/09/20'),'RENTA DE LOCAL UBICADO EN: SEPTIEMBRE 2020','',25870.3,'03','PUE','G03','80131502','E48'),
		('TACR630510Q14','2FB40C4E-F457-4A97-BE7C-A14494207846',CONVERT(DATE, '08/09/20'),'RENTA DEL LOCAL, MES DE SEPTIEMBRE DE 2020','',32370.25,'03','PUE','G03','80131502','E48'),
		('IHS0009013W2','99d60adc-c19d-449a-a238-b18aeb929b58',CONVERT(DATE, '09/09/20'),'Renta','',145000,'03','PUE','G03','80131503','E48'),
		('REF960307LI1','6972432E-293E-4E1F-BE3D-F069505F3BBE',CONVERT(DATE, '10/09/20'),'RENTA DE LOCAL COMERCIAL MES DE SEPTIEMBRE DE 2020','',211077.53,'99','PPD','P01','80131502','CE'),
		('PFA160506KF3','EDE43C91-E872-45EC-AD5C-BC15899BE190',CONVERT(DATE, '01/09/20'),'RENTA DE LOCAL INDUSTRIAL MES DE SEPTIEMBRE DE 2020','',1452,'03','PUE','G03','80131501','E48'),
		('FMA991109GT7','8ffb0ced-4e8c-4b74-a638-5999d71a5dc0',CONVERT(DATE, '12/09/20'),'RENTAS DE LOCAL COMERCIAL','',208744.04,'03','PUE','G03','80131500','MTK'),
		('JANM570414JP8','DAEC6444-564D-42EA-991B-13FFE6CE18EC',CONVERT(DATE, '01/09/20'),'RENTA DEL MES DE SEPTIEMBRE DEL  2020','',108635.85,'03','PUE','G03','80131500','MON'),
		('LIN080507S67','710CDAF7-C550-42CD-A2EE-FF6C33BB6376',CONVERT(DATE, '01/09/20'),'MANTENIMIENTO SEPTIEMBRE 2020. CUENTA 10-005-008','',492.03,'99','PPD','G03','72101507','E48'),
		('TLE1211165V0','5A8828CB-F521-11EA-9678-00155D014407',CONVERT(DATE, '12/09/20'),'Intereses moratorios por atraso en el pago','',7020.24,'03','PUE','G03','84101703','E48'),
		('OCE050214NX3','09487E8B-901F-4710-91A3-208D3C51D8BF',CONVERT(DATE, '01/09/20'),'RENTA DE LOCAL COMERCIAL E INDUSTRIAL','',30304.93,'03','PUE','P01','80131502','E48'),
		('MAJR50050165A','AAA148DB-6A0E-4305-B0D1-A95F702F6970',CONVERT(DATE, '03/09/20'),'RENTA DEL MES DE SEPTIEMBRE DEL 2020','',44633.19,'03','PUE','G03','80131500','E48'),
		('MMI950125KG8','037F7C5A-11A2-4375-B622-65F4B3F29A17',CONVERT(DATE, '01/09/20'),'COMISIONES','',1113.6,'03','PUE','G03','84121500','E48');

	/* 3. Copiar los inserts que vienen en el archivo DatosValidacion.sql y pegar los dentro del procedimiento */	
	INSERT INTO DatosValidacionFacturas (valor,descripcion,estatus) VALUES ('80131502','Clave Producto/Servicio','SI'),
		('80131500','Clave Producto/Servicio','SI'),('84111506','Clave Producto/Servicio','SI'),
		('03','Forma de Pago','SI'),('P01','Uso CFDI','SI'),('PUE','Metodo de Pago','SI'),
		('DLS','Metodo de Pago','NO'),('30181800','Clave Producto/Servicio','NO'),
		('H87','Clave Unidad','NO'),('40','Clave Unidad','NO'),('01','Forma de Pago','NO'),
		('E48','Clave Unidad','SI'),('G03','Uso CFDI','SI'),('PPD','Metodo de Pago','SI'),
		('02','Forma de Pago','SI'),('ACT','Clave Unidad','SI'),('99','Forma de Pago','SI');

	/* 4. Deben validar que cada registro de la tabla de FacturasProveedor... */



END

EXEC Facturas;



DBCC CHECKIDENT ('Proveedores', RESEED, 0)
DBCC CHECKIDENT ('FacturasProveedor', RESEED, 0)
DBCC CHECKIDENT ('FacturasRechazadas', RESEED, 0)
DBCC CHECKIDENT ('DatosValidacionFacturas', RESEED, 0)
