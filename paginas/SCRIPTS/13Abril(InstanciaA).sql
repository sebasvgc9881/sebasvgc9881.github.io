select count(*) from clientes;
select * from cuentas;
BEGIN;
UPDATE cuentas SET cuesaldo = cuesaldo - 100 WHERE cuenumero = 'C-101';
UPDATE cuentas SET cuesaldo = cuesaldo + 100 WHERE cuenumero = 'C-215';
-- se verifica si todo está correcto, si hay algún error, ejecutar ROLLBACK
ROLLBACK;
-- si todo está correcto, ejecutar COMMIT
COMMIT;

