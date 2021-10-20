CREATE PROCEDURE OcultarInformacion
AS
BEGIN
	DROP TABLE IF EXISTS lsbd_EncryMask
		
	CREATE TABLE lsbd_EncryMask(
		id INT NOT NULL IDENTITY,
		infoEncryNombre VARBINARY(MAX) NOT NULL,
		infoMaskDireccion VARCHAR(MAX) MASKED WITH (FUNCTION = 'partial(1, "XXXXX", 1)') NOT NULL,
		infoMaskTelefono VARCHAR(MAX) MASKED WITH (FUNCTION = 'default()') NOT NULL,
		infoMaskEmail VARCHAR(MAX) MASKED WITH (FUNCTION = 'email()') NOT NULL
	);
		
	IF NOT EXISTS (SELECT * FROM lsbd_EncryMask)
	BEGIN
		INSERT INTO lsbd_EncryMask(infoEncryNombre, infoMaskDireccion, infoMaskTelefono,
		infoMaskEmail) VALUES 		
		(ENCRYPTBYPASSPHRASE('LSTI', 'Andres'), 
		'CALLE AGUSTIN LARA NO. 69-B', '8181378772', 'andres@gmail.com'), 
		(ENCRYPTBYPASSPHRASE('LSTI', 'Juan'), 
		'AV. INDEPENDENCIA NO. 241', '8281984162', 'juan@hotmail.com'),
		(ENCRYPTBYPASSPHRASE('LSTI', 'Angel'), 
		'CALLE MATAMOROS NO. 40', '8681883164', 'angel@gmail.com'),
		(ENCRYPTBYPASSPHRASE('LSTI', 'Luis'), 
		'C. GUADALUPE VICTORIA NO 373', '8486483149', 'luis@hotmail.com'),
		(ENCRYPTBYPASSPHRASE('LSTI', 'Missael'), 
		'AV. MANCILLA ESQ. ALDAMA S/N', '8746389151', 'missael@gmail.com');
	END		

	SELECT id, CONVERT(VARBINARY(MAX), ENCRYPTBYPASSPHRASE('LSTI', infoEncryNombre)) 
	AS infoEncryNombre, infoMaskDireccion, infoMaskTelefono, infoMaskEmail
	FROM lsbd_EncryMask

END

EXEC OcultarInformacion

DROP TABLE lsbd_EncryMask