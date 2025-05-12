create database coffe_cesde;

use coffe_cesde;

create table rol(
id_rol int identity (1,1),
nombre_rol varchar (40),
constraint pk_rol primary key (id_rol)
);

create table ciudad(
id_ciudad int identity (1,1),
nombre_ciudad varchar (40),
constraint pk_ciudad primary key (id_ciudad),

);

create table tipo_cliente(
id_tipo_cliente int identity (1,1),
nombre_tipo_cliente varchar (40),
constraint pk_tipo_cliente primary key (id_tipo_cliente),
);

create table cliente(
id_cliente varchar (50),
nombre_cliente varchar (50),
apellido_cliente varchar (50),
edad int not null,
telefono varchar (50),
correo varchar (50),
id_ciudad int,
id_tipo_cliente int,
id_rol int,
constraint pk_cliente primary key (id_cliente),
constraint fk_ciudad foreign key (id_ciudad)
references ciudad (id_ciudad),
constraint fk_tipo_cliente foreign key (id_tipo_cliente)
references tipo_cliente (id_tipo_cliente),
constraint fk_rol foreign key (id_rol)
references rol (id_rol),
);

create table categoria (
id_categoria int identity (1,1),
nombre_categoria varchar (50),
constraint pk_categoria primary key (id_categoria),
);

create table productos (
id_producto int identity (1,1),
nombre_producto varchar (50)not null,
id_categoria int not null,
precio_final decimal (10,2) not null,
constraint pk_productos primary key (id_producto),
constraint fk_categoria foreign key (id_categoria)references categoria(id_categoria),
);

create table tipo_de_inventario(
id_tipo_inventario int identity (1,1),
nombre_tipo_inventario varchar (50),
constraint pk_tipo_de_inventario primary key (id_tipo_inventario),
);

create table inventario (
id_inventario int identity (1,1) not null,
id_producto int not null,
cantidad_dispo int not null,
costo_produc decimal (10,2) not null, 
constraint pk_inventario primary key (id_inventario),
constraint fk_id_inventario foreign key (id_inventario) 
references tipo_de_inventario (id_tipo_inventario),
constraint fk_productos_ foreign key (id_producto)
references productos (id_producto)
);

create table cargo(
id_cargo int identity(1,1),
cargo varchar (30),
constraint pk_cargo primary key (id_cargo)
);

 create table empleado(
id_empleado  varchar (50) not null,
nombre_del_empleado varchar (50) not null,
apellido_del_empleado varchar (50) not null,
id_cargo int not null,
id_ciudad int not null,
constraint pk_empleado primary key(id_empleado),
constraint fk_id_cargo foreign key (id_cargo)
references cargo (id_cargo),
constraint fk_id_ciudad foreign key (id_ciudad)
references ciudad (id_ciudad)
);


create table metodos_de_pago (
id_metodo_de_pago int identity (1,1)not null,
nombre_metodo_de_pago varchar (30) not null,
constraint pk_metodos_de_pago primary key (id_metodo_de_pago)
);

create table compra (
id_compra int identity (1,1) not null,
id_cliente varchar (50) not null,
id_producto int not null,
cantidad int not null,
fecha date not null,
id_metodo_de_pago int not null,
total_pagar decimal (10,2) not null,
id_empleado varchar (50) not null,
constraint pk_compra primary key (id_compra),
constraint fk_id_cliente foreign key (id_cliente)
references cliente (id_cliente),
constraint fk_id_producto foreign key (id_producto)
references productos (id_producto),
constraint fk_id_metodo_de_pago foreign key (id_metodo_de_pago)
references metodos_de_pago (id_metodo_de_pago),
constraint fk_id_empleado foreign key (id_empleado)
references empleado (id_empleado),
);

create table factura(
id_factura int identity (1,1) not null,
id_compra int not null,
total_a_pagar decimal not null,
constraint pk_factura primary key (id_factura),
constraint fk_id_compra foreign key (id_compra)
references compra (id_compra)
);


insert into tipo_cliente values  ('nuevo'),
                                 ('ocasional'),
								 ('frecuente');

insert into ciudad values('medellin'),('bello'),('estrella'),('itagui'),('estrella'),('caldas');

insert into rol values('estudiante'),
                      ('profesor'),
					  ('administrativo');



insert into cliente (id_cliente, nombre_cliente, apellido_cliente,edad,telefono,correo,id_ciudad,id_tipo_cliente,id_rol)
                          values ('1234567890','maria fernanda', 'lopez', '30', '3104567890', 'mariafernanda@gmail.com','1','1','1'),
                           ('7654321098', 'laura camila','rojas','18','3102231122','dianarojas@gmail.com','1','3','1'),
						   ('5432198765', 'diana carolina',' torres',' 17','3209876543','dianatorres@gmail.com',' 2','2','3'),
						   ('3219876543', 'valentina',' ramirez','20','3123345566','valentinaramirez@gmail.com','4','2','1'),
						   ('9876543210', 'andrea juliana','castillo','30',' 300 112 3344','andreacastillo@gmail.com','5','3','3'),
						   ('2468135790', 'Juan Sebastián' ,'Martínez','20',' 300 112 3344','juanmartinez@gmail.com','1','3','1'),
						   ('6357924801', 'andres felipe','martinez','46','3001123344','andresmartinez@gmail.com','4','1','1'),
						   ('8109273564', 'carlos eduardo','gomez','18','301443229','eduardogomez@gmail.com','6','3','1'),
						   ('4890176235', 'santiago david','mejia','45','3117789922','santiagomejia@gmail.com','6','2','2'),
						   ('981672543', 'mateo alejandro','vargas','51','31799001100','mateovargas@gmail.com','5','2','2');

insert into categoria (nombre_categoria)Values 
('Café'),
('Pastelería'),
('Desayunos'),
('Bebidas'),
('Snacks');

Insert into productos (nombre_producto, id_categoria, precio_final) values
('Café Espresso', 1, 2000),
('Café Latte', 1, 3000),
('Café Moka', 1, 3200),
('Croissant de Mantequilla', 2, 1500),
('Muffin de Arándano', 2, 2000),
('Té Verde', 3, 1800),
('Smoothie de Fresa', 3, 2500),
('Rosquillas', 4, 5000),
('Papas Margarita', 4, 500);

insert into tipo_de_inventario(nombre_tipo_inventario) values
('Quincenal'),
('Mensual'),
('Anual');

insert into metodos_de_pago (nombre_metodo_de_pago) values
('Efectivo'),
('Tarjeta'),
('Transferencia'),
('QR');


Insert into compra (id_cliente, id_producto, cantidad, fecha, id_metodo_de_pago, total_pagar, id_empleado) values
('1234567890', 1, 3, '2025-03-20', 2, 10000,'119274385'),
('1234567890', 1, 2, '2025-03-20', 2, 10000,'50774912'),
('3219876543', 1, 2, '2025-03-20', 2, 10000,'50774912'),
('9876543210', 1, 2, '2025-03-20', 2, 10000,'50774912'),
('9876543210', 1, 3, '2025-03-20', 2, 10000,'119274385'),
('2468135790', 1, 3, '2025-03-20', 2, 10000,'119274385'),
('6357924801', 1, 2, '2025-03-20', 2, 10000, '119274385'),
('8109273564', 1, 3, '2025-03-20', 2, 10000,'119274385'),
('4890176235', 1, 3, '2025-03-20', 2, 10000, '119274385'),
('981672543', 1, 2,  '2025-03-20', 2, 10000,'119274385'),
('4890176235', 1, 2, '2025-03-20', 2, 10000,'80572994'),
('6357924801', 1, 3, '2025-03-20', 2, 10000,'80572994'),
('5432198765', 1, 3, '2025-03-20', 2, 10000,'1017148956'),
('7654321098', 2, 1, '2025-02-14', 3, 7600,'80572994'),
('2468135790', 3, 4, '2025-01-02', 1, 15000,'80572994'),
('8109273564', 4, 9, '2025-02-09', 4, 20000,'119274385'),
('4890176235', 5, 7, '2025-04-17', 4, 2000,'119274385'),
('3219876543', 6, 2, '2025-01-13', 2, 6000, '80572994'),
('2468135790', 7, 10, '2025-03-15', 4, 14900, '50774912'),
('7654321098', 8, 3, '2025-04-01', 1, 4800,'80572994'),
('1234567890', 9, 5, '2025-03-08', 1, 36000, '1017148956'),
('6357924801', 10, 6, '2025-01-30', 3, 9700, '1017148956');

insert into factura (id_compra, total_a_pagar) values
(1, 10000),
(2, 7600),
(3, 15000),
(4, 20000),
(5, 2000),
(6, 6000),
(7, 14900),
(8, 4800),
(9, 36000),
(10, 9700);

insert into cargo (cargo) values
('Asistente de ventas'),
('Cajero'), 
('Administrador');

insert into empleado (id_empleado,nombre_del_empleado, apellido_del_empleado, id_cargo, id_ciudad)
values 
('119274385', 'Maria', 'Gonzales Zapata', 1, 1),
('80572994', 'Carolina', 'Hincapie Carmona', 2, 2),
('50774912', 'Angelo', 'Sanchez Montoya', 3, 2),
('1017148956', 'Rahul', 'Been Forner', 2, 3);


