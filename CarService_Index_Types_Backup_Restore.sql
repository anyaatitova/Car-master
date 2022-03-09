USE CarService
GO


CREATE TABLE Master_Clone(
	id_master INT,
	full_name NVARCHAR(50) NOT NULL,
	rating INT NOT NULL,
	payment FLOAT NOT NULL,
	scheudle  NVARCHAR(50) NOT NULL
)

CREATE TABLE Car_Clone(
	car_code INT,
	power INT NOT NULL,
	gov_number NVARCHAR(8) NOT NULL,
	creation_year INT NOT NULL,
	color  NVARCHAR(30) NOT NULL,
	id_owner INT NOT NULL,
	mark_code INT NOT NULL,
)


CREATE UNIQUE CLUSTERED INDEX IDX_car_code ON Car_Clone(car_code)
CREATE UNIQUE CLUSTERED INDEX IDX_id_master ON Master_Clone(id_master)

CREATE INDEX IDX_master_name ON Master_Clone(full_name)
CREATE INDEX IDX_car_color ON Car_Clone(color)

CREATE INDEX IDX_master_info ON Master_Clone(full_name, rating, payment)
CREATE INDEX IDX_car_params ON Car_Clone(color, power,gov_number,creation_year)


DROP TABLE Master_Clone
DROP TABLE Car_Clone


CREATE TYPE Rating_type FROM INT NOT NULL
CREATE TYPE Scheudle_type FROM NVARCHAR(10) NOT NULL
CREATE TYPE Birthday_type FROM DATE NOT NULL


CREATE TABLE Master_Clone(
	id_master INT,
	full_name NVARCHAR(50) NOT NULL,
	rating Rating_type,
	birthday Birthday_type,
	scheudle Scheudle_type,
)


CREATE RULE RatingBorders AS @Rating_type BETWEEN 1 and 12
CREATE RULE ScheduleMask AS @Scheudle_type like '[1-7][/][1-7]'
CREATE RULE Birthday AS @Birthday_type < GETDATE()


EXEC sp_bindrule 'RatingBorders', 'Master_Clone.rating'
EXEC sp_bindrule 'ScheduleMask', 'Master_Clone.scheudle'
EXEC sp_bindrule 'Birthday', 'Master_Clone.birthday'

INSERT INTO Master_Clone(full_name, rating, birthday, scheudle) VALUES (N'Фёдор', 14, '12.09.2021' ,N'2/2');
INSERT INTO Master_Clone(full_name, rating, birthday, scheudle) VALUES (N'Фёдор', 11, '12.09.2021' ,N'2/2');

INSERT INTO Master_Clone(full_name, rating, birthday, scheudle) VALUES (N'Фёдор', 11, '16.09.2021' ,N'2/2');
INSERT INTO Master_Clone(full_name, rating, birthday, scheudle) VALUES (N'Фёдор', 11, '12.09.2021' ,N'2/2');

INSERT INTO Master_Clone(full_name, rating, birthday, scheudle) VALUES (N'Фёдор', 11, '12.09.2021' ,N'8/2');
INSERT INTO Master_Clone(full_name, rating, birthday, scheudle) VALUES (N'Фёдор', 11, '12.09.2021' ,N'2/2');


BACKUP DATABASE CarService
TO DISK = 'C:/Users/Student408/Desktop/BACKUP/CarService.bak'

BACKUP DATABASE CarService
TO DISK = 'C:/Users/Student408/Desktop/BACKUP/CarService.bak'
WITH DIFFERENTIAL

BACKUP DATABASE CarService
TO DISK = 'C:/Users/Student408/Desktop/BACKUP/CarService.log.bak'

RESTORE DATABASE CarService
FROM DISK = 'C:/Users/Student408/Desktop/BACKUP/CarService.bak'
WITH REPLACE

RESTORE DATABASE CarService
FROM DISK = 'C:/Users/Student408/Desktop/BACKUP/CarService.bak'
WITH FILE = 1, NORECOVERY, REPLACE

RESTORE LOG CarService
FROM DISK = 'C:/Users/Student408/Desktop/BACKUP/CarService.LOG.bak'
WITH FILE = 1, NORECOVERY