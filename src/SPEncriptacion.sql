ALTER PROCEDURE SPEncriptacion
	AS
	BEGIN
		DROP TABLE IF EXISTS tiposEncriptacion
		
		CREATE TABLE tiposEncriptacion(
			id INT NOT NULL IDENTITY,
			desCrypt VARCHAR(MAX) NOT NULL,
			desMask VARCHAR(MAX) MASKED WITH (FUNCTION = 'partial(1, "XXXXX", 1)') NOT NULL
		);
		
		IF NOT EXISTS (SELECT * FROM tiposEncriptacion)
		BEGIN
			INSERT INTO tiposEncriptacion(desCrypt, desMask) VALUES 
			('Simétrica', 'Advanced Encryption Standard'), 
			('Asimétrica', 'Rivest, Shamin y Adleman'), ('Flujo', 'Audio y Video'), 
			('Bloques', 'DES Bloques'), ('Estándar de cifrado avanzado', 'AES Estándar');
		END		

		SELECT id, CONVERT(VARBINARY(MAX), ENCRYPTBYPASSPHRASE('FCFM', desCrypt)) AS Encriptacion,
		desMask AS Enmascaramiento FROM tiposEncriptacion

	END




