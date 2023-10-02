BEGIN;	
	LOCK TABLE cuentas IN EXCLUSIVE MODE;
	-- Actualizar el saldo de la cuenta de origen
	UPDATE cuentas 
	SET cuesaldo = cuesaldo - 100 
	WHERE cuenumero = 'C-006' 
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-006') >= 100;
	SELECT pg_sleep(15);
	-- Realizar la transferencia a la cuenta destino 1
	UPDATE cuentas 
	SET cuesaldo = cuesaldo + (100*0.6) 
	WHERE cuenumero = 'C-007'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-006') >= 100;

	-- Realizar la transferencia a la cuenta destino 2
	UPDATE cuentas 
	SET cuesaldo = cuesaldo + (100*0.4) 
	WHERE cuenumero = 'C-008'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-006') >= 100;
COMMIT;

SELECT DISTINCT relation::regclass
FROM pg_locks
WHERE relation IS NOT NULL;