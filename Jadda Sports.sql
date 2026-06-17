drop database if exists jadda_sports_db;
CREATE DATABASE jadda_sports_db;
USE jadda_sports_db;

-- ==============================
-- ROLES
-- ==============================
CREATE TABLE ROLES (
    ID_ROL INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_ROL VARCHAR(50),
    DESCRIPCION VARCHAR(100)
);

INSERT INTO ROLES (NOMBRE_ROL, DESCRIPCION) VALUES
('Administrador', 'Control total del sistema'),
('Cliente', 'Usuario que compra productos'),
('Empleado', 'Trabajador de la tienda'),
('Proveedor', 'Suministra productos'),
('Bodeguero', 'Encargado del inventario'),
('Contador', 'Gestión financiera'),
('Soporte', 'Atención técnica'),
('Gerente', 'Supervisa operaciones'),
('Vendedor', 'Realiza ventas'),
('Logística', 'Gestiona envíos'),
('Marketing', 'Publicidad y promociones'),
('Invitado', 'Acceso limitado');

-- ==============================
-- USUARIOS
-- ==============================
CREATE TABLE USUARIOS (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_USUARIO VARCHAR(100) NOT NULL,
    APELLIDO_USUARIO VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL,
    USUARIO VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(255),
    direccion VARCHAR(255),
    CONTRASENA VARCHAR(255) NOT NULL,
    FECHA_REGISTRO DATE,
    ID_ROL INT,
    CONFIRMADO TINYINT DEFAULT 0,          
    TOKEN VARCHAR(6) DEFAULT NULL,        
    TOKEN_EXPIRA DATETIME DEFAULT NULL, 
    foto_url VARCHAR(255) DEFAULT NULL,
    AUTH_PROVIDER VARCHAR(50) DEFAULT 'local', -- Para saber si es local, google o facebook
    PROVIDER_ID VARCHAR(255) DEFAULT NULL,     -- ID único que te da Google/Facebook
    FOREIGN KEY (ID_ROL) REFERENCES ROLES(ID_ROL)
);

INSERT INTO USUARIOS 
(ID_USUARIO, NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL, USUARIO, CONTRASENA, FECHA_REGISTRO, ID_ROL, CONFIRMADO)
VALUES
(1, 'Juan', 'Torres', 'juan.torres@mail.com', 'juan.torres', 'clave123', '2024-01-12', 2, 1),
(2, 'Daniela', 'Ríos', 'daniela.rios@mail.com', 'daniela.rios', 'clave123', '2023-08-05', 2, 1),
(3, 'Felipe', 'Cano', 'felipe.cano@mail.com', 'felipe.cano', 'clave123', '2024-05-19', 2, 1),
(4, 'Valeria', 'Mendoza', 'valeria.mendoza@mail.com', 'valeria.mendoza', 'clave123', '2025-02-02', 2, 1),
(5, 'Santiago', 'Pardo', 'santiago.pardo@mail.com', 'santiago.pardo', 'clave123', '2023-11-22', 2, 1),
(6, 'Manuela', 'Gil', 'manuela.gil@mail.com', 'manuela.gil', 'clave123', '2024-06-01', 2, 1),
(7, 'Cristian', 'Navarro', 'cristian.navarro@mail.com', 'cristian.navarro', 'clave123', '2025-01-15', 2, 1),
(8, 'Laura', 'Bautista', 'laura.bautista@mail.com', 'laura.bautista', 'clave123', '2024-09-09', 2, 1),
(9, 'Kevin', 'Acosta', 'kevin.acosta@mail.com', 'kevin.acosta', 'clave123', '2023-12-12', 2, 1),
(10, 'Sara', 'Quintero', 'sara.quintero@mail.com', 'sara.quintero', 'clave123', '2024-07-07', 2, 1),
(11, 'Miguel', 'Lara', 'miguel.lara@mail.com', 'miguel.lara', 'clave123', '2024-03-18', 2, 1),
(12, 'Paola', 'Vega', 'paola.vega@mail.com', 'paola.vega', 'clave123', '2023-10-10', 2, 1),
(13, 'Andrés', 'Ruiz', 'andres.ruiz@mail.com', 'andres.ruiz', 'clave123', '2024-04-04', 2, 1),
(14, 'Tatiana', 'Ocampo', 'tatiana.ocampo@mail.com', 'tatiana.ocampo', 'clave123', '2024-02-20', 2, 1),
(15, 'Julian', 'Soto', 'julian.soto@mail.com', 'julian.soto', 'clave123', '2025-03-01', 2, 1);

-- ==============================
-- CLIENTES
-- ==============================
CREATE TABLE CLIENTES (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_CLIENTE VARCHAR(200) NOT NULL,
    APELLIDO_CLIENTE VARCHAR(200) NOT NULL,
    TIPODO_CLIENTE VARCHAR(2) NOT NULL,
    DOCUMENTO_CLIENTE VARCHAR(20) UNIQUE NOT NULL,
    DIRECCION_CLIENTE VARCHAR(100),
    TELEFONO_CLIENTE VARCHAR(15),
    ID_USUARIO INT NOT NULL,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO)
);

INSERT INTO CLIENTES
(NOMBRE_CLIENTE, APELLIDO_CLIENTE, TIPODO_CLIENTE, DOCUMENTO_CLIENTE, DIRECCION_CLIENTE, TELEFONO_CLIENTE, ID_USUARIO)
VALUES
('Juan', 'Torres', 'CC', '1200000001', 'Calle 10 #22-30', '3001112233', 1),
('Daniela', 'Ríos', 'CC', '1200000002', 'Cra 45 #12-10', '3002223344', 2),
('Felipe', 'Cano', 'TI', '1200000003', 'Av 30 #15-20', '3003334455', 3),
('Valeria', 'Mendoza', 'CC', '1200000004', 'Calle 70 #8-90', '3004445566', 4),
('Santiago', 'Pardo', 'CE', '1200000005', 'Cra 9 #3-21', '3005556677', 5),
('Manuela', 'Gil', 'CC', '1200000006', 'Calle 19 #45-87', '3006667788', 6),
('Cristian', 'Navarro', 'TI', '1200000007', 'Cra 15 #16-17', '3007778899', 7),
('Laura', 'Bautista', 'CC', '1200000008', 'Av 68 #50-60', '3008889900', 8),
('Kevin', 'Acosta', 'CC', '1200000009', 'Calle 5 #90-12', '3011112233', 9),
('Sara', 'Quintero', 'CE', '1200000010', 'Cra 11 #44-55', '3012223344', 10),
('Miguel', 'Lara', 'CC', '1200000011', 'Calle 8 #32-14', '3013334455', 11),
('Paola', 'Vega', 'CC', '1200000012', 'Cra 7 #88-10', '3014445566', 12),
('Andrés', 'Ruiz', 'TI', '1200000013', 'Calle 14 #12-90', '3015556677', 13),
('Tatiana', 'Ocampo', 'CC', '1200000014', 'Cra 20 #45-19', '3016667788', 14),
('Julian', 'Soto', 'CC', '1200000015', 'Calle 90 #12-30', '3017778899', 15);

-- ==============================
-- PROVEEDORES
-- ==============================
CREATE TABLE PROVEEDORES (
    ID_PROVEEDOR INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_PROVEEDOR VARCHAR(200),
    TELEFONO_PROVEEDOR VARCHAR(15),
    EMAIL_PROVEEDOR VARCHAR(100),
    DIRECCION_PROVEEDOR VARCHAR(255),
    CONTACTO_PROVEEDOR VARCHAR(100),
    NIT VARCHAR(15)
);

INSERT INTO PROVEEDORES
(NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, EMAIL_PROVEEDOR, DIRECCION_PROVEEDOR, CONTACTO_PROVEEDOR, NIT)
VALUES
('Nike Colombia SAS', '3101112233', 'ventas@nike.com', 'Bogotá D.C.', 'Carlos Pérez', '900123001'),
('Adidas Colombia Ltda', '3102223344', 'contacto@adidas.com', 'Medellín', 'Laura Méndez', '900123002'),
('Puma Sports SAS', '3103334455', 'info@puma.com', 'Cali', 'Andrés Gil', '900123003'),
('Reebok Latam SAS', '3104445566', 'ventas@reebok.com', 'Barranquilla', 'Sofía Ramírez', '900123004'),
('BodyFit Equipos SAS', '3105556677', 'contacto@bodyfit.com', 'Bogotá D.C.', 'Miguel Castro', '900123005'),
('Spalding Colombia', '3106667788', 'ventas@spalding.com', 'Cartagena', 'Daniel Ortiz', '900123006'),
('Everlast Colombia', '3107778899', 'info@everlast.com', 'Bucaramanga', 'María Torres', '900123007'),
('ProFit Machines SAS', '3111112233', 'contacto@profit.com', 'Bogotá D.C.', 'Fernando Ríos', '900123008'),
('Under Armour SAS', '3112223344', 'ventas@underarmour.com', 'Cali', 'Camila Soto', '900123009'),
('New Balance Colombia', '3113334455', 'info@newbalance.com', 'Medellín', 'Ricardo León', '900123010'),
('Wilson Sports SAS', '3114445566', 'ventas@wilson.com', 'Bogotá D.C.', 'Natalia Peña', '900123011'),
('Asics Colombia SAS', '3115556677', 'contacto@asics.com', 'Pereira', 'Javier Mora', '900123012'),
('Kappa Sports SAS', '3116667788', 'info@kappa.com', 'Bogotá D.C.', 'Valentina Ruiz', '900123013'),
('Umbro Colombia', '3117778899', 'ventas@umbro.com', 'Cali', 'Sebastián Díaz', '900123014'),
('Decathlon Proveedores SAS', '3121112233', 'contacto@decathlon.com', 'Bogotá D.C.', 'Paola Vega', '900123015');

-- ==============================
-- CATEGORIAS
-- ==============================
CREATE TABLE CATEGORIAS (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_CATEGORIA VARCHAR(100) NOT NULL,
    DESCRIPCION VARCHAR(100)
);

INSERT INTO CATEGORIAS (NOMBRE_CATEGORIA, DESCRIPCION) VALUES
('Fútbol', 'Productos relacionados con fútbol'),
('Baloncesto', 'Artículos de baloncesto'),
('Running', 'Productos para correr'),
('Gimnasio', 'Equipos y accesorios fitness'),
('Natación', 'Artículos para nadar'),
('Ciclismo', 'Accesorios y ropa ciclismo'),
('Deportes extremos', 'Equipos especializados'),
('Ropa deportiva', 'Prendas deportivas'),
('Accesorios', 'Complementos deportivos'),
('Protección', 'Elementos de seguridad'),
('Cardio', 'Equipos cardiovasculares'),
('Hogar fitness', 'Equipos domésticos'),
('Suplementos', 'Nutrición deportiva'),
('Tecnología deportiva', 'Relojes y gadgets'),
('Ofertas', 'Productos con descuento');

-- ==============================
-- DESCUENTOS
-- ==============================
CREATE TABLE DESCUENTOS (
    ID_DESCUENTO INT PRIMARY KEY AUTO_INCREMENT,
    DESCRIPCION VARCHAR(255),
    PORCENTAJE DECIMAL(5,2),
    FECHA_INICIO DATE,
    FECHA_FIN DATE
);

INSERT INTO DESCUENTOS (DESCRIPCION, PORCENTAJE, FECHA_INICIO, FECHA_FIN) VALUES
('Descuento temporada fútbol', 10, '2025-06-01', '2025-07-01');

-- ==============================
-- PRODUCTOS
-- ==============================
CREATE TABLE PRODUCTOS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(255),
    MARCA VARCHAR(100),
    PRECIO DECIMAL(10,2),
    DESCRIPCION TEXT,
    ID_PROVEEDOR INT,
    ID_CATEGORIA INT,
    ID_DESCUENTO INT
);

INSERT INTO PRODUCTOS (NOMBRE, MARCA, PRECIO, DESCRIPCION, ID_PROVEEDOR, ID_CATEGORIA, ID_DESCUENTO)
VALUES
('Guayos profesionales', 'Adidas', 220000, 'Guayos para césped natural', 1, 1, NULL),
('Balón Al Rihla Pro', 'Adidas', 320000, 'Balón oficial', 2, 1, NULL),
('Espinilleras', 'Nike', 70000, 'Protección fútbol', 1, 1, NULL),
('Guantes de Portero Future', 'Puma', 240000, 'Látex de alto agarre', 1, 1, NULL),
('Camiseta Selección', 'Adidas', 150000, 'Edición especial', 1, 1, NULL),
('Balón baloncesto', 'Spalding', 110000, 'Balón oficial NBA', 2, 2, NULL),
('Tenis Lebron Witness', 'Nike', 480000, 'Amortiguación reactiva', 1, 2, NULL),
('Malla porta balones', 'Spalding', 30000, 'Capacidad 10 balones', 2, 2, NULL),
('Sudadera deportiva', 'Nike', 120000, 'Sudadera térmica', 1, 3, NULL),
('Zapatillas Ultraboost Light', 'Adidas', 650000, 'Retorno de energía ligero', 2, 3, NULL),
('Tenis Speedcross 6', 'Salomon', 590000, 'Ideal para trail running', 2, 3, NULL),
('Joggers Sport Tech', 'Nike', 185000, 'Corte ajustado', 1, 3, NULL),
('Cuerda para saltar', 'Everlast', 35000, 'Cuerda ajustable', 1, 4, NULL),
('Pesas 5kg', 'BodyFit', 50000, 'Recubiertas', 2, 4, NULL),
('Mancuernas 20kg', 'BodyFit', 150000, 'Set completo', 2, 4, NULL),
('Colchoneta Yoga Pro', 'Everlast', 75000, 'Antideslizante 6mm', 1, 4, NULL),
('Gafas de Natación Pro', 'Speedo', 95000, 'Antiempañante y UV', 2, 5, NULL),
('Gorro de Natación Silicona', 'Speedo', 25000, 'Ajuste hidrodinámico', 1, 5, NULL),
('Casco Ciclismo Ruta', 'Bell', 250000, 'Certificación seguridad', 2, 6, NULL),
('Guantes Ciclismo Gel', 'Giant', 85000, 'Acolchado anti-vibración', 1, 6, NULL),
('Casco Escalada', 'Black Diamond', 320000, 'Ultra ligero', 1, 7, NULL),
('Cuerda Escalada 50m', 'Petzl', 850000, 'Resistencia alta', 2, 7, NULL),
('Chaqueta Rompevientos', 'Adidas', 210000, 'Protección contra viento', 2, 8, NULL),
('Leggings Lux High-Rise', 'Reebok', 140000, 'Tela absorción humedad', 1, 8, NULL),
('Termo deportivo', 'Nike', 45000, 'Acero inoxidable', 2, 9, NULL),
('Gorra deportiva', 'Puma', 40000, 'Ajustable', 2, 9, NULL),
('Protector bucal', 'Everlast', 25000, 'Protección dental', 1, 10, NULL),
('Rodilleras', 'Reebok', 60000, 'Soporte deportivo', 1, 10, NULL),
('Elíptica doméstica', 'ProFit', 1800000, 'Equipo cardio', 1, 11, NULL),
('Reloj Inteligente Sport', 'Garmin', 1200000, 'Monitoreo ritmo cardíaco', 2, 11, NULL),
('Steps Aeróbicos', 'ProFit', 160000, 'Altura ajustable 3 niveles', 1, 12, NULL),
('Rueda Abdominal Dual', 'BodyFit', 42000, 'Core reforzado', 2, 12, NULL),
('Proteína Whey 2lb', 'Optimum', 190000, 'Proteína de suero pura', 1, 13, NULL),
('Creatina Micronizada', 'Muscletech', 95000, 'Fuerza explosiva', 2, 13, NULL),
('Banda de Frecuencia', 'Polar', 280000, 'Conectividad Bluetooth', 1, 14, NULL),
('Toalla Microfibra', 'Jadda', 35000, 'Secado rápido', 1, 15, NULL),
('Kit Boxeo Iniciación', 'Everlast', 350000, 'Pack completo', 1, 15, NULL),
('Balón medicinal 5kg', 'Everlast', 120000, 'Entrenamiento funcional', 1, 4, NULL),
('Camiseta Entrenamiento', 'Nike', 115000, 'Dri-FIT', 1, 8, NULL),
('Shorts Tennis', 'Adidas', 95000, 'Movilidad lateral', 2, 3, NULL),
('Polo Tennis', 'Fila', 110000, 'Protección UV', 2, 3, NULL),
('Guantes Gimnasio', 'Everlast', 45000, 'Ventilación', 1, 4, NULL),
('Bolsa Hidratación 2L', 'Salomon', 125000, 'Compatible running', 2, 3, NULL),
('Muñequeras', 'Reebok', 25000, 'Algodón', 1, 10, NULL),
('Balón basket oficial', 'Spalding', 150000, 'NBA', 2, 2, NULL);

-- ==============================
-- Tallas de productos y colores en stock
-- ==============================

CREATE TABLE PRODUCTO_VARIANTES (
    ID_VARIANTE INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO INT NOT NULL,
    COLOR VARCHAR(50),
    NOMBRE_ATRIBUTO VARCHAR(50),
    ATRIBUTO VARCHAR(50),
    STOCK INT,

    FOREIGN KEY (ID_PRODUCTO)
        REFERENCES PRODUCTOS(ID)
        ON DELETE CASCADE
);

INSERT INTO PRODUCTO_VARIANTES
(ID_PRODUCTO, COLOR, NOMBRE_ATRIBUTO, ATRIBUTO, STOCK)
VALUES

-- Guayos
(1,'Blanco','Talla','40',8),
(1,'Blanco','Talla','41',15),
(1,'Blanco','Talla','42',25),
(1,'Blanco','Talla','43',12),

-- Balón Al Rihla
(2,'Blanco/Multicolor','Tamaño','Talla 5',20),

-- Espinilleras
(3,'Negro','Talla','S',15),
(3,'Negro','Talla','M',25),
(3,'Negro','Talla','L',15),

-- Guantes de portero
(4,'Naranja','Talla','8',4),
(4,'Naranja','Talla','9',10),
(4,'Naranja','Talla','10',6),

-- Camiseta selección
(5,'Amarillo','Talla','S',8),
(5,'Amarillo','Talla','M',15),
(5,'Amarillo','Talla','L',30),
(5,'Amarillo','Talla','XL',10),

-- Balón basket
(6,'Naranja','Tamaño','Talla 7',50),

-- Tenis Lebron
(7,'Negro','Talla','41',8),
(7,'Negro','Talla','42',15),
(7,'Rojo','Talla','41',5),
(7,'Rojo','Talla','42',10),

-- Malla porta balones
(8,'Negro','Tamaño','Única',100),

-- Sudadera
(9,'Gris','Talla','S',15),
(9,'Gris','Talla','M',25),
(9,'Gris','Talla','L',60),
(9,'Gris','Talla','XL',20),

-- Ultraboost
(10,'Gris','Talla','38',6),
(10,'Gris','Talla','39',18),
(10,'Gris','Talla','40',10),

-- Speedcross
(11,'Azul','Talla','42',7),
(11,'Azul','Talla','43',14),
(11,'Azul','Talla','44',5),

-- Joggers
(12,'Azul Oscuro','Talla','S',10),
(12,'Azul Oscuro','Talla','M',30),
(12,'Azul Oscuro','Talla','L',15),

-- Cuerda para saltar
(13,'Negro','Tamaño','Única',100),

-- Pesas
(14,'Gris','Peso','5kg',60),

-- Mancuernas
(15,'Negro','Peso','20kg',20),

-- Colchoneta
(16,'Morado','Tamaño','Única',40),

-- Gafas natación
(17,'Humo','Tamaño','Única',40),

-- Gorro natación
(18,'Azul','Tamaño','Única',100),

-- Casco ciclismo
(19,'Negro','Talla','S',5),
(19,'Negro','Talla','M',15),
(19,'Negro','Talla','L',8),

-- Guantes ciclismo
(20,'Rojo','Talla','M',10),
(20,'Rojo','Talla','L',30),

-- Casco escalada
(21,'Naranja','Tamaño','Única',10),

-- Cuerda escalada
(22,'Azul','Longitud','50m',5),

-- Chaqueta rompevientos
(23,'Blanco','Talla','M',10),
(23,'Blanco','Talla','L',20),
(23,'Blanco','Talla','XL',25),

-- Leggings
(24,'Vino Tinto','Talla','S',28),
(24,'Vino Tinto','Talla','M',15),
(24,'Vino Tinto','Talla','L',8),

-- Termo
(25,'Rojo','Capacidad','1L',90),

-- Gorra
(26,'Blanco','Tamaño','Única',120),

-- Protector bucal
(27,'Transparente','Tamaño','Única',150),

-- Rodilleras
(28,'Negro','Talla','S',20),
(28,'Negro','Talla','M',80),
(28,'Negro','Talla','L',25),

-- Elíptica
(29,'Negro','Tamaño','Única',8),

-- Garmin
(30,'Negro','Tamaño','Única',5),

-- Steps
(31,'Gris','Altura','3 niveles',12),
(31,'Negro','Altura','3 niveles',12),

-- Rueda abdominal
(32,'Negro','Modelo','Dual',20),
(32,'Rojo','Modelo','Dual',25),

-- Proteína
(33,'Vainilla','Presentación','2lb',30),

-- Creatina
(34,'Sin sabor','Presentación','300g',50),

-- Banda de frecuencia
(35,'Negro','Conectividad','Bluetooth',12),

-- Toalla
(36,'Azul Rey','Tamaño','L',150),

-- Kit boxeo
(37,'Rojo','Peso','10oz',5),
(37,'Rojo','Peso','12oz',10),
(37,'Rojo','Peso','14oz',5),

-- Balón medicinal
(38,'Gris','Peso','5kg',20),

-- Camiseta entrenamiento
(39,'Verde Lima','Talla','S',45),
(39,'Verde Lima','Talla','M',20),
(39,'Verde Lima','Talla','L',15),

-- Shorts Tennis
(40,'Negro','Talla','S',15),
(40,'Negro','Talla','M',40),
(40,'Negro','Talla','L',20),

-- Polo Tennis
(41,'Blanco','Talla','M',8),
(41,'Blanco','Talla','L',22),
(41,'Blanco','Talla','XL',10),

-- Guantes gimnasio
(42,'Gris','Talla','M',25),
(42,'Negro','Talla','L',40),

-- Bolsa hidratación
(43,'Azul','Capacidad','2L',20),

-- Muñequeras
(44,'Blanco','Tamaño','Única',200),

-- Balón basket oficial
(45,'Naranja','Tamaño','Talla 7',40);



-- =====================================================
-- IMÁGENES
-- =====================================================

CREATE TABLE PRODUCTO_IMAGENES (
    ID_IMAGEN INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO INT NOT NULL,
    URL_IMAGEN VARCHAR(255) NOT NULL,
    ORDEN INT DEFAULT 1, -- 1 = Principal, 2 = Segunda, etc.
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID) ON DELETE CASCADE
);

INSERT INTO PRODUCTO_IMAGENES (ID_PRODUCTO, URL_IMAGEN, ORDEN) VALUES
-- Guayos Predator 1
(1, 'https://tse4.mm.bing.net/th/id/OIP.dM6R2y9wh0tdFIId5kWD5AHaE4?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(1, 'https://cdnx.jumpseller.com/portel1te/image/67806419/a6c4eade.png?1758718494', 2),
(1, 'https://cdnx.jumpseller.com/portel1te/image/67806934/0e655544.png?1758719930', 3),
-- Producto 2
(2, 'https://http2.mlstatic.com/D_NQ_NP_689300-MLU79143397175_092024-O.webp', 1),
(2, 'https://www.dexter.com.ar/on/demandware.static/-/Sites-365-dabra-catalog/default/dwe9cc29cc/products/AD_H57783/AD_H57783-1.JPG', 2),
(2, 'https://www.tradeinn.com/f/13842/138428497/adidas-balon-futbol-rihla-pro-wtr.jpg', 3),
-- Producto 3
(3, 'https://tse1.mm.bing.net/th/id/OIP.w1ERYh67ZHgvxqS_9Bz45AHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(3, 'https://media.futbolmania.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/S/P/SP2120-104_imagen-de-las-espinilleras-de-futbol-con-media-Nike-Mercurial-Lite-2019-2020-blanco_1_frontal.jpg', 2),
(3, 'https://soydechollos.com/storage/oferta/espinilleras-nike-mercurial-para-futbol.jpg', 3),
-- Producto 4
(4, 'https://www.futbolemotion.com/imagesarticulos/243206/750/guantes-puma-future-pro-hybrid-negro-0.webp', 1),
(4, 'https://tse3.mm.bing.net/th/id/OIP.pVNBp5dkmL7uL4Bp--LteQHaIa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(4, 'https://media.futbolmania.com/media/catalog/product/cache/1/9df78eab33525d08d6e5fb8d27136e95/0/4/041841-03_guantes-de-portero-color-negro-puma-future-ultimate-nc_1_completa-dorso-mano-derecha.jpg', 3),
-- Producto 5
(5, 'https://soccerpost.com/cdn/shop/files/JZ8788_b2b012_plp_clipped_rev_1.png?v=1762430671', 1),
(5, 'https://phantom.estaticos-marca.com/a6110799926d34e90981196ae64810da/resize/1320/f/jpg/assets/multimedia/imagenes/2025/10/05/17596752101525.jpg', 2),
(5, 'https://img.asmedia.epimg.net/resizer/v2/SBL64GGCMFE5ZG5CLNQ3QXUPVE.jpg?auth=110d404941eb9591528f9a77c83e9d780b2776e86d114961b33078b944c3a275&width=1472&height=828&focal=590%2C19', 3),
-- Producto 6
(6, 'https://todoendeportes.com.co/wp-content/uploads/2023/09/Spalding-blanco.jpg', 1),
(6, 'https://contents.mediadecathlon.com/p1683148/k$f9501129707a537c5ac177bd5d4f973d/sq/BAL+N+DE+BALONCESTO+SPALDING+NBA+ALL+STAR+talla+7.jpg', 2),
(6, 'https://tse3.mm.bing.net/th/id/OIP.9k1sqf4k3k71aAzyMUZy5QHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 7
(7, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/753a0a56-e4b8-44d7-9eb5-a9d71a21ee0d/LEBRON+WITNESS+VIII.png', 1),
(7, 'https://th.bing.com/th/id/R.6da7b997d23622bfecdf1f85121619e8?rik=wg1gC%2bgkVdQ0Gg&pid=ImgRaw&r=0', 2),
(7, 'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/08cd3c94-791c-4bb4-aac5-419527092517.1dfd8dffe5d2472f0ba27d4f3fec733d.jpeg?odnHeight=2000&odnWidth=2000&odnBg=ffffff', 3),
-- Producto 8
(8, 'https://jomasports.vtexassets.com/arquivos/ids/187330-800-auto?v=638634012554770000&width=800&height=auto&aspect=true', 1),
(8, 'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00068934434381L.jpg', 2),
(8, 'https://www.tripl3shot.com/wp-content/uploads/Carro-balones-spalding-600x600.webp', 3),
-- Producto 9
(9, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/d7e84a0f-0fce-42aa-bb2d-4383d8fd99e1/sudadera-deportiva-con-capucha-y-cremallera-de-1-4-3mkkzw.png', 1),
(9, 'https://cdn-images.farfetch-contents.com/28/45/77/29/28457729_58563324_1000.jpg', 2),
(9, 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ebb30990-2a4d-4efe-a4d3-d732e1becd08/sudadera-con-capucha-de-cierre-completo-sportswear-Mn7XRp.jpg', 3),
-- Producto 10
(10, 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/940481152a8c48d0a0727a27ec7db0b9_9366/Ultraboost_Light_Running_Shoes_White_HQ6351_HM1.jpg', 1),
(10, 'https://www.digitalsport.com.ar/files/products/6474dbb2b7a6c-602279-500x500.jpg', 2),
(10, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/0d8a313277d04b2e8d55fa7b5710ff0c_9366/GZ5159_HM3_hover.jpg', 3),
-- Producto 11
(11, 'https://img.tennisonly.com.au/watermark/rs.php?path=SSC6MCW-1.jpg&nw=1462', 1),
(11, 'https://cdn.awsli.com.br/2500x2500/1874/1874041/produto/316527552/8ce3492bf1b7c3fa181db681a5e34c3d-6c9p19f5r0.jpg', 2),
(11, 'https://www.peregrinoteca.pt/uploads/media/images/zapatillas-salomon-speedcross-6-gtx-w-gris-1.jpg', 3),
-- Producto 12
(12, 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61', 1),
(12, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea', 2),
(12, 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c', 3),
(12, 'https://static.nike.com/a/images/t_web_pw_592_v2/f_auto/u_9ddf04c7-2a9a-4d76-add1-d15af8f0263d,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5b4417c6-4ac6-4c28-b6c1-14310053133b/M+NK+TCH+FLC+JGGR.png', 1),
(12, 'https://static.nike.com/a/images/t_web_pw_592_v2/f_auto/2daace5a-e572-4751-8f54-1065cfd59fbd/M+NK+TCH+FLC+JGGR.png', 2),
(12, 'https://tse3.mm.bing.net/th/id/OIP.mmvdKlapWgfDihvxgF1Q5QHaJQ?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 13
(13, 'https://images.unsplash.com/photo-1594737625785-cb7f8c6c5b60', 1),
(13, 'https://images.unsplash.com/photo-1510017803434-a899398421b3', 2),
(13, 'https://images.unsplash.com/photo-1548330065-c24c62094473', 3),
(13, 'https://tse1.mm.bing.net/th/id/OIP.y0vfH5EZtjMBlnPvBM503QAAAA?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(13, 'https://tse3.mm.bing.net/th/id/OIP.UM5jrd1sAyccGqJa0dXE2AHaHC?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(13, 'https://tse4.mm.bing.net/th/id/OIP.cIXVnA30l66efdqCdi2J2QHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 14
(14, 'https://images.unsplash.com/photo-1599058917212-d750089bc07e', 1),
(14, 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8', 2),
(14, 'https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99', 3),
(14, 'https://http2.mlstatic.com/D_NQ_NP_762065-MLM52326287210_112022-O-pesas-mancuernas-de-5-kilos-negro-ejercicio-pilates-yoga-gym.webp', 1),
(14, 'https://tse1.mm.bing.net/th/id/OIP.XL59xNboKQnC70pNpncCgQHaDr?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(14, 'https://tse1.mm.bing.net/th/id/OIP.JlJNxX37Wd4pZDHLPQ2FGAHaFa?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 15
(15, 'https://images.unsplash.com/photo-1584467735871-8a4aab04dffb', 1),
(15, 'https://images.unsplash.com/photo-1598289431512-b97b0917a63e', 2),
(15, 'https://images.unsplash.com/photo-1592432678016-e910b452f9a2', 3),
(15, 'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/fdf177bb-0518-462a-9c7d-8569fd2b5fc8.b4f2a229ecab3fa908e54d564f4e2bce.jpeg?odnHeight=2000&odnWidth=2000&odnBg=ffffff', 1),
(15, 'https://tse3.mm.bing.net/th/id/OIP.a1CvVT0SiMyxXqLGmnmIqAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(15, 'https://tse1.mm.bing.net/th/id/OIP.NcZ7U5jLcUDRdX8NddnzkAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 16
(16, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', 1),
(16, 'https://images.unsplash.com/photo-1634484521128-4f1082260661', 2),
(16, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30', 3),
(16, 'https://tse2.mm.bing.net/th/id/OIP.Qf65pdGXiTsotVd3YVbJTwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(16, 'https://tse1.mm.bing.net/th/id/OIP.hpc1al9NSYqL_F5EqID7jgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(16, 'https://http2.mlstatic.com/D_NQ_NP_910107-MLU73392892391_122023-O.webp', 3),
-- Producto 17
(17, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e', 1),
(17, 'https://images.unsplash.com/photo-1544919982-b61976f0ba43', 2),
(17, 'https://images.unsplash.com/photo-1606902960316-39f264e839ed', 3),
(17, 'https://tse3.mm.bing.net/th/id/OIP.-ab8CskV3xol9PQPEdkzpwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(17, 'https://tse1.mm.bing.net/th/id/OIP.3IctO49ygGWGCHLkrH8FiwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(17, 'https://tse4.mm.bing.net/th/id/OIP.m4oDdXkm_MxalC1igty8VAHaIx?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 18
(18, 'https://images.unsplash.com/photo-1574629810360-7efbbe195018', 1),
(18, 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48', 2),
(18, 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b', 3),
(18, 'https://tse2.mm.bing.net/th/id/OIP.J7-Ln3KvYbhjeH9cxT_d_QHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(18, 'https://tse2.mm.bing.net/th/id/OIP.wGCsGdPqcCoGK_Q_RidxYAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(18, 'https://mundodeportivo.com.co/wp-content/uploads/8-709900011.webp', 3),
-- Producto 19
(19, 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a', 1),
(19, 'https://images.unsplash.com/photo-1518611012118-296032bb947a', 2),
(19, 'https://images.unsplash.com/photo-1594458396597-073c65918314', 3),
(19, 'https://resources.claroshop.com/medios-plazavip/s2/10382/4867612/64898830c1af4-casbel1270-1600x1600.jpg', 1),
(19, 'https://tse2.mm.bing.net/th/id/OIP.kqWHR5_QTWMPFdPy4VypBAHaFm?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(19, 'https://www.sumitate.com.uy/img/articulos/casco_ciclismo_ruta_bell_z20_aero_mips_2_imagen3.jpg', 3),
-- Producto 20
(20, 'https://images.unsplash.com/photo-1628153322151-35a12d307991', 1),
(20, 'https://images.unsplash.com/photo-1551830820-330a71b99659', 2),
(20, 'https://images.unsplash.com/photo-1626015413325-0150215da7c2', 3),
(20, 'https://i.pinimg.com/736x/36/80/59/368059e80767b467d1d1732f875cb8be.jpg', 1),
(20, 'https://http2.mlstatic.com/D_NQ_NP_724747-MLA50331197972_062022-O.webp', 2),
(20, 'https://tse4.mm.bing.net/th/id/OIP.pNFp0EYDV3Z4aD1K_W-P-AHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 21
(21, 'https://images.unsplash.com/photo-1560769629-975ec94e6a86', 1),
(21, 'https://images.unsplash.com/photo-1606335543042-57c525922933', 2),
(21, 'https://images.unsplash.com/photo-1519315901367-f34ff9154487', 3),
(21, 'https://tse4.mm.bing.net/th/id/OIP.SJbsM5X4V0JAjYcSGZ93SwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(21, 'https://tse1.mm.bing.net/th/id/OIP.THgWjS2SCF70f1MVX9RJTgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(21, 'https://tse2.mm.bing.net/th/id/OIP.OP_fbNQVmD_RVpUUUxW5xgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 3),
-- Producto 22
(22, 'https://images.unsplash.com/photo-1511191988486-103bc3cb8002', 1),
(22, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab', 2),
(22, 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519', 3),
(22, 'https://tse2.mm.bing.net/th/id/OIP.K9hlXVTm34HA34IgqyV71QAAAA?rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(22, 'https://tse1.mm.bing.net/th/id/OIP.nFXHtg52dDGajpOYc5jv3AAAAA?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(22, 'https://zendavertical.com/wp-content/uploads/2020/09/R32AY-Mambo-jaune-pack_LowRes_zendavertical.jpeg', 3),
-- Producto 23
(23, 'https://images.unsplash.com/photo-1622279457486-62dcc4a497c4', 1),
(23, 'https://images.unsplash.com/photo-1517649763962-0c623066013b', 2),
(23, 'https://images.unsplash.com/photo-1519861531473-9200262188bf', 3),
(23, 'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/9138cf4e-34c8-4395-9f90-bce853566c92.3695c56e78748f0252b2aa43da1616d0.jpeg?odnHeight=2000&odnWidth=2000&odnBg=ffffff', 1),
(23, 'https://tse3.mm.bing.net/th/id/OIP.oJ7ncNFPeUxfaWHAaWbVWgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(23, 'https://dpjye2wk9gi5z.cloudfront.net/wcsstore/ExtendedSitesCatalogAssetStore/images/catalog/zoom/3019246-0100V1.jpg', 3),
-- Producto 24
(24, 'https://images.unsplash.com/photo-1517841905240-472988babdf9', 1),
(24, 'https://images.unsplash.com/photo-1599058917765-a780eda07a3e', 2),
(24, 'https://images.unsplash.com/photo-1596462502278-27bfdc403348', 3),
-- Producto 25
(25, 'https://images.unsplash.com/photo-1552066344-24632e2df2b3', 1),
(25, 'https://images.unsplash.com/photo-1584467735871-8a4aab04dffb', 2),
(25, 'https://images.unsplash.com/photo-1602143407151-7111542de6e8', 3),
-- Producto 26
(26, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea', 1),
(26, 'https://images.unsplash.com/photo-1600180758895-1c1bdb0f9e7b', 2),
(26, 'https://images.unsplash.com/photo-1585386959984-a4155224a1ad', 3),
-- Producto 27
(27, 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c', 1),
(27, 'https://images.unsplash.com/photo-1600180758890-6b94519a8ba5', 2),
(27, 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61', 3),
-- Producto 28
(28, 'https://images.unsplash.com/photo-1510017803434-a899398421b3', 1),
(28, 'https://images.unsplash.com/photo-1594737625785-cb7f8c6c5b60', 2),
(28, 'https://images.unsplash.com/photo-1599058917212-d750089bc07e', 3),
-- Producto 29
(29, 'https://images.unsplash.com/photo-1548330065-c24c62094473', 1),
(29, 'https://images.unsplash.com/photo-1584467735871-8a4aab04dffb', 2),
(29, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', 3),
-- Producto 30
(30, 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8', 1),
(30, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e', 2),
(30, 'https://images.unsplash.com/photo-1574629810360-7efbbe195018', 3),
-- Producto 31
(31, 'https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99', 1),
(31, 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a', 2),
(31, 'https://images.unsplash.com/photo-1628153322151-35a12d307991', 3),
-- Producto 32
(32, 'https://images.unsplash.com/photo-1598289431512-b97b0917a63e', 1),
(32, 'https://images.unsplash.com/photo-1560769629-975ec94e6a86', 2),
(32, 'https://images.unsplash.com/photo-1511191988486-103bc3cb8002', 3),
-- Producto 33
(33, 'https://images.unsplash.com/photo-1592432678016-e910b452f9a2', 1),
(33, 'https://images.unsplash.com/photo-1622279457486-62dcc4a497c4', 2),
(33, 'https://images.unsplash.com/photo-1517841905240-472988babdf9', 3),
-- Producto 34
(34, 'https://images.unsplash.com/photo-1634484521128-4f1082260661', 1),
(34, 'https://images.unsplash.com/photo-1552066344-24632e2df2b3', 2),
(34, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea', 3),
-- Producto 35
(35, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30', 1),
(35, 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c', 2),
(35, 'https://images.unsplash.com/photo-1510017803434-a899398421b3', 3),
-- Producto 36
(36, 'https://images.unsplash.com/photo-1544919982-b61976f0ba43', 1),
(36, 'https://images.unsplash.com/photo-1548330065-c24c62094473', 2),
(36, 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8', 3),
-- Producto 37
(37, 'https://images.unsplash.com/photo-1606902960316-39f264e839ed', 1),
(37, 'https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99', 2),
(37, 'https://images.unsplash.com/photo-1598289431512-b97b0917a63e', 3),
-- Producto 38
(38, 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48', 1),
(38, 'https://images.unsplash.com/photo-1592432678016-e910b452f9a2', 2),
(38, 'https://images.unsplash.com/photo-1634484521128-4f1082260661', 3),
-- Producto 39
(39, 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b', 1),
(39, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30', 2),
(39, 'https://images.unsplash.com/photo-1544919982-b61976f0ba43', 3),
-- Producto 40
(40, 'https://images.unsplash.com/photo-1518611012118-296032bb947a', 1),
(40, 'https://images.unsplash.com/photo-1606902960316-39f264e839ed', 2),
(40, 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48', 3),
-- Producto 41
(41, 'https://images.unsplash.com/photo-1594458396597-073c65918314', 1),
(41, 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b', 2),
(41, 'https://images.unsplash.com/photo-1518611012118-296032bb947a', 3),
-- Producto 42
(42, 'https://images.unsplash.com/photo-1551830820-330a71b99659', 1),
(42, 'https://images.unsplash.com/photo-1594458396597-073c65918314', 2),
(42, 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b', 3),
-- Producto 43
(43, 'https://images.unsplash.com/photo-1626015413325-0150215da7c2', 1),
(43, 'https://images.unsplash.com/photo-1551830820-330a71b99659', 2),
(43, 'https://images.unsplash.com/photo-1594458396597-073c65918314', 3),
-- Producto 44
(44, 'https://images.unsplash.com/photo-1606335543042-57c525922933', 1),
(44, 'https://images.unsplash.com/photo-1626015413325-0150215da7c2', 2),
(44, 'https://images.unsplash.com/photo-1551830820-330a71b99659', 3),
-- Producto 45
(45, 'https://images.unsplash.com/photo-1519315901367-f34ff9154487', 1),
(45, 'https://images.unsplash.com/photo-1606335543042-57c525922933', 2),
(45, 'https://images.unsplash.com/photo-1626015413325-0150215da7c2', 3);

-- ==============================
-- INVENTARIO
-- ==============================
CREATE TABLE INVENTARIO (
    ID_INVENTARIO INT PRIMARY KEY AUTO_INCREMENT,
    ID_PRODUCTO INT,
    CANTIDAD INT,
    FECHA_INGRESO DATE,
    FECHA_ACTUALIZACION DATE,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);

INSERT INTO INVENTARIO
(ID_PRODUCTO, CANTIDAD, FECHA_INGRESO, FECHA_ACTUALIZACION)
VALUES
(1, 60, '2025-01-01', '2025-01-10'),
(2, 40, '2025-01-02', '2025-01-10'),
(3, 25, '2025-01-03', '2025-01-10'),
(4, 50, '2025-01-04', '2025-01-10'),
(5, 100, '2025-01-05', '2025-01-10'),
(6, 70, '2025-01-06', '2025-01-10'),
(7, 150, '2025-01-07', '2025-01-10'),
(8, 90, '2025-01-08', '2025-01-10'),
(9, 80, '2025-01-09', '2025-01-10'),
(10, 120, '2025-01-10', '2025-01-10'),
(11, 30, '2025-01-11', '2025-01-11'),
(12, 60, '2025-01-12', '2025-01-12'),
(13, 8, '2025-01-13', '2025-01-13'),
(14, 20, '2025-01-14', '2025-01-14'),
(15, 55, '2025-01-15', '2025-01-15');

-- ==============================
-- EMPLEADOS
-- ==============================
CREATE TABLE EMPLEADOS (
    ID_EMPLEADO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_EMPLEADO VARCHAR(100),
    APELLIDO_EMPLEADO VARCHAR(100),
    CARGO VARCHAR(100),
    FECHA_CONTRATACION DATE,
    TELEFONO VARCHAR(15),
    EMAIL VARCHAR(100)
);

INSERT INTO EMPLEADOS
(NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO, FECHA_CONTRATACION, TELEFONO, EMAIL)
VALUES
('Ricardo', 'López', 'Vendedor', '2022-05-01', '3021112233', 'ricardo@tienda.com'),
('Andrea', 'Reyes', 'Cajero', '2023-02-10', '3022223344', 'andrea@tienda.com'),
('Fernando', 'Muñoz', 'Administrador', '2021-03-15', '3023334455', 'fernando@tienda.com'),
('Sandra', 'Ramírez', 'Contadora', '2020-06-20', '3024445566', 'sandra@tienda.com'),
('David', 'Torres', 'Bodeguero', '2024-01-05', '3025556677', 'david@tienda.com'),
('Lorena', 'Medina', 'Vendedor', '2023-08-08', '3026667788', 'lorena@tienda.com'),
('Carlos', 'Martínez', 'Soporte', '2022-09-12', '3027778899', 'carlos@tienda.com'),
('Natalia', 'Ortiz', 'Vendedor', '2024-02-14', '3031112233', 'natalia@tienda.com'),
('Javier', 'Gómez', 'Logística', '2021-11-11', '3032223344', 'javier@tienda.com'),
('Marta', 'Herrera', 'Cajero', '2023-06-10', '3033334455', 'marta@tienda.com'),
('Sebastián', 'Moreno', 'Vendedor', '2022-03-17', '3034445566', 'sebastian@tienda.com'),
('Paula', 'Rojas', 'Cajero', '2024-01-09', '3035556677', 'paula@tienda.com');

-- ==============================
-- METODOS DE PAGO
-- ==============================
CREATE TABLE METODOS_PAGO (
    ID_METODO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_METODO VARCHAR(50) NOT NULL,
    DESCRIPCION VARCHAR(100)
);

INSERT INTO METODOS_PAGO (NOMBRE_METODO, DESCRIPCION) VALUES
('Efectivo', 'Pago en dinero físico'),
('Tarjeta débito', 'Pago con tarjeta débito'),
('Tarjeta crédito', 'Pago con tarjeta crédito'),
('Nequi', 'Billetera digital'),
('Daviplata', 'Billetera digital Davivienda'),
('Bancolombia', 'Transferencia Bancolombia'),
('PSE', 'Pagos seguros en línea'),
('PayPal', 'Plataforma internacional'),
('Transferencia BBVA', 'Transferencia bancaria'),
('Contra entrega', 'Pago al recibir'),
('Apple Pay', 'Pago móvil Apple'),
('Google Pay', 'Pago móvil Google'),
('Crédito tienda', 'Financiación interna'),
('QR Bancario', 'Pago por código QR'),
('Bitcoin', 'Pago con criptomoneda');

-- ==============================
-- VENTAS
-- ==============================
CREATE TABLE VENTAS (
    ID_VENTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_CLIENTE INT,
    ID_EMPLEADO INT NULL, -- Ajustado: Ahora puede ser NULL si se compra directo desde la web
    FECHA_VENTA DATETIME,
    TOTAL DECIMAL(10,2),
    ESTADO VARCHAR(50) DEFAULT 'COMPLETADA',
    ID_METODO INT,
    REFERENCIA_PAGO VARCHAR(100) DEFAULT NULL, -- Agregado: Para el código de la pasarela
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
    FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS(ID_EMPLEADO),
    FOREIGN KEY (ID_METODO) REFERENCES METODOS_PAGO(ID_METODO)
);

INSERT INTO VENTAS
(ID_CLIENTE, ID_EMPLEADO, FECHA_VENTA, TOTAL, ESTADO, ID_METODO)
VALUES
(1, 1, '2025-01-05 10:15:00', 150000.00, 'COMPLETADA', 2),
(2, 2, '2025-01-06 11:20:00', 260000.00, 'COMPLETADA', 3),
(3, 1, '2025-01-07 14:05:00', 95000.00, 'COMPLETADA', 1),
(4, 3, '2025-01-08 09:30:00', 225000.00, 'COMPLETADA', 5),
(5, 4, '2025-01-09 16:45:00', 35000.00, 'COMPLETADA', 4),
(6, 5, '2025-01-10 12:10:00', 145000.00, 'COMPLETADA', 6),
(7, 6, '2025-01-11 15:30:00', 45000.00, 'COMPLETADA', 2),
(8, 7, '2025-01-12 17:00:00', 60000.00, 'COMPLETADA', 3),
(9, 8, '2025-01-13 13:25:00', 40000.00, 'COMPLETADA', 1),
(10, 9, '2025-01-14 18:40:00', 270000.00, 'COMPLETADA', 7),
(11, 10, '2025-01-15 10:55:00', 1800000.00, 'COMPLETADA', 3),
(12, 11, '2025-01-16 11:15:00', 150000.00, 'COMPLETADA', 8),
(13, 12, '2025-01-17 16:10:00', 70000.00, 'COMPLETADA', 5),
(14, 1, '2025-01-18 09:50:00', 110000.00, 'COMPLETADA', 6),
(15, 2, '2025-01-19 14:35:00', 50000.00, 'COMPLETADA', 2);

-- ==============================
-- DETALLE VENTAS
-- ==============================
CREATE TABLE DETALLE_VENTAS (
    ID_DETALLE INT PRIMARY KEY AUTO_INCREMENT,
    ID_VENTA INT,
    ID_PRODUCTO INT,
    CANTIDAD INT,
    PRECIO_UNITARIO DECIMAL(10,2),
    SUBTOTAL DECIMAL(10,2),
    FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID_VENTA),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);

INSERT INTO DETALLE_VENTAS
(ID_VENTA, ID_PRODUCTO, CANTIDAD, PRECIO_UNITARIO, SUBTOTAL)
VALUES
(1, 11, 1, 150000.00, 150000.00),
(2, 3, 1, 220000.00, 220000.00),
(2, 10, 1, 40000.00, 40000.00),
(3, 6, 1, 95000.00, 95000.00),
(4, 2, 1, 180000.00, 180000.00),
(4, 8, 1, 45000.00, 45000.00),
(5, 5, 1, 35000.00, 35000.00),
(6, 1, 1, 120000.00, 120000.00),
(6, 7, 1, 25000.00, 25000.00),
(7, 8, 1, 45000.00, 45000.00),
(8, 9, 1, 60000.00, 60000.00),
(9, 10, 1, 40000.00, 40000.00),
(10, 11, 1, 150000.00, 150000.00),
(10, 1, 1, 120000.00, 120000.00),
(11, 13, 1, 1800000.00, 1800000.00),
(12, 14, 1, 150000.00, 150000.00),
(13, 15, 1, 70000.00, 70000.00),
(14, 4, 1, 110000.00, 110000.00),
(15, 12, 1, 50000.00, 50000.00);

-- ==============================
-- ENVIOS
-- ==============================
CREATE TABLE ENVIOS (
    ID_ENVIO INT PRIMARY KEY AUTO_INCREMENT,
    ID_VENTA INT,
    DIRECCION_ENVIO VARCHAR(255),
    CIUDAD VARCHAR(100),
    ESTADO_ENVIO VARCHAR(50),
    FECHA_ENVIO DATE,
    FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID_VENTA)
);

INSERT INTO ENVIOS
(ID_VENTA, DIRECCION_ENVIO, CIUDAD, ESTADO_ENVIO, FECHA_ENVIO)
VALUES
(1, 'Cra 10 #20-30', 'Bogotá', 'En camino', '2025-06-02');

-- ==============================
-- MOVIMIENTOS STOCK
-- ==============================
CREATE TABLE MOVIMIENTOS_STOCK (
    ID_MOVIMIENTO INT PRIMARY KEY AUTO_INCREMENT,
    ID_PRODUCTO INT,
    TIPO_MOVIMIENTO VARCHAR(50),
    CANTIDAD INT,
    FECHA DATE,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);

INSERT INTO MOVIMIENTOS_STOCK
(ID_PRODUCTO, TIPO_MOVIMIENTO, CANTIDAD, FECHA)
VALUES
(1, 'SALIDA', 2, '2025-06-01'),
(2, 'SALIDA', 1, '2025-06-02');

-- ==============================
-- FAVORITOS
-- ==============================
CREATE TABLE FAVORITOS (
    ID_FAVORITO INT PRIMARY KEY AUTO_INCREMENT,
    ID_USUARIO INT,
    ID_PRODUCTO INT,
    FECHA_AGREGADO DATE,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);

INSERT INTO FAVORITOS
(ID_USUARIO, ID_PRODUCTO, FECHA_AGREGADO)
VALUES
(1, 1, '2025-06-01'),
(2, 2, '2025-06-02');

-- ==============================
-- CARRITO DE COMPRAS
-- ==============================
CREATE TABLE CARRITO (
    ID_CARRITO INT PRIMARY KEY AUTO_INCREMENT,
    ID_USUARIO INT NOT NULL,
    ID_PRODUCTO INT NOT NULL,
    CANTIDAD INT NOT NULL DEFAULT 1,
    FECHA_AGREGADO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO) ON DELETE CASCADE,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID) ON DELETE CASCADE
);

-- ==============================
-- RESEÑAS
-- ==============================

CREATE TABLE RESENAS (
    ID_RESENA INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO INT NOT NULL,
    ID_USUARIO INT NOT NULL,
    CALIFICACION INT CHECK (CALIFICACION BETWEEN 1 AND 5),
    COMENTARIO TEXT,
    FECHA TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID) ON DELETE CASCADE,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO) ON DELETE CASCADE
);

-- ==============================
-- CARACTERISTICAS E INFORMACION DEL PRODUCTO
-- ==============================
CREATE TABLE PRODUCTO_CARACTERISTICAS (
    ID_CARACTERISTICA INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO INT NOT NULL,
    NOMBRE_ATRIBUTO VARCHAR(100) NOT NULL, -- Ejemplo: "Material"
    VALOR_ATRIBUTO VARCHAR(255) NOT NULL,  -- Ejemplo: "Algodón"
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID) ON DELETE CASCADE
);



select * from USUARIOS;
select * from productos;
DELETE FROM USUARIOS WHERE EMAIL = 'yeisiton922@gmail.com';
DELETE FROM USUARIOS WHERE EMAIL = 'yeisonfernandez2022@gmail.com';
DELETE FROM USUARIOS WHERE EMAIL = 'yeison2004@hotmail.es';


-- ----------------------------------------
-- Join PARA FILTRAR CATEGORIA EN CATALOGO	
-- -----------------------------------------
SELECT 
  PRODUCTOS.ID,
  PRODUCTOS.NOMBRE,
  PRODUCTOS.PRECIO,
  PI.URL_IMAGEN,
  PI.ORDEN
FROM PRODUCTOS
LEFT JOIN PRODUCTO_IMAGENES PI ON PRODUCTOS.ID = PI.ID_PRODUCTO
ORDER BY PRODUCTOS.ID, PI.ORDEN;


SELECT * FROM CARRITO WHERE ID_USUARIO = 16;
SHOW TABLES;
select * from PRODUCTOS;

