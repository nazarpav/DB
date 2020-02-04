--------------------TASK_1
GO
CREATE FUNCTION T_1F()
RETURNS TABLE
AS
RETURN SELECT B.[Name], B.Surname, B.Phone FROM Barbers AS B
	WHERE	B.EmploymentDate = (SELECT MIN(B_.EmploymentDate) FROM Barbers AS B_)
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_1F ()


--------TASK_2
CREATE  FUNCTION T_2F(@begin DATE, @end DATE)
RETURNS TABLE
AS
RETURN SELECT B.[Name], B.Surname, B.Phone 
	FROM Barbers AS B INNER JOIN VisitingArchive AS VA ON VA.BarberId = B.Id
 	WHERE (VA.[Date] BETWEEN @begin AND @end)
	GROUP BY B.[Name],B.Surname,B.Phone, VA.BarberId
	HAVING COUNT(VA.BarberId) =(SELECT MAX(y.num)
	FROM (SELECT COUNT (VA_.Id) AS num
	FROM  VisitingArchive AS VA_ WHERE (VA_.[Date] BETWEEN @begin AND @end) GROUP BY VA_.BarberId) y)	
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2F('2020-01-11', '2020-02-11')



-------------------------------TASK_3
GO
CREATE FUNCTION T3_F()
RETURNS TABLE
AS
RETURN SELECT C.[Name], C.Surname, C.Phone 
	FROM Customers AS C join VisitingArchive AS VA ON VA.CustomerId = C.Id
	WHERE C.Id = VA.CustomerId 
	GROUP BY C.[Name], C.Surname, C.Phone,VA.CustomerId
	HAVING COUNT(VA.CustomerId) = (SELECT MAX(y.num)
	FROM (SELECT COUNT (VAc.Id) AS num
	FROM  VisitingArchive AS VAc 
	GROUP BY VAc.CustomerId) y)	
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T3_F()


--------------------TASK_4
GO
CREATE or ALTER FUNCTION T_4F()
RETURNS TABLE
AS
RETURN SELECT C.[Name], C.Surname, C.Phone 
	FROM Customers AS C join VisitingArchive AS VA ON VA.CustomerId = C.Id
	WHERE C.Id = VA.CustomerId 
	GROUP BY C.[Name], C.Surname, C.Phone,VA.CustomerId
	HAVING sum(VA.TotalPrice) = (SELECT MAX(y.num)
	FROM (SELECT sum(VAs.TotalPrice) AS num
	FROM  VisitingArchive AS VAs 	
	GROUP BY VAs.CustomerId) y)	
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_4F()

----------------------------------TASK_5
GO
CREATE FUNCTION T_5F()
RETURNS TABLE
AS
RETURN SELECT S.[Name],S.Price,S.Duration 
	FROM Services AS S
	WHERE  S.Duration = (SELECT MAX (Sm.Duration)
							FROM Services AS Sm )
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_5F()

---+=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=+
--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	-	-	-	--	
---+=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=++=+
-------------------TASK_2_1
GO
CREATE FUNCTION T_2_1F()
RETURNS TABLE
AS
RETURN SELECT B.[Name], B.Surname, B.Phone 
	FROM Barbers AS B INNER JOIN VisitingArchive AS VA ON VA.BarberId = B.Id
 	GROUP BY B.[Name],B.Surname,B.Phone, VA.BarberId
	HAVING COUNT(VA.BarberId) =(SELECT MAX(y.num)
	FROM (SELECT COUNT (VAc.Id) AS num
    FROM  VisitingArchive AS VAc 
    GROUP BY VAc.BarberId) y)	
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2_1F()

---------------------------TASK_2_2
GO
CREATE FUNCTION T_2_2F()
RETURNS TABLE
AS
RETURN SELECT TOP(3) B.[Name[, B.Surname, B.Phone, sum(VA.TotalPrice) as [PriceClients]
	FROM Barbers AS B join VisitingArchive AS VA ON VA.BarberId = B.Id
	WHERE VA.[Date] >=GETDATE()-30
 	GROUP BY B.[Name],B.Surname,B.Phone, VA.BarberId
	ORDER BY PriceClients DESC
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2_2F()


-------------------------------------------------TASK_2_3
GO
CREATE FUNCTION T_2_3F()
RETURNS TABLE
AS
RETURN SELECT TOP(3) B.[Name], B.Surname, B.Phone, AVG (ET.Id) AS [AVGType]
	FROM Barbers AS B INNER JOIN VisitingArchive AS VA ON VA.BarberId = B.Id
					INNER JOIN Estimations AS E ON E.BarberId = B.Id
					INNER JOIN EstimationTypes AS ET ON E.TypeId = ET.Id
	GROUP BY B.[Name],B.Surname,B.Phone, VA.BarberId, E.BarberId
	HAVING Count (E.BarberId) >= 30
	ORDER BY AVGType DESC
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2_3F()

----------------------------------TASK_2_4
GO
CREATE FUNCTION T_2_4F(@barberId int, @day int)
RETURNS TABLE
AS
RETURN SELECT B.[Name], B.Surname, B.Phone, S.StartTime, S.EndTime
	FROM Barbers AS B join Schedule aASs S ON S.BarberId = B.Id
	WHERE S.DAY = @day and B.Id = @barberId
	GROUP BY B.[Name],B.Surname,B.Phone,  S.StartTime, S.EndTime 
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2_4F(1,4)

----------------------------TASK_2_7
GO
CREATE TRIGGER T_2_7T
ON Records
INSTEAD OF INSERT
AS 
BEGIN	
	DECLARE @B_Id int, @Date date, @Time time, @Check int
	SELECT @Date = I.[Date], @Time = I.[Time], @B_Id = I.BarberId
	FROM	inserted AS I	
	SET @Check=0
	PRINT @Check
	SELECT @Check = R.BarberId
	FROM Records AS R
	WHERE R.[Date] = @Date AND R.[Time] = @Time AND R.BarberId = @B_Id
	PRINT @Check
	IF(@Check = 0)
	BEGIN
		INSERT INTO  Records(BarberId, CustomerId, [Date], [Time])
		SELECT I.BarberId, I.CustomerId, I.[Date], I.[Time]
		FROM	inserted AS I
	END
	ELSE
	BEGIN
		PRINT 'ERROR IS BOOKED'
	END
END
--------------------TEST
--------------------VVV
INSERT INTO Records(BarberId, CustomerId, Date, Time)
VALUES(1,1,'>>>>>>DATE<<<<<<<<<', '>>>TIME<<<<')

-------------------------TASK_2_8
CREATE TRIGGER T_2_8T
ON Barbers
AFTER INSERT
AS 
BEGIN	
	DECLARE @Count int
	SELECT @Count = COUNT (B.Id)FROM Barbers AS B WHERE B.PositionId = 3
	IF(@Count > 5)
	BEGIN
		ROLLBACK TRAN
	END
END

--------------------TEST
--------------------VVV
GO
INSERT INTO Barbers([Name], Surname, Patronymic, Sex, Phone, Email, [Birth Date], EmploymentDate, PositionId)
VALUES	('HERALD', 'RIVNENSKI','ERGHN', 'Male', '+3809545432', 'PLOTVA@gmail.com', '1785', '1790-12-08', 3)


----------------------TASK_2_9
CREATE FUNCTION T_2_9F()
RETURNS TABLE
AS
RETURN SELECT C.[Name], C.Surname, C.Phone
	FROM Customers AS C INNER JOIN Feedbacks AS F ON F.CustomerId=C.Id INNER JOIN Estimations AS E ON E.CustomerId = C.Id
	WHERE F.[Message]='' AND E.TypeId IS NULL GROUP BY F.CustomerId, E.CustomerId,  C.[Name], C.Surname, C.Phone
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2_9F()

-------------------TASK_2_10
go
CREATE FUNCTION T_2_10()
RETURNS TABLE
AS
RETURN SELECT C.[Name], C.Surname, C.Phone
	FROM Customers AS C INNER JOIN VisitingArchive AS VA ON VA.CustomerId = C.Id
	WHERE GETDATE()-365 > (SELECT max(VAc.Date) FROM VisitingArchive AS VAc WHERE VA.CustomerId = Vac.CustomerId)
	GROUP BY C.[Name], C.Surname, C.Phone
-----------------TEST
-----------------VVVV
GO
SELECT * FROM T_2_10()
