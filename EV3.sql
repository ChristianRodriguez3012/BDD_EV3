alter table rrhh.empleados add column comision;

create or replace function comision()
 RETURNS VOID as 
$BODY$
declare
	cursor_reporte_1 cursor for select empleadoID from rrhh.empleados emp; 
	rec record; 

begin
   FOR rec IN cursor_reporte_1 loop	   
	   update rrhh.empleados 
	   set  comision = 0.17 * 300000
	   where  rrhh.empleados.empleadoID = rrhh.empleados.empleadoID;
	  
   END LOOP ;
   RETURN;
end;
$BODY$
language plpgsql;

select * from comision();

create or replace function prize()
	RETURNS VOID as 
$BODY$
DECLARE
    cursor_reporte_2 cursor for select comision, nombre_empleado  from rrhh.empleados emp; 
	rec1   record; 
begin
	FOR rec1 IN cursor_reporte_2 loop
		if rec1.comision < 1000 then
			RAISE NOTICE 'EL EMPLEADO % OBTIENE EL PREMIO DE UNA REFRIGERADORA', rec1.nombre_empleado;
		
		elsif rec1.comision < 2000 then
			RAISE NOTICE 'EL EMPLEADO % OBTIENE EL PREMIO DE UNA LAVADORA', rec1.nombre_empleado;
		
		elsif rec1.comision > 2000 then
			RAISE NOTICE 'EL EMPLEADO % OBTIENE EL PREMIO DE UN EQUIPO DE SONIDO', rec1.nombre_empleado;		
		end if;
	
	END loop;
	return;
end;
$BODY$
language plpgsql;
select * from prize();

--- EJERCICIO 2 (INCOMPLETO)

create or replace function reporte_2()
	RETURNS VOID as 
$BODY$
DECLARE
	cursor_reporte_2 cursor for select cli.nombre_cliente, cli.direccion_cliente, cli.pais_ID  from ventas.clientes cli, ventas.paises p,
   ventas.pedidos_cabe pc, ventas.pedidos_deta pd;
	rec2   record; 

begin
	FOR rec1 IN cursor_reporte_2 loop			
		end if;
	END loop;
	return;
end;

$BODY$
language plpgsql;
select * from reporte_2();





