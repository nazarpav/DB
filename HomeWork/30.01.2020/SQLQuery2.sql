-------TASK_1
--GO
--ALTER TABLE Customers
--DROP CONSTRAINT PK__Customer__3214EC071920BF5C
--GO
--CREATE CLUSTERED INDEX CustomersEmail ON Customers(Email)

--------------TASK_2
--GO
--CREATE INDEX Archive ON Archive([Date])

--GO
--CREATE INDEX Sales ON Sales([Customer Email])

----------------TASK_4
--GO
--CREATE UNIQUE INDEX T_4
--ON History([Customer Email])
--INCLUDE([Sale Price],[Sale Date]);

---------------------TASK_5
--GO
--CREATE NONCLUSTERED INDEX T_5
--ON Employees (Position)
--WHERE Position='Consultant';
