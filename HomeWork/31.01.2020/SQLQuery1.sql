﻿--​-----------------------TASK_1
--SELECT 'Count',
--[Bill] AS 'Bill',
--[Ilon] AS 'Ilon',
--[Jef] AS 'Jef'
--FROM (	SELECT C.[Name], S.Id
--FROM Clients AS C INNER JOIN Sales AS S ON S.ClientsId = C.Id 
--) AS SourceTable
--PIVOT
--(
--COUNT(Id) FOR [Name] IN ([Bill], [Ilon], [Jef])
--) AS CrossingTable
​
​
----------------------TASK_2
--SELECT 'Count',
--[12] AS 'Twelve',
--[15] AS 'Fifteen',
--[18] AS 'Eighteen'
--FROM 
--(
--SELECT C.Discount, C.Id
--FROM Clients AS C 
--) AS SourceTable
--PIVOT
--(
--COUNT(Id) FOR Discount IN ([12], [15], [18])
--) AS CrossingTable
​
​
-----------------------TASK_3​
--SELECT ProdName,	
--[Maxim] AS 'Maxim',
--[Dmitro] AS 'Dmitro',
--[Robert] AS 'Robert',
--[Herald] AS 'Herald',
--[Albert] AS 'Albert',
--[Ivan] AS 'Ivan'
--FROM 
--(	
--SELECT S.[Name] AS [SelName], Sa.Id, P.[Name] AS[ProdName]
--FROM Seller AS S 
--INNER JOIN Sales AS Sa ON Sa.SellerId = S.Id  
--INNER JOIN Product AS P ON P.Id = Sa.ProductId
--) AS SourceTable
--PIVOT
--(
--COUNT(Id) FOR SelName IN ([Dmitro],[Robert],[Herald],[Albert],[Maxim],[Ivan])
--) AS CrossingTable