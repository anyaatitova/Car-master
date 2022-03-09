USE CarService
GO

CREATE OR ALTER FUNCTION YRAVN(@X FLOAT)
RETURNS FLOAT
AS
BEGIN

		IF(@X < 3.5)
			BEGIN
				RETURN (SIN(@X + 1))
			END
		ELSE
			BEGIN
				RETURN (2.5 * @X + 3)
			END

	RETURN 0
END

SELECT dbo.YRAVN(2)


CREATE OR ALTER FUNCTION GETACTIVECLIENTS()
RETURNS TABLE
AS RETURN (SELECT W.full_name AS 'FIO', C.gov_number AS 'GOV NUM' FROM AccountingServices A
						JOIN Orders O ON A.order_code = O.order_code
						JOIN Car C ON O.car_code= C.car_code
						JOIN Owner W ON C.id_owner = W.id_owner
						WHERE A.is_finished != 1)

					
SELECT * FROM GETACTIVECLIENTS()



CREATE OR ALTER FUNCTION NewCost(@percent INT = 10, @GOVNUMBER NVARCHAR(50), @SERVICENAME NVARCHAR(50))
RETURNS FLOAT
AS
BEGIN
        DECLARE @addCosts FLOAT, @sumBudget FLOAT

        SET @sumBudget = (SELECT A.finish_price FROM AccountingServices A
											JOIN Orders O ON O.order_code = A.order_code
											JOIN Car C ON C.car_code = O.car_code
											JOIN Services S ON S.services_code = A.services_code
											WHERE C.gov_number = @GOVNUMBER AND S.services_name = @SERVICENAME)
        SET @addCosts = @sumBudget * @percent/100
        RETURN @addCosts + @sumBudget
END
	
SELECT dbo.NewCost(25, N'8775AP-7', N'Замена масла в ДВС') AS 'Новая цена'


SELECT A.finish_price, A.services_code, S.services_name FROM AccountingServices A
											JOIN Orders O ON O.order_code = A.order_code
											JOIN Services S ON S.services_code = A.services_code
											JOIN Car C ON C.car_code = O.car_code
											WHERE C.gov_number = N'8775AP-7'