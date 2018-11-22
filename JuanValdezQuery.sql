--QUERY FINAL
CREATE TABLESPACE JuanValdezCafe2
DATAFILE 'C:\EMPRESA_IMPLE/JuanValdezCafe2.dbf'
SIZE 100M;

 
--alter session set "_ORACLE_SCRIPT"=true; 

Alter USER AdministradorJV
IDENTIFIED BY ADMI5482
DEFAULT TABLESPACE JuanValdezCafe2
TEMPORARY TABLESPACE temp;

alter USER CajeroJV
IDENTIFIED BY CAJ4852
DEFAULT TABLESPACE JuanValdezCafe2
TEMPORARY TABLESPACE temp;

GRANT connect, resource, create view TO AdministradorJV;

GRANT connect, resource, create view TO CajeroJV;


CREATE TABLE Categoria
(
    categoria_id  	NUMBER        	PRIMARY KEY,
    nombre             VARCHAR(20)	NOT NULL,
    descripcion       VARCHAR2(250)  
);
 
INSERT INTO Categoria VALUES (001, 'VIP', 'Cliente que adquiera la membresía por el costo de S/. 240 permitiéndole consumir cualquier bebida + acompañamiento(una por dia) durante los 20 días hábiles del mes');
INSERT INTO Categoria VALUES (002, 'Frecuente', 'Cliente que realiza por lo menos tres consumos por semana ');

 
CREATE TABLE Cliente
(
	cliente_Id     	        NUMBER        	    PRIMARY KEY,
	nombre         	       VARCHAR2(25)  	NOT NULL,
	apel_mat       	       VARCHAR2(25)  	NOT NULL,
	apel_pat        	       VARCHAR2(25)  	NOT NULL,
	dni                           CHAR(8)       	      NOT NULL,
	telefono        	       CHAR(10),
	fecha_nacimiento	DATE,
	correo          	        VARCHAR2(50),
    fecha_registro         DATE              	    NOT NULL,
    categoria_Id     	   NUMBER        	REFERENCES Categoria
);

INSERT INTO Cliente VALUES (001, 'Javier', 'Court', 'Steak', 73489652, 946852658, '26-FEB-1995', 'javier@gmail.com', '27-OCT-2018', 001);
INSERT INTO Cliente VALUES (002, 'Shao', 'Cañita', 'Sanurya', 20188954, 994513565, '19-JUN-1987', 'shao@gmail.com', '9-OCT-2018', 002);
INSERT INTO Cliente VALUES (003, 'Azucena', 'King', 'Kochhar', 46581656, 921597865, '21-MAY-1993', 'azucena@gmail.com', '20-OCT-2018', 001);
INSERT INTO Cliente VALUES (004, 'Alexander', 'Pataballa', 'Hunold', 20159873, 987654321, '24-JUL-2000', 'alexander@gmail.com', '16-OCT-2018', 001);
INSERT INTO Cliente VALUES (005, 'Nancy', 'Popp', 'Nayer', 75876489, 964587931, '28-MAY-1957', 'nancy@gmail.com', '08-SEP-2018', 002);
INSERT INTO Cliente VALUES (006, 'Diana', 'Tobias', 'Matos', 45678923, 936925814, '10-FEB-1998', 'diana@gmail.com', '01-NOV-2018', 001);
INSERT INTO Cliente VALUES (007, 'Daniel', 'Olson', 'Vargas', 78564231, 912597864, '19-NOV-1988', 'daniel@gmail.com', '27-OCT-2018', 002);
INSERT INTO Cliente VALUES (008, 'Karen', 'Perez', 'Barrera', 21369854, 995684321, '7-MAY-1993', 'karen@gmail.com', '15-SEP-2018', 001);
INSERT INTO Cliente VALUES (009, 'Kevin', 'Trujillo', 'Rivera', 45678231, 984586321, '21-MAR-2000', 'kevin@gmail.com', '02-NOV-2018', 001);
INSERT INTO Cliente VALUES (010, 'Irene', 'Drago', 'Tovar',45876921, 964586721, '30-JUL-1957', 'irene@gmail.com', '04-OCT-2018', 002);
INSERT INTO Cliente VALUES(011, 'MARIO', 'VARGAS', 'LLOSA',21586395, 969584235,'05-JUN-1993','mvllosa@gmail.com','10-SEP-2018',002);
INSERT INTO Cliente VALUES(012, 'ANGEL', 'RUBINA', 'PRLJA',78522459,959268345,'08-NOV-1996','a.nunc.In@gmail.com','25-SEP-2018',001);
INSERT INTO Cliente VALUES(013, 'ROBERTO', 'SALVATIERRA', 'CRISOSTOMO',75852585,989596321,'14-NOV-1998', 'ac.mattis@gmail.com','15-OCT-2018',001);
INSERT INTO Cliente VALUES(014, 'TEOFILO', 'JORGE', 'CABANILLAS',21512826,959636268,'18-FEB-1990','accumsan.sed.facilisis@gmail.com','17-SEP-2018',002);
INSERT INTO Cliente VALUES(015, 'LUIS', 'QUISPE', 'TERAN',48523695,919264358,'19-FEB-1995', 'aliquam.eros@gmail.com','15-SEP-2018',001);
INSERT INTO Cliente VALUES(016, 'JOSE', 'DURAND', 'RAMIREZ',45859632,929597862,'08-FEB-1991','aliquet.diam.Sed@gmail.comm','06-SEP-2018',002);
INSERT INTO Cliente VALUES(017, 'IVAN', 'INGA', 'GONZALEZ',79635152,958552984,'28-SEP-1950', 'amet.ultricies.sem@gmail.comu','27-SEP-2018',001);
INSERT INTO Cliente VALUES(018, 'PEDRO', 'PASQUEL', 'MORENO',71542542,949585269,'19-NOV-1954','arcu@gmail.com','21-OCT-2018',002);
INSERT INTO Cliente VALUES(019, 'VICTOR', 'RIOS', 'QUIROZ',05755896,989523698,'04-NOV-1964', 'at.nisi.Cum@gmail.coma','02-OCT-2018',001);
INSERT INTO Cliente VALUES(020, 'KATHERINE', 'TUESTA', 'BERROCAL',05452598,979596321,'05-JUN-1968', 'consectetuer@gmail.coma','08-OCT-2018',002);
INSERT INTO Cliente VALUES(021, 'KATHERINE', 'VALENZUELA', 'BARAYBAR',70256985,9211585351,'01-JUN-1969', 'Cras@gmail.com','29-SEP-2018',002);
INSERT INTO Cliente VALUES(022, 'MARCO', 'MALPICA', 'JIMENEZ',09536209,919263648,'24-MAR-1994', 'Cum@gmail.com','20-OCT-2018',002);


CREATE SEQUENCE cliente_id
START WITH 30
INCREMENT BY 10
NOMAXVALUE
NOCYCLE
CACHE 10; 

 

INSERT INTO Cliente VALUES(cliente_id.NEXTVAL, 'NERY', 'CHUMPITAZ', 'TUESTAS',05069825,91929896,'09-NOV-1990', 'dapibus.id.blandit@gmail.com','10-OCT-2018',001);
INSERT INTO Cliente VALUES(cliente_id.NEXTVAL, 'JOSE', 'BUENDIA', 'NUÑEZ',79696326,998926962,'11-FEB-1991', 'dapibus@gmail.com','18-OCT-2018',001);
INSERT INTO Cliente VALUES(cliente_id.NEXTVAL, 'JORGE', 'CORDOVA', 'DELGADILLO',06052639,995269719,'12-OCT-1992','diam.eu@gmail.com','22-NOV-2018',002);


--DROP TABLE cliente;
Select * from Cliente;

CREATE INDEX idx_Cliente
ON Cliente(nombre,apel_mat,apel_pat );

CREATE TABLE Proveedor
(
	proveedor_id    	NUMBER      	PRIMARY KEY,
	nomb_comp    	   VARCHAR2(100)   NOT NULL,
	direccion       	VARCHAR2(200)   NOT NULL,
	telefono        	NUMBER      	NOT NULL,
  fecha_entrega     DATE          NOT NULL,             
	Correo          	VARCHAR2(50)
);

INSERT INTO Proveedor VALUES(001,'ANTIOQUIA','Bogota Avenida Carrera 7',475893145,'14-OCT-2018','LUIS_12@HOTMAIL.COM');
INSERT INTO Proveedor VALUES(002,'SIERRA_NEVADA','SAN ANDRES 258',471582936,'10-OCT-2018', 'MARIA_SV12@GMAIL.COM');
INSERT INTO Proveedor VALUES(003,'NARIÑO','VICE CITY 145',995824769,'13-OCT-2018','MARIO_15@GMAIL.COM');
INSERT INTO Proveedor VALUES(004,'HUILA','MEDELLIN 126',483257692,'15-OCT-2018','ROSA-LINARES@GMAIL.COM');

CREATE SEQUENCE proveedor_id
START WITH 5
INCREMENT BY 3
NOMAXVALUE
NOCYCLE
CACHE 10;


INSERT INTO Proveedor VALUES(proveedor_id.NEXTVAL,'SIERRA_NEVADA','CALI 594',172583648,'10-OCT-2018','JESUS15@GMAIL.COM');
INSERT INTO Proveedor VALUES(proveedor_id.NEXTVAL,'BERFRUT','Av.Los Quechuas-Ate',953569825,'13-OCT-2018','BERFRUT15@GMAIL.COM');
INSERT INTO Proveedor VALUES(proveedor_id.NEXTVAL,'ARTEZANOS','LA HAVANA 548',957158647 ,'12-OCT-2018','JUAN03@GMAIL.COM');
INSERT INTO Proveedor VALUES(proveedor_id.NEXTVAL,'FLORENCIA','SAN ANDRES 600',992548632,'15-OCT-2018','JOSE.12_@GMAIL.COM');
INSERT INTO Proveedor VALUES(proveedor_id.NEXTVAL,'SANTA_MARIA','FALCAO 125',547825592,'14-OCT-2018','SAM_11@GMAIL.COM');


select * from proveedor;

CREATE INDEX idx_Proveedor 
ON Proveedor (nomb_comp);

CREATE TABLE Promocion
(
    promocion_id    NUMBER          PRIMARY KEY,
    nombre          VARCHAR2(50)    NOT NULL,
    descripcion     VARCHAR2(200)   
);


CREATE SEQUENCE promocion_id
START WITH 10
INCREMENT BY 10
NOMAXVALUE
NOCYCLE
CACHE 10;



INSERT INTO Promocion VALUES (promocion_id.NEXTVAL, '2x1', 'un producto seleccionado por la empresa tiene la promoción de que  llevas dos por el precio de uno');
INSERT INTO Promocion VALUES (promocion_id.NEXTVAL, 'Cumpleaños', 'un acompañamiento seleccionado por la empresa es gratis');
INSERT INTO Promocion Values (promocion_id.NEXTVAL,'Bebida a mitad de precio','La bebida que esté en promocion tendra un 50% de descuento');

select * from promocion;

CREATE INDEX idx_Promocion 
ON Promocion (nombre);

CREATE TABLE Producto
(
producto_id NUMBER  PRIMARY KEY,
categoria_producto	VARCHAR2(50) NOT NULL,
tipo_producto	VARCHAR2(50) NOT NULL,
nombre      CHAR(50)  NOT NULL,
precio      DECIMAL(10,2) NOT NULL,
descripcion VARCHAR2(200),
proveedor_id  number,
promocion_id   NUMBER     REFERENCES Promocion
);

INSERT INTO Producto VALUES (00001, 'Servicio', 'Fidelizacion',  'Membresia VIP', 240.00, 'Cliente que adquiera la membresía por el costo de S/. 240 permitiéndole consumir cualquier bebida + acompañamiento durante los 20 días hábiles del mes',null,null);
INSERT INTO Producto VALUES (00002, 'Consumible', 'Bebida Caliente', 'Cappuccino Tradicional (12 oz)', 9.00, 'Bebidas con perfectas notas de aroma y sabor en su paladar',null,null);
INSERT INTO Producto VALUES (00003, 'Consumible', 'Bebida Caliente', 'Cappuccino Tradicional (16 oz)', 10.50, 'Bebidas con perfectas notas de aroma y sabor en su paladar',null,null);
INSERT INTO Producto VALUES (00004, 'Consumible', 'Bebida Caliente', 'Latte Cafe (9 oz)', 8.00, 'Espresso y leche cubiertos de una capa cremosa de leche vaporizada',null,null);
INSERT INTO Producto VALUES (00005, 'Consumible', 'Bebida Caliente', 'Latte Cafe (12 oz)', 9.00, 'Espresso y leche cubiertos de una capa cremosa de leche vaporizada',null,null);
INSERT INTO Producto VALUES (00006, 'Consumible', 'Bebida Caliente', 'Latte Cafe (16 oz)', 10.50, 'Espresso y leche cubiertos de una capa cremosa de leche vaporizada',null,null);
INSERT INTO Producto VALUES (00007, 'Consumible', 'Bebida Caliente', 'Mocca (9 oz)', 11.50, 'Combinacion de cafe y chocolate',null, 30);
INSERT INTO Producto VALUES (00008, 'Consumible', 'Bebida Caliente', 'Mocca (12 oz)', 12.50, 'Combinacion de cafe y chocolate',null,30);
INSERT INTO Producto VALUES (00009, 'Consumible', 'Bebida Caliente', 'Mocca (16 oz)', 13.50, 'Combinacion de cafe y chocolate',null,30);
INSERT INTO Producto VALUES (00010, 'Consumible', 'Bebida Caliente', 'Espresso Normal (1.25 oz)', 5.50, 'Extracto de cafe muy aromatico y concentrado cubierto por una crema dorada',null, 10);
INSERT INTO Producto VALUES (00011, 'Consumible', 'Bebida Caliente', 'Chocolate Caliente (9 oz)', 11.00, 'Chocolate con leche vaporizada',null, 30);
INSERT INTO Producto VALUES (00012, 'Consumible', 'Bebida Caliente', 'Chocolate Caliente (12 oz)', 16.00, 'Chocolate con leche vaporizada',null,30);
INSERT INTO Producto VALUES (00013, 'Consumible', 'Bebida Caliente', 'Chocolate Caliente (16 oz)', 13.50, 'Chocolate con leche vaporizada',null, 30);
INSERT INTO Producto VALUES (00014, 'Consumible', 'Bebida Fria', 'Nevado Cafe (12 oz)', 10.50, 'Hielo y leche agregado a un espresso',null, 10);
INSERT INTO Producto VALUES (00015, 'Consumible', 'Bebida Fria', 'Nevado Cafe (15 oz)', 12.50, 'Hielo y leche agregado a un espresso',null, 10);
INSERT INTO Producto VALUES (00016, 'Consumible', 'Bebida Fria', 'Nevado Cafe (20 oz)', 13.50, 'Hielo y leche agregado a un espresso',null, 10);
INSERT INTO Producto VALUES (00017, 'Consumible', 'Bebida Fria', 'Cremolada Cafe (12 oz)', 9.00, 'Mezcla de cafe con hielo granizado',null, 10);
INSERT INTO Producto VALUES (00018, 'Consumible', 'Bebida Fria', 'Cremolada Cafe (15 oz)', 11.00, 'Mezcla de cafe con hielo granizado',null, null);
INSERT INTO Producto VALUES (00019, 'Consumible', 'Bebida Fria', 'Cremolada Cafe (20 oz)', 13.00, 'Mezcla de cafe con hielo granizado',null, null);
INSERT INTO Producto VALUES (00020, 'Consumible', 'Acompañamiento Dulce', 'Tartaleta de Manzana', 8.00, null,11, null);
INSERT INTO Producto VALUES (00021, 'Consumible', 'Acompañamiento Dulce', 'Choco Galleta', 5.00, null,14, null);
INSERT INTO Producto VALUES (00022, 'Consumible', 'Acompañamiento Dulce', 'Brownie', 4.00, null,17, 20);
INSERT INTO Producto VALUES (00023, 'Consumible', 'Acompañamiento Dulce', 'Muffin de Chocolate', 7.00, null,17, 20);
INSERT INTO Producto VALUES (00024, 'Consumible', 'Acompañamiento Dulce', 'Keke de Platano', 6.50, null,14, null);
INSERT INTO Producto VALUES (00025, 'Consumible', 'Acompañamiento Dulce', 'Torta de Chocolate', 6.50, null,11, 20);
INSERT INTO Producto VALUES (00026, 'Consumible', 'Acompañamiento Salada', 'Croissant Mixto', 9.50, null,14, null);

CREATE SEQUENCE producto_id
START WITH 187
INCREMENT BY 2
NOMAXVALUE
NOCYCLE
CACHE 10;



INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Irlandes (9 oz)', 10.00, 'El Cappuccino con un toque de sabor a crema irlandesa',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Irlandes (12 oz)', 11.50, 'El Cappuccino con un toque de sabor a crema irlandesa',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Irlandes (16 oz)', 13.50, 'El Cappuccino con un toque de sabor a crema irlandesa',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Vianes (9 oz)', 10.00, 'El Cappuccino acompañada de una capa de crema chantilly',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Vianes (12 oz)', 11.50, 'El Cappuccino acompañada de una capa de crema chantilly',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Vianes (16 oz)', 13.50, 'El Cappuccino acompañada de una capa de crema chantilly',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Cappuccino Wicao (9 oz)', 13.50, 'Crema de whisky con licor de cacao',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Latte Vanicanela (9 oz)', 10.00, 'El Latte combinado con vainilla y canela',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible',  'Bebida Caliente', 'Latte Vanicanela (12 oz)', 11.50, 'El Latte combinado con vainilla y canela',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible',  'Bebida Caliente', 'Latte Vanicanela (16 oz)', 13.50, 'El Latte combinado con vainilla y canela',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Latte Caramelo (9 oz)', 11.00, 'Espresso y leche vaporizada mezclados con caramelo',null, 30);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible',  'Bebida Caliente', 'Latte Caramelo (12 oz)', 12.50, 'Espresso y leche vaporizada mezclados con caramelo',null, 30);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Latte Caramelo (16 oz)', 13.50, 'Espresso y leche vaporizada mezclados con caramelo',null, 30);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Espresso Cortado (1.25 oz)', 5.50, 'Espresso cortado por leche o leche condensada',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Espresso Corto (1 oz)', 5.00, 'Espresso más concentrado y con menos cantidad de agua',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Espresso Doble (2 oz)', 6.50, 'Doble de Expresso',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Espresso Vianes (1.25 oz)', 7.00, 'Concentrado de cafe acompañado de la crema de chantilly',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Macchiato (35 ml)', 7.00, 'Version concentrada de un cappuccino con un espresso y leche vaporizada',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Pasado (9 oz)', 6.00, 'Cafe tinto',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Pasado (12 oz)', 7.50, 'Cafe tinto',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Pasado (16 oz)', 9.50, 'Cafe tinto',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Tinto Campesino (9 oz)', 7.00, 'Tinto con caña de azúcar, clavo y canela', null,10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Tinto Campesino (12 oz)', 8.50, 'Tinto con caña de azúcar, clavo y canela',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Caliente', 'Tinto Campesino (16 oz)', 10.50, 'Tinto con caña de azúcar, clavo y canela',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible','Bebida Fria', 'Nevado Wicao (12 oz)', 16.50, 'Crema de whisky con licor de cacao', null,10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Chocolate (12 oz)', 13.00, 'Fusión de cafe y chocolate con crema de chantilly',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Chocolate (15 oz)', 15.00, 'Fusión de cafe y chocolate con crema de chantilly',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Chocolate (20 oz)', 16.00, 'Fusión de cafe y chocolate con crema de chantilly',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Galleta (12 oz)', 13.00, 'Nevado con trocitos de galleta',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Galleta (15 oz)', 15.00, 'Nevado con trocitos de galleta',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Galleta (20 oz)', 16.00, 'Nevado con trocitos de galleta',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Brownie (12 oz)', 13.00, 'Nevado con trocitos de Brownie',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Nevado Brownie (15 oz)', 15.00, 'Nevado con trocitos de Brownie',null, 10);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria','Nevado Brownie (20 oz)', 16.00, 'Nevado con trocitos de Brownie', null,null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Fruppe Mango (12 oz)', 12.00, 'Bebida con hielo picado y jugo de mango',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Fruppe Mango (15 oz)', 14.00, 'Bebida con hielo picado y jugo de mango',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Fruppe Maracuya (12 oz)', 12.00, 'Bebida con hielo picado y jugo de maracuya',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Bebida Fria', 'Fruppe Maracuya (15 oz)', 14.00, 'Bebida con hielo picado y jugo de maracuya',null, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Leche', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Soya', 2.00, null,8,null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Fudge', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Chantilly', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Espresso', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Leche Condensada', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Chips de Chocolate', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Manjarblanco', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Mezcla Campesina', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Mezcla Espresso', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Mezcla Licor de Cacao', 2.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Caramelo', 3.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Vainilla', 3.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Chocolate', 3.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Coco', 3.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Crema Irlandesa', 3.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Canela', 3.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Whisky', 4.00, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Licor de Whisky', 7.50, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Topping', 'Adicional de Licor de Amarello', 7.50, null,8, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Dulce', 'Muffin Chocochips', 7.00, null,14, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Dulce', 'Muffin de Naranja', 7.00, null,17, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Dulce', 'Torta de Zanahoria', 6.50, null,11, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Salada', 'Empanada de Carne', 8.00, null,11, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Salada', 'Sandwich de Lomito Ahumado', 12.00, null,14, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Salada', 'Croissant de Mantequilla', 4.50, null,14, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Acompañamiento Salada', 'Croissant de Pollo con Apio', 9.50, null,14, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Organico (500g)', 6.50, null,3, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Volcan (500g)', 6.50, null,4, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Liofilizado Descafeinado (95g)', 33.90, null,5, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Liofilizado Clasico (95g)', 29.90, null,5, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Liofilizado Chocolate (95g)', 33.90, null,5, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Liofilizado Vainicanela (95g)', 33.90, null,4, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Dulce de Cafe (80 unidades)', 25.00, null,5, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Palitos de linaza y Salvado', 5.50, null,17, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cachito de Nuez con Chocolate', 6.00, null,14, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Cafe Achocolatado', 9.00, null,4, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Dulce de Cafe (20 unidades)', 7.50, null,14, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Galleta de Salvado - Oregano', 5.50, null,17, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Galleta de Salvado - Parmesano', 5.50, null,17, null);
INSERT INTO Producto VALUES (producto_id.NEXTVAL, 'Consumible', 'Envasados', 'Galleta de Salvado - Paprika', 5.50, null,17, null);


select * from producto;

CREATE INDEX idx_Producto 
ON Producto (nombre);

CREATE TABLE Sucursal
(
Sucursal_id         NUMBER          PRIMARY KEY,
Pais                VARCHAR2(20)    NOT NULL,
Departamento        VARCHAR2(20)    NOT NULL,
Distrito            VARCHAR2(30)    NOT NULL,
Direccion           VARCHAR2(150)   NOT NULL,
Telefono            CHAR(30)        NULL
);

INSERT INTO Sucursal VALUES (001, 'Peru', 'Lima', 'Santiago de Surco 15023', 'Sodimac - Centro Comercial Jockey Plaza - Av. Javier Prado Este 4200', 7162000);
INSERT INTO Sucursal VALUES (002, 'Peru', 'Lima', 'Miraflores 15074', 'Larcomar', null);
INSERT INTO Sucursal VALUES (003,  'Peru', 'Lima', 'San Miguel', 'PUCP', null);
INSERT INTO Sucursal VALUES (004,  'Peru', 'Lima', 'Independencia 15311', 'Mega Plaza', 4248919);
INSERT INTO Sucursal VALUES (005,  'Peru', 'Lima', 'Jesús María 15076', 'Centro Comercial Real Plaza Salaverry - Auxiliar Eduardo Avaroa 2370', null);
INSERT INTO Sucursal VALUES (006,  'Peru', 'Lima', 'Miraflores 15074', 'Av. Alfredo Benavides 419', null);
INSERT INTO Sucursal VALUES (007,  'Peru', 'Lima', 'Bellavista 07011', 'Av. Oscar R. Benavides 3866', null);
INSERT INTO Sucursal VALUES (008,  'Peru', 'Lima', 'Cercado de Lima 15001', 'Real Plaza - Av. Garcilaso de la Vega 1337', null);
INSERT INTO Sucursal VALUES (009,  'Peru', 'Lima', 'Cercado de Lima 15008', 'Mall Aventura Santa Anita - Minería 130', null);

SELECT * FROM SUCURSAL;

CREATE INDEX idx_Sucursal
ON Sucursal (direccion);

CREATE TABLE Trabajador
(
trabajador_id           NUMBER          PRIMARY KEY,
nombre                  VARCHAR2(25)    NOT NULL, 
apel_mat                VARCHAR2(25)    NOT NULL,
apel_pat                VARCHAR2(25)    NOT NULL,
dni                     NUMBER         NOT NULL,
puesto                  VARCHAR(50)     NOT NULL,
telefono                NUMBER          NOT NULL,
correo                  VARCHAR2(200),
direccion               VARCHAR2(200),
fecha_contratacion      DATE            NOT NULL,
edad                    NUMBER          NOT NULL,
sueldo                  NUMBER          NOT NULL,
sucursal_id        NUMBER     REFERENCES Sucursal
);


INSERT INTO Trabajador VALUES (105021, 'Maria', 'Alquezada', 'Perez', 23658769, 'Administrativo', 956022345, 'maperez@gmail.com', 'Av Raul Ferrero cdr 10-ate', '01-OCT-18', 44,2000, 001);
INSERT INTO Trabajador VALUES (105286, 'Patricia', 'Marquez', 'Benitez', 32456789, 'Administrativo', 958268958, 'pmbenitez@gmail.com', 'Av Canaval Moreyra 340- villa el salvador', '02-OCT-18 ', 40,3000, 002);
INSERT INTO Trabajador VALUES (102514, 'Eduardo', 'Vasquez', 'Sanchez', 15632598, 'Cajero', 925487589, 'evsanchez@gmail.com', 'Av aviacion 2345- callao', '03-OCT-18 ', 24,980, 003);
INSERT INTO Trabajador VALUES (102501, 'Lucia', 'Gutierrez', 'Prado', 19378239, 'Cajero', 969392948, 'lgprado@gmail.com', 'Los canarios 234- la molina', '04-OCT-18 ', 21,980, 004);
INSERT INTO Trabajador VALUES (102947, 'Miguel', 'Torres', 'Suarez', 12236547, 'Administrativo', 929856258, 'mtsuarez@gmail.com', 'Las azucenas 247- chorrillos', '05-OCT-18', 34,2500, 005);
INSERT INTO Trabajador VALUES (105596, 'Isabel', 'Espinoza', 'Bedoya', 88996658, 'Administrativo', 949562586, 'iebedoya@gmail.com', 'San Ignacio 123- san borja', '06-OCT-18 ', 56,2200, 006);
INSERT INTO Trabajador VALUES (110245, 'Raquel', 'Sanchez', 'Yonic', 77889658, 'Cajero', 914255693, 'rsyonic@gmail.com', 'La Fontana 123- la molina', '07-OCT-18 ', 18,980, 007);
INSERT INTO Trabajador VALUES (115748, 'Hector', 'Garcia', 'Dominguez', 873206578, 'Cajero', 929634817, 'hgdominguez@gmail.com', 'Alfa escorpion 135-miraflores', '08-OCT-18', 27,980, 008);
INSERT INTO Trabajador VALUES (119636, 'Maritza', 'Campos', 'Diaz', 78903256, 'Administrativo', 934066456, 'mcdiaz@gmail.com', 'Las rosas 456-san luis', '09-OCT-18 ', 58,2000, 009);
INSERT INTO Trabajador VALUES (115749, 'Vivian', 'Math', 'Valdez', 14203698, 'Cajero', 909654789, 'vmvaldez@gmail.com', 'Las felicias 123- ñaña', '10-OCT-18 ', 29,980, 009);
INSERT INTO Trabajador VALUES (154878,'Juan','Perez','Valdivia',72533782,'Tecnico de Cafe',957185245,'jpvaldivia@gmail.com','Av. independencia- chosica','11-OCT-18',22,1800,001);
INSERT INTO Trabajador VALUES (178592, 'Ulises', 'Rodriguez', 'Mora', 72706924, 'Cajero', 9989634169, 'ulises29@gmail.com', 'jr.union 3123- chosica', '13-OCT-18 ', 21,980, 001);
INSERT INTO Trabajador VALUES (171585, 'Nelson', 'Diaz', 'Gonzalez', 72704157, 'Cajero', 925141254, 'nelson14@gmail.com', 'Av.huascata 2541-chaclacayo', '13-OCT-18 ', 25,980, 002);
INSERT INTO Trabajador VALUES (175285,'Jose','Dias','Pajuelo',72535481,'Tecnico de Cafe',952147892,'jose54@gmail.com','Av.trujillo 15- san luis','12-OCT-18',25,1850,002);
INSERT INTO Trabajador VALUES (157825,'Carlos','Lopez','Anco',72515968,'Administrativo',926151326,'carlosloan@gmail.com','Av.cuzco 21-san borja','10-OCT-18',20,2500,003);
INSERT INTO Trabajador VALUES (189658,'Samy','Paredes','Cahuana',74859632,'Tecnico de Cafe',959262414,'samypa298@gmail.com','Av.los portales 59-san juan de lurigancho','11-OCT-18',22,1800,003);
INSERT INTO Trabajador VALUES (178596,'Cristian','Simcic','Carrero',79636114,'Tecnico de Cafe',9909693214,'cris15@gmail.com','Av.atahualpa15-san juan de lurigancho','13-OCT-18',25,1650,004);
INSERT INTO Trabajador VALUES (196352,'Luigui','Pariona','Perez',70251492,'Administrativo',919264841,'lui14@gmail.com','jr. ayacucho 59-cercado','12-OCT-18',20,2000,004);
INSERT INTO Trabajador VALUES (178965,'Sara','Fuentes','Aroni',70326252,'Tecnico de Cafe',919265259,'sara14@gmail.com','Av.los tutipanes-la molina','13-OCT-18',23,1750,005);
INSERT INTO Trabajador VALUES (189635,'Bruno','Peña','Vela',7261518,'Cajero',939021519,'brunito@gmail.com','Av.los girasoles-chosica','18/OCT/18',24,980,005);
INSERT INTO Trabajador VALUES (178599,'Richard','Fuentes','Izidio',17155268,'Tecnico de Cafe',916254815,'richard18@gmail.com','Av.brasil 59-san juan de miraflores','21-OCT-18',20,1700,006);
INSERT INTO Trabajador VALUES (175824,'Alonso','Nuñez','Serpa',70202548,'Cajero',919254785,'alonso@gmail.com','jr. los ruiselores-san borja','13-OCT-18',28,980,006);
INSERT INTO Trabajador VALUES (201875,'Mario','Vilayzan','Vela',16251521,'Tecnico de Cafe',954158962,'mario12@gmail.com','Av.bolivia 15-cercado','15-OCT-18',20,1750,007);
INSERT INTO Trabajador VALUES (206578,'Francisco','Peña','Vasquez',16251025,'Administrativo',959262148,'pancho32@gmail.com','Av.ayacucho25- san luis','12-OCT-18',27,2500,007);
INSERT INTO Trabajador VALUES (225896,'Max','Prado','Pariona',75952569,'Tecnico de Cafe',909235548,'maxpra48@gmail.com','Av.san francisco 152-independencia','15-OCT-18',26,1700,008);
INSERT INTO Trabajador VALUES (214789,'Rogrido','Paredes','Ayala',14758258,'Administrativo',902154789,'rodbe@gmail.com','Av.san bartolome-san luis','11-OCT-18',22,2500,008);
INSERT INTO Trabajador VALUES (285964,'Samuel','Pajuelo','Castro',74859152,'Tecnico de Cafe',959261100,'samu27@gmail.com','Av.los canarios 15- villa el salvador','15-OCT-18',28,1700,009);

CREATE INDEX idx_Trabajador
ON Trabajador (dni);


CREATE TABLE Recibo
(
    recibo_id       NUMBER  PRIMARY KEY,
    fecha_venta     DATE    NOT NULL,
    cliente_id      NUMBER  REFERENCES Cliente,
    sucursal_id     NUMBER  REFERENCES Sucursal
);

INSERT INTO Recibo VALUES (001, '20-OCT-18',1,001);
INSERT INTO Recibo VALUES (002, '20-OCT-18',2,001);
INSERT INTO Recibo VALUES (003, '20-OCT-18',3,001);
INSERT INTO Recibo VALUES (004, '20-OCT-18',4,002);
INSERT INTO Recibo VALUES (005, '20-OCT-18',5,002);
INSERT INTO Recibo VALUES (006, '20-OCT-18',6,002);
INSERT INTO Recibo VALUES (007, '20-OCT-18',7,003);
INSERT INTO Recibo VALUES (008, '20-OCT-18',8,003);
INSERT INTO Recibo VALUES (009, '20-OCT-18',9,004);
INSERT INTO Recibo VALUES (010, '20-OCT-18',10,004);
INSERT INTO Recibo VALUES (011, '20-OCT-18',11,004);
INSERT INTO Recibo VALUES (012, '20-OCT-18',12,005);
INSERT INTO Recibo VALUES (013, '20-OCT-18',13,005);
INSERT INTO Recibo VALUES (014, '20-OCT-18',14,005);
INSERT INTO Recibo VALUES (015, '20-OCT-18',15,006);
INSERT INTO Recibo VALUES (016, '20-OCT-18',16,006);
INSERT INTO Recibo VALUES (017, '20-OCT-18',17,006);
INSERT INTO Recibo VALUES (018, '20-OCT-18',18,007);
INSERT INTO Recibo VALUES (019, '20-OCT-18',19,007);
 

CREATE SEQUENCE recibo_id
START WITH 20
INCREMENT BY 2
NOMAXVALUE
NOCYCLE
CACHE 10;



INSERT INTO Recibo VALUES (recibo_id.NEXTVAL, '20-OCT-18',20,007);
INSERT INTO Recibo VALUES (recibo_id.NEXTVAL, '20-OCT-18',21,008);
INSERT INTO Recibo VALUES (recibo_id.NEXTVAL, '20-OCT-18',22,008);
INSERT INTO Recibo VALUES (recibo_id.NEXTVAL, '20-OCT-18',30,009);
INSERT INTO Recibo VALUES (recibo_id.NEXTVAL, '20-OCT-18',40,009);
INSERT INTO Recibo VALUES (recibo_id.NEXTVAL, '20-OCT-18',50,009);


CREATE INDEX idx_Recibo
ON Recibo (fecha_venta);

Select * from Recibo;


CREATE TABLE Detalle_Recibo
(
    recibo_id       NUMBER  NOT NULL    REFERENCES  Recibo,
    producto_id     NUMBER  NOT NULL    REFERENCES  Producto,
    precio_prod     NUMBER  NOT NULL,
    cantidad        NUMBER  NOT NULL, 
    primary key(recibo_id,producto_id)
);

INSERT INTO Detalle_Recibo VALUES (001, 5, 18.00, 2);
INSERT INTO Detalle_Recibo VALUES (001, 189, 11.50, 1);
INSERT INTO Detalle_Recibo VALUES (001, 193, 30.00, 3);
INSERT INTO Detalle_Recibo VALUES (001, 191, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (001, 18, 22.00, 2);
INSERT INTO Detalle_Recibo VALUES (002, 26, 9.50, 1);
INSERT INTO Detalle_Recibo VALUES (002, 301, 7.50, 1);
INSERT INTO Detalle_Recibo VALUES (002, 343, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (002, 195, 11.50, 1);
INSERT INTO Detalle_Recibo VALUES (002, 22, 12.00, 3);
INSERT INTO Detalle_Recibo VALUES (003, 8, 12.50, 1);
INSERT INTO Detalle_Recibo VALUES (003, 205, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (003, 223, 24.00, 4);
INSERT INTO Detalle_Recibo VALUES (003, 299, 7.50, 1);
INSERT INTO Detalle_Recibo VALUES (003, 3, 10.50, 1);
INSERT INTO Detalle_Recibo VALUES (003, 1, 240, 1);
INSERT INTO Detalle_Recibo VALUES (004, 333, 18.00, 3);
INSERT INTO Detalle_Recibo VALUES (004, 15, 12.50, 1);
INSERT INTO Detalle_Recibo VALUES (004, 189, 11.50, 1);
INSERT INTO Detalle_Recibo VALUES (004, 20, 24.00, 3);
INSERT INTO Detalle_Recibo VALUES (004, 291, 3.00, 1);
INSERT INTO Detalle_Recibo VALUES (005, 199, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (005, 25, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (005, 341, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (005, 287, 3.00, 1);
INSERT INTO Detalle_Recibo VALUES (005, 7, 11.50, 1);
INSERT INTO Detalle_Recibo VALUES (006, 14, 10.50, 1);
INSERT INTO Detalle_Recibo VALUES (006, 323, 59.80, 2);
INSERT INTO Detalle_Recibo VALUES (006, 22, 4.00, 1);
INSERT INTO Detalle_Recibo VALUES (006, 199, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (006, 193, 10.00, 4);
INSERT INTO Detalle_Recibo VALUES (007, 6, 21.00, 2);
INSERT INTO Detalle_Recibo VALUES (007, 20, 32.00, 4);
INSERT INTO Detalle_Recibo VALUES (007, 329, 30.00, 2);
INSERT INTO Detalle_Recibo VALUES (007, 319, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (007, 18, 11.00, 1);
INSERT INTO Detalle_Recibo VALUES (008, 16, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (008, 197, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (008, 217, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (008, 2, 27.00, 3);
INSERT INTO Detalle_Recibo VALUES (008, 221, 14.00, 2);
INSERT INTO Detalle_Recibo VALUES (009, 287, 3.00, 1);
INSERT INTO Detalle_Recibo VALUES (009, 279, 2.00, 1);
INSERT INTO Detalle_Recibo VALUES (009, 25, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (009, 4, 16.00, 2);
INSERT INTO Detalle_Recibo VALUES (009, 337, 7.50, 1);
INSERT INTO Detalle_Recibo VALUES (010, 9, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (010, 10, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (010, 211, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (010, 311, 36.00, 3);
INSERT INTO Detalle_Recibo VALUES (010, 215, 5.00, 1);
INSERT INTO Detalle_Recibo VALUES (011, 22, 4.00, 1);
INSERT INTO Detalle_Recibo VALUES (011, 315, 9.50, 1);
INSERT INTO Detalle_Recibo VALUES (011,6 , 10.50, 1);
INSERT INTO Detalle_Recibo VALUES (011,4, 8.00, 1);
INSERT INTO Detalle_Recibo VALUES (011,2 , 9.00, 1);
INSERT INTO Detalle_Recibo VALUES (012, 221, 21.00, 3);
INSERT INTO Detalle_Recibo VALUES (012, 339, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (012, 189, 11.50, 1);
INSERT INTO Detalle_Recibo VALUES (012, 16, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (012, 201, 10.00, 1);
INSERT INTO Detalle_Recibo VALUES (013, 19, 26.00, 2);
INSERT INTO Detalle_Recibo VALUES (013, 205, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (013, 209, 12.50, 1);
INSERT INTO Detalle_Recibo VALUES (013, 14, 10.50, 1);
INSERT INTO Detalle_Recibo VALUES (013, 16, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (014, 299, 7.50, 1);
INSERT INTO Detalle_Recibo VALUES (014, 333, 24.00, 4);
INSERT INTO Detalle_Recibo VALUES (014, 343, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (014, 17, 9.00, 1);
INSERT INTO Detalle_Recibo VALUES (014, 209, 12.50, 1);
INSERT INTO Detalle_Recibo VALUES (015, 18, 33.00, 3);
INSERT INTO Detalle_Recibo VALUES (015, 251, 15.00, 1);
INSERT INTO Detalle_Recibo VALUES (015, 263, 2.00, 1);
INSERT INTO Detalle_Recibo VALUES (015,19 , 26.00, 2);
INSERT INTO Detalle_Recibo VALUES (015, 229, 7.00, 1);
INSERT INTO Detalle_Recibo VALUES (016, 20, 24.00, 3);
INSERT INTO Detalle_Recibo VALUES (016, 26, 9.50, 1);
INSERT INTO Detalle_Recibo VALUES (016, 315, 9.50, 1);
INSERT INTO Detalle_Recibo VALUES (016, 317, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (016, 313, 4.50, 1);
INSERT INTO Detalle_Recibo VALUES (017, 219, 7.00, 1);
INSERT INTO Detalle_Recibo VALUES (017, 229, 21.00, 3);
INSERT INTO Detalle_Recibo VALUES (017, 16, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (017, 237, 13.00, 1);
INSERT INTO Detalle_Recibo VALUES (017, 337, 7.50, 1);
INSERT INTO Detalle_Recibo VALUES (018, 20, 8.00, 1);
INSERT INTO Detalle_Recibo VALUES (018, 229, 14.00, 2);
INSERT INTO Detalle_Recibo VALUES (018, 221, 7.00, 1);
INSERT INTO Detalle_Recibo VALUES (018, 301, 7.50, 1);
INSERT INTO Detalle_Recibo VALUES (018, 22, 4.00, 1);
INSERT INTO Detalle_Recibo VALUES (019, 223, 6.00, 1);
INSERT INTO Detalle_Recibo VALUES (019, 24, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (019, 323, 29.90, 1);
INSERT INTO Detalle_Recibo VALUES (019, 10, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (019, 321, 33.90, 1);
INSERT INTO Detalle_Recibo VALUES (020, 11, 11.00, 1);
INSERT INTO Detalle_Recibo VALUES (020, 249, 13.00, 1);
INSERT INTO Detalle_Recibo VALUES (020, 259, 24.00, 2);
INSERT INTO Detalle_Recibo VALUES (020, 18, 11.00, 1);
INSERT INTO Detalle_Recibo VALUES (020, 269, 2.00, 1);
INSERT INTO Detalle_Recibo VALUES (022, 23, 7.00, 1);
INSERT INTO Detalle_Recibo VALUES (022, 11, 44.00, 4);
INSERT INTO Detalle_Recibo VALUES (022, 339, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (022, 17, 9.00, 1);
INSERT INTO Detalle_Recibo VALUES (022, 24, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (024, 341, 5.50, 1);
INSERT INTO Detalle_Recibo VALUES (024, 197, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (024, 227, 9.50, 1);
INSERT INTO Detalle_Recibo VALUES (024, 2, 27.00, 3);
INSERT INTO Detalle_Recibo VALUES (024, 1, 400.00, 1);
INSERT INTO Detalle_Recibo VALUES (026, 9, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (026, 309, 8.00, 1);
INSERT INTO Detalle_Recibo VALUES (026, 311, 36.00, 3);
INSERT INTO Detalle_Recibo VALUES (026, 321, 33.90, 1);
INSERT INTO Detalle_Recibo VALUES (026, 13, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (028, 23, 7.00, 1);
INSERT INTO Detalle_Recibo VALUES (028, 267, 2.00, 1);
INSERT INTO Detalle_Recibo VALUES (028, 249, 26.00, 2);
INSERT INTO Detalle_Recibo VALUES (028, 243, 26.00, 2);
INSERT INTO Detalle_Recibo VALUES (028, 25, 6.50, 1);
INSERT INTO Detalle_Recibo VALUES (030, 20, 16.00, 2);
INSERT INTO Detalle_Recibo VALUES (030, 279, 2.00, 1);
INSERT INTO Detalle_Recibo VALUES (030, 13, 13.50, 1);
INSERT INTO Detalle_Recibo VALUES (030, 289, 3.00, 1);
INSERT INTO Detalle_Recibo VALUES (030, 319, 13.00, 2);

select * from  Detalle_Recibo;


-- ADMINISTRACIÓN

-- *Bloques Anónimos
Declare
 v_trabajadorid trabajador.trabajador_id%type;
 v_nombretrab   trabajador.nombre%type;
 v_apelmat      trabajador.apel_mat%type;     
 v_apelpat      trabajador.apel_pat%type;     
 v_dni          trabajador.dni%type;    

begin
 v_trabajadorid:=115748;
 select t.nombre, t.apel_mat,t.apel_pat,t.dni
 into v_nombretrab, v_apelmat,v_apelpat,v_dni
 from trabajador t
 where v_trabajadorid=trabajador_id;
 dbms_output.put_line ('El trabajador '||v_nombretrab||' '||v_apelmat ||' '|| v_apelpat||' con codigo '||v_trabajadorid||' y dni '||v_dni);
 end;
----------
Declare
 v_trabajadorid trabajador.trabajador_id%type;
 v_nombretrab   trabajador.nombre%type;     
 v_apelpat      trabajador.apel_pat%type;     
 v_puesto       trabajador.puesto%type;
 v_sueldo       trabajador.sueldo%type;
begin
 v_trabajadorid:=175285;
 select t.nombre,t.apel_pat,t.puesto,t.sueldo
 into v_nombretrab,v_apelpat,v_puesto,v_sueldo
 from trabajador t
 where v_trabajadorid=trabajador_id;
 dbms_output.put_line ('El trabajador '||v_nombretrab||' '|| v_apelpat||' con codigo '||v_trabajadorid||' ocupa el cargo de '||v_puesto||' y gana un sueldo de '||v_sueldo|| ' soles.');
 end;

--*Funciones
-----
-- Función  denominada Puesto_trabajador que recibe como parametro un codigo de trabajador y devuelva su puesto.

Create or replace function Puesto_trabajador (ftrabajador_id IN number) return varchar2 AS 
V_puesto_trab trabajador.puesto%type;
Begin
     	select puesto
      into V_puesto_trab
      from trabajador
      where ftrabajador_id = trabajador_id;
      return V_puesto_trab;
      End Puesto_trabajador;    

select Puesto_trabajador (105286)  as Puesto_del_Trabajador FROM DUAL; 
------
-- 2) Función  denominada Existe_dni que recibe como parametro el dni del trabajador y devuelva un 0 si es falso y un 1 si es verdadero.

create or replace function Existe_dni(v_dni in number)
return number as
encontro number :=0;
numero number; 
begin
select count(TRABAJADOR_ID)
into numero
from TRABAJADOR
where dni = v_dni;
if(numero = 1) then
encontro := 1;
end if;
return encontro;
end Existe_dni;

SELECT Existe_dni(12236547) as existe_dni_del_trabajador FROM DUAL;
-----
-- *Procedimientos






-- inserta sueldo trabajador
CREATE OR REPLACE
PROCEDURE P_SUELDO_TRAB (ptra_id in number,psueldo in number) as
v_nombre  trabajador.nombre%type;

begin 
select  nombre into v_nombre
from trabajador
where trabajador_id=ptra_id
and sueldo=psueldo;
end P_SUELDO_TRAB;
  
EXECUTE P_SUELDO_TRAB(178592,980);  

-- insertar dni trabajador
CREATE OR REPLACE
PROCEDURE P_DNI_TRAB (pnombre in varchar2,pdni in number) as
v_trabajador_id  trabajador.trabajador_id%type;

begin 
select  trabajador_id into v_trabajador_id
from trabajador
where pdni= dni
and pnombre like nombre;
END P_DNI_TRAB;

EXECUTE P_SUELDO_TRAB('Maria',23658769);  





-- PAQUETE 1 

create or replace package INFO_TRABAJADOR AS 

PROCEDURE P_DNI_TRAB (pnombre in varchar2,pdni in number);
PROCEDURE P_SUELDO_TRAB (ptra_id in number,psueldo in number);

end INFO_TRABAJADOR;

create or replace package body INFO_TRABAJADOR AS

PROCEDURE P_DNI_TRAB (pnombre in varchar2,pdni in number) as
v_trabajador_id  trabajador.trabajador_id%type;

begin 
select  trabajador_id into v_trabajador_id
from trabajador
where pdni= dni
and pnombre like nombre;
END P_DNI_TRAB;

-- 

PROCEDURE P_SUELDO_TRAB (ptra_id in number,psueldo in number) as
v_nombre  trabajador.nombre%type;

begin 
select  nombre into v_nombre
from trabajador
where trabajador_id=ptra_id
and sueldo=psueldo;
end P_SUELDO_TRAB;


END INFO_TRABAJADOR;




























-- CAJERO
-- *Bloques Anónimos
Declare 

vproductoid           producto.producto_id%type;
vcategoriaproducto    producto.categoria_producto%type;
vtipoproducto         producto.tipo_producto%type;
vnombre               producto.nombre%type;
vprecio               producto.precio%type;

BEGIN 
vproductoid:=15;
Select  categoria_producto, tipo_producto , nombre , precio
INTO  vcategoriaproducto, vtipoproducto, vnombre , vprecio
FROM producto
where producto_id=vproductoid;
dbms_output.put_line('El producto'||vproductoid||' ,su categoria es '||vcategoriaproducto||' y su tipo de producto es '||vtipoproducto||' tiene un precio de '||vprecio||' soles.');
END;
-----------------------------
declare
v_promocion varchar2(12);  

begin
v_promocion:='cumpleaños';

if v_promocion='cumpleaños' then 
dbms_output.put_line('El cumpleañero obtiene ese postre gratis');
else
dbms_output.put_line('El cumpleañero no obtiene ese postre gratis');
end if;
end; 
-----------------
declare
v_promocion varchar2(12);  

begin
v_promocion:='2x1';

if v_promocion='2x1' then 
dbms_output.put_line('El cliente obtiene su segunda bebida gratis');
else
dbms_output.put_line('El cliente no obtiene su segunda bebida gratis');
end if;
end; 
---------------------------

declare
v_promocion varchar2(30);  

begin
v_promocion:='Bebida a mitad de precio';

if v_promocion='Bebida a mitad de precio' then 
dbms_output.put_line('El cliente obtiene su bebida con un 50% de descuento');
else
dbms_output.put_line('El cliente no obtiene su bebida con un 50% de descuento');
end if;
end; 
----------
Declare 

vclienteid        cliente.cliente_id%type;
vnombre           cliente.nombre%type;
vapel_mat         cliente.apel_mat%type;
vapel_pat         cliente.apel_pat%type;
vdni              cliente.dni%type;
vtlf              cliente.telefono%type;
vfdn              cliente.fecha_nacimiento%type;
vcorreo           cliente.correo%type;
vfregistro        cliente.fecha_registro%type;
BEGIN 


Select cliente_id,  nombre,  apel_mat , apel_pat  , dni  , telefono , fecha_nacimiento, correo , fecha_registro 
INTO   vclienteid, vnombre,  vapel_mat, vapel_pat , vdni , vtlf     , vfdn            , vcorreo, vfregistro

FROM cliente
where cliente_id=2;


 DBMS_output.put_line('El cliente ' ||vnombre|| ' ' ||vapel_mat|| ' ' ||vapel_pat||' con codigo '||vclienteid|| '  con dni  ' ||vdni||' nacio el ' ||vfdn|| ', su correo es ' || vcorreo || ' y tiene por fecha de registro a ' ||vfregistro);

END;

-- Funciones
-- Función  denominada  Es_vip que recibe como parametro  el codigo del cliente y devuelva un 0 si el cliente es vip y un 1 si no lo es.

Create or replace function Es_vip (fcliente_id IN number) return number AS 
V_es_vip number:= 0;
v_nombre  categoria.nombre%type;
Begin
     	select c.nombre
      into v_nombre
      from categoria c join cliente cl
      on c.categoria_id= cl.categoria_id
      where cl.cliente_id=fcliente_id;
       if(v_nombre LIKE '%VIP%')then
               	V_es_vip := 1;
      end if;
      return V_es_vip;
End Es_vip;
        
select Es_vip(011) as  El_cliente_es_vip FROM DUAL;     
---






-- 2) Función  denominada  Prom_producto que recibe como parámetro  el código del producto y devuelva la promoción del producto.

create or replace function Prom_producto(fproducto_id in number)
return varchar2 AS
V_nombreprom promocion.nombre%type;
BEGIN 
select p.nombre into V_nombreprom
from promocion p join producto pr
on p.promocion_id=pr.promocion_id
where pr.Producto_id = fproducto_id;
return V_nombreprom;
exception
when no_data_found then return 'No tiene promocion';
End Prom_producto;

Select Prom_producto(2) as Promocion_del_producto from dual;

-- 3)Función  denominada Nombre_producto que recibe como parámetro  el código del producto y devuelva la nombre del producto.
create or replace function Nombre_producto(fproducto_id in number)
return varchar2 AS
V_name     producto.nombre%type;
BEGIN 
 select nombre into V_name
 from Producto 
 where Producto_ID = fproducto_id;
 return V_name;
END;

Select Nombre_Producto(15) as Nombre_del_producto from DUAL;

-- *Procedimientos
Create or replace 
Procedure P_DATOS_CLIENTES (pclienteid in number,pnombre in varchar2,papel_pat in varchar2,papel_mat in varchar2,pdni in number,pfechana in date,pcorreo in varchar2)as
v_cliente_id cliente.cliente_id%type;
total number;
begin
total:= 0;
select count(*) into total from cliente where cliente_id=pclienteid;
select cliente_id into v_cliente_id
from cliente
where nombre=pnombre and apel_mat= papel_mat and apel_pat=papel_pat and dni=pdni and fecha_nacimiento=pfechana and correo=pcorreo;
end;
------------------------------------------------------------------
-- Ingresar codigo de producto (muestre precio)

create or replace procedure precio_producto(pproducto_id in number) 
AS 
vpprecio producto.precio%type;

Begin 

select producto.precio INTO vpprecio

from producto

where producto_id = pproducto_id;

END precio_producto;


execute precio_producto(2);
----------------------------------------------------------------------------------
-- Ingresar un nombre de cliente y muestre nombre,apellidos y dni

create or replace procedure BUSCARCLIENTE(parametro in varchar2) 
IS


nombre     cliente.nombre%type;
apel_mat   cliente.apel_mat%type;
apel_pat   cliente.apel_pat%type;
dni            cliente.dni%type;

cursor cliente_cursor is select nombre,apel_mat,apel_pat,dni from cliente where nombre =parametro;

BEGIN 
open cliente_cursor;
loop 

fetch cliente_cursor into nombre,apel_mat,apel_pat,dni;
exit when cliente_cursor%notfound;
dbms_output.put_line( 'Nombre' || nombre || 'Apellido Materno' ||apel_mat|| 'Apellido Paterno' ||apel_pat|| 'Dni' || dni); 

end loop;
End;

execute BUSCARCLIENTE ('Javier');

-- *PAQUETE 2 

-- Creacion de paquete general
create or replace package  Cliente_Prod AS

 function Prom_producto(fproducto_id in number) return varchar2;
 function Es_vip (fcliente_id IN number) return number;
 
END Cliente_Prod;


-- Creacion del cuerpo del paquete 

create or replace package body Cliente_Prod AS

function Prom_producto(fproducto_id in number)
return varchar2 AS
V_nombreprom promocion.nombre%type;
BEGIN 
select p.nombre into V_nombreprom   
from promocion p join producto pr
on p.promocion_id=pr.promocion_id
where pr.Producto_id = fproducto_id;
return V_nombreprom;
exception
when no_data_found then return 'No tiene promocion';
End Prom_producto;

-- 
function Es_vip (fcliente_id IN number) return number AS 
V_es_vip number:= 0;
v_nombre  categoria.nombre%type;
Begin
     	select c.nombre
      into v_nombre
      from categoria c join cliente cl
      on c.categoria_id= cl.categoria_id
      where cl.cliente_id=fcliente_id;
       if(v_nombre LIKE '%VIP%')then
               	V_es_vip := 1;
      end if;
      return V_es_vip;
End Es_vip;


END Cliente_Prod;
-- *TRIGGER

-- Calcula la nueva cantidad de productos dependiendo del nuevo precio 


create or replace trigger tr_1 
  before insert or delete or update on detalle_recibo
  for each row 
  
  BEGIN 
  
  IF INSERTING THEN 
  :new.precio_prod:=:new.cantidad;
  END IF; 
  
  IF UPDATING THEN 
  :new.precio_prod:=:new.cantidad;
  END IF; 
  
  END; 
  
  Select *from detalle_recibo;
  
  update detalle_recibo set precio_prod= 3 where recibo_id=1 AND producto_id=5;








-- CONSULTAS

-- El Administrador requiere los ingresos del mes de octubre de todas las sucursales en Lima, ordenandolas desde las sucursales con menores ingresos hasta las que registraron mayores ingresos. Dicha información le servirá para implementar segú requiera cada sucursal.
SELECT s.Surcusal_id, s.Distrito, Ingreso
FROM Sucursal s
WHERE Ingreso =(SELECT SUM(dr.precio_prod)
                FROM Detalle_Recibo dr JOIN Recibo r
                ON dr.recibo_id = r.recibo_id
                WHERE to_number(to_char(r.fecha_venta, 'Month'))='OCT'
                ORDER BY SUM(dr.precio_prod) desc);
                
--El Cajero requiere la lista de Topping para ofrecer al cliente.
SELECT producto_id, nombre, precio
FROM Producto p
WHERE p.tipo_producto='Topping'
ORDER BY precio desc



