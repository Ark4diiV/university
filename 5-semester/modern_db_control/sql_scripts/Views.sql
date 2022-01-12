--Список сотрудников сматченный с грейдами и почасовая ставка
--select * from staff_list;
create view staff_list as
select staff.name, 
       staff.qualification, 
       grades.description,
       (grades.id_grade * 500) as rate
from   staff 
join   grades 
       on staff.id_grade = grades.id_grade;

      
--Сервисные работы за последний день 
--select * from last_day_services;
create view last_day_services as
select staff.name, 
       service.job, 
       service.state, 
       service.start_date, 
       service.conclusion, 
       service.duration 
from   service 
join   staff 
       on service.id_master = staff.id_master 
where  service.start_date >=  DATEADD(day,-1,CAST(GETDATE() as date));


--Динамика выполненных заявок на диагностику по дням
--select * from diagnostics_by_day;
create view diagnostics_by_day as
select   day(start_date) 'day', 
         count(id_ticket) as cnt
from     dbo.[diagnostics] 
where    state = 'done'
group by datepart(day, start_date);


--Статистика по моделям автомобилей клиентов
--select * from vehicles_by_models;
create view vehicles_by_models as
select   model, 
         count(*) as cnt 
from     vehicles
group by model;


--Список клиентов сматченный с автомобилями
--select * from customers_and_vehicles;
create view customers_and_vehicles as
select customers.name, 
       vehicles.model, 
       vehicles.[number], 
       customers.phone, 
       customers.email, 
       customers.document_id
from   customers 
join   vehicles 
       on customers.id_owner = vehicles.id_owner;
