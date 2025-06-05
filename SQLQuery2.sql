select * from  productos;
select * from pasteleria;

select * from  productos;

create table categoria (
id_categoria int identity (1,1),
nombre_categoria varchar (50),
constraint pk_categoria primary key (id_categoria),
);
create table subCategorias (
id_subCategoria int identity (1,1),
id_categoria_principal int,
nombre_subCategoria varchar(60),
constraint pk_id_subCategoria primary key (id_subCategoria),
constraint fk_id_categoria_principal foreign key(id_categoria_principal)
references categoria(id_categoria)
);

create table productos (
id_producto int identity (1,1),
nombre_producto varchar (50)not null,
id_categoria int not null,
id_Subcategoria int not null,
precio_final decimal (10,2) not null,
constraint pk_productos primary key (id_producto),
constraint fk_categoria foreign key (id_categoria)references categoria(id_categoria),
constraint fk_id_Subcategoria foreign key (id_Subcategoria)
references subCategorias (id_subCategoria)
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
create table compra (
id_compra int identity (1,1) not null,
id_cliente_comprador varchar(50),
id_producto int not null,
cantidad int not null,
fecha date not null,
id_metodo_de_pago int not null,
total_pagar decimal (10,2) not null,
id_empleado varchar (50) not null,
constraint pk_compra primary key (id_compra),
constraint fk_id_cliente_comprador foreign key (id_cliente_comprador)
references cliente (id_cliente),
constraint fk_id_producto foreign key (id_producto)
references productos (id_producto),
constraint fk_id_metodo_de_pago foreign key (id_metodo_de_pago)
references metodos_de_pago (id_metodo_de_pago),
constraint fk_id_empleado foreign key (id_empleado)
references empleado (id_empleado)
);

create table factura(
id_factura int identity (1,1) not null,
id_compra int not null,
total_a_pagar decimal not null,
constraint pk_factura primary key (id_factura),
constraint fk_id_compra foreign key (id_compra)
references compra (id_compra)
);

insert into categoria (nombre_categoria)Values 
('Café'),
('Pastelería'),
('Desayunos'),
('Bebidas'),
('Snacks');

insert into subCategorias (id_categoria_principal,nombre_subCategoria)
values (1, 'Cafe Frio'),
(1, 'Cafe Caliente'),
(2, 'Salado Horneado'),
(2, 'Salado Frito'),
(2, 'Dulce Horneado'),
(2, 'Tortas'),
(3, 'Desayunos'),
(4, 'Bebidas Frias'),
(4, 'Bebidas Calientes'),
(5, 'Snacks')

insert into productos (nombre_producto,id_categoria, id_Subcategoria, precio_final)
values ('Café Espresso',1,2, '3000'),
('Café Latte', 1,2, '4500'),
('Café Moka', 1, 2, '5000'),
('Café Americano', 1,2, '3500'),
('Café Cappuccino',1, 2, '4500'),
('Frappe',1,1, '6000'),
('Café Latte',1, 1, '5000'), 
('Café Americano',1,1, '4000'),
('Café Cappuccino', 1,1, '5000'), 
('Cold Brew', 1,1, '5500'),
('Croissant Mantequilla',2,3,'3500'),
('Croissant Integral',2,3, '4000'),
('Croissant Avena',2,3, '4000'),
('Croissant Queso',2,3, '4500'),
('Pastel de Pollo',2,4, '6000'),
('Pastel de Carne',2,4, '6000'), 
('Pastel de Jamon y queso', 2,4, '6000'),
('Pastel Ranchero',2,4, '6500'),
('Palito de queso', 2,3, '3000'), 
('Pan de queso',2,3, '2500'),
('Papa con carne',2,4,'7000'),
('Empanada de Pollo',2,4, '3000'),
('Empanada de Carne', 2,4, '3000'), 
('Empanada de Queso',2,4, '3000'),
('Empanada de Papa',2,4, '3000'),
('Croissant de Chocolate',2,5, '4500'),
('Muffin de Arandano',2,5, '4000'),
('Muffin de Yogurt',2,5, '4000'),
('Muffin de Chocolate', 2,5, '4000'), 
('Porcion de pastel de Chocolate',2,5, '5500'),
('Porcion de pastel de Fresa', 2, 5, '5500'), 
('Porcion de pastel de Naranja',2,5, '5500'),
('Porcion de pastel de Banano', 2,5, '5500'), 
('Porcion de pastel de Caramelo', 2,5,'5500'),
('Sandwich de pollo',3,7, '7000'),
('Wrap de queso y jamon',3,7, '6500'),
('Desayuno sencillo',3,7, '8000'),
('Desayuno americano',3,7, '10000'),
('Desayuno ranchero',3,7, '9500'),
('Té matcha Frio',4,8, '5000'), 
('Chocolate Frio', 4,8, '4500'),
('Te chai Frio',4,8, '5000'), 
('Te taro Frio',4,8, '5000'), 
('Smoothies',4,8, '7000'),
('Leche Fria',4,8, '2500'), 
('Malteada',4,8, '6000'), 
('Limonada',4,8, '3000'), 
('Agua',4,8, '2000'), 
('Gasesosa pet 400',4,8, '3500'), 
('Té matcha Caliente', 4,9, '5000'),
('Chocolate Caliente', 4,9,  '4500'),
('Te chai Caliente',4,9, '5000'), 
('Te taro Caliente',4,9, '5000'), 
('Leche Caliente',4,9, '2500'),
('Rosquillas',5,10, '2000'),
('Papas Margarita',5,10, '3000'),
('Galletas Integrales',5,10, '2500'), 
('Barra de granola',5,10, '3000'), 
('Mix de frutos secos',5,10, '4000') 