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

