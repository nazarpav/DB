--CREATE DATABASE STSHOP
--GO
--CREATE FUNCTION CheckCustomerExist_ (
--    @Email_ NVARCHAR(75)
--)
--RETURNS VARCHAR(5)
--AS
--BEGIN
--    IF EXISTS (SELECT* FROM Customers WHERE Email = @Email_)
--        return 'True'
--    return 'False'
--END

--GO
--CREATE TABLE Product
--(
--Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
--[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
--QP_Avaiable INT NOT NULL,
--Cost INT NOT NULL,
--Manufacturer NVARCHAR(150) NOT NULL CHECK (Manufacturer!=''),
--[Sale Price] INT NOT NULL
--)
--GO
--CREATE TABLE Sales
--(
--Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
--[Product Id] INT NOT NULL FOREIGN KEY REFERENCES Product,
--[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
--Quantity INT NOT NULL CHECK(Quantity>0),
--[Sale Price] INT NOT NULL CHECK([Sale Price]>0),
--[Sale Date] DATE NOT NULL,
--[Customer Email] NVARCHAR(75) NOT NULL DEFAULT 'Unregistered User'
--CHECK(dbo.CheckCustomerExist_([Customer Email]) = 'True' OR [Customer Email]='Unregistered User')
--)
--GO
--CREATE TABLE Customers
--(
--Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
--[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
--Surname NVARCHAR(100) NOT NULL CHECK (Surname!=''),
--Patronymic NVARCHAR(100) NOT NULL CHECK (Patronymic!=''),
--Email NVARCHAR(75) NOT NULL UNIQUE CHECK (Email!=''),
--Phone NVARCHAR(15) NOT NULL UNIQUE CHECK (Phone!=''),
--[Percent Discount] INT NOT NULL CHECK([Percent Discount]>=0AND[Percent Discount]<=100)
--)
--GO
--CREATE TABLE History
--(
--Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
--[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
--Quantity INT NOT NULL CHECK(Quantity>0),
--[Sale Price] INT NOT NULL CHECK([Sale Price]>0),
--[Sale Date] DATE NOT NULL,
--[Customer Email] NVARCHAR(75) NOT NULL DEFAULT 'Unregistered User'
--CHECK(dbo.CheckCustomerExist_([Customer Email]) = 'True' OR [Customer Email]='Unregistered User')
--)

----------------------GO
----------------------CREATE TRIGGER SaleProduct
----------------------ON Sales
----------------------AFTER INSERT
----------------------AS
----------------------BEGIN
----------------------IF EXISTS(SELECT [Product Id] FROM inserted WHERE SELECT Id FROM Product = [Product Id])
----------------------END

--GO
--CREATE TABLE Archive
--(
--Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
--[Name] NVARCHAR(100) NOT NULL CHECK ([Name]!=''),
--QP_Avaiable INT NOT NULL,
--Cost INT NOT NULL,
--Manufacturer NVARCHAR(150) NOT NULL CHECK (Manufacturer!=''),
--[Sale Price] INT NOT NULL,
--[Date] DATE NOT NULL
--)

----------------------GO
----------------------INSERT Customers
----------------------VALUES
------------------------('Oleg','Olegenko','Olegovich','OlegO12@ukr.net','+380687559823',0)

----------------------GO
----------------------INSERT Sales ([Name],Quantity,[Sale Price],[Sale Date])
----------------------VALUES
----------------------('Apple',3,12,GETDATE()),
----------------------('Banana',8,82,GETDATE()),
----------------------('Lemon',30,332,GETDATE()),
----------------------('Orange',6,92,GETDATE()),
----------------------('Sausage',20,200,GETDATE())

----------------------GO
----------------------INSERT Sales
----------------------VALUES
----------------------('Melon',2,50,GETDATE(),'OlegO12@ukr.net')

--GO
--CREATE TRIGGER T1
--ON Sales
--AFTER INSERT
--AS
--INSERT INTO History ([Name],Quantity,[Sale Price],[Sale Date],[Customer Email])
--SELECT [Name],Quantity,[Sale Price],[Sale Date],[Customer Email]
--FROM inserted
-----------------
--TEST 
--|||||||
--VVVVV
--GO
--INSERT Sales
--VALUES
--('Melon',2,50,GETDATE(),'OlegO12@ukr.net')
--GO 
--SELECT *
--FROM History
--GO
--SELECT *
--FROM Sales

-----------------------TASK_2




-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--Ÿ≈ œ–¿÷ﬁﬁ Õ¿ƒ ÷»Ã «¿¬ƒ¿ÕÕﬂÃ 