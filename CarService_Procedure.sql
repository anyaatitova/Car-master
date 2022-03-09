USE CarService
GO

CREATE or ALTER PROC Average_Service_Cost_By_Type --1
	@WorkType NVARCHAR(50) 
	AS
BEGIN
		SELECT AVG(cost) AS 'Средняя стоимость', MIN(cost) AS 'Минимальная стоимсоть', MAX(cost) AS 'Максимальная стоимость' FROM Services S 
		JOIN WorkType W on S.work_type_code = W.work_type_code
		WHERE work_type = @WorkType
END

EXEC Average_Service_Cost_By_Type N'Двигатель и система охлаждения'
EXEC Average_Service_Cost_By_Type N'Обслуживание ходовой части'
DROP PROC Average_Service_Cost_By_Type



CREATE or ALTER PROC Car_Mark_By_Name --2
	@full_name NVARCHAR(30)
	AS 
BEGIN

	SELECT c.gov_number, m.mark_name, c.creation_year, c.color
	FROM Car c
	join Mark m ON m.mark_code = c.mark_code
	join Owner o ON o.id_owner= c.id_owner
	WHERE full_name like @full_name

END

EXEC Car_Mark_By_Name N'Филиппов Эдуард Ефимови'
DROP PROC Car_Mark_By_Name



CREATE OR ALTER PROC MasterExpOrder --3
	@min_age INT,
	@max_age INT
	AS
BEGIN

	SELECT M.full_name, M.payment, M.rating, A.complete_date, O.note FROM Master M
	JOIN AccountingServices A ON M.id_master = A.id_master
	JOIN Orders O ON O.order_code = A.order_code
	WHERE M.rating > @min_age AND M.rating < @max_age

END

EXEC MasterExpOrder 0, 5
DROP PROC MasterExpOrder


CREATE OR ALTER PROC CAR_BY_WORK_TYPE --4
	@WORK_TYPE NVARCHAR(30)
	AS
BEGIN
	
	SELECT C.gov_number, C.creation_year, S.services_name, S.cost, O.due_date, O.note, A.complete_date FROM Car C
	JOIN Orders O ON C.car_code = O.car_code
	JOIN AccountingServices A ON A.order_code = O.order_code
	JOIN Services S ON S.services_code = A.services_code
	JOIN WorkType W ON W.work_type_code = S.work_type_code
	WHERE W.work_type = @WORK_TYPE

END


EXEC CAR_BY_WORK_TYPE N'Техническое обслуживание'
DROP PROC CAR_BY_WORK_TYPE

CREATE OR ALTER PROC Overdue_Order AS
BEGIN

	declare @Today date = GETDATE()

	SELECT M.full_name, M.payment, M.rating, M.rating FROM AccountingServices A
	JOIN Master M ON M.id_master = A.id_master
	WHERE A.complete_date < @Today

END

EXEC Overdue_Order
DROP PROC Overdue_Order