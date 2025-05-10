create database cafe_cesde;


use cafe_cesde;

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
id_cliente int identity (1,1),
nombre_cliente varchar (50),
apellido_cliente varchar (50),
edad int,
telefono int,
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
id_tipo_inventario int not null,
id_producto int not null,
cantidad_dispo int not null,
costo_produc decimal (10,2) not null, 
constraint pk_inventario primary key (id_inventario),
constraint fk_id_tipo_inventario foreign key (id_tipo_inventario) 
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
id_empleado int identity (1,1)not null,
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

create table compra(
id_compra int identity (1,1) not null,
id_cliente int not null,
id_producto int not null,
cantidad int not null,
fecha date not null,
id_metodo_de_pago int not null,
total_pagar decimal not null,
id_empleado int not null,
constraint pk_compra primary key (id_compra),
constraint fk_id_cliente foreign key (id_cliente)
references cliente (id_cliente),
constraint fk_id_producto foreign key (id_producto)
references productos (id_producto),
constraint fk_id_metodo_de_pago foreign key (id_metodo_de_pago)
references metodos_de_pago (id_metodo_de_pago),
constraint fk_id_empleado foreign key (id_empleado)
references empleado (id_empleado)
);
create table factura (
id_factura int identity (1,1) not null,
id_compra int,
total_a_pagar decimal not null,
constraint pk_factura primary key (id_factura)
);