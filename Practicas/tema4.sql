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
WHERE art_pc > 10
ORDER BY art_nom;

/*
    2 - Listado de tiendas junto con las ventas que han hecho en febrero de 2020. El listado
debe mostrar todas columnas de la tabla tiendas con la fecha de cada venta. El listado
deberá ordenarse por fecha de venta de manera descendente y por nombre de gerente
de la tienda alfabéticamente cuando la fecha coincida.
*/

SELECT tda_num "Numero Tienda", tda_pob "Población", tda_ger "Gerente", vnt_fch "Fecha de venta"
FROM tiendas, ventas
WHERE MONTH(vnt_fch) = 02 AND YEAR(vnt_fch) = 2020
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