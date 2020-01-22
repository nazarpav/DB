--GO
--CREATE DATABASE HN_21_01_2020
--GO
--USE HN_21_01_2020
--GO
--create table [Departments]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Building] int not null check ([Building] between 1 and 5),
--	[Name] nvarchar(100) not null unique check ([Name] <> N'')
--);
--go

--create table [Doctors]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(max) not null check ([Name] <> N''),
--	[Premium] money not null check ([Premium] >= 0.0) default 0.0,
--	[Salary] money not null check ([Salary] > 0.0),
--	[Surname] nvarchar(max) not null check ([Surname] <> N'')
--);
--go

--create table [DoctorsExaminations]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[EndTime] time not null,
--	[StartTime] time not null check ([StartTime] between '08:00' and '18:00'),
--	[DoctorId] int not null,
--	[ExaminationId] int not null,
--	[WardId] int not null,
--	check ([StartTime] < [EndTime])
--);
--go

--create table [Examinations]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(100) not null unique check ([Name] <> N'')
--);
--go

--create table [Wards]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(20) not null unique check ([Name] <> N''),
--	[Places] int not null check ([Places] >= 1),
--	[DepartmentId] int not null
--);
--go

--alter table [DoctorsExaminations]
--add foreign key ([DoctorId]) references [Doctors]([Id]);
--go

--alter table [DoctorsExaminations]
--add foreign key ([ExaminationId]) references [Examinations]([Id]);
--go

--alter table [DoctorsExaminations]
--add foreign key ([WardId]) references [Wards]([Id]);
--go

--alter table [Wards]
--add foreign key ([DepartmentId]) references [Departments]([Id]);
--go

----------------------------------------------------------------------------------------------
--GO 
--INSERT Departments
--VALUES
--(1,'DP_1'),
--(2,'DP_2'),
--(1,'DP_3'),
--(1,'DP_4'),
--(2,'DP_5')
--GO 
--INSERT Wards
--VALUES
--('W1',3,1),
--('W2',11,1),
--('W3',13,2),
--('W4',6,2)

----------------------------------------------------------------------------------------------

------------------TASK_1
--GO
--SELECT COUNT(Id)
--FROM Wards
--WHERE Places>10
--------------------TASK_2
--GO
--SELECT Departments.Building,COUNT(Departments.Id) 
--FROM Departments join Wards on Wards.DepartmentId = Departments.Id
--GROUP BY Departments.Building

---------------------TASK_3
--GO
--SELECT Departments.[Name],COUNT(Departments.Id) 
--FROM Departments join Wards on Wards.DepartmentId = Departments.Id
--GROUP BY Departments.[Name]

------------------------TASK_4
GO
SELECT Departments.[Name],COUNT(Departments.Id) 
FROM Departments join Wards on Wards.DepartmentId = Departments.Id
GROUP BY Departments.[Name]
