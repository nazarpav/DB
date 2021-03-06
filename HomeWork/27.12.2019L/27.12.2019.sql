CREATE DATABASE Hospital;
GO
USE Hospital;
GO
CREATE TABLE Departments
(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY, 
Building INT NOT NULL CHECK(Building>0AND Building<6),
Financing MONEY NOT NULL DEFAULT 0 CHECK(Financing>=0),
[Name] NVARCHAR(100) NOT NULL CHECK([Name]!='') UNIQUE
)
GO
CREATE TABLE Diseases
(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY, 
[Name] NVARCHAR(100) NOT NULL CHECK([Name]!='') UNIQUE,
Severity INT NOT NULL CHECK(Severity>0) DEFAULT 1
)
GO
CREATE TABLE Doctors
(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY, 
[Name] NVARCHAR(MAX) NOT NULL CHECK([Name]!='') ,
Phone CHAR(10) NULL,
Salary MONEY NOT NULL CHECK(Salary>0),
Surname NVARCHAR(MAX) NOT NULL CHECK(Surname!='')
)
GO
CREATE TABLE Examinations
(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY, 
[DayOfWeek] INT NOT NULL CHECK([DayOfWeek]>0AND [DayOfWeek]<7),
[Name] NVARCHAR(100) NOT NULL CHECK([Name]!='') UNIQUE,
StartTime TIME NOT NULL CHECK(StartTime BETWEEN '08:00:00' AND '18:00:00'),
EndTime TIME NOT NULL ,CHECK (EndTime>StartTime)
)