select * from Author
declare @index int = ;
BEGIN
INSERT INTO [Author]
           ([Name])
     VALUES(
           'Author ' + cast(@index as VARCHAR(10)));
		   set @index = @index+1;
		   print @index;
END

DECLARE @ID INT = 1;
WHILE(@ID <= 2000)
BEGIN
	INSERT INTO DummyTBL(id,name) VALUES (@ID,'Mr ' + CAST(@ID as VARCHAR(10)));
	SET @ID = @ID + 1;
END

