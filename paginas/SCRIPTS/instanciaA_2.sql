/*==============================================================*/
/* DBMS      :     MySQL XAMPP                                  */
/* Created on:     2020-03-26 08:00:00                          */
/* Designed  :     CCJW - Bases de Datos I                      */
/* Proposito :     Registros COHERENTES para tablas de BANCA    */
/*==============================================================*/

/*========================================================================================================================*/
/* 1.- Table: SUCURSALES                                                                                                  */
/*========================================================================================================================*/
insert into sucursales values ('Alameda'   , 'Quito'     , 'Av. 12 de Octubre'   ,  400, 'CCJW', '022224466', '2000-01-01');
insert into sucursales values ('Centro'    , 'Babahoyo'  , 'Conquistadores y 60' , 9000, 'ABCD', '052224466', '1998-01-01');
insert into sucursales values ('Metropoli' , 'Quito'     , '6 Diciembre y Colon' , 8000, 'ZPFE', '022335577', '2005-01-01');
insert into sucursales values ('Galápagos' , 'Babahoyo'  , 'Conquistadores y 40' , 7100, 'ARGR', '052224466', '2029-01-01');
insert into sucursales values ('Mariscal'  , 'Cuenca'    , 'Via a Guayaquil'     , 2100, 'PPTR', '072424446', '2004-01-01');
insert into sucursales values ('Condado'   , 'Quito'     , 'Upano y Radison'     , 1700, 'REBA', '022445577', '2010-01-01');
insert into sucursales values ('Peninsula' , 'Orellana'  , 'Conquistadores 427'  ,  300, 'RTSA', '092224466', '1995-01-01');
insert into sucursales values ('Rio'       , 'Guayaquil' , 'Malecon 2000'        , 3700, 'WZZR', '062224466', '1980-01-01');
insert into sucursales values ('Malacato'  , 'Cuenca'    , 'De las flores SN'    ,    0, 'ETDE', '072224466', '2005-01-01');

/*=====================================================================================================*/
/* 2.- Table: CLIENTES                                                                                 */
/*=====================================================================================================*/
insert into clientes values ('Alvarez'   , 'Conquistadores'   , 'Cuenca'    , 'M', '1999-01-01', 'NAT');
insert into clientes values ('Alomoto'   , 'Av 12 Octubre'    , 'Babahoyo'  , 'M', '1987-01-01', 'NAT');
insert into clientes values ('Baldeón'   , 'Toledo'           , 'Cuenca'    , 'M', '1999-01-01', 'JUR');
insert into clientes values ('Cañizares' , 'Francisco Arévalo', 'Quito DM'  , 'M', '2001-01-01', 'JUR');
insert into clientes values ('Fernández' , 'Madrid'           , 'Latacunga' , 'F', '2008-01-01', 'NAT');
insert into clientes values ('Torres'    , 'Carretas'         , 'Guayaquil' , 'F', '2020-01-01', 'JUR');
insert into clientes values ('González'  , 'Av 10 Agosto'     , 'Quito'     , 'M', '2004-01-01', 'NAT');
insert into clientes values ('López'     , 'Manabí'           , 'Portoviejo', 'M', '1972-01-01', 'NAT');
insert into clientes values ('Pérez'     , 'Carretas'         , 'Guayaquil' , 'F', '1998-01-01', 'NAT');
insert into clientes values ('Rodríguez' , 'Yasuní'           , 'Quevedo'   , 'M', '2012-01-01', 'JUR');
insert into clientes values ('Ramos'     , 'Eloy Alfaro'      , 'Latacunga' , 'M', '1955-01-01', 'NAT');
insert into clientes values ('Santamaria', 'Manabí'           , 'Portoviejo', 'F', '2000-01-01', 'NAT');
insert into clientes values ('Valdivieso', 'Simón Bolívar'    , 'Zaruma'    , 'M', '1965-01-01', 'NAT');
insert into clientes values ('Zapata'    , 'Malecon esquina'  , 'Azogues'   , 'F', '2010-01-01', 'JUR');
insert into clientes values ('Enriquez'  , 'Valladolid N23'   , 'UIO'       , 'M', '1945-01-01', 'NAT');

/*=======================================================================*/
/* 3.- Table: CUENTAS                                                    */
/*=======================================================================*/
insert into cuentas values ('C-101', 'Centro'   , 500, 'A', '1945-01-01');
insert into cuentas values ('C-215', 'Alameda'  , 700, 'A', '2010-01-01');
insert into cuentas values ('C-102', 'Condado'  , 400, 'A', '1965-01-01');
insert into cuentas values ('C-305', 'Metropoli', 350, 'C', '2012-01-01');
insert into cuentas values ('C-201', 'Galápagos', 900, 'C', '1999-01-01');
insert into cuentas values ('C-222', 'Mariscal' , 700, 'C', '2015-01-01');
insert into cuentas values ('C-217', 'Galápagos', 750, 'A', '1999-01-01');
insert into cuentas values ('C-009', 'Alameda'  , 347, 'C', '2002-01-01');
insert into cuentas values ('C-509', 'Rio'      ,   3, 'M', '2019-01-01');

/*=====================================================================*/
/* 4.- Table: PRESTAMOS                                                */
/*=====================================================================*/
insert into prestamos values ('P-11', 'Metropoli',  900, '2010-01-01');
insert into prestamos values ('P-14', 'Centro'   , 1500, '1980-03-01');
insert into prestamos values ('P-15', 'Condado'  , 1500, '2014-05-01');
insert into prestamos values ('P-16', 'Condado'  , 1300, '2016-07-01');
insert into prestamos values ('P-17', 'Centro'   , 1000, '1990-09-01');
insert into prestamos values ('P-23', 'Mariscal' , 2000, '2012-11-01');
insert into prestamos values ('P-93', 'Alameda'  ,  500, '2020-12-01');

/*================================================*/
/* 5.- Table: TIENE                               */
/*================================================*/
insert into tiene  values ('C-101', 'Zapata'  );
insert into tiene  values ('C-215', 'Torres'  );
insert into tiene  values ('C-102', 'Enriquez');
insert into tiene  values ('C-305', 'Zapata'  );
insert into tiene  values ('C-201', 'Enriquez');
insert into tiene  values ('C-222', 'Enriquez');
insert into tiene  values ('C-217', 'Enriquez');
insert into tiene  values ('C-009', 'Torres'  );
insert into tiene  values ('C-509', 'Ramos'   );
insert into tiene  values ('C-102', 'Zapata'  );
insert into tiene  values ('C-305', 'Torres'  );
insert into tiene  values ('C-201', 'Zapata'  );

/*=============================================*/
/* 6.- Table: DEBE                             */
/*=============================================*/
insert into debe  values ('P-11', 'Enriquez'  );
insert into debe  values ('P-14', 'Valdivieso');
insert into debe  values ('P-15', 'Pérez'     );
insert into debe  values ('P-16', 'Pérez'     );
insert into debe  values ('P-17', 'Enriquez'  );
insert into debe  values ('P-23', 'Enriquez'  );
insert into debe  values ('P-93', 'Valdivieso');
insert into debe  values ('P-17', 'Valdivieso');
insert into debe  values ('P-23', 'Pérez'     );
insert into debe  values ('P-93', 'Torres'    );