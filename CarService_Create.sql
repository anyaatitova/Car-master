CREATE DATABASE CarService
GO

USE CarService
GO

CREATE TABLE WorkType(
	work_type_code INT IDENTITY,
	work_type NVARCHAR(40) NOT NULL

	CONSTRAINT PK_work_type PRIMARY KEY(work_type_code),
	CONSTRAINT UQ_work_type UNIQUE(work_type),
)

CREATE TABLE Services(
	services_code INT IDENTITY,
	services_name NVARCHAR(50) NOT NULL,
	cost FLOAT NOT NULL,
	work_type_code INT NOT NULL

	CONSTRAINT PK_services_code PRIMARY KEY(services_code),
	CONSTRAINT CK_cost CHECK (cost > 0),
	CONSTRAINT FK_work_type_code FOREIGN KEY (work_type_code)  REFERENCES WorkType (work_type_code) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE Owner(
	id_owner INT IDENTITY,
	phone_number NVARCHAR(13) NOT NULL,
	full_name NVARCHAR(50) NOT NULL

	CONSTRAINT PK_id_owner PRIMARY KEY(id_owner),
	CONSTRAINT CK_phone_number CHECK (phone_number like '[+][3][7][5][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
)

CREATE TABLE Mark(
	mark_code INT IDENTITY,
	mark_name NVARCHAR(13) NOT NULL,

	CONSTRAINT PK_mark_code PRIMARY KEY(mark_code),
)

CREATE TABLE Master(
	id_master INT IDENTITY,
	full_name NVARCHAR(50) NOT NULL,
	rating INT NOT NULL,
	payment FLOAT NOT NULL,
	scheudle  NVARCHAR(50) NOT NULL

	CONSTRAINT PK_id_master PRIMARY KEY(id_master),
	CONSTRAINT CK_scheudle CHECK (scheudle like '[1-7][/][1-7]'),
	CONSTRAINT CK_payment CHECK (payment > 400),
	CONSTRAINT CK_rating CHECK (rating BETWEEN 0 AND 13),
)

CREATE TABLE Car(
	car_code INT IDENTITY,
	power INT NOT NULL,
	gov_number NVARCHAR(8) NOT NULL,
	creation_year INT NOT NULL,
	color  NVARCHAR(30) NOT NULL,
	id_owner INT NOT NULL,
	mark_code INT NOT NULL,

	CONSTRAINT PK_car_code PRIMARY KEY(car_code),
	CONSTRAINT FK_id_owner FOREIGN KEY  (id_owner)  REFERENCES Owner (id_owner) ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT FK_mark_code FOREIGN KEY (mark_code)  REFERENCES Mark (mark_code) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CH_power CHECK (power > 0),
	CONSTRAINT CH_gov_number CHECK(gov_number like '[0-9][0-9][0-9][0-9][A-Z][A-Z][-][1-7]')
)


CREATE TABLE Orders(
	order_code INT IDENTITY,
	application_date date NOT NULL,
	due_date date NOT NULL,
	note NVARCHAR(50) NOT NULL,
	order_cost  INT NOT NULL,
	car_code INT NOT NULL,

	CONSTRAINT PK_order_code PRIMARY KEY(order_code),
	CONSTRAINT CH_order_cost CHECK (order_cost > 0),
	CONSTRAINT FK_car_code FOREIGN KEY  (car_code)  REFERENCES Car (car_code) ON DELETE CASCADE ON UPDATE CASCADE, 
)

CREATE TABLE AccountingServices(
	code_accounting_services INT IDENTITY,
	count_of_services INT NOT NULL,
	complete_date date NULL,
	finish_price FLOAT NULL,
	services_code INT NOT NULL,
	id_master  INT NOT NULL,
	order_code INT NOT NULL,
	is_finished BIT NOT NULL DEFAULT 0,

	CONSTRAINT PK_code_accounting_services PRIMARY KEY(code_accounting_services),
	CONSTRAINT FK_services_code FOREIGN KEY  (services_code)  REFERENCES Services (services_code) ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT FK_id_master FOREIGN KEY (id_master)  REFERENCES Master (id_master) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_order_code FOREIGN KEY (order_code)  REFERENCES Orders (order_code) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CH_count_of_services CHECK(count_of_services > 0)
)

set dateformat dmy
