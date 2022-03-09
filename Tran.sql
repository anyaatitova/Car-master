USE CarService
GO


--явная транзация
begin try
	begin tran
		set dateformat qwerty
		INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'4/2');
		INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'6/2');
		INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'1/2');
	commit tran
end try
begin catch
	print ERROR_NUMBER()
	print ERROR_MESSAGE()
	rollback tran
end catch


--неяная транзакция
SET IMPLICIT_TRANSACTIONS ON
print 'До_транзации: ' + cast(@@TRANCOUNT as char(1))
	go
	INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'4/2');
	print 'Значение_транзакции: ' + cast(@@TRANCOUNT as char(1))
	go 
	rollback tran
print 'После_транзакции: ' + cast(@@TRANCOUNT as char(1))
SET IMPLICIT_TRANSACTIONS OFF


SET IMPLICIT_TRANSACTIONS OFF
BEGIN TRAN Insert1
    print N'Кол-во тразнакций: ' + cast(@@TRANCOUNT as CHAR(1))
    INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'2/2');
    begin tran INSERT2
        print N'Кол-во тразнакций: ' + cast(@@TRANCOUNT as CHAR(1))
        INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'2/2');
    COMMIT TRAN
print N'Кол-во тразнакций: ' + cast(@@TRANCOUNT as CHAR(1))
COMMIT TRAN
print N'Кол-во тразнакций: ' + cast(@@TRANCOUNT as CHAR(1))