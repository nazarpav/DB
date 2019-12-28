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