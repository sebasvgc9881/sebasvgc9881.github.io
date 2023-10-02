/* Creamos el índice para 1 columna */
CREATE INDEX idx_sucursales ON sucursales (sucnombre ASC);
CREATE INDEX idx_cuentas ON cuentas (sucnombre ASC);

/* Mostramos el índice */
SHOW INDEX FROM sucursales;
SHOW INDEX FROM cuentas;

/* Usamos el comando EXPLAIN para acceder a información sobre el índice */
EXPLAIN SELECT * FROM sucursales WHERE sucnombre = 'Alameda';

/* Usamos el comando JOIN mediante índices para mejorar los tiempos de consulta */
SELECT *
FROM sucursales
JOIN cuentas
ON sucursales.SUCNOMBRE = cuentas.SUCNOMBRE;

/* COmprobamos el uso de los índices mediante el comando EXPLAIN */
EXPLAIN
SELECT *
FROM sucursales
JOIN cuentas
ON sucursales.SUCNOMBRE = cuentas.SUCNOMBRE
WHERE sucursales.SUCNOMBRE = 'Alameda2';