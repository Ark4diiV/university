select * from customers;         --�������
select * from vehicles;          --���������
select * from dbo.[diagnostics]; --������ �� �����������
select * from service;           --������ �� ������
select * from grades;            --������
select * from staff;             --��������
select * from bills;             --��������� �����

delete from dbo.[diagnostics] where id_ticket = 1; --������� �����
delete from dbo.service where id_service = 1; --������� ������ �� ������

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

