CREATE DATABASE TIENDA_DEPORTIVA;
USE TIENDA_DEPORTIVA;

-- ==============================
-- ROLES
-- ==============================

CREATE TABLE ROLES (
    ID_ROL INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_ROL VARCHAR(50),
    DESCRIPCION varchar(100)
);

INSERT INTO ROLES (NOMBRE_ROL, DESCRIPCION)
VALUES
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
    NOMBRE_USUARIO VARCHAR(100),
    APELLIDO_USUARIO VARCHAR(100),
    EMAIL VARCHAR(100) UNIQUE,
    USUARIO VARCHAR(100) UNIQUE,
    CONTRASENA VARCHAR(255),
    FECHA_REGISTRO DATE,
    ID_ROL INT,
    FOREIGN KEY (ID_ROL) REFERENCES ROLES(ID_ROL)
);

INSERT INTO USUARIOS 
(NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL, USUARIO, CONTRASENA, FECHA_REGISTRO, ID_ROL)
VALUES
('Juan', 'Torres', 'juan.torres@mail.com', 'juan.torres', 'clave123', '2024-01-12', 2),
('Daniela', 'Ríos', 'daniela.rios@mail.com', 'daniela.rios', 'clave123', '2023-08-05', 2),
('Felipe', 'Cano', 'felipe.cano@mail.com', 'felipe.cano', 'clave123', '2024-05-19', 2),
('Valeria', 'Mendoza', 'valeria.mendoza@mail.com', 'valeria.mendoza', 'clave123', '2025-02-02', 2),
('Santiago', 'Pardo', 'santiago.pardo@mail.com', 'santiago.pardo', 'clave123', '2023-11-22', 2),
('Manuela', 'Gil', 'manuela.gil@mail.com', 'manuela.gil', 'clave123', '2024-06-01', 2),
('Cristian', 'Navarro', 'cristian.navarro@mail.com', 'cristian.navarro', 'clave123', '2025-01-15', 2),
('Laura', 'Bautista', 'laura.bautista@mail.com', 'laura.bautista', 'clave123', '2024-09-09', 2),
('Kevin', 'Acosta', 'kevin.acosta@mail.com', 'kevin.acosta', 'clave123', '2023-12-12', 2),
('Sara', 'Quintero', 'sara.quintero@mail.com', 'sara.quintero', 'clave123', '2024-07-07', 2),
('Miguel', 'Lara', 'miguel.lara@mail.com', 'miguel.lara', 'clave123', '2024-03-18', 2),
('Paola', 'Vega', 'paola.vega@mail.com', 'paola.vega', 'clave123', '2023-10-10', 2),
('Andrés', 'Ruiz', 'andres.ruiz@mail.com', 'andres.ruiz', 'clave123', '2024-04-04', 2),
('Tatiana', 'Ocampo', 'tatiana.ocampo@mail.com', 'tatiana.ocampo', 'clave123', '2024-02-20', 2),
('Julian', 'Soto', 'julian.soto@mail.com', 'julian.soto', 'clave123', '2025-03-01', 2);


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

INSERT INTO CATEGORIAS (NOMBRE_CATEGORIA, DESCRIPCION)
VALUES
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

INSERT INTO DESCUENTOS (DESCRIPCION, PORCENTAJE, FECHA_INICIO, FECHA_FIN)
VALUES
('Descuento temporada fútbol', 10, '2025-06-01', '2025-07-01');

-- ==============================
-- PRODUCTOS
-- ==============================

CREATE TABLE PRODUCTOS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(255),
    MARCA VARCHAR(100),
    COLOR VARCHAR(50),
    TALLA VARCHAR(10),
    PRECIO DECIMAL(10,2),
    STOCK INT,
    DESCRIPCION TEXT,
    ID_PROVEEDOR INT,
    ID_CATEGORIA INT,
    ID_DESCUENTO INT,
    FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR),
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA),
    FOREIGN KEY (ID_DESCUENTO) REFERENCES DESCUENTOS(ID_DESCUENTO)
);

INSERT INTO PRODUCTOS
(NOMBRE, MARCA, COLOR, TALLA, PRECIO, STOCK, DESCRIPCION, ID_PROVEEDOR, ID_CATEGORIA, ID_DESCUENTO)
VALUES
('Sudadera deportiva', 'Nike', 'Gris', 'L', 120000, 60, 'Sudadera térmica', 1, 3, NULL),
('Chaqueta impermeable', 'Adidas', 'Negro', 'M', 180000, 40, 'Resistente al agua', 2, 3, NULL),
('Guayos profesionales', 'Puma', 'Blanco', '42', 220000, 25, 'Guayos para césped natural', 1, 1, NULL),
('Balón baloncesto', 'Spalding', 'Naranja', '7', 110000, 50, 'Balón oficial NBA', 2, 1, NULL),
('Cuerda para saltar', 'Everlast', 'Negro', 'U', 35000, 100, 'Cuerda ajustable', 1, 4, NULL),
('Bolso deportivo', 'Adidas', 'Azul', 'U', 95000, 70, 'Bolso amplio', 2, 3, NULL),
('Protector bucal', 'Everlast', 'Transparente', 'U', 25000, 150, 'Protección dental', 1, 4, NULL),
('Termo deportivo', 'Nike', 'Rojo', '1L', 45000, 90, 'Acero inoxidable', 2, 4, NULL),
('Rodilleras', 'Reebok', 'Negro', 'M', 60000, 80, 'Soporte deportivo', 1, 4, NULL),
('Gorra deportiva', 'Puma', 'Blanco', 'U', 40000, 120, 'Ajustable', 2, 3, NULL),
('Camiseta selección', 'Adidas', 'Amarillo', 'L', 150000, 30, 'Edición especial', 1, 1, NULL),
('Pesas 5kg', 'BodyFit', 'Gris', '5kg', 50000, 60, 'Recubiertas', 2, 4, NULL),
('Elíptica doméstica', 'ProFit', 'Negro', 'U', 1800000, 8, 'Equipo cardio', 1, 4, NULL),
('Mancuernas 20kg', 'BodyFit', 'Negro', '20kg', 150000, 20, 'Set completo', 2, 4, NULL),
('Espinilleras', 'Nike', 'Negro', 'M', 70000, 55, 'Protección fútbol', 1, 1, NULL);


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

INSERT INTO METODOS_PAGO (NOMBRE_METODO, DESCRIPCION)
VALUES
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
    ID_EMPLEADO INT,
    FECHA_VENTA DATETIME,
    TOTAL DECIMAL(10,2),
    ESTADO VARCHAR(50) DEFAULT 'COMPLETADA',
    ID_METODO INT,
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

-- Obtener el total general de ventas.
SELECT 
    COUNT(ID_VENTA) AS TOTAL_VENTAS_REALIZADAS,
    SUM(TOTAL) AS TOTAL_GENERAL_VENTAS
FROM VENTAS;

-- Obtener el promedio general de ventas.
SELECT 
    AVG(TOTAL) AS PROMEDIO_GENERAL_VENTAS
FROM VENTAS;

-- Mostrar los productos cuyo total vendido sea superior al promedio general
SELECT 
    P.NOMBRE,
    SUM(DV.SUBTOTAL) AS TOTAL_VENDIDO_PRODUCTO
FROM DETALLE_VENTAS DV
JOIN PRODUCTOS P ON DV.ID_PRODUCTO = P.ID
GROUP BY P.NOMBRE
HAVING TOTAL_VENDIDO_PRODUCTO > (
    SELECT AVG(TOTAL) FROM VENTAS
);

-- Mostrar la categoría con menor volumen de ventas.
SELECT 
    C.NOMBRE_CATEGORIA,
    SUM(DV.SUBTOTAL) AS TOTAL_VENTAS_CATEGORIA
FROM DETALLE_VENTAS DV
JOIN PRODUCTOS P ON DV.ID_PRODUCTO = P.ID
JOIN CATEGORIAS C ON P.ID_CATEGORIA = C.ID_CATEGORIA
GROUP BY C.NOMBRE_CATEGORIA
HAVING TOTAL_VENTAS_CATEGORIA = (
    SELECT MIN(TOTAL_CATEGORIA)
    FROM (
        SELECT SUM(DV2.SUBTOTAL) AS TOTAL_CATEGORIA
        FROM DETALLE_VENTAS DV2
        JOIN PRODUCTOS P2 ON DV2.ID_PRODUCTO = P2.ID
        GROUP BY P2.ID_CATEGORIA
    ) AS SUBCONSULTA
);

-- Mostrar la venta más alta y la más baja.
SELECT 
    MAX(TOTAL) AS VENTA_MAS_ALTA,
    MIN(TOTAL) AS VENTA_MAS_BAJA
FROM VENTAS;


/* =====================================================
   PROCEDIMIENTOS ALMACENADOS SIN PARÁMETROS 10
   ===================================================== */
DELIMITER //
-- 1. Mostrar todos los productos
-- Beneficio: permite ver el catálogo completo rápidamente
CREATE PROCEDURE sp_mostrar_productos()
BEGIN
    SELECT * FROM PRODUCTOS;
END //

-- 2. Mostrar todos los clientes
-- Beneficio: facilita consultar los clientes registrados
CREATE PROCEDURE sp_mostrar_clientes()
BEGIN
    SELECT * FROM CLIENTES;
END //

-- 3. Mostrar todas las ventas
-- Beneficio: permite revisar el historial de ventas
CREATE PROCEDURE sp_mostrar_ventas()
BEGIN
    SELECT * FROM VENTAS;
END //

-- 4. Mostrar inventario actual
-- Beneficio: permite controlar el stock disponible
CREATE PROCEDURE sp_ver_inventario()
BEGIN
    SELECT P.NOMBRE, I.CANTIDAD, I.FECHA_ACTUALIZACION
    FROM INVENTARIO I
    JOIN PRODUCTOS P ON I.ID_PRODUCTO = P.ID;
END //

-- 5. Mostrar proveedores
-- Beneficio: facilita la gestión de proveedores
CREATE PROCEDURE sp_ver_proveedores()
BEGIN
    SELECT * FROM PROVEEDORES;
END //

-- 6. Mostrar empleados
-- Beneficio: permite consultar el personal contratado
CREATE PROCEDURE sp_ver_empleados()
BEGIN
    SELECT * FROM EMPLEADOS;
END //

-- 7. Mostrar categorías
-- Beneficio: permite administrar las categorías de productos
CREATE PROCEDURE sp_ver_categorias()
BEGIN
    SELECT * FROM CATEGORIAS;
END //

-- 8. Mostrar métodos de pago
-- Beneficio: permite conocer las opciones disponibles
CREATE PROCEDURE sp_ver_metodos_pago()
BEGIN
    SELECT * FROM METODOS_PAGO;
END //

-- 9. Mostrar productos con bajo stock (<20)
-- Beneficio: ayuda a identificar productos que necesitan reposición
CREATE PROCEDURE sp_stock_bajo()
BEGIN
    SELECT NOMBRE, STOCK
    FROM PRODUCTOS
    WHERE STOCK < 20;
END //

-- 10. Mostrar total general de ventas
-- Beneficio: permite conocer el ingreso total de la tienda
CREATE PROCEDURE sp_total_ventas()
BEGIN
    SELECT COUNT(ID_VENTA) AS TOTAL_VENTAS,
           SUM(TOTAL) AS INGRESO_TOTAL
    FROM VENTAS;
END //


/* =====================================================
   PROCEDIMIENTOS CON 1 PARÁMETRO 5
   ===================================================== */

-- 11. Buscar producto por ID
-- Beneficio: permite encontrar un producto específico
CREATE PROCEDURE sp_buscar_producto(IN p_id INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS
    WHERE ID = p_id;
END //

-- 12. Mostrar ventas de un cliente
-- Beneficio: permite ver el historial de compras de un cliente
CREATE PROCEDURE sp_ventas_cliente(IN p_cliente INT)
BEGIN
    SELECT *
    FROM VENTAS
    WHERE ID_CLIENTE = p_cliente;
END //

-- 13. Mostrar productos por categoría
-- Beneficio: permite filtrar productos según su categoría
CREATE PROCEDURE sp_productos_categoria(IN p_categoria INT)
BEGIN
    SELECT *
    FROM PRODUCTOS
    WHERE ID_CATEGORIA = p_categoria;
END //

-- 14. Buscar usuario por correo
-- Beneficio: útil para autenticación y consultas
CREATE PROCEDURE sp_buscar_usuario_email(IN p_email VARCHAR(100))
BEGIN
    SELECT *
    FROM USUARIOS
    WHERE EMAIL = p_email;
END //

-- 15. Mostrar ventas realizadas por un empleado
-- Beneficio: permite evaluar el desempeño del empleado
CREATE PROCEDURE sp_ventas_empleado(IN p_empleado INT)
BEGIN
    SELECT *
    FROM VENTAS
    WHERE ID_EMPLEADO = p_empleado;
END //


/* =====================================================
   PROCEDIMIENTOS CON 2 PARÁMETROS 5
   ===================================================== */

-- 16. Insertar un nuevo cliente (nombre y apellido)
-- Beneficio: facilita el registro de clientes
CREATE PROCEDURE sp_insertar_cliente(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100)
)
BEGIN
    INSERT INTO CLIENTES
    (NOMBRE_CLIENTE, APELLIDO_CLIENTE, TIPODO_CLIENTE, DOCUMENTO_CLIENTE, ID_USUARIO)
    VALUES
    (p_nombre, p_apellido, 'CC', FLOOR(RAND()*1000000000), 1);
END //

-- 17. Actualizar precio de un producto
-- Beneficio: permite modificar precios fácilmente
CREATE PROCEDURE sp_actualizar_precio(
    IN p_id INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    UPDATE PRODUCTOS
    SET PRECIO = p_precio
    WHERE ID = p_id;
END //

-- 18. Actualizar stock de un producto
-- Beneficio: permite mantener actualizado el inventario
CREATE PROCEDURE sp_actualizar_stock(
    IN p_id INT,
    IN p_stock INT
)
BEGIN
    UPDATE PRODUCTOS
    SET STOCK = p_stock
    WHERE ID = p_id;
END //

-- 19. Eliminar producto de favoritos
-- Beneficio: permite gestionar los productos favoritos
CREATE PROCEDURE sp_eliminar_favorito(
    IN p_usuario INT,
    IN p_producto INT
)
BEGIN
    DELETE FROM FAVORITOS
    WHERE ID_USUARIO = p_usuario
    AND ID_PRODUCTO = p_producto;
END //

-- 20. Mostrar ventas entre dos fechas
-- Beneficio: permite generar reportes por periodo
CREATE PROCEDURE sp_ventas_por_fecha(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT *
    FROM VENTAS
    WHERE DATE(FECHA_VENTA) BETWEEN p_fecha_inicio AND p_fecha_fin;
END //

DELIMITER ;

-- Llamadas

CALL sp_mostrar_productos();

CALL sp_buscar_producto(1);

CALL sp_actualizar_precio(1, 130000);

CALL sp_ventas_por_fecha('2025-01-01','2025-01-31');