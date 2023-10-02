
SET log_min_messages = 'DEBUG1';
SET TIME ZONE 'UTC';

--SET LOG es utilizado para cambiar el nivel de registro de los mensajes del servidor de PostgreSQL. 

SELECT current_setting('TIMEZONE');
SHOW log_min_messages;

-- Volver a los ajustes predeterminados

SET timezone = 'America/Bogota';
SET log_min_messages = 'Warning';


