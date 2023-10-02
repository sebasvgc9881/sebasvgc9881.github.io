BEGIN;

SELECT * FROM cuentas WHERE cuenumero = 'C-10' FOR UPDATE;

UPDATE cuentas SET cuesaldo = cuesaldo + 100 WHERE cuenumero = 'C-10';

SELECT pg_sleep(3);

UPDATE cuentas SET cuesaldo = cuesaldo + 50 WHERE cuenumero = 'C-20';

COMMIT;

SELECT pg_advisory_unlock(hashtext('C-10')) FROM cuentas WHERE cuenumero = 'C-10';

SELECT pg_advisory_lock(hashtext('C-10')) FROM cuentas WHERE cuenumero = 'C-10';



/********************************************************/

select * from cuentas where cuenumero = 'C-10' or cuenumero = 'C-20';