--Создание пользователя с использованием Windows-аутентификации
CREATE LOGIN [VM01-W10Edu\vlad] FROM WINDOWS WITH DEFAULT_DATABASE=service_db

--Пользователь с использованием SQL-аутентификации
CREATE LOGIN sysadm WITH PASSWORD='sysadm', 
                    DEFAULT_DATABASE=service_db, 
					CHECK_EXPIRATION=OFF, 
					CHECK_POLICY=OFF

--На уровне пользователей базы данных
CREATE USER oper FOR LOGIN sysadmж
CREATE USER master_admin FOR LOGIN [VM01-W10Edu\vlad]

--Накинуть права для oper (оператора приемки)
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

--Предоставление прав пользователю sysadm (уровень сервера)
ALTER SERVER ROLE sysadmin ADD MEMBER sysadm