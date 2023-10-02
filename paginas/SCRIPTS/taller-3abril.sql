BEGIN;

SELECT * FROM cuentas WHERE cuenumero = 'C-10' FOR UPDATE;

UPDATE cuentas SET cuesaldo = cuesaldo - 100 WHERE cuenumero = 'C-10';

COMMIT;

select * from cuentas where cuenumero = 'C-10';

