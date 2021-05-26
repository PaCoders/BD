
/* 
=========================================================================================================
							CONSULTAS TEMA 2: FUNCIONES Y EXPRESIONES
=========================================================================================================
*/

/*
	Práctica 3
=========================================================================================================
	1 - Listado de pesos que muestre para cada registro la diferencia entre el peso máximo y el
peso mínimo.
*/

SELECT peso_max - peso_min "Diferencia de Pesos"
FROM pesos;

/*
	2 - Consulta que te devuelva el día de la semana que naciste
*/

SELECT dayofweek("2000-15-03");

/*
	3 -  Listado de países que empiezan por A. El listado deberá mostrar el nombre de los
países en mayúscula
*/

SELECT pai_id "ID", pai_iso "ISO", upper(pai_nombre) "Pais"
FROM paises
WHERE pai_nombre LIKE "A%";

/*
	4 - Listado de proveedores que empiezan por E, ya sea letra mayúscula o minúscula.
PISTA: Utilice la función UPPER y un LIKE, no es válido utilizar dos likes.
*/

SELECT *
FROM proveedores
WHERE PRV_NOM = upper("e%") OR PRV_NOM LIKE "e%";

/*
	5 - Listado de empleados mayores de 40 años.
*/

SELECT *
FROM empleados
WHERE timestampdiff(YEAR,emp_nacimiento,curdate()) > 40;

/*
	6 - Muestre un listado de clientes con dos columnas: en la primera columna debe aparecer
el nombre completo de los clientes (nombre + apellido), mientras que en la segunda columna debe aparecer la inicial del país en mayúscula.
*/

SELECT concat(emp_nombre,", ",emp_apellidos) "Nombre y Apellido",  upper(emp_pais) "Pais"
FROM empleados;

/*
	7 - Listado de artículos cuyo precio de venta sea superior al doble del precio de compra
ordenado por beneficio de manera descendente.
*/

SELECT ART_NUM "Numero", ART_NOM "Nombre"
FROM articulos
WHERE art_pv > 2*art_pc
ORDER BY art_pv - art_pc;

/*
	8 - Listado de ventas realizadas en algún día 2 (de cualquier mes y cualquier año). PISTA:
no use LIKE y use la función DAY().
*/

SELECT *
FROM ventas
WHERE day(vnt_fch) = 2;

/*
	9 - Listado de empleados cuyo nombre sea superior a 5 caracteres.
*/

SELECT *
FROM empleados
WHERE length(emp_nombre) > 5;

/*
	10 - Listado que devuelva el código de la tienda, la población y el nombre de los gerentes.
Ojo, queremos sólo el nombre, no el apellido, por lo que tendrá que utilizar alguna función que extraiga el nombre de la columna tda_ger, que contiene apellido + nombre.
*/

SELECT tda_num "Codigo", tda_pob "Poblacion", substring(tda_ger,locate(",",tda_ger)+1,length(tda_ger)-locate(",",tda_ger)+1) "Nombre de los gerentes"
FROM tiendas;