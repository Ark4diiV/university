--�������, ����������� ��������� �������
create trigger restrict_grade_changes on staff 
for update 
as 
begin
	if update (id_grade)
	begin 
		rollback
		raiserror('��������� ������� ���������', 16, 1);
	end
end;

--������� �� ������ ����������� �� ������ 1990 ����
create trigger restrict_issued_year on vehicles
for INSERT, UPDATE 
as
begin
	if exists (select year(issued) from vehicles where year(issued)< 1990)
	begin 
		rollback
		raiserror('��� ������� �� �� ����� ���� ������ 1990', 16, 1);
	end
end