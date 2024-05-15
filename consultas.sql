-- consultas completadas

-- 1 Consulta de Todos los Eventos en un Complejo Deportivo Específico.

select  distinct cd.nombre,even.nombre from evento_complejo_deportivo as ep 
join eventos as even on even.id_evento = ep.id_evento
join complejo_deportivo as cd 
on cd.id_complejo_deportivo = ep.id_complejo; 

-- 2 Consulta de Comisarios Asignados a un Evento en Particular.

select c.nombre,even.nombre from evento_comisario as ec
join comisario as c on ec.id_comisario = c.id_comisario 
join eventos as even on ec.id_evento = even.id_evento;

-- 3 Consulta de Todos los Eventos en un Rango de Fechas.

select * from eventos where fecha > "2023-05-12" and fecha < "2023-06-12";

-- 4 Consulta del Número Total de Comisarios Asignados a Eventos.

select even.nombre,count(c.nombre) from evento_comisario as ec
join comisario as c on ec.id_comisario = c.id_comisario 
join eventos as even on ec.id_evento = even.id_evento
group by even.nombre;

-- 5 Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

select cp.nombre as complejo_deportivo,ic.area_complejo as area
from complejo_polideportivo as cp
join info_complejo as ic on ic.id_complejo = cp.id_info_complejo
where ic.area_complejo > 10
;
-- 6 Consulta de Eventos con Número de Participantes Mayor que la Media.

select * from eventos
where num_participantes 
> (select avg(num_participantes) from eventos);

-- 7 Consulta de Equipamiento Necesario para un Evento Específico.

select e.nombre as nombre_evento,eq.nombre_equipos as necesario from evento_equipo as ee 
join eventos as e on ee.id_evento =  e.id_evento
join equipamiento as eq on eq.id_equipamiento = ee.id_equipamiento;

-- 8 Consulta de Eventos Celebrados en Complejos Deportivos 
-- con Jefe de Organización Específico.

select * from jefes,info_complejo,complejo_deportivo 
where jefes.id_jefe = info_complejo.id_jefe and info_complejo.id_complejo = complejo_deportivo.
id_info_complejo and jefes.nombre <> "null";


-- 9 Consulta de Complejos Polideportivos sin Eventos Celebrados.

select cp.nombre as complejo from evento_complejo_poli as ecp
join eventos as even on ecp.id_evento = even.id_evento
join complejo_polideportivo as cp on cp.id_complejo_polideportico = ecp.id_complejo 
where id_complejo is null; 

-- 10 Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.

select c.nombre,even.nombre,c.tipo from evento_comisario as ec
join comisario as c on ec.id_comisario = c.id_comisario
join eventos as even on ec.id_evento = even.id_evento
where tipo = "juez";
