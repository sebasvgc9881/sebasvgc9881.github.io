CREATE ROLE gerente LOGIN PASSWORD 'gerente123';
GRANT SELECT ON sucursales TO gerente;
GRANT SELECT, UPDATE ON cuentas TO cliente;
GRANT SELECT, INSERT, UPDATE, DELETE ON debe TO gerente;
GRANT SELECT ON tiene TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON prestamos TO gerente;
--------------------------------------------------------------------------------------------------------------------------------
CREATE ROLE cajero LOGIN PASSWORD 'cajero123';
GRANT SELECT ON sucursales TO cajero;
GRANT SELECT, UPDATE ON cuentas TO cajero;
GRANT SELECT, INSERT, UPDATE, DELETE ON debe TO cajero;
GRANT SELECT ON tiene TO cajero;
GRANT SELECT, INSERT, UPDATE, DELETE ON prestamos TO cajero;
-----------------------------------------------------------------------------------------------------------------------------
CREATE ROLE cliente LOGIN PASSWORD 'cliente123';
GRANT SELECT ON sucursales TO cliente;
GRANT SELECT ON cuentas TO cliente;
GRANT SELECT ON debe TO cliente;
GRANT SELECT ON tiene TO cliente;
GRANT SELECT ON prestamos TO cliente;