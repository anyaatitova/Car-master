USE CarService
GO

CREATE OR ALTER TRIGGER Orders_date_trigger
ON Orders
AFTER INSERT
AS
BEGIN
	DECLARE @app_date DATE
	DECLARE @due_date DATE

	SET @app_date = (SELECT application_date FROM inserted)
	SET @due_date = (SELECT due_date FROM inserted)

	if(@app_date > @due_date)	
	BEGIN
		ROLLBACK TRANSACTION
		PRINT(N'ƒата прин€ти€ заказа не может быть больше даты выполнени€');
	END
END

INSERT INTO Orders VALUES ('29.10.2021', '25.10.2021', N'ќплата в рассрочку', 150, (select car_code  from Car where gov_number = N'8745AP-7'))
 
SELECT * FROM Orders


CREATE OR ALTER TRIGGER Change_AccountingService_Status
ON AccountingServices AFTER UPDATE
AS IF UPDATE(is_finished)
BEGIN
	

	DECLARE @FINAL_PRICE FLOAT
	DECLARE @CODE_ACCOUNTING_SERVICES INT
	DECLARE @OLD_ID INT
	DECLARE @OLD_COUNT INT
	DECLARE @SERVICE_CODE INT
	DECLARE @ID_MASTER INT
	DECLARE @ORDER_CODE INT

	SET @OLD_COUNT = (SELECT count_of_services FROM deleted)
	SET @CODE_ACCOUNTING_SERVICES = (SELECT code_accounting_services FROM deleted)
	SET @OLD_ID = (SELECT code_accounting_services FROM deleted)
	SET @SERVICE_CODE = (SELECT services_code FROM deleted)
	SET @ID_MASTER = (SELECT id_master FROM deleted)
	SET @ORDER_CODE = (SELECT order_code FROM deleted)

	SET @FINAL_PRICE = (SELECT order_cost FROM Orders O JOIN deleted i ON i.order_code = O.order_code) + (SELECT cost FROM Services S JOIN deleted i ON i.services_code = S.services_code)

	DELETE FROM AccountingServices WHERE (code_accounting_services = @CODE_ACCOUNTING_SERVICES)
	INSERT INTO AccountingServices(count_of_services, complete_date, finish_price, services_code, id_master, order_code, is_finished) VALUES (@OLD_COUNT, GETDATE(), @FINAL_PRICE, @SERVICE_CODE, @ID_MASTER, @ORDER_CODE,1)
END

UPDATE AccountingServices SET is_finished = 1 WHERE code_accounting_services = 10

SELECT * FROM AccountingServices


CREATE or alter TRIGGER Accounting_services_delete
ON AccountingServices
AFTER DELETE
AS
begin
	DECLARE @finish int

	SET @finish = (SELECT is_finished FROM deleted)
		
	IF(@finish = 1)
	BEGIN
		INSERT INTO History (code,car_num, price)
		SELECT code_accounting_services, c.gov_number, finish_price
		FROM DELETED
		JOIN Orders O ON O.order_code = deleted.order_code
		JOIN Car C ON C.car_code = O.car_code
	END

	ELSE
		begin
			INSERT INTO History (code,car_num)
			SELECT code_accounting_services, c.gov_number
			FROM DELETED
			JOIN Orders O ON O.order_code = deleted.order_code
			JOIN Car C ON C.car_code = O.car_code
		end
end

delete from AccountingServices where code_accounting_services = 20
select * from AccountingServices
select * FROM History


CREATE TABLE History(
	code INT,
	price NVARCHAR(50),
	car_num NVARCHAR(50),
	deleted_date date DEFAULT(GETDATE())
)


select * from Services
select * from Orders
select * from AccountingServices
select * from Car
select * from Mark
select * from Master
select * from Owner
select * from WorkType

