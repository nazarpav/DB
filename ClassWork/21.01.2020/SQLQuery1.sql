--SELECT поле_для_заголовку_рядка,
--	[перше_поле_для_значень], ...
--	FROM ( { назва_таблиці | SELECT_запит }) -- звідки отримувати дані
--PIVOT
--(
--	функція_агрегування(поле)
--	FOR [поле_для_заголовку_стовбця]
--	IN ( [первое_поле_для_значений],... )
--) AS псевдонім_зведеної_таблиці
--ORDER BY имя_поля | номер_поля [{ASC | DESC}] -- обов'язкова конструкція
--​
-------------------------------------------------------------------------
--SELECT 'Average',
--[Ukraine] ,
-- [Belarus],
-- [Madagaskar]
-- from (Select p.Producer , p.[Cost Price]
-- from Product as p ) as SourceTable
-- PIVOT
-- (
--  AVG([Cost Price]) for Producer in (
-- [Ukraine] ,
-- [Belarus],
-- [Madagaskar]) 
-- )AS CrossingTable

 GO
 select 'Count of sales',
Apple,
Watter,
Potato,
Banana,
Tangerine
 from (select p.[Name],s.ProductId
 from Product as p join Sales as s on p.Id = s.ProductId ) as SourceTable
 PIVOT
 (
  Count(ProductId) for [Name] in (
Apple,
Watter,
Potato,
Banana,
Tangerine)
 )AS CrossingTable