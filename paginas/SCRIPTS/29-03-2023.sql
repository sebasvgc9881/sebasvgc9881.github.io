select * from clientes;

CREATE ROLE new_role LOGIN PASSWORD 'password';

CREATE FUNCTION calculate_sum(a integer, b integer)
RETURNS integer AS $$
BEGIN
  RETURN a + b;
END;
$$ LANGUAGE plpgsql;

//USUARIOS
Para crear usuarios primero se debe tener permisos de administrador.

---Crear nuevos usuarios
 CREATE USER user_name WITH PASSWORD contraseña;
	CREATE USER christian WITH PASSWORD 'chris123';

--Crear usuarios y asignarle un ROL
CREATE USER user_name WITH PASSWORD contraseña ROL;
	CREATE USER christian WITH PASSWORD 'chris123' SUPERUSER;

--Eliminar usuarios 
DROP USER nombre usuario;
	DROP USER christian;


//PERMISOS O PRIVILEGIOS
Se concede privilegios de CRUD a los usuarios

GRANT privilegio
ON object (nombre_tabla)
TO nombre_usuario

GRANT select 
ON empleados
TO chritian;

GRANT ALL
ON empleados
TO christian;

------Para eliminar un privilegio utilizamos
REVOKE privilegio
ON object (nombre_tabla)
FROM nombre_usuario;

REVOKE update
ON empleados
FROM christian;

REVOKE ALL
ON empleados
FROM christian;


//ROLES (LOGIN - PASSWORD, CREATEROLE, CREATEDB, INHERIT, NOINHERIT)
--Crear Roles
CREATE ROLE nombreRol OPCIONES
	CREATE ROLE 

--Asignar 1 Rol
ALTER ROLE nombreUsuario IN ROLE nombreRol;
	ALTER ROLE juan IN ROLE admin;

--Asignar varios roles
ALTER ROLE nombreUsuario IN ROLE rol1, rol2, ...;
	ALTER ROLE juan IN ROLE admin, editor, viewer;
	

CREATE ROLE nombre_rol [OPTIONS]
  [LOGIN | NOLOGIN] [PASSWORD 'contraseña']
  [CREATEDB | NOCREATEDB]
  [CREATEUSER | NOCREATEUSER]
  [INHERIT | NOINHERIT]
  [CONNECTION LIMIT conexiones_simultaneas]
  [VALID UNTIL 'fecha_expiración']
  [ROLE rol_padre[, rol_padre...]]


/*PEOCESOS ALMACENADOS*/

--Crear Proceso
CREATE OR REPLACE PROCEDURE nombre_procedimiento(parametro1 tipo_dato, parametro2 tipo_dato)
LANGUAGE plpgsql
AS $$
DECLARE
    variable1 tipo_dato;
    variable2 tipo_dato;
BEGIN
    -- cuerpo del procedimiento
END;
$$;

--Llamar al proceso
CALL nombre_procedimiento(valor1, valor2);


--Eliminar un proceso
DROP PROCEDURE nombre_procedimiento(parametro1 tipo_dato, parametro2 tipo_dato);
	


/*FUNCIONES*/
--crear funcion

CREATE OR REPLACE FUNCTION nombre_funcion(parametro1 tipo_dato, parametro2 tipo_dato)
RETURNS tipo_dato_retorno
AS $$
DECLARE
    variable1 tipo_dato;
    variable2 tipo_dato;
BEGIN
    -- cuerpo de la función
    RETURN valor_retorno;
END;
$$ LANGUAGE plpgsql;



--llamar funcion

SELECT nombre_funcion (parametros);	


--Eliminar una funcion
DROP FUNCTION nombre_funcion(parametro1 tipo_dato, parametro2 tipo_dato);
	DROP FUNCTION sumar_numeros(num1 INTEGER, num2 INTEGER);



--Funcion que necesita declarar variables
	
CREATE OR REPLACE FUNCTION sumar_numeros(num1 INTEGER, num2 INTEGER)
RETURNS INTEGER
AS $$
DECLARE
    resultado INTEGER;
BEGIN
    resultado := num1 + num2;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

--Funcion que devulve una tabla 

CREATE OR REPLACE FUNCTION obtener_personas()
RETURNS TABLE (
    id INTEGER,
    nombre VARCHAR(50),
    edad INTEGER,
    ciudad VARCHAR(50)
)
AS $$
BEGIN
    RETURN QUERY SELECT id, nombre, edad, ciudad FROM personas;
END;
$$ LANGUAGE plpgsql;

/*TRANSACCIONES*/

--Crear transaccion

BEGIN;
-- Insertar un registro en una tabla
INSERT INTO tabla1 (campo1, campo2) VALUES ('valor1', 'valor2');

-- Actualizar un registro en otra tabla
UPDATE tabla2 SET campo3 = 'nuevo valor' WHERE campo4 = 'valor a buscar';

COMMIT; -- Confirmar los cambios



-- SAVEPOINT
BEGIN; -- Inicio de la transacción

-- Operaciones SQL

SAVEPOINT nombre_savepoint; -- Creación de un SAVEPOINT

-- Operaciones SQL adicionales

ROLLBACK TO nombre_savepoint; -- Volver a un SAVEPOINT previo

-- Más operaciones SQL

COMMIT; -- Confirmar los cambios




BEGIN;
-- Operación 1
INSERT INTO tabla1 (campo1, campo2) VALUES ('valor1', 'valor2');

-- Creación de un SAVEPOINT
SAVEPOINT savepoint1;

-- Operación 2
UPDATE tabla2 SET campo3 = 'nuevo valor' WHERE campo4 = 'valor a buscar';

-- Operación 3
DELETE FROM tabla3 WHERE campo5 = 'valor a eliminar';

-- Comprobación de errores y posible rollback
IF <condición de error> THEN
    -- Volver al SAVEPOINT anterior
    ROLLBACK TO savepoint1;
END IF;

-- Operación 4
INSERT INTO tabla4 (campo6, campo7) VALUES ('valor3', 'valor4');

COMMIT; -- Confirmar los cambios
































