DENY INSERT On SCHEMA::[dbo] To sdb_user
DENY UPDATE On SCHEMA::[dbo] To sdb_user
DENY DELETE On SCHEMA::[dbo] To sdb_user

UPDATE dbo.Customers SET Address = 'Obere Str. 57' WHERE CustomerID = 'ALFKI'

