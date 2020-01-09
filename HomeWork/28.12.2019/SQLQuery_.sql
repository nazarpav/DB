CREATE TABLE  Departments
(
ID int NOT NULL IDENTITY PRiMARY KEY,
Financing money NOT NULL CHECK(Financing > 0) DEFAULT 0,
[Name] nvarchar(100) NOT NULL CHECK([Name] > 0)  UNIQUE 
)
GO
CREATE TABLE  Faculties
(
ID int NOT NULL IDENTITY PRiMARY KEY,
Dean nvarchar(MAX) NOT NULL CHECK(Dean > 0)  , 
[Name] nvarchar(100) NOT NULL CHECK([Name] > 0)   UNIQUE 
)
GO
CREATE TABLE  Groups
(
ID int NOT NULL IDENTITY PRiMARY KEY,
[Name] nvarchar(10) NOT NULL CHECK([Name] > 0)   UNIQUE, 
Rating int NOT NULL CHECK(Rating>0 AND Rating<5),
[Year] int NOT NULL CHECK([Year]>1 AND [Year]<5)
)
GO
CREATE TABLE  Teachers
(
ID int NOT NULL IDENTITY PRiMARY KEY,
EmploymentDate date NOT NULL CHECK(EmploymentDate> '01.01.1990'),
IsAssistant bit NOT NULL DEFAULT 0,
IsProfessor bit NOT NULL DEFAULT 0,
[Name] nvarchar(MAX) NOT NULL CHECK([Name] > 0) ,
Position nvarchar(MAX) NOT NULL CHECK(Position > 0) ,
Premium money NOT NULL CHECK(Premium > 0) DEFAULT 0,
Salary money NOT NULL CHECK(Salary >= 0),
Surname nvarchar(MAX) NOT NULL CHECK(Surname > 0) ,
)
GO
-----------------------------------------
--1
GO
SELECT * FROM Faculties
ORDER BY ID DESC;
--2
GO
SELECT [Name], Rating FROM Groups;
--3
GO
SELECT Surname, Salary, Premium FROM Teachers;
--4
GO
SELECT 'The dean of faculty'+ [Name] +'is'+ Dean FROM Faculties;
--5
GO
SELECT Surname FROM Teachers 
WHERE IsProfessor=1 AND Salary>1050;
--6
GO
SELECT [Name] FROM Departments
WHERE Financing<11000 OR Financing>25000;
--7
GO
SELECT [Name] FROM Faculties
WHERE [Name]!='Computer Science';
--8
GO
SELECT Surname, Position FROM Teachers
WHERE IsProfessor=0;
--9
GO
SELECT Surname, Position, Salary, Premium FROM Teachers
WHERE IsAssistant=1 AND Premium>160 AND Premium<550;
--10
GO
SELECT Surname, Salary FROM Teachers 
WHERE IsAssistant=1 ;
--11
GO
SELECT Surname, Position FROM Teachers
WHERE EmploymentDate<'01-01-2000';
--12
GO
SELECT 'Name of Departmen'+[Name] FROM Departments
WHERE [Name] < 'Software Development'
ORDER BY [Name];
--13
GO
SELECT Surname FROM Teachers 
WHERE IsAssistant=1 AND Salary+Premium<1200;
--14
GO
SELECT [Name] FROM Groups 
WHERE [Year] =5 AND Rating>=2 AND Rating<=4;
--15
SELECT Surname FROM Teachers 
WHERE Salary < 550 OR Premium < 200;