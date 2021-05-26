
/* 
=========================================================================================================
							CONSULTAS TEMA 1: MANIPULACIÓN DE DATOS
=========================================================================================================
*/

/*
	Práctica 1
=========================================================================================================
	1 -  Escriba por pantalla la instrucción necesaria para mostrar la estructura de la tabla clientes. 
*/

SELECT *
FROM clientes;

/*
	2 - Listado con el nombre y apellidos de todos los clientes.
*/

SELECT clt_apell “Apellidos, clt_nom “Nombre”
FROM clientes;
 
/*
	3 -  Listado articulos. Para cada artículo deberá mostrarse la siguiente información: código numérico, nombre y color. 
*/

SELECT art_num “Codigo_numérico”, art_nom “Nombre”, art_col “Color”
FROM articulos;

/*
	4 - Listado de proveedores. Para cada proveedor deberá mostrarse únicamente su nombre. 
*/

SELECT prv_nom “Nombre”
FROM proveedores;

/*
	5 - Listado de pesos. Deberán mostrarse todas las columnas de la tabla pesos. 
*/

SELECT *
	FROM pesos;

/*
	6 - Listado de gerentes de las tiendas. 
*/

SELECT tda_ger “Gerentes”
FROM tiendas;

/*
	7 - Listado de ventas realizadas al cliente número 7. 
*/

SELECT *
FROM ventas
WHERE vnt_clt = 7;

/*
	8 - Nombre y apellidos del cliente número 7.
*/

SELECT clt_apell “Apellidos”, clt_nom “Nombre”
FROM clientes
WHERE clt_num = 7;
 
 /*
	9 - Listado de artículos de color rojo. 
*/

SELECT *
FROM articulos
WHERE art_col = “rojo”;

/*
	10 - Listado de proveedores cuyo código es superior 5.
*/

SELECT *
FROM proveedores
WHERE prv_num > 5;

/*
	11 - Listado que muestre información de los pesos cuyo nombre/descripción sea leve y ligero.
*/

SELECT *
FROM pesos
WHERE peso_nom = “leve” OR peso_nom = “ligero”;

/*
	12 - Listado de ventas realizadas durante el mes de febrero de 2020. 
*/

SELECT *
FROM ventas
WHERE month(vnt_fch) = 2 AND year(vnt_fch) = 2020;

/*
	13 - Listado de clientes que viven en España ordenados alfabéticamente según su población (un cliente vive en España si en la columna CLT_PAIS aparece la letra ‘e’). 
*/

SELECT *
FROM clientes
WHERE clt_pais = “e”;

/*
	14 - Listado de artículos que provee el proveedor (ART_PRV) número 5 ordenados de mayor a menor precio de compra (ART_PC).
*/

SELECT *
FROM articulos
WHERE art_prv = 5
ORDER BY art_pc;

/*
	15 - Listado de las tiendas que no sean ni de Palencia, ni de Pamplona, ni de Jerez. 
*/

SELECT  *
FROM tiendas
WHERE tda_pob != “Jerez” AND tda_pob != “Pamplona” AND tda_pob != “Palencia”;

/*
	16 - Listado de ventas realizadas por la tienda número 11 ordenadas cronológicamente por fecha y, en caso de que dos ventas se hayan realizado el mismo día, que se ordenen por la cantidad vendida de mayor a menor.
*/

SELECT *
FROM ventas
WHERE vnt_tda = 11
ORDER BY vnt_fch, vnt_cant DESC;

/*
	17 - Listado de clientes que viven en una ciudad cuyo nombre empieza por M o cuyo país sea Francia (‘f’).
*/

SELECT *
FROM clientes
WHERE clt_pob LIKE "M%" OR clt_pais = "f";

/*
	18 - Listado de artículos cuyo nombre sea calendario o papel, y cuyo precio de venta (ART_PV) sea superior al doble del precio de compra (ART_PC). 
*/

SELECT *
FROM articulos
WHERE art_nom LIKE "calendario" OR art_nom LIKE "papel" AND art_pv > 2*art_pc;

/*
	19 - Listado de ventas cuya cantidad no esté definida.
*/

SELECT *
FROM ventas
WHERE vnt_cant IS NULL;

/*
	20 - Buscar un cliente cuyo apellido empiece por ‘Du’, termine por ‘t’ y contenga exactamente 7 letras.
*/

SELECT *
FROM clientes
WHERE clt_apell LIKE "Du%" AND clt_apell LIKE "%t" AND length(clt_apell) = 7;

/*
	Práctica 2
=========================================================================================================
	21 -  Listado de poblaciones de las tiendas. El listado debe mostrarse sin repeticiones y
ordenado alfabéticamente por nombre de población.
*/

SELECT DISTINCT tda_pob "Poblacion"
FROM tiendas
ORDER BY tda_pob;

/*
	22 - Listado que muestre la información de las poblaciones de los clientes en dos columnas:
población y país. No deben aparecer repeticiones del par clt_pob, clt_pais.
*/

SELECT DISTINCT clt_pob "Poblacion", clt_pais "País"
FROM clientes;

/*
	23 - Listado que muestre la gama de artículos proporcionados por el proveedor número 2
(art_prv). El listado deberá mostrar 3 columnas con la siguiente información y con el
siguiente título para las columnas: “Nombre”, “Color” y “Precio de Venta”. El listado
deberá ordenarse de más caro a más barato y, cuando dos artículos tengan el mismo
precio, que se ordene alfabéticamente por nombre.
*/

SELECT art_nom "Nombre", art_col "Color", art_pv "Precio de Venta"
FROM articulos
WHERE art_prv = 2
ORDER BY art_pv DESC, art_nom;

/*
	24 - Listado de ventas realizadas por el cliente número 1 (vnt_clt) cuyo código de artículo
comprado (vnt_art) esté entre el 12 y el 20. La información a mostrar junto con su
cabecera es la que sigue a continuación: “Tienda”, “Artículo”, “Cantidad” y “Fecha de
compra”.
*/

SELECT vnt_tda "Tienda", vnt_art "Artículo", vnt_cant "Cantidad", vnt_fch "Fecha de compra"
FROM ventas
WHERE vnt_clt = 1 AND vnt_art >= 12 AND vnt_art <= 20;

/*
	25 - Listado de tiendas en el que debe aparecer cada tiendas y su gerente. La cabecera
deberá mostrar “Gerente” y “Población”, en ese orden. Además, el listado deberá estar
ordenado alfabéticamente por nombre de gerente en primer lugar y por población en
segundo lugar. Deberá excluir del listado las tiendas de París, las tiendas de Lyon y las
que empiezan por “Madrid”.
*/

SELECT tda_ger "Gerente", tda_pob "Población"
FROM tiendas
WHERE tda_pob <> "París" AND tda_pob <> "Lyon" AND tda_pob NOT LIKE "Madrid%"
ORDER BY tda_ger, tda_pob;

/*
	26 - Listado de artículos cuyo nombre empiece por la letra ‘b’ o que empiece por la letra ‘i’.
Además, tampoco deben aparecer en el listado aquellos cuyo peso o color es nulo. El
listado deberá estar ordenado por precio de coste (de más caro a más barato).
*/

SELECT *
FROM articulos
WHERE (art_nom LIKE "b%" OR art_nom LIKE "i%") AND art_col IS NOT NULL AND art_peso IS NOT NULL
ORDER BY art_pc;
 
/*
	27 - Listado de fechas diferentes en las que se ha comprado el artículo número 9.
Únicamente debe aparecer la columna de las fechas y debe aparecer con el texto
‘Fecha’. Ordene el listado cronológicamente.
*/

SELECT DISTINCT vnt_fch "Fecha"
FROM ventas
WHERE vnt_art = 9
ORDER BY vnt_fch;

/*
	28 - Muestre un listado de proveedores cuyo nombre contiene la sílaba “ca” pero que no
termine en nic. La cabecera del listado debe ser la siguiente: “Código numérico” y
“Nombre del proveedor”.
*/

SELECT prv_num "Código numérico", prv_nom "Nombre del proveedor"
FROM proveedores
WHERE prv_nom LIKE "%ca%" AND prv_nom NOT LIKE "%nic";

/*
	29 - Listado de tiendas cuyo gerente se llama Juan Carlos.
*/

SELECT tda_num "Numero de tienda", tda_pob "Poblacion"
FROM tiendas
WHERE tda_ger LIKE "%Juan Carlos";

/*
	30 - Listado de clientes cuyo nombre empiece por J, cuyo apellido no termine en z y, que sea
de Madrid, Barcelona, Valencia o Pamplona o su identificador (clt_num) esté entre el 1 y
el 10.
*/

SELECT *
FROM clientes
WHERE clt_nom LIKE "J%" AND clt_apell NOT LIKE "%z" AND (clt_pob = "Madrid" OR clt_pob = "Barcelona" OR clt_pob = "Valencia" OR clt_pob = "Pamplona" OR (clt_num >= 1 AND clt_num <= 10));