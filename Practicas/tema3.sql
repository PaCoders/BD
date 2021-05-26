
/*
	TEMA 3: CONSULTAS ANIDADAS    
*/

/* PRACTICA 5 */

/*
	1 -  Listado de artículos que pesan menos que el artículo número 2, ordenados de manera
ascendente por peso.
*/

SELECT *
FROM articulos
WHERE art_peso < (SELECT art_peso FROM articulos WHERE art_num = 2)
ORDER BY art_peso;

/*
	2 - Listado de proveedores (que muestre código y nombre) que proveen algún artículo.
*/

SELECT prv_num "Código", prv_nom "Nombre"
FROM proveedores
WHERE prv_num = ANY(SELECT art_prv FROM articulos);

/*
	3 - . Listado de ventas que muestre las fechas en que se han vendido impresoras o de las
ventas realizadas a los clientes de Madrid.
*/

SELECT vnt_fch "Fecha de las ventas realizadas"
FROM ventas
WHERE vnt_art IN (SELECT art_num FROM articulos WHERE art_nom = "impresora") OR vnt_clt IN (SELECT clt_num FROM clientes WHERE clt_pob = "Madrid");

/*
	4 -  Listado de clientes que sean de España y que residan en la misma ciudad que los que
se llaman de nombre Pablo, ordenados por su número de cliente. Aquellos que se
llaman ‘Pablo’ no deben aparecer en el listado. El listado deberá ordenarse por clt_num.
*/

SELECT clt_num "Número", clt_apell "Apellidos", clt_nom "Nombre", clt_pais "País", clt_pob "Población"
FROM clientes
WHERE clt_pais = "España" AND clt_pob = (SELECT clt_pob FROM clientes WHERE clt_nom = "Pablo") AND clt_nom != "Pablo"
ORDER BY clt_num;

/*
	11 - Listado de artículos cuyo peso es superior a alguno de los artículos de color morado.
*/

SELECT a1.*
FROM articulos a1
WHERE a1.ART_PESO > ANY(SELECT a2.art_peso
							FROM articulos a2
							WHERE a2.art_col = "morado");
                            
/*
	12 - . Muestre todas las columnas de la tienda que ha realizado más ventas.
*/

SELECT *
FROM tiendas
WHERE tda_num IN (SELECT vnt_tda
					FROM ventas
					GROUP BY vnt_tda
                    HAVING count(*) >= ALL(SELECT count(*)
												FROM ventas
                                                GROUP BY vnt_tda));

/* 13 - Listado de clientes que sean de la misma ciudad y país que el cliente número 24	*/

SELECT *
FROM clientes c1
WHERE (c1.clt_pais, c1.clt_pob) = (SELECT c2.clt_pais, c2.clt_pob
					FROM clientes c2
					WHERE c2.clt_num = 24);
                                                
/*
	14 -  Listado de la tabla ventas que muestre la última venta de cada artículo. La última venta
es la fecha más alta (vnt_fch) en que se ha vendido cada artículo (vnt_art). El listado
deberá ordenarse por código de artículo de manera ascendente.
*/

SELECT *
FROM ventas v1
WHERE v1.vnt_fch IN 
	(SELECT max(v2.vnt_fch)
	FROM ventas v2
    GROUP BY v2.vnt_fch)
GROUP BY vnt_art
ORDER BY vnt_art;

/* 15 - Listado de tiendas para los que existe alguna venta (o que han vendido algún producto). */

SELECT *
FROM tiendas
WHERE tda_num = ANY(
	SELECT vnt_tda
    FROM ventas
    WHERE vnt_cant IS NOT NULL);
    
/* 16 - Listado de artículos para los que no existe ninguna compra de un cliente de Madrid. */

select * from clientes
SELECT *
FROM articulos
WHERE art_num NOT IN(
	SELECT vnt_art
    FROM ventas
    WHERE vnt_clt IN(
		SELECT clt_num
		FROM clientes
		WHERE clt_pob LIKE "Madrid%"));
        
/* 17 - Listado de clientes de Madrid o Barcelona que por lo menos no han hecho dos compras */

SELECT *
FROM clientes
WHERE (clt_pob = "Madrid" OR clt_pob = "Barcelona") AND clt_num NOT IN(
	SELECT vnt_clt
    FROM ventas 
    HAVING count(vnt_clt) >= 2);
    
/* 18 - Listado de proveedores que proveen algún artículo. */

SELECT * 
FROM proveedores
WHERE prv_num = ANY(SELECT art_prv
					FROM articulos);

/* 19 - Listado de tiendas que no han venido ningún bolígrafo.*/

SELECT *
FROM tiendas
WHERE tda_num NOT IN(SELECT vnt_tda
					FROM ventas
					WHERE vnt_art IN (SELECT art_num
										FROM articulos
										WHERE art_nom LIKE "%bolígrafo%"));

/* 20 - Listado de clientes de España que han comprado más cantidad de artículos que el
cliente número 17.*/

SELECT *
FROM clientes
WHERE clt_pais = 'e' AND clt_num IN (SELECT v1.vnt_clt
									FROM ventas v1
									WHERE v1.vnt_cant > (SELECT v2.vnt_cant
														FROM ventas v2
														WHERE v2.vnt_clt = 17
														GROUP BY v2.vnt_art)
									GROUP BY v1.vnt_art);

/* 
	================================================================================================
									ENTREGABLES DE PRACTICAS
	================================================================================================
*/

/*  Listado de clientes que han comprado más de un artículo entre 5 y el 15 de abril de 2021, 
	ordenado por código de cliente de manera descendente. 
 	El listado deberá mostrar el número de cliente, el nombre del cliente y los apellidos del cliente con las siguientes cabeceras: 
  	Código, Nombre, Apellidos.
*/
SELECT clt_num "Código", clt_nom "Nombre", clt_apell "Apellidos"
FROM clientes
WHERE clt_num IN (SELECT vnt_clt
					FROM ventas
					WHERE vnt_fch BETWEEN "05-04-2021" AND "15-04-2021"
					GROUP BY vnt_clt
					HAVING count(*) > 1)
ORDER BY clt_num DESC;

/*
	Listado que muestre la cantidad de artículos que hay de cada color. 
	Solo deberán contarse aquellos artículos que han sido vendidos en el año 2021. 
	La cabecera deberá mostrar dos columnas: color y cantidad.
	Los colores no definidos deberán mostrarse con el texto ‘sin color’. Ordene el texto por cantidad de mayor a menor.
*/

SELECT IFNULL(art_col,"sin color") "Color", count(*) "Cantidad"
FROM articulos
WHERE art_num IN (SELECT vnt_art
					FROM ventas
					WHERE YEAR(vnt_fch) = 2021)
GROUP BY art_col
ORDER BY Cantidad DESC;

/*
	Listado de proveedores que suministran más artículos de color verde o azul que el proveedor número 5. El listado deberá mostrar el código y el nombre de los proveedores con todas sus letras en mayúsculas,
    y el listado deberá tener la siguiente cabecera: ‘Número’, ‘Nombre del proveedor’.
*/

SELECT prv_num "Número", upper(prv_nom) "Nombre del proveedor"
FROM proveedores
WHERE prv_num IN (SELECT a1.art_prv
				  FROM articulos a1
				  WHERE a1.art_col IN ("verde","azul")
				  GROUP BY a1.art_prv
                  HAVING count(*) > (SELECT count(*)
										FROM articulos a2
										WHERE a2.art_prv = 5 AND a2.art_col IN ("verde","azul")));
        
