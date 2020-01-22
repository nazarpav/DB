CREATE INDEX _NP ON  Customers([Name],Surname,Patronymic)--1
GO
CREATE INDEX S ON VisitingArchive([Date])WHERE(TotalPrice>100)--2
GO
CREATE INDEX _K ON  Records([Date],[Time])--3
GO
CREATE INDEX SD ON Barbers(Email)WHERE(Phone!=NULL)--4
GO
CREATE CLUSTERED INDEX FS ON Schedule(BarberId)--5





