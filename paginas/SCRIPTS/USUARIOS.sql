
CREATE USER V009 WITH PASSWORD 'v009';
CREATE USER V509 WITH PASSWORD 'v509';
CREATE USER V999 WITH PASSWORD 'v999';

GRANT SELECT, UPDATE, INSERT ON CUENTAS TO V009;
GRANT SELECT, UPDATE, INSERT ON CUENTAS TO V509;
GRANT SELECT, UPDATE, INSERT ON CUENTAS TO V999;

REVOKE INSERT ON CUENTAS FROM V009;
REVOKE INSERT ON CUENTAS FROM V509;
REVOKE INSERT ON CUENTAS FROM V999;


SELECT
    grantee,
    table_catalog,
    table_schema,
    table_name,
    string_agg(privilege_type, ', ') AS privileges
FROM
    information_schema.role_table_grants
WHERE
    grantee = 'v009'
GROUP BY
    grantee,
    table_catalog,
    table_schema,
    table_name;