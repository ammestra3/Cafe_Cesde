-- Consultas 
select * from rol;
select * from ciudad;
select * from tipo_cliente;
select * from cliente;
select * from categoria;
select * from productos;
select * from tipo_de_inventario;
select * from inventario;
select * from cargo;
select * from empleado;
select * from metodos_de_pago;
select * from compra;
select * from factura;

select * from ciudad where id_ciudad=1
select * from cliente where id_cliente=5432198765;
select * from productos where precio_final=2000;
select * from cliente order by apellido_cliente desc;
select distinct apellido_cliente from cliente
select * from empleado where apellido_del_empleado= 'Gonzales Zapata' and nombre_del_empleado like 'M%';
select top 2 * from empleado;

-- Joins

SELECT empleado.id_empleado, empleado.nombre_del_empleado, cargo.cargo
FROM empleado 
JOIN cargo ON empleado.id_cargo = cargo.id_cargo;

SELECT empleado.nombre_del_empleado, empleado.apellido_del_empleado, ciudad.nombre_ciudad, cargo.cargo
FROM empleado
JOIN ciudad ON empleado.id_ciudad = ciudad.id_ciudad
JOIN cargo ON empleado.id_cargo = cargo.id_cargo;

SELECT compra.id_compra, cliente.nombre_cliente, productos.nombre_producto, compra.cantidad, compra.total_pagar, 
       metodos_de_pago.nombre_metodo_de_pago, empleado.nombre_del_empleado
FROM compra
JOIN cliente ON compra.id_cliente = cliente.id_cliente
JOIN productos ON compra.id_producto = productos.id_producto
JOIN metodos_de_pago ON compra.id_metodo_de_pago = metodos_de_pago.id_metodo_de_pago
JOIN empleado ON compra.id_empleado = empleado.id_empleado;

SELECT factura.id_factura, factura.total_a_pagar, compra.fecha, cliente.nombre_cliente
FROM factura
JOIN compra ON factura.id_compra = compra.id_compra
JOIN cliente ON compra.id_cliente = cliente.id_cliente;

SELECT cliente.nombre_cliente, cliente.apellido_cliente, ciudad.nombre_ciudad, tipo_cliente.nombre_tipo_cliente, rol.nombre_rol
FROM cliente
JOIN ciudad ON cliente.id_ciudad = ciudad.id_ciudad
JOIN tipo_cliente ON cliente.id_tipo_cliente = tipo_cliente.id_tipo_cliente
JOIN rol ON cliente.id_rol = rol.id_rol;



