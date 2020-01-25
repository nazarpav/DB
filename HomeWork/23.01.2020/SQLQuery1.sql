--CREATE DATABASE STSHOP
--GO
--CREATE FUNCTION CheckCustomerExist_ (
--    @Email_ NVARCHAR(75)
--)
--RETURNS VARCHAR(5)
--AS
--BEGIN
--    IF EXISTS (SELECT* FROM Customers WHERE Customers.Email = @Email_)
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
--Email NVARCHAR(75) NOT NULL CHECK (Email!=''),
--Phone NVARCHAR(15) NOT NULL CHECK (Phone!=''),
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

------------------GO
------------------CREATE TRIGGER SaleProduct
------------------ON Sales
------------------AFTER INSERT
------------------AS
------------------BEGIN
------------------IF EXISTS(SELECT [Product Id] FROM inserted WHERE SELECT Id FROM Product)
------------------END

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

--GO
--INSERT Product
--VALUES
--('Apple',100,10,'Kiiv',15)

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
--BEGIN
--INSERT INTO History ([Name],Quantity,[Sale Price],[Sale Date],[Customer Email])
--SELECT [Name],Quantity,[Sale Price],[Sale Date],[Customer Email]
--FROM inserted
--END
-----------------
----------------TEST 
----------------|||||||
----------------VVVVV
--GO
--INSERT Sales
--VALUES
--(1,'Apple',2,50,GETDATE(),'OlegO12@ukr.net')
--GO 
--SELECT *
--FROM History
--GO
--SELECT *
--FROM Sales

-----------------------TASK_2



-----------------------------TASK_3
ALTER TRIGGER T3
ON Customers
AFTER INSERT
AS
BEGIN
DECLARE @Count INT;
SET @Count = 0;
PRINT @Count;
SELECT *FROM inserted;
SET @Count = (SELECT COUNT(Email)FROM inserted WHERE dbo.CheckCustomerExist_(Email)='True');
SELECT *FROM inserted;
PRINT @Count;
IF(@Count != 0)
BEGIN
	RAISERROR ( 'You can not add new customer, email must be unique',0,2);
	ROLLBACK TRAN;
END
END
----------------TEST 
----------------|||||||
----------------VVVVV
SELECT Email FROM Customers
--GO
INSERT Customers
VALUES
('Oleg','Olegenko','Olegovich','OlegO12@ukr.net','+380687559823',0),
('Oleg','Olegenko','Olegovich','OlegO12@ukr.net','+380687559823',0),
('Oleg','Olegenko','Olegovich','OlegO12@ukr.net','+380687559823',0)


-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--Ÿ≈ œ–¿÷ﬁﬁ Õ¿ƒ ÷»Ã «¿¬ƒ¿ÕÕﬂÃ 