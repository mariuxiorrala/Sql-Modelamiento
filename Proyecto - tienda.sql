CREATE TABLE proveedores(
    id_proveedores serial NOT NULL,
	nombreproveedor character varying(30) not null,
	direccion character varying(255) not null,
	pais character varying(30) not null,
	ciudad character varying(30) not null,
	region character varying(30) not null,
	telefono character varying(10) not null,
	CONSTRAINT pk_idproveedores PRIMARY KEY (id_proveedores)
);

CREATE TABLE categorias(
    id_categorias serial NOT NULL,
	nombrecategoria character varying(30) not null,
	descripcion character varying(90) not null,
	CONSTRAINT pk_idcategorias PRIMARY KEY (id_categorias)
);

CREATE TABLE productos(
    id_productos serial NOT NULL,
	nombreproductos character varying(50) not null,
	cantidad_productos character varying(10) not null,
	precioUnidad character varying(10) not null,
	unidadesExistentes character varying(10) not null,
	cod_proveedores integer not null,
	cod_categorias integer not null,
	CONSTRAINT pk_idproductos PRIMARY KEY (id_productos),
	CONSTRAINT fk_idproveedores FOREIGN KEY (cod_proveedores) REFERENCES proveedores(id_proveedores),
	CONSTRAINT fk_idcategorias FOREIGN KEY (cod_categorias) REFERENCES categorias(id_categorias)
);

CREATE TABLE cliente(
    id_cliente serial NOT NULL,
	nombre_cliente character varying(30) not null,
	apellido_cliente character varying(30) not null,
	direccion_cliente character varying(255) not null,
	pais_cliente character varying(30) not null,
	ciudad_cliente character varying(30) not null,
	region_cliente character varying(30) not null,
	telefono_cliente character varying(10) not null,
	CONSTRAINT pk_idcliente PRIMARY KEY (id_cliente)
);

CREATE TABLE empleado(
    id_empleado serial NOT NULL,
	apellidos_empleado character varying(30) not null,
	nombre_empleado character varying(30) not null,
	cargo character varying(30) not null,
	fechanacimiento date not null,
	fechacontrato date not null,
	direccion_empleado character varying(255) not null,
	pais_empleado character varying(30) not null,
	ciudad_empleado character varying(30) not null,
	region_empleado character varying(30) not null,
	telefono_empleado character varying(10) not null,
	CONSTRAINT pk_idempleado PRIMARY KEY (id_empleado)
);

CREATE TABLE pedidos(
    id_pedidos serial NOT NULL,
	fechapedido date not null,
	fechaentrega date not null,
	fechaenvio date not null,
	formaenvio character varying(30) not null,
	destinatario character varying(40) not null,
	direcciondestino character varying(255) not null,
	ciudaddestino character varying(30) not null,
	regiondestino character varying(30) not null,
	paisdestino character varying(30) not null,
	cod_cliente integer not null,
	cod_empleado integer not null,
	CONSTRAINT pk_pedidos PRIMARY KEY (id_pedidos),
	CONSTRAINT fk_idcliente FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_idempleado FOREIGN KEY (cod_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE compañiaenvio(
    id_compañiaenvio serial NOT NULL,
	nombrecompañia character varying(40) not null,
	telefono_compañia character varying(10) not null,
	CONSTRAINT pk_idcompañiaenvio PRIMARY KEY (id_compañiaenvio)
);

CREATE TABLE detallepedido(
     id_detallepedido serial NOT NULL,
	 precio_u character varying(30) not null,
	 cant_detalle character varying(30) not null,
	 descuento character varying(30) not null,
	 cod_productos integer not null,
	 CONSTRAINT pk_iddetallepedido PRIMARY KEY (id_detallepedido),
	 CONSTRAINT fk_idproductos FOREIGN KEY (cod_productos) REFERENCES productos(id_productos)
);

--Tabla Proveedores
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Alejandro Mendez', 'Sauces 6', 'Ecuador', 'Guayaquil', 'Costa', '0941527895');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Juan Ramirez', 'Alborada VII Etapa', 'Ecuador', 'Guayaquil', 'Costa', '0945879852');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Mayra Miranda', 'El oro', 'Ecuador', 'Guayaquil', 'Costa', '0932165498');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Francisco Velasquez', 'Avenida De La Virgen', 'Ecuador', 'Guayaquil', 'Costa', '0925874196');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Danilo Arias', 'Humberto Ayala', 'Ecuador', 'Guayaquil', 'Costa', '0936965985');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Edgar Flores', 'Calle 30 - Victor Peñaherrera', 'Ecuador', 'Guayaquil', 'Costa', '0932525248');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Laura Muñoz', 'Avenida De Las Américas', 'Ecuador', 'Guayaquil', 'Costa', '0914587844');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Susan Rivas', 'León De Febres Cordero', 'Ecuador', 'Guayaquil', 'Costa', '0968858459');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Héctor Quevedo', 'Calle Novena - Emilio Estrada C.', 'Ecuador', 'Guayaquil', 'Costa', '0974521548');
INSERT INTO proveedores (nombreproveedor, direccion, pais, ciudad, region, telefono)
VALUES ('Wilson Quiñonez', 'Calle Esmeralda', 'Ecuador', 'Guayaquil', 'Costa', '0915242154');

Select * from proveedores

-- Tabla Categorias
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Licores', 'Cerveza, Vinos, Vinos Espumantes, Whisky, Vodka, Ron, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Bebidas', 'Aguas, Gaseosas, Jugos y Té, Hidratantes,etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Lácteos', 'Leches, Leches en polvo, Leches vegetales, Margarinas, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Despensa', 'Arroz, Granos y Pastas, Aceites y Vinagres, Enlatados y conservas, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Snacks', 'Snacks de sal, Galletas, Confitería y Dulces, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Cuidado Personal', 'Cuidado Capilar, Cuidado Facial, Cuidado Corporal, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Salud', 'Medicina, Suero Oral, Alcohol, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Mascotas', 'Alimentos, Higiene, Juguetes, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Limpieza Hogar', 'Limpieza de baño, sala, cocina, etc');
INSERT INTO categorias (nombrecategoria, descripcion)
VALUES ('Desechables', 'Aluminio, Bandejas, etc');

Select * from categorias

-- Tabla Productos
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Six Pack Cerveza Corona', '3', '$12.39', '5', 3, 1);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Cola Pepsi Regular 3L', '8' , '$1.99', '12', 7 , 2);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Margarina Naturella Ales 500g', '3' , '$1.65', '4', 10 , 3);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Aceite Girasol 2L', '1' , '$6.75', '10', 2 , 4); --10% desc
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Bombón Bon o Bon Regalaría', '5', '$3.19', '6', 5 , 5);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Protector Solar Neutrogena Fps 70', '3' , '$22.49', '4', 1 , 6);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Repelente en Crema Off Family', '4' , '$5.10', '12', 4 , 7);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Shampoo para Perro LevaCan', '3' , '$4.69', '6', 6 , 8);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Lavavajillas Axion Limón', '5' , '$1.99', '8', 3 , 9);
INSERT INTO productos (nombreproductos, cantidad_productos, preciounidad,unidadesexistentes,cod_proveedores,cod_categorias)
VALUES ('Papel Aluminio Diamond 7.6 m', '1' , '$2.30', '10', 8 , 10);

Select * from productos

-- Tabla Cliente
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Mariuxi', 'Orrala', 'Sauces 6 MZ 312 Villa 9', 'Ecuador', 'Guayaquil', 'Costa', '0961226703');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Camila', 'Rivadeneira', 'Sauces 3', 'Ecuador', 'Guayaquil', 'Costa', '0957414112');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Domenica', 'Ordoñez', 'Humberto Ayala', 'Ecuador', 'Portoviejo', 'Costa', '0945854124');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Hugo', 'Villacis', 'Avenida Los Ríos', 'Ecuador', 'Macará', 'Sierra', '0987544847');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Viviana', 'Chiquito', 'Leon Febres Cordero', 'Ecuador', 'Portoviejo', 'Costa', '0945855470');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Nayeli', 'Aviles', 'Avenida De Alarcon', 'Ecuador', 'Santo Domingo', 'Costa', '0920005130');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Mario', 'Salas', 'Avenida 22 So', 'Ecuador', 'Macará', 'Sierra', '0964521030');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Silvia', 'Rivas', 'Entre Rios', 'Ecuador', 'Babahoyo', 'Costa', '0912115478');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Sandra', 'Caceres', 'Avenida Norte', 'Ecuador', 'Santo Domingo', 'Costa', '0965855632');
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion_cliente, pais_cliente, ciudad_cliente, region_cliente, telefono_cliente)
VALUES ('Luis', 'Lopez', 'La Puntilla', 'Ecuador', 'Babahoyo', 'Costa', '0914123758');

Select * from cliente

-- Tabla Empleado
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Perez Tabique', 'Antonio', 'Jefe', '24/05/2003', '09/03/2023','Humberto Ayala', 'Ecuador', 'Guayaquil', 'Costa', '0958546230');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Morales Pu', 'Esdras', 'Supervisor', '05/11/2000', '29/08/2022','Sauces 6','Ecuador', 'Guayaquil', 'Costa', '0901214521');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Contreras Ramirez', 'Edgar', 'Gerente', '25/12/1972', '12/12/2012','Alborada VII Etapa', 'Ecuador', 'Guayaquil', 'Costa', '0952112012');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Molina Orellana', 'Maritza', 'Supervisor', '10/02/2000', '24/01/2020','Guiermo Benitez', 'Ecuador', 'Guayaquil', 'Costa', '0963632320');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Matta Lopez', 'Mario', 'Empleado', '16/03/1995', '13/04/2019','Leon Febres Cordero', 'Ecuador', 'Guayaquil', 'Costa', '0951478745');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Picon Gabrie', 'Isidro', 'Supervisor', '07/10/2003', '12/06/2021','Avenida De Las Américas', 'Ecuador', 'Guayaquil', 'Costa', '0998956859');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Perez Cruz', 'Isabel', 'Empleado', '06/01/1980', '29/08/2013','Avenida Los Ríos', 'Ecuador', 'Guayaquil', 'Costa', '0912102545');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('De Leon', 'Ernestina', 'Empleado', '11/06/1999', '13/09/2022','Avenida Abel Gilbert', 'Ecuador', 'Guayaquil', 'Costa', '0963251021');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Tavique Colay', 'Osvaldo', 'Empleado', '25/05/1998', '09/07/2020','Samanes', 'Ecuador', 'Guayaquil', 'Costa', '0952212010');
INSERT INTO empleado (apellidos_empleado, nombre_empleado, cargo, fechanacimiento, fechacontrato, direccion_empleado, pais_empleado, ciudad_empleado, region_empleado, telefono_empleado)
VALUES ('Juarez Ochoa', 'Ingrid', 'Gerente', '05/12/2000', '29/12/2023','Guayacanes', 'Ecuador', 'Guayaquil', 'Costa', '0964162522');

Select * from empleado

-- Tabla Pedidos
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('20/01/2023', '26/03/2023', '22/01/2023', 'A Domicilio', 'Mariuxi','Sauces 6 MZ 312 Villa 9', 'Guayaquil', 'Costa', 'Ecuador', 1 , 3);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('14/03/2023', '19/06/2023', '16/03/2023', 'A Domicilio', 'Camila','Sauces 3', 'Guayaquil', 'Costa', 'Ecuador', 2 , 10);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('23/03/2023', '27/06/2023', '25/03/2023', 'A Domicilio', 'Domenica','Humberto Ayala', 'Portoviejo', 'Costa', 'Ecuador', 3 , 5);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('09/02/2023', '13/04/2023', '11/02/2023', 'A Domicilio', 'Hugo','Avenida Los Ríos', 'Macará', 'Sierra', 'Ecuador', 4 , 2);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('12/01/2023', '16/03/2023', '14/01/2023', 'A Domicilio', 'Viviana','Leon Febres Cordero', 'Portoviejo', 'Costa', 'Ecuador', 5 , 7);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('03/01/2023', '07/03/2023', '05/01/2023', 'A Domicilio', 'Nayeli','Avenida De Alarcon', 'Santo Domingo', 'Costa', 'Ecuador', 6 , 9);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('25/03/2023', '26/06/2023', '27/03/2023', 'A Domicilio', 'Mario','Avenida 22 So', 'Macará', 'Sierra', 'Ecuador', 7 , 2);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('20/02/2023', '30/05/2023', '22/02/2023', 'A Domicilio', 'Silvia','Entre Rios', 'Babahoyo', 'Costa', 'Ecuador', 8 , 4);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('15/01/2023', '23/03/2023', '17/01/2023', 'A Domicilio', 'Sandra','Avenida Norte', 'Santo Domingo', 'Costa', 'Ecuador', 9 , 6);
INSERT INTO pedidos (fechapedido, fechaentrega, fechaenvio, formaenvio, destinatario, direcciondestino, ciudaddestino, regiondestino, paisdestino, cod_cliente, cod_empleado)
VALUES ('02/02/2023', '26/05/2023', '04/02/2023', 'A Domicilio', 'Luis','La Puntilla', 'Babahoyo', 'Costa', 'Ecuador', 10 , 8);

Select * from cliente

-- Tabla Compañia Envío
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('AGEEP COURIER', '0994520287');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('Delivery Go Gye', '0967924151');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('Multientrega', '213-0510');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('FedEx', '500-3000');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('DHL ENVIOS', '1800345345');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('Furgo Express', '0986426729');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('Expresito Guayaquil', '372-6200');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('UMP Courier', '0987421763');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('Encargos Online', '0990964706');
INSERT INTO compañiaenvio (nombrecompañia, telefono_compañia)
VALUES ('In Express', '216-9085');

Select * from compañiaenvio

-- Tabla Detalle Pedido
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$12.39', '3','10%', 1);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$1.99', '8','12%', 2);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$1.65', '3','5%', 3);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$6.75', '1','10%', 4);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$3.19', '5','5%', 5);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$22.49', '3','12%', 6);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$5.10', '4','12%', 7);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$4.69', '3','12%', 8);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$1.99', '5','5%', 9);
INSERT INTO detallepedido (precio_u, cant_detalle, descuento, cod_productos)
VALUES ('$2.30', '1','10%', 10);

Select * from detallepedido


-- Ejemplo:
Select nombreproductos, cantidad_productos, nombrecategoria, nombreproveedor, pais
from productos p, categorias c, proveedores pr
where cod_categorias=id_categorias and cod_proveedores=id_proveedores

-- Alias (Mariuxi Orrala)
select pais AS paisproveedor from proveedores;

select region_empleado AS regionempleado from empleado;

select Max(preciounidad) AS maximoprecio from productos
where cantidad_productos = '3'; 

-- Join (Mariuxi Orrala)
select nombreproductos, cantidad_productos,  preciounidad, nombrecategoria
from  productos
INNER JOIN categorias on productos.cod_categorias=categorias.id_categorias
order by nombreproductos desc;

select fechapedido, fechaentrega, paisdestino, destinatario, nombre_cliente, apellido_cliente
from  pedidos
INNER JOIN cliente on pedidos.cod_cliente=cliente.id_cliente
order by  fechapedido asc;

-- Operadores (Mariuxi Orrala)
select fechapedido, paisdestino, destinatario, formaenvio, nombre_cliente, apellido_cliente
from pedidos p, cliente c
where cod_cliente=id_cliente and nombre_cliente like '%M%'

select nombreproductos, cantidad_productos, preciounidad, nombrecategoria
from productos p, categorias c
where cod_categorias=id_categorias and cantidad_productos in ('3')

-- Order by (Mariuxi Orrala)
select ciudad_cliente, Count(*) AS Total
from cliente
group by ciudad_cliente
order by Total asc

select nombreproductos, cantidad_productos, preciounidad, pais, ciudad
from productos p, proveedores pr
where cod_proveedores=id_proveedores and cantidad_productos between '01' and '20'
and ciudad='Guayaquil'
order by cantidad_productos asc

-- Subconsultas (Mariuxi Orrala)
select fechapedido, destinatario, direcciondestino, paisdestino, regiondestino
from pedidos
where regiondestino = (select regiondestino from pedidos where destinatario='Mariuxi')

select precio_u, cant_detalle, descuento, nombreproductos, preciounidad
from detallepedido d, productos p
where cod_productos=id_productos
and precio_u=(select max(precio_u) from detallepedido)



-- Join (Doménica Ordóñez)
select cliente.nombre_cliente, pedidos.id_pedidos
from cliente
LEFT JOIN pedidos
on cliente.id_cliente=pedidos.id_pedidos

select productos.nombreproductos, categorias.id_categorias 
from productos 
INNER JOIN categorias 
on productos.id_productos = categorias.id_categorias
order by productos.nombreproductos

-- Alias (Doménica Ordóñez)
select nombrecompañia, telefono_compañia 
AS telfcompenv 
from compañiaenvio 

-- Group by (Doménica Ordóñez)
select categorias.nombrecategoria,count(*) from categorias, productos 
where categorias.id_categorias=productos.id_productos 
group by categorias.nombrecategoria     

select nombreproductos, cantidad_productos,count(*) 
from productos 
group by cantidad_productos, id_productos 

-- Order by (Doménica Ordóñez)
select id_pedidos, nombre_cliente from pedidos, cliente 
where pedidos.id_pedidos=cliente.id_cliente 
order by nombre_cliente asc 

select preciounidad, nombreproductos 
from productos 
order by preciounidad desc 

-- Operadores (Doménica Ordóñez)
select nombre_cliente, region_cliente
from cliente
where nombre_cliente<>'Hugo' 

-- Subconsultas (Doménica Ordóñez)
select nombre_empleado, apellidos_empleado, fechacontrato 
from empleado 
where fechacontrato = (select min(fechacontrato) from empleado) 

select nombreproductos, cantidad_productos, cod_productos, descuento 
from detallepedido, productos
where descuento =(select max(descuento) from detallepedido) 

-- Order by (Hugo Villacis)
SELECT nombreproveedor, telefono 
FROM proveedores 
ORDER BY telefono DESC

SELECT fechanacimiento,fechacontrato
FROM empleado
ORDER BY fechacontrato ASC

SELECT nombre_empleado, nombre_cliente
FROM empleado, cliente
ORDER BY nombre_cliente ASC, nombre_empleado DESC

-- subconsulta (Hugo Villacis)
SELECT nombre_empleado, apellidos_empleado, fechacontrato 
FROM empleado 
WHERE fechacontrato = (select Max(fechacontrato) from empleado)

SELECT nombre_cliente, (SELECT COUNT(*) FROM pedidos 
WHERE id_cliente = cod_cliente) AS cantidad_productos 
FROM cliente

SELECT *
FROM  productos
WHERE id_productos IN (SELECT id_productos
FROM productos 
WHERE cod_categorias > 8) 

--- Alias (Hugo Villacis)
SELECT sum(cod_productos) As codigoproductos
FROM detallepedido

--- Join (Hugo Villacis)
SELECT fechapedido
FROM cliente
INNER JOIN pedidos ON cliente.id_cliente = pedidos.cod_cliente
WHERE cliente.id_cliente = 8

SELECT Pedidos.id_Pedidos, Cliente.nombre_cliente
FROM Cliente 
RIGHT JOIN Pedidos ON Cliente.id_cliente=Pedidos.id_pedidos
ORDER BY Pedidos.id_Pedidos DESC

--- Group by (Hugo Villacis)
SELECT region_cliente
FROM cliente
GROUP BY region_cliente