select * from customers;         --Клиенты
select * from vehicles;          --Транспорт
select * from dbo.[diagnostics]; --Тикеты на диагностику
select * from service;           --Заявки на сервис
select * from grades;            --Грейды
select * from staff;             --Персонал
select * from bills;             --Стоимость работ

delete from dbo.[diagnostics] where id_ticket = 1; --Удалить тикет
delete from dbo.service where id_service = 1; --Удалить заявку на сервис

/*
DROP TABLE service_db.dbo.customers;
DROP TABLE service_db.dbo.vehicles;
DROP TABLE service_db.dbo.diagnostics;
DROP TABLE service_db.dbo.service;
DROP TABLE service_db.dbo.staff;
DROP TABLE service_db.dbo.materials;
DROP TABLE service_db.dbo.grades;
DROP TABLE service_db.dbo.bills;
*/

