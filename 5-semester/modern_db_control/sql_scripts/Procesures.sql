--��������� �������� ������ �� �����������
create procedure ticket_to_diagnostic (
                 @idt int,           --����� ������ �� �����������
                 @j   nchar(30),     --
                 @d   nchar(30),     --�������� ��������
                 @idv int )          --ID ����������
as
declare @cur_date datetime
set @cur_date = (select CURRENT_TIMESTAMP)
insert into dbo.[diagnostics] (id_ticket, job, description, state, id_vehicle, conclusion, id_master, start_date, duration)
values      (@idt, @j, @d, 'waiting', @idv, '', '1', @cur_date, '');

exec ticket_to_diagnostic @idt = 20, @j = '����������� �������', @d = '������� �������', @idv = 1;
exec ticket_to_diagnostic @idt = 2, @j = '����������� ���', @d = '���� � ������� �������', @idv = 2;
exec ticket_to_diagnostic @idt = 3, @j = '����������� ���������', @d = '��������� �� � ������� ����', @idv = 3;


--��������� ���������� �����������
create procedure diagnostic_done (
				 @concl  nchar(30),   --���������� �� �����������
				 @durat  int,         --����������������� �����������
				 @idt    int )        --����� ������ �� �����������
as
update dbo.[diagnostics] 
set    conclusion = @concl, 
       duration   = @durat,
       state      = 'done'
where  id_ticket = @idt;

exec diagnostic_done @concl = '��������� ������ �������. ��������', @durat = 2, @idt = 1;
exec diagnostic_done @concl = '�� ���������� ���������� ��� ����', @durat = 4, @idt = 2;
exec diagnostic_done @concl = '��������� ������ 1 �����', @durat = 1, @idt = 3;


--��������� �������� ��������� �����
create procedure calc_amount ( 
                 @idb int,      --����� ����������� �����
                 @ids int,      --����� ������ �� �����������
                 @idt int )     --����� �������
as
declare @coefficient int
declare @ido         int
declare @hours_d     int
declare @hours_m     int
declare @material    int
set @coefficient = (select id_grade 
                    from   staff 
                    where  id_master = (select id_master 
                                       from    service 
                                       where   id_service = @ids))
set @hours_d =     (select duration 
                    from   [diagnostics]
                    where  id_ticket = @idt)
set @hours_m =     (select duration 
                    from   service 
                    where  id_service = @ids)

set @material =    (select price 
                    from   materials 
                    where  id_material = (select id_material
                                          from   service
                                          where   id_service = @ids))
set @ido =          (select id_owner from vehicles where id_vehicle = (select id_vehicle from service where id_service = @ids))
insert into dbo.bills (id_bill, id_owner, id_ticket, id_service, amount)
values      (@idb, @ido, @idt, @ids, ((@hours_d * 500) + (@coefficient * @hours_m * 500) + 3000 + @material));

exec calc_amount @idb = 1, @ids = 1, @idt = 1;
exec calc_amount @idb = 2, @ids = 2, @idt = 2;
exec calc_amount @idb = 3, @ids = 3, @idt = 3;

--��������� �������
create procedure total_amount as
declare @cnt int, 
        @summ int,
        @bills int;
set     @bills = (select count(*) from bills);
set     @cnt   = 1;
set     @summ  = 0;
while @cnt < @bills + 1
	begin 
		set @summ = @summ + (select amount from bills where id_bill = @cnt)
		set @cnt  = @cnt + 1
	end;

select @summ as 'sum';

exec total_amount;
