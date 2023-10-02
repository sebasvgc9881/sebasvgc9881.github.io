CREATE OR REPLACE PROCEDURE transferir_dinero(
    cuenta_origen_id VARCHAR,
    cuenta_destino_1_id VARCHAR,
    cuenta_destino_2_id VARCHAR,
    monto NUMERIC(10,2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    saldo_origen NUMERIC(10,2);
    saldo_destino_1 NUMERIC(10,2);
    saldo_destino_2 NUMERIC(10,2);
BEGIN
    -- Obtener los saldos actuales de las cuentas
    SELECT cuesaldo INTO saldo_origen FROM cuentas WHERE cuenumero = cuenta_origen_id FOR UPDATE;
    SELECT cuesaldo INTO saldo_destino_1 FROM cuentas WHERE cuenumero = cuenta_destino_1_id FOR UPDATE;
    SELECT cuesaldo INTO saldo_destino_2 FROM cuentas WHERE cuenumero = cuenta_destino_2_id FOR UPDATE;

    -- Verificar que el saldo de la cuenta de origen sea suficiente
    IF saldo_origen >= monto THEN
	
	    -- Actualizar el saldo de la cuenta de origen
        UPDATE cuentas SET cuesaldo = cuesaldo - monto WHERE cuenumero = cuenta_origen_id;
		
        -- Realizar la transferencia a la cuenta destino 1
        UPDATE cuentas SET cuesaldo = cuesaldo + (monto*0.6) WHERE cuenumero = cuenta_destino_1_id;
        
        -- Realizar la transferencia a la cuenta destino 2
        UPDATE cuentas SET cuesaldo = cuesaldo + (monto*0.4) WHERE cuenumero = cuenta_destino_2_id;
        
        -- Mostrar el saldo actualizado de las cuentas
        SELECT cuesaldo INTO saldo_origen FROM cuentas WHERE cuenumero = cuenta_origen_id;
        SELECT cuesaldo INTO saldo_destino_1 FROM cuentas WHERE cuenumero = cuenta_destino_1_id;
        SELECT cuesaldo INTO saldo_destino_2 FROM cuentas WHERE cuenumero = cuenta_destino_2_id;
        RAISE INFO 'Transferencia realizada con éxito. Saldo actual de la cuenta de origen: %, saldo actual de la cuenta destino 1: %, saldo actual de la cuenta destino 2: %', saldo_origen, saldo_destino_1, saldo_destino_2;
    ELSE
        -- Si el saldo de la cuenta de origen no es suficiente, hacer un rollback de la transacción
        RAISE EXCEPTION 'El saldo de la cuenta de origen no es suficiente para realizar la transferencia';
    END IF;
END;
$$;

CALL transferir_dinero ('C-1', 'C-2', 'C-3', 100);

SELECT * FROM CUENTAS WHERE cuenumero = 'C-1' or cuenumero = 'C-2' or cuenumero = 'C-3';
