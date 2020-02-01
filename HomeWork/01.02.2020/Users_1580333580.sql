------------------------TASK_1
GO
CREATE USER Dima WITHOUT LOGIN
GO
DENY SELECT ON dbo.Seller TO Dima


------------------------------TASK_2
GO
CREATE USER Sasko WITHOUT LOGIN
GO
GRANT SELECT, INSERT, UPDATE ON dbo.Seller TO Sasko

-----------------------------------------TASK_3
GO
CREATE USER Mariia WITHOUT LOGIN
ALTER ROLE  db_owner ADD member MaHBSDHriiaIJ

--------------------------------TASK_4
GO
CREATE USER Pavlo WITHOUT LOGIN
GO
GRANT SELECT  ON dbo.Sales TO Pavlo
GRANT UPDATE ON Shop.dbo.Sales(Price, Amount) TO Pavlo


-----------------------------TASK_5
GO
CREATE USER Nazar WITHOUT LOGIN
GO
GRANT INSERT, DELETE ON dbo.Clients TO Nazar


------------------------TASK_6
GO
CREATE USER Tolyan WITHOUT LOGIN
GO
ALTER ROLE  db_denydatawriter ADD member Tolyan


--------------------TASK_7
GO
CREATE USER Bohdan WITHOUT LOGIN
GO
ALTER ROLE  db_datawriter ADD member Bohdan


---------------------------TASK_8
GO
CREATE USER Misha WITHOUT LOGIN
GO
CREATE USER Anna WITHOUT LOGIN
GO
GRANT SELECT, UPDATE ON dbo.Product TO Misha, Anna
DENY  SELECT, UPDATE ON dbo.Product(Price) TO Misha, Anna


