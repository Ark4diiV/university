--Персонал
insert into dbo.staff (id_master, name, id_grade, qualification)
values      (1, 'Пиминов Дмитрий',   '1', 'Диагност'), 
            (2, 'Печенкин Виталий',  '2', 'Диагност, электрик'), 
            (3, 'Шварц Александр',   '3', 'Диагност, автожестянщик, моторист');

--Грейды
insert into dbo.grades (id_grade, description)
values      (1, 'Стажер'),
            (2, 'Специалист'),
            (3, 'Старший специалист'),
            (4, 'Эксперт'),
            (5, 'Начальник');

--Склад
select * from materials;
insert into dbo.materials (id_material, title, price)
values      (1, 'Тормозные колодки AL-1345', 5500),
            (2, 'Фары от ВАЗ 2114', 2300),
            (3, 'Шины 15 от ВАЗ 2114', 4500),
            (4, 'Коробка передач ЗАЗ-34', 13700),
            (5, 'Свечи зажигания БЖ-11', 1100),
            (6, 'Аккумулятор АК-117', 3500);

-- Наполнить customers
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (1, 'Калашников Михаил', 1, '79992224466', 'kalashnikov@mail.ru', '1323 235689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (2, 'Айгумов Магомедали', 2, '79998886611', 'igumov@mail.ru', '1307 235689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (3, 'Акинфеев Андрей', 3, '79993334455', 'akinfeev@mail.ru', '1385 452989');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (4, 'Алешичев Валерий', 4, '79990033222', 'alishevich@mail.ru', '1318 995689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (5, 'Алешкин Валерий', 5, '79993344000', 'aleshkin@mail.ru', '1544 322189');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (6, 'Карагодов Алексей', 6, '79991199333', 'karagodov@mail.ru', '1904 849689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (7, 'Карачаровский Владимир', 7, '79997766111', 'karacharovky@mail.ru', '1433 455689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (8, 'Санков Виктор', 8, '79996644333', 'sankov@mail.ru', '1243 235649');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (9, 'Севостьянов Илья', 9, '79993322888', 'sevastyanov@mail.ru', '1294 2333389');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (10, 'Семенова Наталья', 10, '79993355444', 'semenova@mail.ru', '1253 232349');

-- Наполнить vehicles
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (1, 1, 'ВАЗ 2110', 'Н101АН', '2001', 2435000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (2, 2, 'ВАЗ 2111', 'Г131РН', '2002', 9935000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (3, 3, 'ВАЗ 2112', 'Н991ОН', '2003', 3935000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (4, 4, 'ВАЗ 2114', 'Н145ОО', '2004', 1335000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (5, 5, 'ВАЗ 2116', 'Н555НН', '2005', 1350400);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (6, 6, 'ВАЗ 2107', 'А222АА', '2006', 3450100);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (7, 7, 'ВАЗ 2107', 'С144АН', '2007', 3535000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (8, 8, 'ВАЗ 2110', 'В221АН', '1999', 3532000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (9, 9, 'ВАЗ 2115', 'М331ПН', '1995', 7995000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (11, 11, 'ВАЗ 2101', 'С266СН', '1989', 9935770);
