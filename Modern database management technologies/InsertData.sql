--��������
insert into dbo.staff (id_master, name, id_grade, qualification)
values      (1, '������� �������',   '1', '��������'), 
            (2, '�������� �������',  '2', '��������, ��������'), 
            (3, '����� ���������',   '3', '��������, �������������, ��������');

--������
insert into dbo.grades (id_grade, description)
values      (1, '������'),
            (2, '����������'),
            (3, '������� ����������'),
            (4, '�������'),
            (5, '���������');

--�����
select * from materials;
insert into dbo.materials (id_material, title, price)
values      (1, '��������� ������� AL-1345', 5500),
            (2, '���� �� ��� 2114', 2300),
            (3, '���� 15 �� ��� 2114', 4500),
            (4, '������� ������� ���-34', 13700),
            (5, '����� ��������� ��-11', 1100),
            (6, '����������� ��-117', 3500);

-- ��������� customers
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (1, '���������� ������', 1, '79992224466', 'kalashnikov@mail.ru', '1323 235689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (2, '������� ����������', 2, '79998886611', 'igumov@mail.ru', '1307 235689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (3, '�������� ������', 3, '79993334455', 'akinfeev@mail.ru', '1385 452989');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (4, '�������� �������', 4, '79990033222', 'alishevich@mail.ru', '1318 995689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (5, '������� �������', 5, '79993344000', 'aleshkin@mail.ru', '1544 322189');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (6, '��������� �������', 6, '79991199333', 'karagodov@mail.ru', '1904 849689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (7, '������������� ��������', 7, '79997766111', 'karacharovky@mail.ru', '1433 455689');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (8, '������ ������', 8, '79996644333', 'sankov@mail.ru', '1243 235649');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (9, '����������� ����', 9, '79993322888', 'sevastyanov@mail.ru', '1294 2333389');
insert into dbo.customers (id_owner, name, id_vehicle, phone, email, document_id)
values      (10, '�������� �������', 10, '79993355444', 'semenova@mail.ru', '1253 232349');

-- ��������� vehicles
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (1, 1, '��� 2110', '�101��', '2001', 2435000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (2, 2, '��� 2111', '�131��', '2002', 9935000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (3, 3, '��� 2112', '�991��', '2003', 3935000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (4, 4, '��� 2114', '�145��', '2004', 1335000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (5, 5, '��� 2116', '�555��', '2005', 1350400);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (6, 6, '��� 2107', '�222��', '2006', 3450100);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (7, 7, '��� 2107', '�144��', '2007', 3535000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (8, 8, '��� 2110', '�221��', '1999', 3532000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (9, 9, '��� 2115', '�331��', '1995', 7995000);
insert into dbo.vehicles (id_vehicle, id_owner, model, [number], issued, mileage)
values      (11, 11, '��� 2101', '�266��', '1989', 9935770);
