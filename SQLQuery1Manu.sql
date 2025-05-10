create database cafe_cesde;
use cafe_cesde;

create table categoria (
    id_categoria int identity (1,1),
    nombre_categoria varchar(50) not null,
	constraint pk_categoria primary key (id_categoria)
);
create table productos (
    id_producto int identity (1,1),
    nombre_producto varchar(50) not null,
    id_categoria int not null,
    precio_final decimal not null,
	constraint pk_productos primary key (id_producto),
	constraint fk_categoria foreign key (id_categoria) 
	references categoria(id_categoria)
);
create table tipo_de_inventario (
    id_tipo_inv int identity (1,1),
    nombre_tipo_inv varchar(50) not null,
	constraint pk_tipo_inventario primary key (id_tipo_inv)
);

create table inventario (
    id_inventario int identity(1,1),
    id_tipo_inv int not null,
    id_producto int not null,
    cantidad_disponible int not null,
    costo_producto decimal not null,
	constraint pk_inventario primary key (id_inventario),
	constraint fk_tipo_inv foreign key (id_tipo_inv) 
	references tipo_de_inventario(id_tipo_inv),
	constraint fk_productos foreign key(id_producto) 
	references productos(id_producto)
);

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

insert into tipo_de_inventario(nombre_tipo_inv) values
('Quincenal'),
('Mensual'),
('Anual');

insert into inventario (id_tipo_inv, id_producto, cantidad_disponible, costo_producto) values
(1, 1, 100, 1000),  
(1, 2, 150, 1200),  
(2, 3, 50, 1000),  
(2, 4, 200, 400),  
(2, 5, 80, 150),   
(3, 6, 120, 1000),  
(1, 7, 30, 1000),  
(2, 8, 500, 200),  
(3, 9, 250, 1000);


