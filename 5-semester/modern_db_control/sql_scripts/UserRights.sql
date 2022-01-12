--�������� ������������ � �������������� Windows-��������������
CREATE LOGIN [VM01-W10Edu\vlad] FROM WINDOWS WITH DEFAULT_DATABASE=service_db

--������������ � �������������� SQL-��������������
CREATE LOGIN sysadm WITH PASSWORD='sysadm', 
                    DEFAULT_DATABASE=service_db, 
					CHECK_EXPIRATION=OFF, 
					CHECK_POLICY=OFF

--�� ������ ������������� ���� ������
CREATE USER oper FOR LOGIN sysadm�
CREATE USER master_admin FOR LOGIN [VM01-W10Edu\vlad]

--�������� ����� ��� oper (��������� �������)
CREATE ROLE oper_role
ALTER ROLE oper_role ADD MEMBER oper

GRANT INSERT,SELECT,UPDATE ON dbo.customers TO oper_role
GRANT INSERT,SELECT,UPDATE ON dbo.vehicles TO oper_role
GRANT INSERT,SELECT,UPDATE ON dbo.diagnostics TO oper_role
GRANT INSERT,SELECT,UPDATE ON dbo.[service] TO oper_role
GRANT SELECT ON dbo.grades TO oper_role
GRANT SELECT ON dbo.materials TO oper_role
GRANT SELECT ON dbo.staff TO oper_role
GRANT INSERT ON dbo.bills TO oper_role
GRANT EXECUTE ON ticket_to_diagnostic TO oper_role
GRANT EXECUTE ON calc_amount TO oper_role

--�������������� ���� ������������ sysadm (������� �������)
ALTER SERVER ROLE sysadmin ADD MEMBER sysadm