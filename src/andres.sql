
-- Enmascaramiento dinámico de datos
/* El enmascaramiento dinámico de datos (DDM) limita la exposición de información confidencial 
al ocultarla a los usuarios sin privilegios */

-- Existen cuatro tipos de máscaras

/*

Valor predeterminado: Enmascaramiento completo de acuerdo con los tipos de datos 
de los campos designados.

Email: Método de enmascaramiento que expone la primera letra de una dirección de correo electrónico
y el sufijo constante ".com"

Random: Una función de enmascaramiento aleatorio que se puede usar con cualquier tipo numérico 
a fin de enmascarar el valor original con uno aleatorio dentro de un intervalo especificado.

Cadena personalizada: Método de enmascaramiento que expone la primera y última letra y 
agrega una cadena de relleno personalizada en el medio. prefix,[padding],suffix

*/

DROP TABLE Membership;
SELECT * FROM Membership;

-- Tabla con columnas enmascaradas
CREATE TABLE Membership(
    MemberID        int IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
    FirstName        varchar(100) MASKED WITH (FUNCTION = 'partial(1, "xxxxx", 1)') NULL,
    LastName        varchar(100) NOT NULL,
    Phone            varchar(12) MASKED WITH (FUNCTION = 'default()') NULL,
    Email            varchar(100) MASKED WITH (FUNCTION = 'email()') NOT NULL,
	DiscountCode    smallint MASKED WITH (FUNCTION = 'random(1, 100)') NULL
    );

-- Insertar datos de muestra
INSERT INTO Membership (FirstName, LastName, Phone, Email, DiscountCode)
VALUES   
('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com', 10),  
('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co', 5),  
('Shakti', 'Menon', '555.123.4570', 'SMenon@contoso.net', 50),  
('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net', 40);  


ALTER TABLE Membership  
ALTER COLUMN LastName ADD MASKED WITH (FUNCTION = 'partial(2,"xxxx",0)');  
