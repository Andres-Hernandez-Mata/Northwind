CREATE SCHEMA class_sbd

CREATE TABLE Prueba(
	id INT
)


DENY INSERT On SCHEMA::dbo To sdb_user

UPDATE dbo.Customers SET Address = 'Obere Str. 57' WHERE CustomerID = 'ALFKI'

SELECT * FROM SYS.sysprocesses

SELECT hostname AS Servidor, 
login_time AS 'Fecha Hora',
loginame AS Usuario,
COUNT(dbid) AS 'Numero de Conexiones'
FROM SYS.sysprocesses
GROUP BY dbid, login_time, hostname, loginame
ORDER BY COUNT( dbid ) DESC


KILL 66

sp_who2



SELECT * FROM Membership;


	EXEC SPEncriptacion

	EXEC OcultarInformacion;

	EXEC VerInformacion;

	GRANT UNMASK

	SELECT * FROM lsbd_EncryMask;

	DENY UNMASK TO sdb_user

	INSERT INTO lsbd_EncryMask(infoEncryNombre, infoMaskDireccion, infoMaskTelefono,
		infoMaskEmail) VALUES 
		(ENCRYPTBYPASSPHRASE('LSTI', 'Andres'), 'CALLE AGUSTIN LARA NO. 69-B', '8181378772', 'andres@gmail.com'), 
		(ENCRYPTBYPASSPHRASE('LSTI', 'Juan'), 'AV. INDEPENDENCIA NO. 241', '8281984162', 'juan@hotmail.com'),
		(ENCRYPTBYPASSPHRASE('LSTI', 'Angel'), 'CALLE MATAMOROS NO. 40', '8681883164', 'angel@gmail.com'),
		(ENCRYPTBYPASSPHRASE('LSTI', 'Luis'), 'C. GUADALUPE VICTORIA NO 373', '8486483149', 'luis@hotmail.com'),
		(ENCRYPTBYPASSPHRASE('LSTI', 'Missael'), 'AV. MANCILLA ESQ. ALDAMA S/N', '8746389151', 'missael@gmail.com');