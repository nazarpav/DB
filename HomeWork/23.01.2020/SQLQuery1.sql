--CREATE DATABASE STSHOP
--GO
--CREATE FUNCTION myFunction (
--    @Email_ INT
--)
--RETURNS VARCHAR(5)
--AS
--BEGIN
--    IF EXISTS (SELECT* FROM Customers WHERE Email = @Email_)
--        return 'True'
--    return 'False'
--END

GO
CREATE TABLE Product
(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
QP_Avaiable INT NOT NULL,
Cost INT NOT NULL,
Manufacturer NVARCHAR(150) NOT NULL CHECK (Manufacturer!=''),
[Sale Price] INT NOT NULL
)
GO
CREATE TABLE Sales
(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
Quantity INT NOT NULL,
[Sale Price] INT NOT NULL,
[Sale Date] NVARCHAR NOT NULL
)
--Ще працюю над цим завданням