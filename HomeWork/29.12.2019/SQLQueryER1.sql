--CREATE DATABASE HOSPITAL;
--GO
--CREATE TABLE Departments	
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--[Name]  VARCHAR(100) NOT NULL UNIQUE CHECK ([Name]  != '')
--)
--GO
--CREATE TABLE Doctors
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--[Name]  VARCHAR(MAX) NOT NULL CHECK ([Name]  != ''),
--Premium MONEY NOT NULL CHECK(Premium > 0) DEFAULT 0,
--Salary MONEY NOT NULL CHECK(Salary >= 0),
--Surname VARCHAR(MAX) NOT NULL CHECK (Surname  != '')
--)
--GO
--CREATE TABLE Specializations
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK([Name]  != '')
--)
--GO
--CREATE TABLE Sponsors
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK([Name]  != '')
--)
--GO 
--CREATE TABLE DoctorsSpecializations
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctors,
--SpecializationId INT NOT NULL FOREIGN KEY REFERENCES Specializations
--)
--GO
--CREATE TABLE Donations
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--Amount MONEY NOT NULL CHECK (Amount > 0),
--[Date] DATE NOT NULL DEFAULT GETDATE(),
--DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments,
--SponsorId INT NOT NULL FOREIGN KEY REFERENCES Sponsors,
--)
--GO
--CREATE TABLE Vacations
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--StartDate DATE NOT NULL,
--DoctorId INT NOT NULL FOREIGN KEY REFERENCES Doctors,
--EndDate DATE NOT NULL,
--CHECK(EndDate>StartDate)
--)
--GO
--CREATE TABLE Wards
--(
--ID INT NOT NULL IDENTITY PRIMARY KEY,
--[Name] NVARCHAR(20) CHECK([Name]  != '') UNIQUE,
--DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments
--)
--------------GO
--------------create table [Examinations]
--------------(
--------------	[Id] int not null identity(1, 1) primary key,
--------------	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
--------------	[EndTime] time not null,
--------------	[Name] nvarchar(100) not null unique check([Name] <> N''),
--------------	[StartTime] time not null check ([StartTime] between '08:00' and '18:00'),
--------------	check ([StartTime] < [EndTime])
--------------);
--------------GO
--------------create table [Diseases]
--------------(
--------------	[Id] int not null identity(1, 1) primary key,
--------------	[Name] nvarchar(100) not null unique check ([Name] <> N''),
--------------	[Severity] int not null check ([Severity] >= 1) default 1
--------------);
-----------------------------------------------------------------------------------------------------------------------
--GO
--INSERT Specializations
--VALUES
--('Specialization1'),
--('Specialization2'),
--('Specialization3'),
--('Specialization4'),
--('Specialization5'),
--('Specialization6')
--GO
--INSERT Doctors
--VALUES
--('ROB',100,1000,'KOLOBKO'),
--('ALEX',50,900,'GRICH'),
--('ADAN',150,1500,'Smith'),
--('GUNNY',200,1800,'Williams'),
--('JADA',125,800,'Miller')
--GO
--INSERT DoctorsSpecializations
--VALUES
--(11,14),
--(20,16),
--(16,17),
--(18,15),
--(12,18)

--GO
--INSERT Vacations
--VALUES
--('2019-01-20',11,'2019-01-29'),
--('2020-01-20',12,'2020-08-29'),
--('2020-01-20',15,'2020-08-29'),
--('2019-01-20',13,'2020-01-29'),
--('2019-01-20',14,'2019-01-29'),
--('2019-01-20',16,'2019-01-29')

--GO
--INSERT Departments
--VALUES
--('Intensive Treatment'),
--('Dentistry'),
--('Intensive Treatment2'),
--('Dentistry2')

--GO
--INSERT Wards
--VALUES
--('W1',1),
--('W2',2),
--('W3',2),
--('W4',1),
--('W5',1),
--('W6',2),
--('W7',2)

--GO
--INSERT Sponsors
--VALUES
--('Umbrella Corporation'),
--('ROMA'),
--('VOVKA'),
--('OLEG'),
--('BORIS')

--GO 
--INSERT Donations 
--VALUES
--(100000,'2019-01-01',1,5),
--(10000,'2019-02-01',1,5),
--(10000,'2019-03-01',2,5),
--(10000,'2019-04-01',2,5),
--(100000,'2019-01-01',1,1),
--(10000,'2019-02-01',1,1),
--(10000,'2019-03-01',2,1),
--(10000,'2019-04-01',2,1),
--(1000000,'2020-01-01',1,2)
--------------TASK_1
--GO
--SELECT Doctors.[Name],Specializations.[Name]
--FROM DoctorsSpecializations
--INNER JOIN Doctors ON Doctors.ID=DoctorID
--INNER JOIN Specializations ON Specializations.ID=SpecializationId

-------------TASK_2
--GO
--SELECT Doctors.Surname,Doctors.Salary+Doctors.Premium----,Doctors.ID,Vacations.StartDate,Vacations.EndDate
--FROM Doctors
--INNER JOIN Vacations ON  Vacations.DoctorId=Doctors.ID
--WHERE Vacations.StartDate>GETDATE() OR Vacations.EndDate<GETDATE()

-------------TASK_3
--GO
--SELECT Wards.[Name]
--FROM Wards
--INNER JOIN Departments ON Departments.ID=Wards.DepartmentId
--WHERE Departments.[Name]='Intensive Treatment'

---------------TASK_4
--GO
--SELECT Departments.[Name]
--FROM Donations
--INNER JOIN Departments ON Donations.DepartmentId=Departments.ID
--INNER JOIN Sponsors ON Donations.SponsorId=Sponsors.ID
--WHERE Sponsors.[Name]='Umbrella Corporation'
--GROUP BY Departments.[Name]

-------------------------TASK_5
--GO
--SELECT Departments.[Name],Sponsors.[Name],Donations.Amount,Donations.[Date]
--FROM Donations
--INNER JOIN Departments ON Donations.DepartmentId=Departments.ID
--INNER JOIN Sponsors ON Donations.SponsorId=Sponsors.ID

------------------------TASK_6
--GO

------------------------TASK_7
--GO

-------------------------TASK_8
--GO
--SELECT Departments.[Name]
--FROM Donations
--INNER JOIN Departments ON Donations.DepartmentId=Departments.ID
--WHERE Donations.Amount>100000
--GROUP BY Departments.[Name]

--������� ������� ���� ��'����� � ����������
--������\��������\������� :�������� ������
--������������ ������� ���� ��'����� � �������� � ��� ���� �������������
--�������� ����� �������� ������� �� ����� ���� ��������������
	
