--create database [Around the World in 80 Days];
--go
--use [Around the World in 80 Days];
--go
--CREATE TABLE EmployeeTourAgency (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Surname nvarchar(255) NOT NULL check(Surname!=''),
--	[Name] nvarchar(255) NOT NULL check([Name]!=''),
--	Patronymic nvarchar(255) NOT NULL check(Patronymic!=''),
--	Position_Id integer NOT NULL,
--	Phone nvarchar(25) NOT NULL UNIQUE check(Phone!=''),
--	Email varchar(255) NOT NULL UNIQUE check(Email!=''),
--	DateOfRecruitment date NOT NULL,
--  CONSTRAINT [PK_EmployeeTourAgency] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Positions (
--	ID integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	PositionName nvarchar(255) NOT NULL UNIQUE check(PositionName!=''),
--  CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Tour (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	TourRoute_Id integer NOT NULL,
--	Cost money NOT NULL,
--	StartDate datetime NOT NULL,
--	EndDate datetime NOT NULL,
--	Employee_Id integer NOT NULL,
--  CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED
--  (
--  ID ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE TouristList (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Tour_Id integer NOT NULL,
--	Tourist_Id integer NOT NULL,
--	WhetherTheClientIsInterested bit NOT NULL,
--	IsBought bit NOT NULL,
--  CONSTRAINT [PK_TouristList] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE TourRoute (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	[Name] nvarchar(255) NOT NULL UNIQUE check([Name]!=''),
--  CONSTRAINT [PK_TourRoute] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE WaysToMove (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Tour_Id integer NOT NULL,
--	Transport_Id integer NOT NULL,
--  CONSTRAINT [PK_WaysToMove] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Transport (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	[Name] nvarchar(255) NOT NULL check([Name]!=''),
--  CONSTRAINT [PK_Transport] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE TourPoint (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Country_Id integer NOT NULL,
--  CONSTRAINT [PK_TourPoint] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Country (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	[Name] nvarchar(255) NOT NULL check([Name]!=''),
--  CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE City (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	[Name] integer NOT NULL check([Name]!=''),
--	Country_Id integer NOT NULL,
--  CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Monuments (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	City_Id integer NOT NULL,
--	[Name] nvarchar(255) NOT NULL check([Name]!=''),
--  CONSTRAINT [PK_Monuments] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE MonumentsPhoto (
--	ID integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Monuments_Id integer NOT NULL,
--	PhotoPath nvarchar(1000) NOT NULL check(PhotoPath!=''),
--  CONSTRAINT [PK_MonumentsPhoto] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Hotels (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	City_Id integer NOT NULL,
--	[Name] nvarchar(255) NOT NULL check([Name]!=''),
--	StartsQuantity integer NOT NULL,
--  CONSTRAINT [PK_Hotels] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE HotelsPhoto (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Hotels_Id integer NOT NULL,
--	PhotoPath nvarchar(1000) NOT NULL  check(PhotoPath!=''),
--  CONSTRAINT [PK_HotelsPhoto] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE RoutesInTour (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	TourRoute_Id integer NOT NULL,
--	TourPoint_Id integer NOT NULL,
--	[Date] date NOT NULL,
--  CONSTRAINT [PK_RoutesInTour] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)
--)
--GO
--CREATE TABLE MonumentsInRout (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Rout_Id integer NOT NULL,
--	Monuments_Id integer NOT NULL,
--	Tour_id integer NOT NULL,
--	IsIncludedInTheCostOfTheTour bit NOT NULL,
--  CONSTRAINT [PK_MonumentsInRout] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE Customers (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Surname nvarchar(255) NOT NULL check(Surname!=''),
--	[Name] nvarchar(255) NOT NULL check([Name]!=''),
--	Patronymic nvarchar(255) NOT NULL check(Patronymic!=''),
--	Phone nvarchar(25) NOT NULL UNIQUE check(Phone!=''),
--	Email nvarchar(255) NOT NULL UNIQUE check(Email!=''),
--	DateOfBirth date NOT NULL,
--  CONSTRAINT [PK_Agency clients] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE ToursArchive (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Tour_Id integer NOT NULL,
--	[Counter vouchers purchased] integer NOT NULL,
--  CONSTRAINT [PK_Tours archive] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE EmployeesIsResponsibleForCountriesAndTours (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Employee_Id integer NOT NULL,
--	Country_Id integer NOT NULL,
--	TourRoute_Id integer NOT NULL,
--  CONSTRAINT [PK_Country and tour staff] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)

--)
--GO
--CREATE TABLE ToursClients (
--	Id integer NOT NULL,
--	IsDeleted bit NOT NULL DEFAULT 0,
--	Clients_Id integer NOT NULL,
--	Tour_id integer NOT NULL,
--	IsFuture bit NOT NULL,
--  CONSTRAINT [PK_Tours clients] PRIMARY KEY CLUSTERED
--  (
--  Id ASC
--  ) WITH (IGNORE_DUP_KEY = OFF)
--)

--GO
--ALTER TABLE EmployeeTourAgency WITH CHECK ADD CONSTRAINT EmployeeTourAgency_fk0 FOREIGN KEY (Position_Id) REFERENCES Positions(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE EmployeeTourAgency CHECK CONSTRAINT EmployeeTourAgency_fk0
--GO


--ALTER TABLE Tour WITH CHECK ADD CONSTRAINT Tour_fk0 FOREIGN KEY (TourRoute_Id) REFERENCES TourRoute(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE Tour CHECK CONSTRAINT Tour_fk0
--GO

--ALTER TABLE TouristList WITH CHECK ADD CONSTRAINT TouristList_fk0 FOREIGN KEY (Tour_Id) REFERENCES Tour(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE TouristList CHECK CONSTRAINT TouristList_fk0
--GO
--ALTER TABLE TouristList WITH CHECK ADD CONSTRAINT TouristList_fk1 FOREIGN KEY (Tourist_Id) REFERENCES Customers(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE TouristList CHECK CONSTRAINT TouristList_fk1
--GO


--ALTER TABLE WaysToMove WITH CHECK ADD CONSTRAINT WaysToMove_fk0 FOREIGN KEY (Tour_Id) REFERENCES Tour(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE WaysToMove CHECK CONSTRAINT WaysToMove_fk0
--GO
--ALTER TABLE WaysToMove WITH CHECK ADD CONSTRAINT WaysToMove_fk1 FOREIGN KEY (Transport_Id) REFERENCES Transport(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE WaysToMove CHECK CONSTRAINT WaysToMove_fk1
--GO


--ALTER TABLE TourPoint WITH CHECK ADD CONSTRAINT TourPoint_fk0 FOREIGN KEY (Country_Id) REFERENCES Country(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE TourPoint CHECK CONSTRAINT TourPoint_fk0
--GO


--ALTER TABLE City WITH CHECK ADD CONSTRAINT City_fk0 FOREIGN KEY (Country_Id) REFERENCES Country(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE City CHECK CONSTRAINT City_fk0
--GO

--ALTER TABLE Monuments WITH CHECK ADD CONSTRAINT Monuments_fk0 FOREIGN KEY (City_Id) REFERENCES City(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE Monuments CHECK CONSTRAINT Monuments_fk0
--GO

--ALTER TABLE MonumentsPhoto WITH CHECK ADD CONSTRAINT MonumentsPhoto_fk0 FOREIGN KEY (Monuments_Id) REFERENCES Monuments(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE MonumentsPhoto CHECK CONSTRAINT MonumentsPhoto_fk0
--GO

--ALTER TABLE Hotels WITH CHECK ADD CONSTRAINT Hotels_fk0 FOREIGN KEY (City_Id) REFERENCES City(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE Hotels CHECK CONSTRAINT Hotels_fk0
--GO

--ALTER TABLE HotelsPhoto WITH CHECK ADD CONSTRAINT HotelsPhoto_fk0 FOREIGN KEY (Hotels_Id) REFERENCES Hotels(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE HotelsPhoto CHECK CONSTRAINT HotelsPhoto_fk0
--GO

--ALTER TABLE RoutesInTour WITH CHECK ADD CONSTRAINT RoutesInTour_fk0 FOREIGN KEY (TourRoute_Id) REFERENCES TourRoute(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE RoutesInTour CHECK CONSTRAINT RoutesInTour_fk0
--GO
--ALTER TABLE RoutesInTour WITH CHECK ADD CONSTRAINT RoutesInTour_fk1 FOREIGN KEY (TourPoint_Id) REFERENCES TourPoint(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE RoutesInTour CHECK CONSTRAINT RoutesInTour_fk1
--GO

--ALTER TABLE MonumentsInRout WITH CHECK ADD CONSTRAINT MonumentsInRout_fk0 FOREIGN KEY (Rout_Id) REFERENCES TourRoute(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE MonumentsInRout CHECK CONSTRAINT MonumentsInRout_fk0
--GO
--ALTER TABLE MonumentsInRout WITH CHECK ADD CONSTRAINT MonumentsInRout_fk1 FOREIGN KEY (Monuments_Id) REFERENCES Monuments(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE MonumentsInRout CHECK CONSTRAINT MonumentsInRout_fk1
--GO
--ALTER TABLE MonumentsInRout WITH CHECK ADD CONSTRAINT MonumentsInRout_fk2 FOREIGN KEY (Tour_Id) REFERENCES Tour(Id)
--GO
--ALTER TABLE MonumentsInRout CHECK CONSTRAINT MonumentsInRout_fk2
--GO


--ALTER TABLE ToursArchive WITH CHECK ADD CONSTRAINT ToursArchive_fk0 FOREIGN KEY (Tour_Id) REFERENCES Tour(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE ToursArchive CHECK CONSTRAINT ToursArchive_fk0
--GO

--ALTER TABLE EmployeesIsResponsibleForCountriesAndTours WITH CHECK ADD CONSTRAINT EmployeesIsResponsibleForCountriesAndTours_fk0 FOREIGN KEY (Employee_Id) REFERENCES EmployeeTourAgency(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE EmployeesIsResponsibleForCountriesAndTours CHECK CONSTRAINT EmployeesIsResponsibleForCountriesAndTours_fk0
--GO
--ALTER TABLE EmployeesIsResponsibleForCountriesAndTours WITH CHECK ADD CONSTRAINT EmployeesIsResponsibleForCountriesAndTours_fk1 FOREIGN KEY (Country_Id) REFERENCES Country(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE EmployeesIsResponsibleForCountriesAndTours CHECK CONSTRAINT EmployeesIsResponsibleForCountriesAndTours_fk1
--GO
--ALTER TABLE EmployeesIsResponsibleForCountriesAndTours WITH CHECK ADD CONSTRAINT EmployeesIsResponsibleForCountriesAndTours_fk2 FOREIGN KEY (TourRoute_Id) REFERENCES TourRoute(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE EmployeesIsResponsibleForCountriesAndTours CHECK CONSTRAINT EmployeesIsResponsibleForCountriesAndTours_fk2
--GO

--ALTER TABLE ToursClients WITH CHECK ADD CONSTRAINT ToursClients_fk0 FOREIGN KEY (Clients_Id) REFERENCES Customers(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE ToursClients CHECK CONSTRAINT ToursClients_fk0
--GO
--ALTER TABLE ToursClients WITH CHECK ADD CONSTRAINT ToursClients_fk1 FOREIGN KEY (Tour_id) REFERENCES Tour(Id)
--ON UPDATE CASCADE
--GO
--ALTER TABLE ToursClients CHECK CONSTRAINT ToursClients_fk1
--GO

