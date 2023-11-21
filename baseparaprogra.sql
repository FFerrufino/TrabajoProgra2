CREATE DATABASE  Automotriz_tp_gp19;
GO
USE Automotriz_tp_gp19;
GO

CREATE TABLE PAISES(
id INT IDENTITY(1,1),
descripcion VARCHAR(100)
CONSTRAINT pk_paises PRIMARY KEY (id)
);
GO


CREATE TABLE PROVINCIAS(
id INT IDENTITY (1,1),
descripcion VARCHAR (100),
id_pais	INT
CONSTRAINT pk_provincias PRIMARY KEY (id)
CONSTRAINT fk_provincias_paises FOREIGN KEY (id_pais)
REFERENCES PAISES (id)
);
GO

CREATE TABLE BARRIOS(
id INT IDENTITY (1,1),
descripcion VARCHAR (100),
id_provincia INT
CONSTRAINT pk_barrios PRIMARY KEY (id)
CONSTRAINT fk_barrios_provincias FOREIGN KEY (id_provincia)
REFERENCES PROVINCIAS (id)
);
GO

CREATE TABLE TIPOS_PRODUCTOS(
id INT IDENTITY (1,1),
descripcion VARCHAR (100),
CONSTRAINT pk_tipos_productos PRIMARY KEY (id)
);
GO

CREATE TABLE TIPOS_MOVIMIENTOS(
id INT IDENTITY (1,1),
descripcion VARCHAR (100)
CONSTRAINT pk_tipos_movimientos PRIMARY KEY (id)
);
GO


CREATE TABLE COLORES(
id INT IDENTITY (1, 1),
descripcion VARCHAR (100)
CONSTRAINT pk_colores PRIMARY KEY (id)
);
GO

CREATE TABLE MARCAS(
id INT IDENTITY (1,1),
descripcion VARCHAR (100)
CONSTRAINT pk_marcas PRIMARY KEY (id)
);
GO

CREATE TABLE MODELOS(
id INT IDENTITY (1,1),
descripcion VARCHAR (100)
CONSTRAINT pk_modelos PRIMARY KEY (id)
);
GO

CREATE TABLE PRODUCTOS(
cod_producto INT IDENTITY (1,1),
id_tipo_producto INT,
id_marca INT,
id_modelo INT, 
id_origen INT,
descripcion VARCHAR (100),
precio_unitario DECIMAL (10,2),
id_color INT
CONSTRAINT pk_productos PRIMARY KEY (cod_producto),
CONSTRAINT fk_productos_tipos FOREIGN KEY (id_tipo_producto)
REFERENCES TIPOS_PRODUCTOS (id),
CONSTRAINT fk_productos_marcas FOREIGN KEY (id_marca)
REFERENCES MARCAS (id),
CONSTRAINT fk_productos_modelos FOREIGN KEY (id_modelo)
REFERENCES MODELOS (id),
CONSTRAINT fk_productos_paises FOREIGN KEY (id_origen)
REFERENCES PAISES (id),
CONSTRAINT fk_productos_colores FOREIGN KEY (id_color)
REFERENCES COLORES (id)
);
GO

CREATE TABLE TIPOS_CLIENTES(
id_tipo_cliente INT IDENTITY (1,1),
descripcion VARCHAR (200),
CONSTRAINT pk_tipos_clientes PRIMARY KEY (id_tipo_cliente)
);
GO

CREATE TABLE TIPOS_IDENTIFICACIONES(
id_tipo_identificacion INT IDENTITY (1,1),
descripcion VARCHAR(200),
CONSTRAINT pk_tipos_identificaciones PRIMARY KEY (id_tipo_identificacion)
);
GO

CREATE TABLE CLIENTES(
id_cliente INT IDENTITY (1,1),
id_tipo_cliente INT,
id_tipo_identificacion INT,
nro_identificacion INT,
nombre_raz_social VARCHAR (150),
direccion VARCHAR (200),
id_barrio INT,
CONSTRAINT pk_clientes PRIMARY KEY (id_cliente),
CONSTRAINT fk_clientes_tipos FOREIGN KEY (id_tipo_cliente) 
REFERENCES TIPOS_CLIENTES (id_tipo_cliente),
CONSTRAINT fk_clientes_tipos_identificaciones FOREIGN KEY (id_tipo_identificacion) 
REFERENCES TIPOS_IDENTIFICACIONES (id_tipo_identificacion),
CONSTRAINT fk_clientes_barrio FOREIGN KEY (id_barrio)
REFERENCES BARRIOS (id)
);
GO


CREATE TABLE TIPOS_CONTACTOS(
id INT IDENTITY(1,1),
descripcion VARCHAR(50)
CONSTRAINT pk_tipos_contactos PRIMARY KEY (id)
);
GO

CREATE TABLE CONTACTOS(
id_contactos INT IDENTITY(1,1),
id_cliente INT NOT NULL,
id_tipo_contacto INT,
contacto VARCHAR(100)
CONSTRAINT pk_contactos PRIMARY KEY (id_contactos),
CONSTRAINT fk_contactos_clientes FOREIGN KEY (id_cliente)
REFERENCES CLIENTES (id_cliente),
CONSTRAINT fk_contactos_tipos FOREIGN KEY (id_tipo_contacto)
REFERENCES TIPOS_CONTACTOS (id)
);
GO

CREATE TABLE AUTOPLANES(
id INT IDENTITY (1,1),
descripcion VARCHAR (100),
tasa_interes INT,
CONSTRAINT pk_autoplanes PRIMARY KEY (id)
);
GO

CREATE TABLE FORMAS_PAGO(
id INT IDENTITY (1,1),
descripcion VARCHAR (100),
id_cuotas INT,
CONSTRAINT pk_formas_pago PRIMARY KEY(id),
CONSTRAINT fk_formas_pago_autoplanes FOREIGN KEY (id_cuotas)
REFERENCES AUTOPLANES (id)
);
GO

CREATE TABLE INVENTARIOS(
id INT IDENTITY (1,1),
cod_producto INT,
cantidad INT,
id_tipo_movimiento INT,
fecha DATETIME,
CONSTRAINT pk_inventarios PRIMARY KEY (id),
CONSTRAINT fk_inventarios_productos FOREIGN KEY (cod_producto) 
REFERENCES PRODUCTOS (cod_producto),
CONSTRAINT fk_tipo_movimiento FOREIGN KEY (id_tipo_movimiento) 
REFERENCES TIPOS_MOVIMIENTOS (id)
);
GO

CREATE TABLE FACTURAS(
id INT IDENTITY (1,1),
fecha DATETIME,
id_cliente INT,
id_forma_pago INT,
CONSTRAINT pk_facturas PRIMARY KEY (id),
CONSTRAINT fk_facturas_formas_pago FOREIGN KEY (id_forma_pago)
REFERENCES FORMAS_PAGO (id),
CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente)
REFERENCES CLIENTES (id_cliente)
);
GO

CREATE TABLE DETALLES_FACTURAS(
id INT IDENTITY (1,1),
id_factura INT NULL,
cod_producto INT,
cantidad INT,
pre_unitario INT,
CONSTRAINT pk_detalles_facturas PRIMARY KEY (id),
CONSTRAINT fk_detalles_facturas_facturas FOREIGN KEY (id_factura)
REFERENCES FACTURAS (id),
CONSTRAINT fk_detalles_facturas_productos FOREIGN KEY (cod_producto)
REFERENCES PRODUCTOS (cod_producto)
);
GO

CREATE TABLE USUARIOS(
usuario VARCHAR(100),
pass VARCHAR(300)
CONSTRAINT pk_usuario PRIMARY KEY (usuario)
);



INSERT INTO PAISES (descripcion)
VALUES ('ARGENTINA');
INSERT INTO PAISES (descripcion)
VALUES ('ALEMANIA');
INSERT INTO PAISES (descripcion)
VALUES ('GRECIA');
INSERT INTO PAISES (descripcion)
VALUES ('MEXICO');
INSERT INTO PAISES (descripcion)
VALUES ('URUGUAY');

INSERT INTO PROVINCIAS (descripcion, id_pais)
VALUES ('CORDOBA', 1)

INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('SAN VICENTE', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('CENTRO', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('CENTRO', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('SAN MARTIN', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('NUEVA CORDOBA', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('COLON', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('JARDIN', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('GENERAL PAZ', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('URCA', 1);
INSERT INTO BARRIOS (descripcion, id_provincia)
VALUES ('BAJO PALERMO', 1);


INSERT USUARIOS(usuario, pass)
VALUES('Ferru', '0fa2f9f2c538cbab5e577f8b9472a24d6d7abb14211a90cd943be63441f15638')

INSERT INTO TIPOS_PRODUCTOS (descripcion)
VALUES ('Automovil');

INSERT INTO TIPOS_MOVIMIENTOS (descripcion)
VALUES ('Entrada');
INSERT INTO TIPOS_MOVIMIENTOS (descripcion)
VALUES ('Salida');


INSERT INTO COLORES (descripcion)
VALUES ('Negro');
INSERT INTO COLORES (descripcion)
VALUES ('Blanco');
INSERT INTO COLORES (descripcion)
VALUES ('Gris');
INSERT INTO COLORES (descripcion)
VALUES ('Azul');
INSERT INTO COLORES (descripcion)
VALUES ('Rojo');
INSERT INTO COLORES (descripcion)
VALUES ('Amarillo');
INSERT INTO COLORES (descripcion)
VALUES ('Verde');

INSERT INTO MARCAS (descripcion)
VALUES ('Volkswagen');
INSERT INTO MARCAS (descripcion)
VALUES ('Fiat');
INSERT INTO MARCAS (descripcion)
VALUES ('Chevrolet');

--Volkswagen
INSERT INTO MODELOS (descripcion)
VALUES ('Gol Trend');
INSERT INTO MODELOS (descripcion)
VALUES ('Gol GTI');
INSERT INTO MODELOS (descripcion)
VALUES ('Golf');
INSERT INTO MODELOS (descripcion)
VALUES ('Polo');
INSERT INTO MODELOS (descripcion)
VALUES ('Amarok');
--Fiat
INSERT INTO MODELOS (descripcion)
VALUES ('Cronos');
INSERT INTO MODELOS (descripcion)
VALUES ('Palio');
INSERT INTO MODELOS (descripcion)
VALUES ('Argo');
INSERT INTO MODELOS (descripcion)
VALUES ('Uno');
INSERT INTO MODELOS (descripcion)
VALUES ('Toro');
--Chevrolet
INSERT INTO MODELOS (descripcion)
VALUES ('Corsa');
INSERT INTO MODELOS (descripcion)
VALUES ('Onix');
INSERT INTO MODELOS (descripcion)
VALUES ('Prisma');
INSERT INTO MODELOS (descripcion)
VALUES ('Cruze');
INSERT INTO MODELOS (descripcion)
VALUES ('S-10');


INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 1, 3, 2, 'Automovil Importado', 4000000.00,1)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 2, 2, 3, 'Automovil Importado', 4060000.00,4)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 3, 3, 2,'Automovil Importado', 4500000.00,5)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 3, 3, 2,  'Automovil Importado', 5400000.00,3)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 1, 2, 1, 'Origen Nacional', 5000000.00,2)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 2, 4, 2, 'Automovil Importado', 4000000.00,1)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 3, 2, 3,  'Automovil Importado', 7060000.00,4)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 2, 5, 2,  'Automovil Importado', 3500000.00,5)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 2, 3, 2, 'Automovil Importado', 6400000.00,3)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 2, 2, 1, 'Origen Nacional', 2000000.00,2)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 3, 4, 2,  'Automovil Importado', 8000000.00,1)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 3, 2, 3,  'Automovil Importado', 5060000.00,4)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 1, 3, 2,  'Automovil Importado', 3500000.00,1)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 2, 5, 2, 'Automovil Importado', 1400000.00,4)
INSERT INTO PRODUCTOS (id_tipo_producto, id_marca, id_modelo, id_origen, descripcion, precio_unitario, id_color)
VALUES (1, 3, 5, 1,  'Origen Nacional', 9000000.00,2)


INSERT INTO TIPOS_CLIENTES(descripcion)	
VALUES('consumidor final');	
INSERT INTO TIPOS_CLIENTES(descripcion)	
VALUES('empresa');	

INSERT INTO TIPOS_IDENTIFICACIONES (descripcion)	
VALUES ('DNI');	
INSERT INTO TIPOS_IDENTIFICACIONES (descripcion)	
VALUES ('CUIT');	
INSERT INTO TIPOS_IDENTIFICACIONES (descripcion)	
VALUES ('Pasaporte');	
INSERT INTO TIPOS_IDENTIFICACIONES (descripcion)	
VALUES ('Libreta de Enrolamiento');	

INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(1,1,49700288,'Lucas Oropel','Las Rosas 123',6);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(1,1,37000193,'Gustavo Ruiz','Aconcagua 1895',3);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2, 30771831,'Los Hermanos S.A.','La Rioja 6947',8);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2,30713281,'Taller MGC S.A.','Martinoli 774',7);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(1,3,313431,'Franco Martinez','Colon 5648',9);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(1,3,31312391,'Gabriela Sosa','Artigas 1479',9);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(1,4, 293839213,'Joaquin Perez','Pasaje Arroyo 1647',1);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2,307171713, 'Cotreco S.A.','Mercosur 998',1);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2,91397194,'Taverniti S.R.L.','Las Tejas 4967',4);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2,307193,'Epec S.A.','Saturnino Segurola 7466',2);
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,1,22555333,'Oreste Berta','Tucuman 54',6);
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,1,36555222,'El señor de los amortiguadores','Av. fuerza aerea 1200',3);
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2, 30777000,'Arcor S.A.','Av general paz 235',8); 
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(1,1,25888555,'Sebastian Vettel','El chaco 5478',6);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,1,30888555,'Autopartes el chanchito feliz','Estrada 214',3);	
INSERT INTO CLIENTES (id_tipo_cliente, id_tipo_identificacion,nro_identificacion, nombre_raz_social, direccion, id_barrio)	
VALUES(2,2, 31000888,'BGH S.R.L.','Paraná 889',8);	


INSERT INTO TIPOS_CONTACTOS(descripcion)	
VALUES('celular');	
INSERT INTO TIPOS_CONTACTOS(descripcion)	
VALUES('correo electrónico');	
INSERT INTO TIPOS_CONTACTOS(descripcion)	
VALUES('telefono');	
INSERT INTO TIPOS_CONTACTOS(descripcion)	
VALUES('facebook');	
INSERT INTO TIPOS_CONTACTOS(descripcion)	
VALUES('instagram');	

INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (1, 2, 'ELLUKITAPIOLA@GMAIL.COM');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (2, 1, '8432462612');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (3, 1, '8432462513');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (4, 1, '8432462614');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (5, 1, '8432462615');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (6, 1, '8432462616');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (7, 1, '8432462617');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (8, 1, '8432462618');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (9, 1, '8432462619');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (10, 1, '8432462620');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (2, 2, 'GUSTAVOGE.RUIZ@GMAIL.COM');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (3, 2, 'RJUNCOS@HNOSSA.COM');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (3, 1, 'LOS HERMANOS SA');	
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (3, 4, 'Los Hermanos S.A.');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (4, 5, '@TallerMGCok');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (5, 4, 'Franco el loco Martinez');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (6, 2, 'gabi1sosa@gmail.com');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (7, 5, '@elJoaqui');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (8, 5, '@Cotrecosaok');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (9, 4, 'Tu jean Taverniti');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (10, 5, '@epecok');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (4, 2, 'info@tallermgc.com');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (5, 5, '@martinezfranco');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (6, 4, 'Gabi Sosa');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (7, 4, 'Joanquin Perez');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (8, 2, 'info@cotrecosa.com');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (9, 2, 'info@taverniti.com');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (10, 2, 'info@epec.com');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (2, 5, '@gusruiz21');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)			
VALUES (1, 1, '8432462611');			
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (13, 4, 'GOLOSINAS ARCOR');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (11, 5, '@OBERTAok');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (12, 4, 'El señor de los amortiguadores');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (16, 2, 'info@bgh.com');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (15, 5, '@elchanchitofeliz');
INSERT INTO CONTACTOS (id_cliente, id_tipo_contacto, contacto)
VALUES (14, 5, '@svettelok');

INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (1, 50, 1, '2023-01-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (1, 20, 2, '2023-07-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (2, 50, 1, '2023-09-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (3, 40, 1, '2023-10-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (4, 30, 1, '2023-11-09')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (5, 25, 1, '2023-06-10')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (6, 20, 1, '2023-10-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (7, 60, 1, '2023-11-09')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (8, 30, 1, '2023-06-10')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (9, 150, 1, '2023-10-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (10, 60, 1, '2023-11-09')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (11, 55, 1, '2023-10-10')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (12, 50, 1, '2023-11-01')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (13, 20, 1, '2023-10-09')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (14, 25, 1, '2023-09-10')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (15, 25, 1, '2023-09-10')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (14, 3, 2, '2023-09-10')
INSERT INTO INVENTARIOS (cod_producto, cantidad, id_tipo_movimiento, fecha)
VALUES (15, 1, 2, '2023-09-10')

INSERT INTO AUTOPLANES (descripcion, tasa_interes)
VALUES ('30 cuotas', 45)
INSERT INTO AUTOPLANES (descripcion, tasa_interes)
VALUES ('60 cuotas', 65)
INSERT INTO AUTOPLANES (descripcion, tasa_interes)
VALUES ('120 cuotas', 85)
INSERT INTO AUTOPLANES (descripcion, tasa_interes)
VALUES ('150 cuotas', 97)

INSERT INTO FORMAS_PAGO (descripcion, id_cuotas)
VALUES ('CONTADO', NULL)
INSERT INTO FORMAS_PAGO (descripcion, id_cuotas)
VALUES ('AUTOPLAN 30', 1)
INSERT INTO FORMAS_PAGO (descripcion, id_cuotas)
VALUES ('AUTOPLAN 60', 2)
INSERT INTO FORMAS_PAGO (descripcion, id_cuotas)
VALUES ('AUTOPLAN 120', 3)
INSERT INTO FORMAS_PAGO (descripcion, id_cuotas)
VALUES ('AUTOPLAN 150', 4)


INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2019-03-10', 1, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2020-03-13', 2, 2)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2021-03-15', 7, 1)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2022-04-10', 5, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2023-05-23', 10, 1)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2019-05-10', 11, 2)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2020-04-10', 12, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2021-01-10', 13, 1)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2022-07-10', 8, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2023-09-10', 9, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2019-11-10', 12, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2020-01-10', 13, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2021-07-10', 14, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2022-09-10', 15, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2023-11-10', 16, 3)
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2014-12-10', 8, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2013-03-10', 10, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2013-08-03', 13, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2014-04-08', 16, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_forma_pago)
VALUES ('2013-04-08', 8, 1);

INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (1, 1, 1, 4000000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (2, 2, 1, 4060000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (3, 3, 1, 4500000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (4, 4, 1, 5400000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (5, 5, 1, 5000000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (6, 6, 1, 4000000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (7, 7, 1, 7060000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (8, 8, 1, 3500000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (9, 9, 1, 6400000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (10, 10, 1, 2000000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (11, 11, 1, 8000000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (12, 12, 1, 5060000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (13, 13, 1, 3500000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (14, 14, 1, 1400000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (15, 15, 1, 9000000.00)
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (16, 1, 1, 4000000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (16, 2, 1, 4060000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (17, 3, 1, 4500000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (17, 4, 1, 5400000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (18, 5, 1, 5000000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (18, 6, 1, 4000000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (19, 7, 1, 7060000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (19, 8, 1, 3500000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (20, 9, 1, 6400000.00);
INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
VALUES (20, 10, 1, 2000000.00);

---- TRAE LOS PRODUCTOS ----
CREATE PROCEDURE SP_TRAER_PRODUCTOS
AS
BEGIN
	SELECT p.cod_producto 'cod_producto', tp.id 'id_tipo_producto', tp.descripcion 'tipo_producto',
	m.id 'id_marca', m.descripcion 'marca',
	mo.id 'id_modelo', mo.descripcion 'modelo', o.id 'id_pais', o.descripcion 'pais',
	p.descripcion 'descripcion', p.precio_unitario 'precio_unitario', c.id 'id_color',
	c.descripcion 'color'
	FROM PRODUCTOS p
	JOIN TIPOS_PRODUCTOS tp ON p.id_tipo_producto = tp.id
	JOIN MARCAS m ON p.id_marca = m.id
	JOIN MODELOS mo ON p.id_modelo = mo.id
	JOIN PAISES o ON p.id_origen = o.id
	JOIN COLORES c ON p.id_color = c.id
END;
GO

---- TRAE LOS PRODUCTOS POR CÓDIGO----
CREATE PROCEDURE SP_TRAER_PRODUCTOS_CODIGO
@cod_producto INT
AS
BEGIN
	SELECT p.cod_producto 'cod_producto', tp.id 'id_tipo_producto', tp.descripcion 'tipo_producto',
	m.id 'id_marca', m.descripcion 'marca',
	mo.id 'id_modelo', mo.descripcion 'modelo', o.id 'id_pais', o.descripcion 'pais',
	p.descripcion 'descripcion', p.precio_unitario 'precio_unitario', c.id 'id_color',
	c.descripcion 'color'
	FROM PRODUCTOS p
	JOIN TIPOS_PRODUCTOS tp ON p.id_tipo_producto = tp.id
	JOIN MARCAS m ON p.id_marca = m.id
	JOIN MODELOS mo ON p.id_modelo = mo.id
	JOIN PAISES o ON p.id_origen = o.id
	JOIN COLORES c ON p.id_color = c.id
	WHERE cod_producto = @cod_producto
END;
GO

---- INSERTA PRODUCTOS ----
CREATE PROCEDURE SP_ALTA_PRODUCTO
@id_tipo_producto INT,
@id_marca INT,
@id_modelo INT,
@id_origen INT,
@descripcion VARCHAR(100),
@precio_unitario DECIMAL(10,2),
@id_color INT
AS
BEGIN
 INSERT INTO PRODUCTOS (
            id_tipo_producto,
            id_marca,
            id_modelo,
            id_origen,
            descripcion,
            precio_unitario,
            id_color
        ) VALUES (
            @id_tipo_producto,
            @id_marca,
            @id_modelo,
            @id_origen,
            @descripcion,
            @precio_unitario,
            @id_color
        );
END;

---- BUSQUEDA SIMPLE PRODUCTOS ----
CREATE PROCEDURE SP_BUSCA_SIMPLE_PRODUCTOS
AS
BEGIN
	SELECT cod_producto, descripcion
	FROM PRODUCTOS
END;

---- TRAE CLIENTES POR ID -----

CREATE PROCEDURE SP_TRAER_CLIENTES_ID
@id_cliente INT
AS
BEGIN
	SELECT id_cliente 'id_cliente',
	tc.id_tipo_cliente 'id_tipo_cliente',
	tc.descripcion 'tipo_cliente',
	ti.id_tipo_identificacion 'id_tipo_identificacion',
	ti.descripcion 'tipo_identificacion',
	nro_identificacion 'identificaion', 
	nombre_raz_social 'nombre_raz_social',
	direccion 'direccion', b.id 'id_barrio',
	b.descripcion 'barrio', p.id 'id_provincia',
	p.descripcion 'provincia', pa.id 'id_pais',
	pa.descripcion 'pais'
	FROM CLIENTES c
	JOIN BARRIOS b ON c.id_barrio = b.id
	JOIN PROVINCIAS p ON b.id_provincia = p.id
	JOIN PAISES pa ON pa.id = p.id_pais
	JOIN TIPOS_CLIENTES tc ON c.id_tipo_cliente = tc.id_tipo_cliente
	JOIN TIPOS_IDENTIFICACIONES ti ON c.id_tipo_identificacion = ti.id_tipo_identificacion
	WHERE id_cliente = @id_cliente
END;

---- TRAE FACTURAS POR ID ----
CREATE PROCEDURE SP_BUSCAR_FACTURA
@id_factura INT
AS
BEGIN
SELECT f.id 'id_factura', fecha 'fecha',
id_cliente 'id_cliente', f.id_forma_pago 'id_forma_pago',
fp.descripcion 'forma_pago',
fp.descripcion 'Cuota'
FROM facturas f
JOIN FORMAS_PAGO fp ON f.id_forma_pago = fp.id
WHERE f.id = @id_factura
END;

---- INSERTA FACTURA, TRAE SU ID ----
CREATE PROCEDURE SP_INSERTAR_FACTURA
@fecha DATETIME,
@id_cliente INT,
@id_forma_pago INT,
@id_factura INT OUTPUT
AS
BEGIN
	INSERT INTO FACTURAS(fecha, id_cliente, id_forma_pago)
	VALUES(@fecha,@id_cliente,@id_forma_pago);
	SET @id_factura = SCOPE_IDENTITY();
END;
GO

---- INSERTA UN DETALLE DE FACTURA ----
CREATE PROCEDURE SP_INSERTAR_DETALLE_FACTURA
@id_factura INT,
@cod_producto INT,
@cantidad INT,
@pre_unitario INT
AS
BEGIN
	INSERT INTO DETALLES_FACTURAS(id_factura, cod_producto, cantidad, pre_unitario)
	VALUES(@id_factura,@cod_producto,@cantidad,@pre_unitario)
END;
GO

---- TRAE LOS BARRIOS ----
CREATE PROCEDURE SP_TRAER_BARRIOS
AS
BEGIN
	SELECT id 'id_barrio', descripcion 'descripcion'
	FROM BARRIOS
END;
GO

CREATE PROCEDURE SP_TRAER_TIPO_IDENT
AS
BEGIN
	SELECT id_tipo_identificacion 'id_tipo_identificación', descripcion 'descripcion'
	FROM TIPOS_IDENTIFICACIONES
END;
GO



---- TRAE FORMAS PAGO ----
CREATE PROCEDURE SP_TRAER_FORMAS_PAGO
AS
BEGIN
	SELECT fp.id, fp.descripcion, a.descripcion, tasa_interes
	FROM FORMAS_PAGO fp
	LEFT JOIN AUTOPLANES a ON fp.id_cuotas = a.id
END;
GO

CREATE PROCEDURE SP_TRAER_USUARIOS
AS
BEGIN
	SELECT usuario 'usuario', pass 'password'
	FROM USUARIOS
END;
GO

CREATE PROCEDURE SP_TRAER_TIPO_CLIENTE
AS
BEGIN
	SELECT id_tipo_cliente 'id_tipo_cliente', descripcion 'descripcion'
	FROM TIPOS_CLIENTES
END;
GO

CREATE PROCEDURE SP_TRAER_CLIENTES_TODOS
AS
BEGIN
	SELECT id_cliente 'id_cliente', nombre_raz_social 'nombre', tc.descripcion 'tipo_cliente',
	ti.descripcion 'tipo_identificacion', c.nro_identificacion 'identificación',
	c.direccion 'dirección', b.descripcion 'barrio'
	FROM CLIENTES c
	JOIN TIPOS_CLIENTES tc ON tc.id_tipo_cliente = c.id_tipo_cliente
	JOIN TIPOS_IDENTIFICACIONES ti ON ti.id_tipo_identificacion = c.id_tipo_identificacion
	JOIN Barrios b ON b.id = c.id_barrio
END;

CREATE PROCEDURE SP_MARCAS_VENDIDAS
@MARCA varchar (100)
AS
BEGIN
SELECT p.cod_producto Codigo, tp.descripcion Producto, m.descripcion Marca, SUM(df.cantidad*df.pre_unitario) Facturación, COUNT(*) CantidadVentas 
FROM FACTURAS f
JOIN DETALLES_FACTURAS df on f.id = df.id_factura
JOIN PRODUCTOS p on p.cod_producto = df.cod_producto
JOIN TIPOS_PRODUCTOS tp on p.id_tipo_producto = tp.id
JOIN MARCAS m on m.id = p.id_marca
WHERE m.descripcion = @MARCA
GROUP BY p.cod_producto, tp.descripcion, m.descripcion
END


CREATE PROCEDURE SP_MARCAS_VENDIDAS
@id_marca int
AS
BEGIN
SELECT p.cod_producto Codigo, tp.descripcion Producto, m.descripcion Marca, 
SUM(df.cantidad*df.pre_unitario) Facturación, COUNT(*) CantidadVentas 
FROM FACTURAS f
JOIN DETALLES_FACTURAS df on f.id = df.id_factura
JOIN PRODUCTOS p on p.cod_producto = df.cod_producto
JOIN TIPOS_PRODUCTOS tp on p.id_tipo_producto = tp.id
JOIN MARCAS m on m.id = p.id_marca
WHERE m.id = @id_marca
GROUP BY p.cod_producto, tp.descripcion, m.descripcion
END

CREATE PROCEDURE SP_FACTURAS_POR_CLIENTE
@id_tipo_cliente int 
AS
BEGIN
SELECT  c.nombre_raz_social 'Nombre', c.nro_identificacion 'Identificacion',
		tc.descripcion 'TipoCliente',
		c.direccion 'Direccion', 
		COUNT(c.id_cliente) 'CantidadFacturas'
FROM CLIENTES C
JOIN Facturas f ON f.id_cliente = c.id_cliente
JOIN TIPOS_CLIENTES tc ON tc.id_tipo_cliente = c.id_tipo_cliente
WHERE tc.id_tipo_cliente = @id_tipo_cliente 
GROUP BY c.nombre_raz_social, c.nro_identificacion,
		 tc.descripcion, c.direccion 
END;

CREATE PROCEDURE SP_BORRAR_CLIENTES
@id_cliente INT
AS
BEGIN
	DECLARE @id_Factura INT
	SELECT @id_Factura = id FROM FACTURAS WHERE id_cliente = @id_cliente
	DELETE FROM DETALLES_FACTURAS
	WHERE id_factura = @id_Factura
	DELETE FROM CONTACTOS
	WHERE id_cliente = @id_cliente
	DELETE FROM FACTURAS
	WHERE id_cliente = @id_cliente
	DELETE FROM CLIENTES
	WHERE id_cliente = @id_cliente
END;