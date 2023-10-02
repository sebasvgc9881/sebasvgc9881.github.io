-- Punto 7: Explica como identificar las acciones de un usuario
--y como recuperar la consistencia de datos con LOG

ALTER SYSTEM SET wal_level = logical;
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET wal_keep_segments = 10;
ALTER SYSTEM SET archive_mode = on;
ALTER SYSTEM SET archive_command = 'cp %p /var/lib/postgresql/wal/%f';

SELECT pg_xlogdump('/var/lib/postgresql/wal') AS log;


-- Punto 9: Expone la administración de USUARIOS conectados remotamente 
-- (suspender o eliminar)

SELECT * FROM pg_stat_activity;

SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE usename = 'sebitas';

SELECT pg_cancel_backend(pid) FROM pg_stat_activity WHERE usename = 'sebitas';

DROP USER sebitas;
