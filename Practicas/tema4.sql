/*
    TEMA 4: CONSULTAS A MÚLTIPLES TABLAS
*/

/* 1 - Listado de artículos cuyo precio sea superior a 10 euros junto con el proveedor que lo
proporciona. El listado debe mostrar: nombre del artículo, color del artículo, precio de
compra y nombre del proveedor. El listado se debe ordenar alfabéticamente por nombre
del artículo.
*/

SELECT art_nom "Nombre", art_col "Color", art_pc "Precio de compra", prv_nom "Nombre del proveedor"
FROM articulos, proveedores
WHERE art_prv = prv_num AND art_pc > 10
ORDER BY art_nom;

/*
    2 - Listado de tiendas junto con las ventas que han hecho en febrero de 2020. El listado
debe mostrar todas columnas de la tabla tiendas con la fecha de cada venta. El listado
deberá ordenarse por fecha de venta de manera descendente y por nombre de gerente
de la tienda alfabéticamente cuando la fecha coincida.
*/

SELECT tda_num "Numero Tienda", tda_pob "Población", tda_ger "Gerente", vnt_fch "Fecha de venta"
FROM tiendas, ventas
WHERE tda_num = vnt_tda AND MONTH(vnt_fch) = 02 AND YEAR(vnt_fch) = 2020
ORDER BY vnt_fch DESC, tda_ger;

/*
3 - Listado de clientes que son de la misma población que el cliente número 5. El listado
deberá mostrar todas las columnas de la tabla clientes y no deberá listar el registro para
el cliente número 5.
*/

SELECT c1.clt_num "Número", c1.clt_apell "Apellidos", c1.clt_nom "Nombre", c1.clt_pais "País", c1.clt_pob "Poblado"
FROM  clientes c1, clientes c2
WHERE c1.clt_num != 5 AND (c2.clt_num = 5 AND c1.clt_pob = c2.clt_pob);

/*
 4 - Listado de artículos de color azul, rosa o verde junto con su peso. El listado debe
mostrar el número, nombre, color, obtenidos de la tabla artículos y el peso, obtenido a
partir de la clasificación de la tabla pesos. Por ejemplo, si un artículo pesa 10, su peso
será leve ya que está comprendido entre el peso_min (1) y el peso_max(100)
*/

SELECT art_num, art_nom, art_col, peso_nom
FROM articulos,pesos
WHERE art_col = "azul" OR art_col = "rosa" OR art_col = "verde";

/*
    5 - Listado que muestre las ventas que los clientes de Barcelona han hecho en las tiendas
que no son de Barcelona. El listado deberá mostrar el nombre, apellidos y población del
cliente, la población de la tienda y la fecha de las ventas.
*/

SELECT clt_nom "Nombre", clt_apell "Apellidos", clt_pob "Población del Cliente", tda_pob "Población de la Tienda", vnt_fch "Fecha de las ventas"
FROM clientes, tiendas, ventas
WHERE clt_num = vnt_clt AND vnt_tda = tda_num AND clt_pob = "Barcelona" AND tda_pob != "Barcelona";

/*
   6 - Listado que muestre aquellos clientes que han realizado más de 2 compras y esté
ordenado de mayor a menor ventas realizadas. El listado deberá mostrar el número,
apellido y nombre del cliente, así como la cantidad de compras realizada.
*/

SELECT clt_num "Código", clt_apell "Apellidos", clt_nom "Nombre", count(*) "Cantidad de compras realizadas"
FROM clientes, ventas
WHERE clt_num = vnt_clt
GROUP BY vnt_clt
HAVING count(*) > 2
ORDER BY count(*) DESC;

/*
    7 - Listado de tiendas junto con la cantidad de clientes distintos que han comprado en
dichas tiendas. El listado deberá mostrar dos columnas: población de la tienda
(tda_pob) y cantidad de clientes distintos (el código de los clientes en las ventas se
indica en la columna vnt_clt). El listado deberá ordenarse por la segunda columna de
manera descendente.
*/

SELECT tda_pob "Población de la tienda", count(*) "Cantidad de clientes distintos"
FROM tiendas, ventas
WHERE tda_num = vnt_tda
GROUP BY tda_num
ORDER BY count(*) DESC;

/*
    8 - Listado de ventas que muestre para cada color la cantidad de artículos vendidos de ese
color y la cantidad de artículos diferentes. Ordene la consulta por la segunda y tercera
columna de manera descendente.
*/

SELECT art_col "Color", sum(vnt_cant) "Cantidad", count(DISTINCT art_num) "Variedad"
FROM ventas,articulos
WHERE vnt_art = art_num
GROUP BY art_col
ORDER BY Cantidad DESC, Variedad DESC;

/*
    9 - Listado de artículos vendidos por cada proveedor. El listado mostrará dos columnas: el
nombre del proveedor y la cantidad de ventas de los artículos de cada proveedor.
*/

SELECT prv_nom "Nombre del proveedor", count(*) "Cantidad de ventas"
FROM proveedores, articulos, ventas
WHERE prv_num = art_prv AND art_num = vnt_art
GROUP BY prv_num;

/*
    10 - Listado que muestre la siguiente información de las ventas. Las columnas deben
mostrar la información y cabeceras tal y como se muestran en el siguiente ejemplo.
Ordene el resultado por fecha de manera ascendente.
*/

SELECT CONCAT(clt_nom," ",clt_apell) "Cliente", tda_pob "Tienda", art_nom "Artículo", vnt_cant "Cantidad", vnt_fch "Fecha"
FROM clientes, tiendas, articulos, ventas
WHERE clt_num = vnt_clt AND tda_num = vnt_tda AND art_num = vnt_art
ORDER BY vnt_fch;

/*
    11 - Listado de artículos que se han vendido tanto en enero como en febrero
*/

SELECT art_num "Código", art_nom "Nombre", vnt_fch "Fecha de venta"
FROM articulos JOIN ventas ON art_num = vnt_art
WHERE MONTH(vnt_fch) = 2 OR MONTH(vnt_fch) = 3;

/*
    12 - Listado de tiendas que han vendido en febrero menos las tiendas que han vendido en
enero. Ordenado por código de tienda
*/

SELECT tda_num "Número", tda_pob "Población"
FROM tiendas, ventas
WHERE tda_num = vnt_tda AND MONTH(vnt_fch) = 2 AND MONTH(vnt_fch) != 1
ORDER BY tda_num;

/*
    13 - Listado de proveedores que una aquellos que han vendido algún producto en enero
junto con aquellos de los que se ha vendido algún producto en febrero.
*/

SELECT prv_num "Código", prv_nom "Nombre"
FROM proveedores,articulos,ventas
WHERE prv_num = art_prv AND art_num = vnt_art AND 


