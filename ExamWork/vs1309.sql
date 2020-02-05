--GO
--CREATE VIEW T_1
--AS
--SELECT TourRoute.[Name],Tour.Cost,Tour.EndDate,Tour.StartDate FROM Tour
--INNER JOIN TourRoute ON Tour.TourRoute_Id=TourRoute.Id

--GO
--CREATE PROCEDURE  T_2 (@Start_Date DATE,@End_Date DATE)
--AS
--BEGIN
--SELECT TourRoute.[Name],Tour.Cost,Tour.EndDate,Tour.StartDate FROM Tour
--INNER JOIN TourRoute ON Tour.TourRoute_Id=TourRoute.Id
--WHERE Tour.EndDate>=@End_Date AND Tour.StartDate<=@Start_Date
--END

--GO
--CREATE PROCEDURE T_3 (@Country NVARCHAR(150))
--AS
--SELECT TourRoute.[Name],Tour.Cost,Tour.EndDate,Tour.StartDate FROM Tour
--INNER JOIN TourRoute ON Tour.TourRoute_Id=TourRoute.Id
--INNER JOIN RoutesInTour ON RoutesInTour.TourRoute_Id = TourRoute.Id
--INNER JOIN TourPoint ON TourPoint.Country_Id=RoutesInTour.TourPoint_Id
--INNER JOIN Country ON Country.Id=TourPoint.Country_Id
--WHERE Country.[Name]=@Country
--GO
--EXEC dbo.T_3'F'


--GO 
--CREATE FUNCTION T_4()-------------------------------
--RETURNS NVARCHAR(1000)
--AS
--BEGIN
--DECLARE @COUNT INT;
--SET @COUNT = 
--(SELECT TOP(1)  COUNT(Country.[Name])
--FROM Tour
--INNER JOIN TourRoute ON Tour.TourRoute_Id=TourRoute.Id
--INNER JOIN RoutesInTour ON RoutesInTour.TourRoute_Id = TourRoute.Id
--INNER JOIN TourPoint ON TourPoint.Country_Id=RoutesInTour.TourPoint_Id
--INNER JOIN Country ON Country.Id=TourPoint.Country_Id
--GROUP BY Country.[Name]
--ORDER BY COUNT(Country.[Name]))

--SET @COUNT = @COUNT
--END

--GO---------------------------
--CREATE VIEW T_5
--AS
--SELECT TOP (1) TouristList.Tour_Id
--FROM TouristList
--INNER JOIN Tour ON Tour.Id = TouristList.Tour_Id
--INNER JOIN TourRoute ON TourRoute.Id = Tour.TourRoute_Id
--WHERE TouristList.IsBought=1 AND Tour.EndDate>GETDATE() AND Tour.IsDeleted=0
--GROUP BY TouristList.Tour_Id
--ORDER BY COUNT(TouristList.Tour_Id)

--GO 
--CREATE VIEW T_6
--AS
--SELECT TOP(1) TourRoute.[Name] FROM ToursArchive
--INNER JOIN Tour ON Tour.Id=ToursArchive.Tour_Id
--INNER JOIN TourRoute ON TourRoute.Id = Tour.TourRoute_Id
--ORDER BY ToursArchive.[Counter vouchers purchased] DESC
--GO 
--SELECT* FROM T_6


--GO
--CREATE PROCEDURE T_8 (@Name NVARCHAR(150),@Surname NVARCHAR(150),@Patronymic NVARCHAR(150))
--AS
--SELECT TourRoute.[Name]
--FROM TouristList
--INNER JOIN Tour ON Tour.Id = TouristList.Tour_Id
--INNER JOIN TourRoute ON TourRoute.Id = Tour.TourRoute_Id
--INNER JOIN Customers ON Customers.Id = TouristList.Tourist_Id
--WHERE Customers.[Name] = @Name AND
--Customers.Surname = @Surname AND
--Customers.Patronymic = @Patronymic

--GO
--EXEC T_8'ROB','BOBR','ROBERER'

--GO
--CREATE FUNCTION T_9 (@Name NVARCHAR(150),@Surname NVARCHAR(150),@Patronymic NVARCHAR(150))
--RETURNS NVARCHAR(10)
--AS
--BEGIN
--DECLARE @ISTOUR NVARCHAR(10);
--IF EXISTS(SELECT TourRoute.[Name]
--FROM TouristList
--INNER JOIN Tour ON Tour.Id = TouristList.Tour_Id
--INNER JOIN TourRoute ON TourRoute.Id = Tour.TourRoute_Id
--INNER JOIN Customers ON Customers.Id = TouristList.Tourist_Id
--WHERE Customers.[Name] = @Name AND
--Customers.Surname = @Surname AND
--Customers.Patronymic = @Patronymic 
--AND Tour.EndDate>GETDATE() AND Tour.StartDate<GETDATE())
--BEGIN 
--SET @ISTOUR = 'IN TOUR'
--END
--ELSE
--BEGIN
--SET @ISTOUR = 'OUT TOUR'
--END
--RETURN @ISTOUR
--END


--------------------
CREATE TRIGGER T_12
ON
INSTEAD OF INSERT
AS
BEGIN
SELECT * FROM 
END




