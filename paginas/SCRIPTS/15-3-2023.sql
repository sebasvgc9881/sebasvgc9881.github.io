select * 
	from clientes
	order by cliciudad, clicalle;
    
select * 
	from clientes
	order by cliciudad asc;
    
create index idx_cli_ciudad_calle on clientes(clinombre, cliciudad);

SELECT *
	FROM SUCURSALES JOIN PRESTAMOS;

SELECT *
	FROM CUENTAS JOIN sucursales;
 