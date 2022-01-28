--Создание полной копии
BACKUP DATABASE service_db to disk = 'C:\SQL2019\Backups\service_db_full_backup'
WITH NOFORMAT, NOINIT, NAME = 'Service DB Full backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;

--Создание инкрементной копии
BACKUP DATABASE service_db to disk = 'C:\SQL2019\Backups\service_db_diff_backup' 
WITH DIFFERENTIAL, NOFORMAT, NOINIT,  NAME = 'Service DB Diff backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;

--Восстановление из бэкапа
RESTORE DATABASE service_db FROM  DISK = 'C:\SQL2019\Backups\service_db_full_backup' WITH  FILE = 2, NORECOVERY, NOUNLOAD, STATS = 5;
RESTORE DATABASE service_db FROM  DISK = 'C:\SQL2019\Backups\service_db_diff_backup' WITH  FILE = 2, NORECOVERY, NOUNLOAD, STATS = 5;
