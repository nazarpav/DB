GO
SELECT [Name]
FROM Barbers
ORDER BY [Name]

GO
ALTER INDEX I_NAME ON  Barbers
DISABLE

GO
DECLARE @C INT
SET @C = 1
WHILE @C < 2000
BEGIN
INSERT INTO Barbers([Name], [Surname], [Patronymic], Sex, Phone, Email, [Birth Date], [EmploymentDate], [PositionId])
VALUES	('Bob', 'Bobenko','Bobovich', 'Man', '+380964512387', 'BobBobenko@gmail.com', '1978-02-25', '2015-03-14', 2),
		('Max', 'Maxsymenko','Maxsymovich', 'Man', '+38063698741', 'MaxsymenkoMax@gmail.com', '1988-08-15', '2018-04-24', 2),
		('Andrii', 'Andrienko','Andriovich', 'Man', '+38068124785', 'Andrii@gmail.com', '1986-01-20', '2017-05-13', 2),
		('Mariia', 'Ponomarenko','Volodymyrivna', 'Woman', '+380681257963', 'Ponomarenko@gmail.com', '1995-01-23', '2019-08-10', 3),
		('Petro', 'Petrenko','Petrovych', 'Man', '+380954123584', 'Petrenko@gmail.com', '1997-01-23', '2019-11-14', 3)

	SET @C  = @C + 1
	END