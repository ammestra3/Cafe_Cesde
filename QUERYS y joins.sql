--QUERYS sencillos

--cuales son los nombres de los clientes 

SELECT id_cliente, nombre_cliente
FROM cliente;

--cuantos empleados hay registrados

SELECT COUNT(*) AS cantidad_empleados
FROM empleado;

--cuales son los productoa con mayor precio

SELECT nombre_producto,precio_final
FROM productos
WHERE precio_final >= 3200.00;



--JOINS

--quiero saber los clientes que mas compran productos y la cantidad 
SELECT compra.id_cliente, cliente.nombre_cliente, compra.id_producto, productos.nombre_producto,compra.fecha, compra.cantidad
FROM compra
JOIN cliente ON compra.id_cliente = cliente.id_cliente
JOIN productos ON compra.id_producto = productos.id_producto
WHERE compra.cantidad >=4
ORDER BY compra.id_producto, productos.nombre_producto, compra.cantidad,compra.fecha DESC;


--quiero saber los clientes frecuentes 
SELECT cliente.id_cliente,
cliente.nombre_cliente, tipo_cliente.nombre_tipo_cliente
FROM cliente
JOIN tipo_cliente ON cliente.id_tipo_cliente = tipo_cliente.id_tipo_cliente
WHERE tipo_cliente.nombre_tipo_cliente = 'frecuente';



--NESTED QUERYS

--quiero saber el id y el nombre del producto ademas de su fecha y en que cantidad se vendio
SELECT id_producto, 
(SELECT nombre_producto FROM productos WHERE productos.id_producto = compra.id_producto) AS nombre_producto,
fecha,
cantidad
FROM  compra 
WHERE cantidad >= 4
AND fecha >'2025-01-01'
GROUP BY id_producto,fecha, cantidad 
ORDER BY fecha DESC;

--quiero saber las fechas con menos ventas y que producto se vendio

SELECT id_producto,
(SELECT nombre_producto FROM productos WHERE productos.id_producto = compra.id_producto) AS nombre_producto, 
fecha,cantidad
FROM compra
WHERE cantidad <=3
GROUP BY id_producto, fecha, cantidad
ORDER BY fecha ASC;

	
--quiero saber cuantos clientes son de la ciudad de medellin
SELECT id_cliente , nombre_cliente, id_ciudad,
(SELECT nombre_ciudad FROM ciudad WHERE nombre_ciudad = 'medellin') AS nombre_ciudad
FROM cliente
WHERE id_ciudad = 1;


SELECT * FROM cliente;
SELECT * FROM compra;
SELECT * FROM inventario;
SELECT * FROM empleado;
SELECT * FROM productos;
SELECT nombre_producto, precio_final
FROM productos;