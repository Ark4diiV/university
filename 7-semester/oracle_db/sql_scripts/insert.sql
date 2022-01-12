--Наполнение таблицы GRADES
INSERT ALL 
  INTO SERVICEDB.GRADES (ID_GRADE, DESCRIPTION) VALUES (3,  'Менеджер')
  INTO SERVICEDB.GRADES (ID_GRADE, DESCRIPTION) VALUES (5,  'Эксперт')
  INTO SERVICEDB.GRADES (ID_GRADE, DESCRIPTION) VALUES (6,  'Специалист')
  INTO SERVICEDB.GRADES (ID_GRADE, DESCRIPTION) VALUES (7,  'Стажер')
  INTO SERVICEDB.GRADES (ID_GRADE, DESCRIPTION) VALUES (10, 'Приемщик')
SELECT * FROM dual;
--Наполнение таблицы MATERIALS
INSERT ALL 
  INTO SERVICEDB.MATERIALS (id_material, title, price) VALUES (1, 'Тормозные колодки AL-1345', 5500)
  INTO SERVICEDB.MATERIALS (id_material, title, price) VALUES (2, 'Фары от ВАЗ 2114', 2300)
  INTO SERVICEDB.MATERIALS (id_material, title, price) VALUES (3, 'Шины 15 от ВАЗ 2114', 4500)
  INTO SERVICEDB.MATERIALS (id_material, title, price) VALUES (4, 'Коробка передач ЗАЗ-34', 13700)
  INTO SERVICEDB.MATERIALS (id_material, title, price) VALUES (5, 'Свечи зажигания БЖ-11', 1100)
  INTO SERVICEDB.MATERIALS (id_material, title, price) VALUES (6, 'Аккумулятор АК-117', 3500)
SELECT * FROM dual;
--Наполнение таблицы CUSTOMERS и VEHICLES
INSERT ALL 
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (1, 1, 'ВАЗ 2110', 'Н101АН', '2001', 2435000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (2, 2, 'ВАЗ 2111', 'Г131РН', '2002', 9935000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (3, 3, 'ВАЗ 2112', 'Н991ОН', '2003', 3935000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (4, 4, 'ВАЗ 2114', 'Н145ОО', '2004', 1335000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (5, 5, 'ВАЗ 2116', 'Н555НН', '2005', 1350400)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (6, 6, 'ВАЗ 2107', 'А222АА', '2006', 3450100)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (7, 7, 'ВАЗ 2107', 'С144АН', '2007', 3535000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (8, 8, 'ВАЗ 2110', 'В221АН', '1999', 3532000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (9, 9, 'ВАЗ 2115', 'М331ПН', '1995', 7995000)
  INTO SERVICEDB.VEHICLES (id_vehicle, id_owner, model, PLATE, issued, mileage)
    VALUES (10, 10, 'ВАЗ 2114', 'М333ПН', '1999', 988000)
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (1, 'Калашников Михаил', 1, '79992224466', 'kalashnikov@mail.ru', '1323 235689')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (2, 'Айгумов Магомедали', 2, '79998886611', 'igumov@mail.ru', '1307 235689')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (3, 'Акинфеев Андрей', 3, '79993334455', 'akinfeev@mail.ru', '1385 452989')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (4, 'Алешичев Валерий', 4, '79990033222', 'alishevich@mail.ru', '1318 995689')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (5, 'Алешкин Валерий', 5, '79993344000', 'aleshkin@mail.ru', '1544 322189')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (6, 'Карагодов Алексей', 6, '79991199333', 'karagodov@mail.ru', '1904 849689')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (7, 'Карачаровский Владимир', 7, '79997766111', 'karacharovky@mail.ru', '1433 455689')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (8, 'Санков Виктор', 8, '79996644333', 'sankov@mail.ru', '1243 235649')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (9, 'Севостьянов Илья', 9, '79993322888', 'sevastyanov@mail.ru', '1294 2333389')
  INTO SERVICEDB.CUSTOMERS (id_owner, name, id_vehicle, phone, email, document_id) 
    VALUES (10, 'Семенова Наталья', 10, '79993355444', 'semenova@mail.ru', '1253 232349')
SELECT * FROM dual;
--Наполнение таблицы STAFF
INSERT ALL 
  INTO SERVICEDB.STAFF (ID_MASTER, NAME, ID_GRADE, QUALIFICATION)
    VALUES (1, 'Пиминов Дмитрий', '7', 'Диагност', 50000)
  INTO SERVICEDB.STAFF (ID_MASTER, NAME, ID_GRADE, QUALIFICATION)
    VALUES (2, 'Печенкин Виталий',  '6', 'Диагност, электрик', 55000)
  INTO SERVICEDB.STAFF (ID_MASTER, NAME, ID_GRADE, QUALIFICATION)
    VALUES (3, 'Шварц Александр',   '5', 'Диагност, автожестянщик, моторист', 60000)
SELECT * FROM dual;
--Наполнение таблицы DIAGNISTIC
INSERT ALL
  INTO SERVICEDB."DIAGNOSTICS" (ID_TICKET, JOB, DESCRIPTION, STATE, ID_VEHICLE, CONCLUSION, ID_MASTER, START_DATE, DURATION)
    VALUES (1, 'Проверить передние колодки', 'Скрипят колодки', 'Продиагностировано', '1', 'Замена колодок', '1', '25.12.2021', '3')
  INTO SERVICEDB."DIAGNOSTICS" (ID_TICKET, JOB, DESCRIPTION, STATE, ID_VEHICLE, CONCLUSION, ID_MASTER, START_DATE, DURATION)
    VALUES (2, 'Проверить фары освещения', 'Не горят фары освещения', 'Продиагностировано', '2', 'Замена фар', '2', '25.12.2021', '1')
  INTO SERVICEDB."DIAGNOSTICS" (ID_TICKET, JOB, DESCRIPTION, STATE, ID_VEHICLE, CONCLUSION, ID_MASTER, START_DATE, DURATION)
    VALUES (3, 'Проверить коробку передач', 'Стучит коробка передач', 'Продиагностировано', '3', 'Замена коробки', '3', '25.12.2021', '3')
  INTO SERVICEDB."DIAGNOSTICS" (ID_TICKET, JOB, DESCRIPTION, STATE, ID_VEHICLE, CONCLUSION, ID_MASTER, START_DATE, DURATION)
    VALUES (4, 'Проверить свечи', 'Зажигание долгое', 'Продиагностировано', '4', 'Замена 2 свечей', '2', '25.12.2021', '1')
SELECT * FROM dual;
--Наполнение таблицы SERVICE
INSERT ALL
  INTO SERVICEDB.SERVICE (ID_SERVICE, JOB, STATE, ID_VEHICLE, ID_MASTER, ID_TICKET, START_DATE, DURATION, ID_MATERIAL, CONCLUSION)
    VALUES (1, 'Замена колодок', 'Выполнено', 1, 1, 1, '25.12.2021', 2, 1, 'Замена произведена')
  INTO SERVICEDB.SERVICE (ID_SERVICE, JOB, STATE, ID_VEHICLE, ID_MASTER, ID_TICKET, START_DATE, DURATION, ID_MATERIAL, CONCLUSION)
    VALUES (2, 'Замена фар освещения', 'Выполнено', 2, 2, 2, '25.12.2021', 1, 2, 'Замена произведена')
  INTO SERVICEDB.SERVICE (ID_SERVICE, JOB, STATE, ID_VEHICLE, ID_MASTER, ID_TICKET, START_DATE, DURATION, ID_MATERIAL, CONCLUSION)
    VALUES (3, 'Замена коробки передач', 'Выполнено', 3, 3, 3, '25.12.2021', 2, 4, 'Замена произведена')
  INTO SERVICEDB.SERVICE (ID_SERVICE, JOB, STATE, ID_VEHICLE, ID_MASTER, ID_TICKET, START_DATE, DURATION, ID_MATERIAL, CONCLUSION)
    VALUES (4, 'Замена 2 свечей', 'Выполнено', 4, 2, 4, '25.12.2021', 1, 5, 'Замена произведена')
 SELECT * FROM dual;
  INTO 