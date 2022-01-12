--Триггер, запрещающий изменение грейдов
create trigger restrict_grade_changes on staff 
for update 
as 
begin
	if update (id_grade)
	begin 
		rollback
		raiserror('Изменения грейдов запрещены', 16, 1);
	end
end;

--Триггер на запрет регистрации ТС старше 1990 года
create trigger restrict_issued_year on vehicles
for INSERT, UPDATE 
as
begin
	if exists (select year(issued) from vehicles where year(issued)< 1990)
	begin 
		rollback
		raiserror('Год выпуска ТС не может быть старше 1990', 16, 1);
	end
end