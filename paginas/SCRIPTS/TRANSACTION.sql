BEGIN;	
	-- Actualizar el saldo de la cuenta de origen
	UPDATE cuentas
	SET cuesaldo = cuesaldo - 100
	WHERE cuenumero = 'C-4'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-4') >= 100;

	-- Realizar la transferencia a la cuenta destino 1
	UPDATE cuentas
	SET cuesaldo = cuesaldo + (100*0.6)
	WHERE cuenumero = 'C-5'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-5') >= 100;

	-- Realizar la transferencia a la cuenta destino 2
	UPDATE cuentas
	SET cuesaldo = cuesaldo + (100*0.4)
	WHERE cuenumero = 'C-6'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-6') >= 100;
COMMIT;

BEGIN;
	SAVEPOINT inicio_transaccion;

	-- Actualizar el saldo de la cuenta de origen
	UPDATE cuentas
	SET cuesaldo = cuesaldo - 100
	WHERE cuenumero = 'C-4'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-4') >= 100;

	-- Realizar la transferencia a la cuenta destino 1
	UPDATE cuentas
	SET cuesaldo = cuesaldo + (100*0.6)
	WHERE cuenumero = 'C-5'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-5') >= 100;

	-- Realizar la transferencia a la cuenta destino 2
	UPDATE cuentas
	SET cuesaldo = cuesaldo + (100*0.4)
	WHERE cuenumero = 'C-6'
	AND (SELECT cuesaldo FROM cuentas WHERE cuenumero = 'C-6') >= 100;

	COMMIT;
EXCEPTION
	WHEN others THEN
		ROLLBACK TO SAVEPOINT inicio_transaccion;
END;

SELECT * FROM CUENTAS WHERE cuenumero = 'C-4' or cuenumero = 'C-5' or cuenumero = 'C-6';

