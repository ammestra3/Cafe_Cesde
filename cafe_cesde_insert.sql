
insert into tipo_cliente values  ('nuevo'),
                                 ('ocasional'),
								 ('frecuente');

insert into ciudad values('medellin'),('bello'),('estrella'),('itagui'),('caldas');

insert into rol values('estudiante'),
                      ('profesor'),
					  ('administrativo');


alter table cliente
alter column telefono varchar(50);

insert into cliente (nombre_cliente, apellido_cliente,edad,telefono,correo,id_ciudad,id_tipo_cliente,id_rol)
                          values ('maria fernanda', 'lopez', '30', '3104567890', 'mariafernanda@gmail.com','1','1','1'),
                           ('laura camila','rojas','18','3102231122','dianarojas@gmail.com','1','3','1'),
						   ('diana carolina',' torres',' 17','3209876543','dianatorres@gmail.com',' 2','2','3'),
						   ('valentina',' ramirez','20','3123345566','valentinaramirez@gmail.com','4','2','1'),
						   ('andrea juliana','castillo','30',' 300 112 3344','andreacastillo@gmail.com','5','3','3'),
						   ('Juan Sebastián' ,'Martínez','20',' 300 112 3344','juanmartinez@gmail.com','1','3','1'),
						   ('andres felipe','martinez','46','3001123344','andresmartinez@gmail.com','4','1','1'),
						   ('carlos eduardo','gomez','18','301443229','eduardogomez@gmail.com','6','3','1'),
						   ('santiago david','mejia','45','3117789922','santiagomejia@gmail.com','6','2','2'),
						   ('mateo alejandro','vargas','51','31799001100','mateovargas@gmail.com','5','2','2');

	

