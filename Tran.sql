USE CarService
GO


--����� ���������
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


--������ ����������
SET IMPLICIT_TRANSACTIONS ON
print '��_���������: ' + cast(@@TRANCOUNT as char(1))
	go
	INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'4/2');
	print '��������_����������: ' + cast(@@TRANCOUNT as char(1))
	go 
	rollback tran
print '�����_����������: ' + cast(@@TRANCOUNT as char(1))
SET IMPLICIT_TRANSACTIONS OFF


SET IMPLICIT_TRANSACTIONS OFF
BEGIN TRAN Insert1
    print N'���-�� ����������: ' + cast(@@TRANCOUNT as CHAR(1))
    INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'2/2');
    begin tran INSERT2
        print N'���-�� ����������: ' + cast(@@TRANCOUNT as CHAR(1))
        INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Titova Anna', 3, 1200, N'2/2');
    COMMIT TRAN
print N'���-�� ����������: ' + cast(@@TRANCOUNT as CHAR(1))
COMMIT TRAN
print N'���-�� ����������: ' + cast(@@TRANCOUNT as CHAR(1))