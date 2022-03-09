USE CarService
GO

INSERT INTO WorkType(work_type) VALUES (N'Техническое обслуживание'),
										(N'Двигатель и система охлаждения'),
										(N'Кузовной ремонт и сварочные работы'),
										(N'Обслуживание ходовой части'),
										(N'Шиномонтаж и сход-развал'),
										(N'Трансмиссия'),
										(N'Рулевое управление'),
										(N'Тормозная система'),
										(N'Дополнительные услуги'),
										(N'Электроника'),
										(N'Покраска'),
										(N'Диагностика')


									
INSERT INTO Services(services_name,cost,work_type_code) VALUES (N'Замена масла в ДВС', 30, (select work_type_code from WorkType where work_type = N'Техническое обслуживание')),
																(N'Замена масляного фильтра', 130, (select work_type_code from WorkType where work_type = N'Техническое обслуживание')),
																(N'Замена воздушного фильтра', 230, (select work_type_code from WorkType where work_type = N'Техническое обслуживание')),
																(N'Замена топливного фильтра', 34, (select work_type_code from WorkType where work_type = N'Техническое обслуживание')),
																(N'Замена тормозной жидкости', 32, (select work_type_code from WorkType where work_type = N'Техническое обслуживание')),

																(N'Капитальный ремонт двигателя', 21, (select work_type_code from WorkType where work_type = N'Двигатель и система охлаждения')),
																(N'Замена ремня и цепи ГРМ', 12, (select work_type_code from WorkType where work_type = N'Двигатель и система охлаждения')),
																(N'Замена приводных ремней', 14, (select work_type_code from WorkType where work_type = N'Двигатель и система охлаждения')),
																(N'Замена опор двигателя', 154, (select work_type_code from WorkType where work_type = N'Двигатель и система охлаждения')),
																(N'Замена поршневых колец и маслосъемных колпачков', 123, (select work_type_code from WorkType where work_type = N'Двигатель и система охлаждения')),

																(N'Кузовной ремонт', 213, (select work_type_code from WorkType where work_type = N'Кузовной ремонт и сварочные работы')),
																(N'Покраска кузова автомобиля', 143, (select work_type_code from WorkType where work_type = N'Кузовной ремонт и сварочные работы')),
																(N'Ремонт бампера', 234, (select work_type_code from WorkType where work_type = N'Кузовной ремонт и сварочные работы')),
																(N'Вакуумное удаление вмятин без покраски', 123, (select work_type_code from WorkType where work_type = N'Кузовной ремонт и сварочные работы')),
																(N'Восстановление геометрии кузова', 342, (select work_type_code from WorkType where work_type = N'Кузовной ремонт и сварочные работы')),

																(N'Замена сцепления', 234, (select work_type_code from WorkType where work_type = N'Обслуживание ходовой части')),
																(N'Замена сайлентблока', 234, (select work_type_code from WorkType where work_type = N'Обслуживание ходовой части')),
																(N'Замена амортизатора', 123, (select work_type_code from WorkType where work_type = N'Обслуживание ходовой части')),
																(N'Замена шаровых опор', 241, (select work_type_code from WorkType where work_type = N'Обслуживание ходовой части')),
																(N'Замена рычагов', 211, (select work_type_code from WorkType where work_type = N'Обслуживание ходовой части')),

																(N'Компьютерная диагностика развал-схождение 3D', 235, (select work_type_code from WorkType where work_type = N'Шиномонтаж и сход-развал')),
																(N'Балансировка колес', 123, (select work_type_code from WorkType where work_type = N'Шиномонтаж и сход-развал')),
																(N'Отель для ваших шин', 100, (select work_type_code from WorkType where work_type = N'Шиномонтаж и сход-развал')),

																(N'Замена масла в АКПП', 344, (select work_type_code from WorkType where work_type = N'Трансмиссия')),
																(N'Замена АКПП', 333, (select work_type_code from WorkType where work_type = N'Трансмиссия')),
																(N'Замена крестовин', 344, (select work_type_code from WorkType where work_type = N'Трансмиссия')),
																(N'Ремонт МКПП', 355, (select work_type_code from WorkType where work_type = N'Трансмиссия')),
																(N'Замена карданного вала', 356, (select work_type_code from WorkType where work_type = N'Трансмиссия')),

															    (N'Замена рулевых тяг и наконечников', 123, (select work_type_code from WorkType where work_type = N'Рулевое управление')),
																(N'Замена рулевых реек', 55, (select work_type_code from WorkType where work_type = N'Рулевое управление')),
																(N'Ремонт рулевых редукторов', 55, (select work_type_code from WorkType where work_type = N'Рулевое управление')),

																(N'Замена тормозных дисков', 66, (select work_type_code from WorkType where work_type = N'Тормозная система')),
																(N'Замена тормозных колодок', 44, (select work_type_code from WorkType where work_type = N'Тормозная система')),
																(N'Замена тормозной жидкости', 33, (select work_type_code from WorkType where work_type = N'Тормозная система')),

															
																(N'Установка парктроников', 466, (select work_type_code from WorkType where work_type = N'Дополнительные услуги')),
																(N'Установка камеры заднего вида', 433, (select work_type_code from WorkType where work_type = N'Дополнительные услуги')),
																(N'Шумоизоляция автомобиля', 400, (select work_type_code from WorkType where work_type = N'Дополнительные услуги'))
					
INSERT INTO Owner(phone_number, full_name) VALUES (N'+375292474148', N'Федотов Остап Вадимович'),
													(N'+375441474586', N'Власов Олег Ростиславович'),
													(N'+375289632145', N'Филиппов Эдуард Ефимови'),
													(N'+375774125873', N'Гордеев Анатолий Данилович'),
													(N'+375998741205', N'Белоусов Ипполит Федосеевич'),
													(N'+375998741205', N'Попов Арсен Михайлович'),
													(N'+375295874847', N'Орлова Варвара Михайловна'),
													(N'+375289874515', N'Королева София Александровна'),
													(N'+375125874545', N'Ильин Марк Степанович'),
													(N'+375281474747', N'Андреев Александр Андреевич'),
													(N'+375295874512', N'Андреев Александр Вячеславович'),
													(N'+375298741324', N'Дмитриев Илья Романович'),
													(N'+375295874512', N'Владимиров Ярослав Егорович'),
													(N'+375789465123', N'Вешняков Илья Григорьевич'),
													(N'+375489461520', N'Юдин Лев Матвеевич'),
													(N'+375865156422', N'Медведев Матвей Евгеньевич'),
													(N'+375222147888', N'Смирнов Михаил Степанович'),
													(N'+375298742222', N'Шилова Полина Ивановна'),
													(N'+375000014552', N'Селезнев Иван Александрович')

INSERT INTO Mark(mark_name) VALUES (N'AUDI'),
									(N'BMW'),
									(N'Mazda'),
									(N'Toyota'),
									(N'Opel'),
									(N'Aston-Martin'),
									(N'Mercedes-Benz'),
									(N'Volkswagen'),
									(N'Nissan'),
									(N'Volvo'),
									(N'Citroen'),
									(N'Adler'),
									(N'Donkervoort'),
									(N'Daihatsu'),
									(N'Dodge'),
									(N'ZIL'),
									(N'Fiat'),
									(N'Infiniti'),
									(N'Jeep'),
									(N'Landwind'),
									(N'Nissan'),
									(N'Pagani'),
									(N'Rover'),
									(N'Škoda')


INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (200, N'8745AP-7', 2001, N'Зелёный', (select id_owner from Owner where full_name = N'Федотов Остап Вадимович'), (select mark_code from Mark where mark_name = N'AUDI'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (150, N'8765AP-7', 2011, N'Белый', (select id_owner from Owner where full_name = N'Власов Олег Ростиславович'),(select mark_code from Mark where mark_name = N'BMW'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (100, N'8775AP-7', 2021, N'Чёрный', (select id_owner from Owner where full_name = N'Филиппов Эдуард Ефимови'),(select mark_code from Mark where mark_name = N'BMW'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (50,  N'8725AP-7', 2012, N'Жёлтый', (select id_owner from Owner where full_name = N'Гордеев Анатолий Данилович'),(select mark_code from Mark where mark_name = N'Toyota'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (160, N'8715AP-7', 2001, N'Красный', (select id_owner from Owner where full_name = N'Орлова Варвара Михайловна'),(select mark_code from Mark where mark_name = N'Mazda'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (220, N'7715AP-7', 2001, N'Чёрный', (select id_owner from Owner where full_name = N'Орлова Варвара Михайловна'),(select mark_code from Mark where mark_name = N'Volvo'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (140, N'8115AP-7', 2001, N'Чёрный', (select id_owner from Owner where full_name = N'Орлова Варвара Михайловна'),(select mark_code from Mark where mark_name = N'Opel'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (100, N'9715AP-5', 2001, N'Чёрный', (select id_owner from Owner where full_name = N'Селезнев Иван Александрович'),(select mark_code from Mark where mark_name = N'Infiniti'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (372, N'0715AP-6', 2001, N'Белый', (select id_owner from Owner where full_name = N'Вешняков Илья Григорьевич'),(select mark_code from Mark where mark_name = N'Infiniti'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (100, N'8115AP-6', 2001, N'Белый', (select id_owner from Owner where full_name = N'Вешняков Илья Григорьевич'),(select mark_code from Mark where mark_name = N'Infiniti'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (120, N'8215AP-6', 2001, N'Белый', (select id_owner from Owner where full_name = N'Попов Арсен Михайлович'),(select mark_code from Mark where mark_name = N'Škoda'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (120, N'8915AP-5', 2001, N'Жёлтый', (select id_owner from Owner where full_name = N'Попов Арсен Михайлович'),(select mark_code from Mark where mark_name = N'Škoda'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (160, N'8615AP-1', 2001, N'Жёлтый', (select id_owner from Owner where full_name = N'Попов Арсен Михайлович'),(select mark_code from Mark where mark_name = N'Škoda'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (160, N'8515AP-3', 2001, N'Жёлтый', (select id_owner from Owner where full_name = N'Шилова Полина Ивановна'),(select mark_code from Mark where mark_name = N'ZIL'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (140, N'8415AP-1', 2001, N'Красный', (select id_owner from Owner where full_name = N'Медведев Матвей Евгеньевич'),(select mark_code from Mark where mark_name = N'Donkervoort'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (87,  N'8715PP-2', 2001, N'Красный', (select id_owner from Owner where full_name = N'Андреев Александр Вячеславович'),(select mark_code from Mark where mark_name = N'Donkervoort'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (89,  N'8715AP-5', 2001, N'Красный', (select id_owner from Owner where full_name = N'Андреев Александр Андреевич'),(select mark_code from Mark where mark_name = N'Donkervoort'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (90,  N'8715EP-7', 2001, N'Красный', (select id_owner from Owner where full_name = N'Ильин Марк Степанович'),(select mark_code from Mark where mark_name = N'Citroen'))
INSERT INTO Car(power, gov_number, creation_year, color, id_owner, mark_code) VALUES (100, N'8785AP-7', 2021, N'Чёрный', (select id_owner from Owner where full_name = N'Филиппов Эдуард Ефимови'),(select mark_code from Mark where mark_name = N'Mercedes-Benz'))
																					


INSERT INTO Master(full_name, rating, payment, scheudle) VALUES (N'Казаков Харитон Васильевич', 5, 450, N'2/2'),
																(N'Карпенко-Карый Гарри Андреевич', 5, 600, N'2/2'),
																(N'Самсонов Чарльз Станиславович', 6, 1500, N'5/2'),
																(N'Гаврилов Харитон Станиславович', 10, 900, N'4/3'),
																(N'Яковлев Сава Дмитриевич', 1, 500, N'5/2'),
																(N'Лукин Жигер Брониславович', 2, 600, N'5/2'),
																(N'Гришин Алексей Давидович', 3, 700, N'5/2'),
																(N'Егоров Фёдор Романович', 4, 800, N'5/2'),
																(N'Гаврилов Марат Тимурович', 5, 900, N'5/2'),
																(N'Лебедев Макар Вячеславович', 6, 1000, N'5/2'),
																(N'Павлов Марк Богданович', 7, 1100, N'5/2'),
																(N'Андреева Анна Владимировна', 8, 1200, N'5/2'),
																(N'Белова Элина Матвеевна', 9, 1300, N'5/2'),
																(N'Фролов Олег Александрович', 10, 1400, N'5/2'),
																(N'Трифонова Елизавета Давидовна', 11, 1420, N'5/2'),
																(N'Колесников Илья Иванович', 12, 1450, N'5/2'),
																(N'Цветков Иван Андреевич', 12, 1500, N'5/2')

																
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('22.09.2021', '25.09.2021', N'Оплата в рассрочку', 150, (select car_code  from Car where gov_number = N'8745AP-7'))
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('22.09.2021', '26.09.2021', N'Отсутствует', 250, (select car_code  from Car where gov_number = N'8765AP-7'))																		     
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('18.09.2021', '30.09.2021', N'Необходима замена', 300, (select car_code  from Car where gov_number = N'8775AP-7'))																		     
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('19.09.2021', '19.09.2021', N'Оплата в рассрочку', 400, (select car_code  from Car where gov_number = N'8725AP-7'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('15.09.2021', '17.09.2021', N'Необходима замена', 350, (select car_code  from Car where gov_number = N'8725AP-7'))																				
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('14.09.2021', '17.09.2021', N'Оплата в рассрочку', 200, (select car_code  from Car where gov_number = N'9715AP-5'))																			 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('20.09.2021', '22.09.2021', N'Необходима замена', 20, (select car_code  from Car where gov_number = N'0715AP-6'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('16.10.2021', '18.10.2021', N'Оплата в рассрочку', 30, (select car_code  from Car where gov_number = N'8115AP-6'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('17.10.2021', '19.10.2021', N'Необходима замена', 120, (select car_code  from Car where gov_number = N'8215AP-6'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('18.10.2021', '20.10.2021', N'Отсутствует', 300, (select car_code  from Car where gov_number = N'8615AP-1'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('19.10.2021', '21.10.2021', N'Необходима замена', 400, (select car_code  from Car where gov_number = N'8515AP-3'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('20.10.2021', '22.10.2021', N'Срочно', 500, (select car_code  from Car where gov_number = N'8415AP-1'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('21.10.2021', '23.10.2021', N'Необходима замена', 550, (select car_code  from Car where gov_number = N'8715PP-2'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('22.10.2021', '24.10.2021', N'Срочно', 600, (select car_code  from Car where gov_number = N'8715AP-5'))																				 
INSERT INTO Orders(application_date, due_date, note, order_cost, car_code) VALUES ('23.10.2021', '25.10.2021', N'Необходима замена', 700, (select car_code  from Car where gov_number = N'8745AP-7'))



INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (1, (select services_code  from Services where services_name = N'Замена масла в ДВС'),(select id_master  from Master where full_name = N'Казаков Харитон Васильевич'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8415AP-1')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (1, (select services_code  from Services where services_name = N'Капитальный ремонт двигателя'),(select id_master  from Master where full_name = N'Самсонов Чарльз Станиславович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8765AP-7')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (2, (select services_code  from Services where services_name = N'Замена сайлентблока'),(select id_master  from Master where full_name = N'Гаврилов Харитон Станиславович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8775AP-7')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (4, (select services_code  from Services where services_name = N'Замена тормозных колодок'),(select id_master  from Master where full_name = N'Лукин Жигер Брониславович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8515AP-3')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (5, (select services_code  from Services where services_name = N'Шумоизоляция автомобиля'),(select id_master  from Master where full_name = N'Карпенко-Карый Гарри Андреевич'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8715AP-5')))
																																																																																																						
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (1, (select services_code  from Services where services_name = N'Замена масла в ДВС'),(select id_master  from Master where full_name = N'Андреева Анна Владимировна'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'0715AP-6')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (1, (select services_code  from Services where services_name = N'Капитальный ремонт двигателя'),(select id_master  from Master where full_name = N'Фролов Олег Александрович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8115AP-6')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (2, (select services_code  from Services where services_name = N'Замена сайлентблока'),(select id_master  from Master where full_name = N'Трифонова Елизавета Давидовна'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8215AP-6')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (4, (select services_code  from Services where services_name = N'Замена тормозных колодок'),(select id_master  from Master where full_name = N'Цветков Иван Андреевич'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'7715AP-7')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (5, (select services_code  from Services where services_name = N'Шумоизоляция автомобиля'),(select id_master  from Master where full_name = N'Гришин Алексей Давидович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8215AP-6')))

INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (1, (select services_code  from Services where services_name = N'Замена масла в ДВС'),(select id_master  from Master where full_name = N'Павлов Марк Богданович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8775AP-7')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (1, (select services_code  from Services where services_name = N'Капитальный ремонт двигателя'),(select id_master  from Master where full_name = N'Белова Элина Матвеевна'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8765AP-7')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (2, (select services_code  from Services where services_name = N'Замена сайлентблока'),(select id_master  from Master where full_name = N'Самсонов Чарльз Станиславович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8775AP-7')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (4, (select services_code  from Services where services_name = N'Замена тормозных колодок'),(select id_master  from Master where full_name = N'Гаврилов Харитон Станиславович'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8215AP-6')))
INSERT INTO AccountingServices(count_of_services,  services_code, id_master, order_code) VALUES (5, (select services_code  from Services where services_name = N'Шумоизоляция автомобиля'),(select id_master  from Master where full_name = N'Трифонова Елизавета Давидовна'), (select order_code  from Orders where car_code = (select car_code  from Car where gov_number = N'8715PP-2')))


select * from AccountingServices
select * from Car
select * from Mark
select * from Master
select * from Orders
select * from Owner
select * from Services
select * from WorkType

