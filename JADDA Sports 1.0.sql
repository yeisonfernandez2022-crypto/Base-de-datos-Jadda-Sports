CREATE DATABASE TIENDA_DEPORTIVA;
USE TIENDA_DEPORTIVA;

CREATE TABLE USUARIOS (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_USUARIO VARCHAR(100),
    APELLIDO_USUARIO VARCHAR(100),
    EMAIL VARCHAR(100) UNIQUE,
    USUARIO VARCHAR(100) UNIQUE,
    CONTRASENA VARCHAR(255),
    FECHA_REGISTRO DATE
);

INSERT INTO USUARIOS (NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL, USUARIO, CONTRASENA, FECHA_REGISTRO)
VALUES
('Laura', 'Ramírez', 'laura.ramirez@mail.com', 'laura.ramirez', 'clave123', '2024-02-01'),
('Carlos', 'Martínez', 'carlos.martinez@mail.com', 'carlos.martinez', 'clave123', '2023-11-15'),
('María', 'González', 'maria.gonzalez@mail.com', 'maria.gonzalez', 'clave123', '2023-10-20'),
('Andrés', 'Pérez', 'andres.perez@mail.com', 'andres.perez', 'clave123', '2025-01-10'),
('Valentina', 'Morales', 'valentina.morales@mail.com', 'valentina.morales', 'clave123', '2022-08-30'),
('Javier', 'Suárez', 'javier.suarez@mail.com', 'javier.suarez', 'clave123', '2024-06-05'),
('Camila', 'Castro', 'camila.castro@mail.com', 'camila.castro', 'clave123', '2025-03-18'),
('Esteban', 'Vargas', 'esteban.vargas@mail.com', 'esteban.vargas', 'clave123', '2023-05-22'),
('Natalia', 'Ortega', 'natalia.ortega@mail.com', 'natalia.ortega', 'clave123', '2024-12-12'),
('Mateo', 'López', 'mateo.lopez@mail.com', 'mateo.lopez', 'clave123', '2023-09-09');

CREATE TABLE CLIENTES (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_CLIENTE VARCHAR(200),
    APELLIDO_CLIENTE VARCHAR(200),
    TIPODO_CLIENTE VARCHAR(2),
    DOCUMENTO_CLIENTE INT,
    DIRECCION_CLIENTE VARCHAR(100),
    TELEFONO_CLIENTE VARCHAR(15),
    ID_USUARIO INT,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO)
);

INSERT INTO CLIENTES (NOMBRE_CLIENTE, APELLIDO_CLIENTE, TIPODO_CLIENTE, DOCUMENTO_CLIENTE, DIRECCION_CLIENTE, TELEFONO_CLIENTE, ID_USUARIO)
VALUES
('Laura', 'Ramírez', 'CC', 1012345678, 'Cra 10 #20-30', '3123456790', 1),
('Carlos', 'Martínez', 'TI', 1023456789, 'Calle 45 #5-10', '3101234567', 2),
('María', 'González', 'CC', 1034567890, 'Av 9 #12-34', '3119876543', 3),
('Andrés', 'Pérez', 'CC', 1045678901, 'Cra 3 #33-21', '3198765432', 4),
('Valentina', 'Morales', 'CE', 1056789012, 'Calle 90 #45-67', '3156789012', 5),
('Javier', 'Suárez', 'CC', 1067890123, 'Transv 12 #8-56', '3167890123', 6),
('Camila', 'Castro', 'TI', 1078901234, 'Diagonal 5 #6-78', '3178901234', 7),
('Esteban', 'Vargas', 'CE', 1089012345, 'Av 6 #9-65', '3189012345', 8),
('Natalia', 'Ortega', 'CC', 1090123456, 'Cra 2 #14-90', '3134567890', 9),
('Mateo', 'López', 'TI', 1101234567, 'Calle 23 #17-55', '3145678901', 10);


CREATE TABLE PROVEEDORES (
    ID_PROVEEDOR INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_PROVEEDOR VARCHAR(200),
    TELEFONO_PROVEEDOR VARCHAR(15),
    EMAIL_PROVEEDOR VARCHAR(100),
    DIRECCION_PROVEEDOR VARCHAR(255),
    CONTACTO_PROVEEDOR VARCHAR(100),
    NIT VARCHAR (15)
);

INSERT INTO PROVEEDORES (NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, EMAIL_PROVEEDOR, DIRECCION_PROVEEDOR, CONTACTO_PROVEEDOR, NIT)
VALUES
('Deportes Total S.A.', '3114567890', 'contacto@deportestotal.com', 'Calle 45 #32-18, Bogotá', 'Luis Martínez',"10764573"),
('Distribuciones Olímpicas', '3001234567', 'ventas@olimpicas.com', 'Cra 12 #45-67, Medellín', 'Laura Gómez',"10748493"),
('Fitness Colombia Ltda.', '3109876543', 'soporte@fitnessco.com', 'Av 68 #20-55, Cali', 'Carlos Ríos',"16473454"),
('Indeportes Nacional', '3187654321', 'info@indeportes.com', 'Transv 7 #100-20, Barranquilla', 'Ana Salazar',"10568364"),
('Atléticos del Norte', '3012345678', 'pedidos@atleticosnorte.com', 'Calle 80 #9-45, Bucaramanga', 'Mario Castaño',"10637503"),
('ProSport Equipos SAS', '3123456789', 'clientes@prosport.com', 'Cra 20 #15-10, Cartagena', 'Sandra Méndez',"10359743"),
('Mega Deportes E.U.', '3191234567', 'contacto@megadeportes.com', 'Calle 60 #13-25, Pereira', 'Julián Herrera',"10547392"),
('Zona Sport S.A.S.', '3145678910', 'info@zonasport.com', 'Av 1 #90-12, Manizales', 'Paula Ramírez',"10947382"),
('Distribuidora Running', '3134567890', 'ventas@running.com', 'Carrera 10 #12-10, Ibagué', 'Fernando Díaz',"10846382"),
('Suministros Fit S.A.', '3156789123', 'admin@suministrosfit.com', 'Calle 34 #5-67, Armenia', 'Liliana Vargas',"10407394");


CREATE TABLE PRODUCTOS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(255),
    MARCA VARCHAR(100),
    COLOR VARCHAR(50),
    TALLA VARCHAR (4),
    CATEGORIA VARCHAR(100),
    PRECIO FLOAT,
    STOCK INT,
    DESCRIPCION TEXT,
    ID_PROVEEDOR INT,
    FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR)
);
INSERT INTO PRODUCTOS (NOMBRE, MARCA, COLOR, TALLA, CATEGORIA, PRECIO, STOCK, DESCRIPCION, ID_PROVEEDOR)
VALUES
('Balón de fútbol', 'Adidas', 'Blanco', '5.0', 'Fútbol', 89900.00, 50, 'Balón profesional de alta resistencia.', 1),
('Zapatillas deportivas', 'Nike', 'Negro', '42', 'Calzado', 199900.00, 30, 'Zapatillas para entrenamiento diario.', 2),
('Guantes de boxeo', 'Everlast', 'Rojo', '12.0', 'Boxeo', 145000.00, 20, 'Guantes acolchados para protección.', 3),
('Pesas de 10kg', 'BodyFit', 'Gris', '10', 'Gimnasio', 80000.00, 40, 'Pesas individuales con recubrimiento.', 4),
('Camiseta deportiva', 'Puma', 'Azul', 'M', 'Ropa', 59000.00, 100, 'Camiseta con tecnología dry fit.', 5),
('Raqueta de tenis', 'Wilson', 'Negro', '3.0', 'Tenis', 250000.00, 15, 'Raqueta ligera de alto rendimiento.', 6),
('Bicicleta de montaña', 'Trek', 'Verde', '29', 'Ciclismo', 1200000.00, 10, 'Bicicleta con doble suspensión.', 7),
('Casco para ciclismo', 'Giro', 'Blanco', '20', 'Accesorios', 130000.00, 25, 'Casco ajustable y ventilado.', 8),
('Short deportivo', 'Reebok', 'Gris', 'S', 'Ropa', 45000.00, 80, 'Short con bolsillos laterales.', 9),
('Mat de yoga', 'Manduka', 'Morado', '1.0', 'Yoga', 99000.00, 35, 'Mat antideslizante de 6mm.', 10);

CREATE TABLE INVENTARIO (
    ID_INVENTARIO INT PRIMARY KEY AUTO_INCREMENT,
    ID_PRODUCTO INT,
    CANTIDAD INT,
    FECHA_INGRESO DATE,
    FECHA_ACTUALIZACION DATE,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);
INSERT INTO INVENTARIO (ID_PRODUCTO, CANTIDAD, FECHA_INGRESO, FECHA_ACTUALIZACION)
VALUES
(1, 50, '2025-05-01', '2025-06-20'),
(2, 30, '2025-04-15', '2025-06-18'),
(3, 20, '2025-03-10', '2025-06-10'),
(4, 40, '2025-06-01', '2025-06-25'),
(5, 100, '2025-05-20', '2025-06-22'),
(6, 15, '2025-02-28', '2025-06-21'),
(7, 10, '2025-03-15', '2025-06-24'),
(8, 25, '2025-04-10', '2025-06-23'),
(9, 80, '2025-05-05', '2025-06-19'),
(10, 35, '2025-04-01', '2025-06-20');

CREATE TABLE EMPLEADOS (
    ID_EMPLEADO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_EMPLEADO VARCHAR(100),
    APELLIDO_EMPLEADO VARCHAR(100),
    CARGO VARCHAR(100),
    FECHA_CONTRATACION DATE,
    TELEFONO VARCHAR(15),
    EMAIL VARCHAR(100)
);
INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO, FECHA_CONTRATACION, TELEFONO, EMAIL)
VALUES
('Andrés', 'Salazar', 'Cajero', '2023-01-15', '3112345678', 'andres.salazar@tiendadp.com'),
('Lucía', 'Gómez', 'Vendedor', '2022-11-01', '3123456789', 'lucia.gomez@tiendadp.com'),
('Camilo', 'Ramírez', 'Administrador', '2021-07-20', '3134567890', 'camilo.ramirez@tiendadp.com'),
('Marta', 'Herrera', 'Cajero', '2023-06-10', '3145678901', 'marta.herrera@tiendadp.com'),
('Diana', 'Ortega', 'Gerente', '2020-08-05', '3156789012', 'diana.ortega@tiendadp.com'),
('Sebastián', 'Moreno', 'Cajero', '2022-03-17', '3167890123', 'sebastian.moreno@tiendadp.com'),
('Jorge', 'Pérez', 'Bodeguero', '2021-12-12', '3178901234', 'jorge.perez@tiendadp.com'),
('Paula', 'Rojas', 'Vendedor', '2024-01-09', '3189012345', 'paula.rojas@tiendadp.com'),
('Manuel', 'Castaño', 'Administrador', '2019-09-25', '3190123456', 'manuel.castano@tiendadp.com'),
('Tatiana', 'Vargas', 'Cajero', '2025-02-01', '3201234567', 'tatiana.vargas@tiendadp.com');

CREATE TABLE VENTAS (
    ID_VENTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_CLIENTE INT,
    ID_EMPLEADO INT,
    FECHA_VENTA DATETIME,
    TOTAL FLOAT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
    FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS(ID_EMPLEADO)
);
INSERT INTO VENTAS (ID_CLIENTE, ID_EMPLEADO, FECHA_VENTA, TOTAL)
VALUES
(1, 3, '2025-06-01 10:15:30', 180000),
(2, 5, '2025-06-02 14:20:45', 299900),
(3, 1, '2025-06-03 09:50:10', 145000),
(4, 2, '2025-06-04 11:40:00', 80000),
(5, 4, '2025-06-05 16:10:25', 59000),
(6, 6, '2025-06-06 13:35:50', 380000),
(7, 7, '2025-06-07 15:00:00', 130000),
(8, 8, '2025-06-08 17:25:15', 45000),
(9, 9, '2025-06-09 18:40:40', 99000),
(10, 10, '2025-06-10 12:05:05', 1200000);

CREATE TABLE DETALLE_VENTAS (
    ID_DETALLE INT PRIMARY KEY AUTO_INCREMENT,
    ID_VENTA INT,
    ID_PRODUCTO INT,
    CANTIDAD INT,
    PRECIO_UNITARIO FLOAT,
    SUBTOTAL FLOAT,
    FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID_VENTA),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);
INSERT INTO DETALLE_VENTAS (ID_VENTA, ID_PRODUCTO, CANTIDAD, PRECIO_UNITARIO, SUBTOTAL)
VALUES
(1, 1, 2, 89900, 179800),
(2, 2, 1, 199900, 199900),
(3, 3, 1, 145000, 145000),
(4, 4, 1, 80000, 80000),
(5, 5, 1, 59000, 59000),
(6, 6, 1, 250000, 250000),
(7, 8, 1, 130000, 130000),
(8, 9, 1, 45000, 45000),
(9, 10, 1, 99000, 99000),
(10, 7, 1, 1200000, 1200000);

CREATE TABLE STAFF (
    ID_STAFF INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_STAFF VARCHAR(100),
    APELLIDO_STAFF VARCHAR(100),
    AREA VARCHAR(100),
    HORARIO VARCHAR(100)
);
INSERT INTO STAFF (NOMBRE_STAFF, APELLIDO_STAFF, AREA, HORARIO)
VALUES
('Lorena', 'Medina', 'Atención al Cliente', '08:00 - 17:00'),
('Ricardo', 'López', 'Bodega', '07:00 - 16:00'),
('María', 'Castillo', 'Administración', '09:00 - 18:00'),
('Fernando', 'Muñoz', 'Ventas', '10:00 - 19:00'),
('Sandra', 'Ramírez', 'Contabilidad', '08:00 - 17:00'),
('David', 'Torres', 'Almacén', '06:00 - 15:00'),
('Andrea', 'Reyes', 'Atención al Cliente', '09:00 - 18:00'),
('Carlos', 'Martínez', 'Sistemas', '07:00 - 16:00'),
('Natalia', 'Ortiz', 'Ventas', '10:00 - 19:00'),
('Javier', 'Gómez', 'Logística', '06:00 - 15:00');

CREATE TABLE FAVORITOS (
    ID_FAVORITO INT PRIMARY KEY AUTO_INCREMENT,
    ID_USUARIO INT,
    ID_PRODUCTO INT,
    FECHA_AGREGADO DATE,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
);
INSERT INTO FAVORITOS (ID_USUARIO, ID_PRODUCTO, FECHA_AGREGADO)
VALUES
(1, 3, '2025-06-01'),
(2, 5, '2025-06-02'),
(3, 7, '2025-06-03'),
(4, 2, '2025-06-04'),
(5, 1, '2025-06-05'),
(6, 4, '2025-06-06'),
(7, 6, '2025-06-07'),
(8, 8, '2025-06-08'),
(9, 9, '2025-06-09'),
(10, 10, '2025-06-10');


-- Actividad 3
-- usuarios
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_usuario(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_usuario VARCHAR(100),
    IN p_contrasena VARCHAR(255),
    IN p_fecha DATE
)
BEGIN
    INSERT INTO USUARIOS(NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL, USUARIO, CONTRASENA, FECHA_REGISTRO)
    VALUES(p_nombre, p_apellido, p_email, p_usuario, p_contrasena, p_fecha);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_usuario(
    IN p_id INT,
    IN p_email VARCHAR(100)
)
BEGIN
    UPDATE USUARIOS SET EMAIL = p_email WHERE ID_USUARIO = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_usuario(IN p_id INT)
BEGIN
    DELETE FROM USUARIOS WHERE ID_USUARIO = p_id;
END $$
DELIMITER ;



-- clientes
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_cliente(
    IN p_nombre VARCHAR(200),
    IN p_apellido VARCHAR(200),
    IN p_tipo VARCHAR(2),
    IN p_doc INT,
    IN p_dir VARCHAR(100),
    IN p_tel VARCHAR(15),
    IN p_usuario INT
)
BEGIN
    INSERT INTO CLIENTES(NOMBRE_CLIENTE, APELLIDO_CLIENTE, TIPODO_CLIENTE, DOCUMENTO_CLIENTE, DIRECCION_CLIENTE, TELEFONO_CLIENTE, ID_USUARIO)
    VALUES(p_nombre, p_apellido, p_tipo, p_doc, p_dir, p_tel, p_usuario);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_cliente(
    IN p_id INT,
    IN p_tel VARCHAR(15)
)
BEGIN
    UPDATE CLIENTES SET TELEFONO_CLIENTE = p_tel WHERE ID_CLIENTE = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_cliente(IN p_id INT)
BEGIN
    DELETE FROM CLIENTES WHERE ID_CLIENTE = p_id;
END $$
DELIMITER ;



-- proveedores 
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_proveedor(
    IN p_nombre VARCHAR(200),
    IN p_tel VARCHAR(15),
    IN p_email VARCHAR(100),
    IN p_dir VARCHAR(255),
    IN p_contacto VARCHAR(100)
)
BEGIN
    INSERT INTO PROVEEDORES(NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, EMAIL_PROVEEDOR, DIRECCION_PROVEEDOR, CONTACTO_PROVEEDOR)
    VALUES(p_nombre, p_tel, p_email, p_dir, p_contacto);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_proveedor(
    IN p_id INT,
    IN p_tel VARCHAR(15)
)
BEGIN
    UPDATE PROVEEDORES SET TELEFONO_PROVEEDOR = p_tel WHERE ID_PROVEEDOR = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_proveedor(IN p_id INT)
BEGIN
    DELETE FROM PROVEEDORES WHERE ID_PROVEEDOR = p_id;
END $$
DELIMITER ;



-- productos
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_producto(
    IN p_nombre VARCHAR(255),
    IN p_marca VARCHAR(100),
    IN p_color VARCHAR(50),
    IN p_talla VARCHAR(4),
    IN p_categoria VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_descripcion TEXT,
    IN p_proveedor INT
)
BEGIN
    INSERT INTO PRODUCTOS(NOMBRE, MARCA, COLOR, TALLA, CATEGORIA, PRECIO, STOCK, DESCRIPCION, ID_PROVEEDOR)
    VALUES(p_nombre, p_marca, p_color, p_talla, p_categoria, p_precio, p_stock, p_descripcion, p_proveedor);
END $$
DELIMITER ;




-- inventario
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_inventario(
    IN p_producto INT,
    IN p_cantidad INT,
    IN p_ingreso DATE,
    IN p_actualizacion DATE
)
BEGIN
    INSERT INTO INVENTARIO(ID_PRODUCTO, CANTIDAD, FECHA_INGRESO, FECHA_ACTUALIZACION)
    VALUES(p_producto, p_cantidad, p_ingreso, p_actualizacion);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_inventario(
    IN p_id INT,
    IN p_cantidad INT
)
BEGIN
    UPDATE INVENTARIO SET CANTIDAD = p_cantidad WHERE ID_INVENTARIO = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_inventario(IN p_id INT)
BEGIN
    DELETE FROM INVENTARIO WHERE ID_INVENTARIO = p_id;
END $$
DELIMITER ;



-- empleados
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_empleado(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_cargo VARCHAR(100),
    IN p_fecha DATE,
    IN p_tel VARCHAR(15),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO EMPLEADOS(NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO, FECHA_CONTRATACION, TELEFONO, EMAIL)
    VALUES(p_nombre, p_apellido, p_cargo, p_fecha, p_tel, p_email);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_empleado(
    IN p_id INT,
    IN p_cargo VARCHAR(100)
)
BEGIN
    UPDATE EMPLEADOS SET CARGO = p_cargo WHERE ID_EMPLEADO = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_empleado(IN p_id INT)
BEGIN
    DELETE FROM EMPLEADOS WHERE ID_EMPLEADO = p_id;
END $$
DELIMITER ;



-- VENTAS
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_venta(
    IN p_cliente INT,
    IN p_empleado INT,
    IN p_fecha DATETIME,
    IN p_total DECIMAL(10,2)
)
BEGIN
    INSERT INTO VENTAS(ID_CLIENTE, ID_EMPLEADO, FECHA_VENTA, TOTAL)
    VALUES(p_cliente, p_empleado, p_fecha, p_total);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_venta(
    IN p_id INT,
    IN p_total DECIMAL(10,2)
)
BEGIN
    UPDATE VENTAS SET TOTAL = p_total WHERE ID_VENTA = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_venta(IN p_id INT)
BEGIN
    DELETE FROM VENTAS WHERE ID_VENTA = p_id;
END $$
DELIMITER ;






-- DETALLES_VENTAS
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_detalle(
    IN p_venta INT,
    IN p_producto INT,
    IN p_cantidad INT,
    IN p_precio DECIMAL(10,2),
    IN p_subtotal DECIMAL(10,2)
)
BEGIN
    INSERT INTO DETALLE_VENTAS(ID_VENTA, ID_PRODUCTO, CANTIDAD, PRECIO_UNITARIO, SUBTOTAL)
    VALUES(p_venta, p_producto, p_cantidad, p_precio, p_subtotal);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_detalle(
    IN p_id INT,
    IN p_cantidad INT
)
BEGIN
    UPDATE DETALLE_VENTAS SET CANTIDAD = p_cantidad WHERE ID_DETALLE = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_detalle(IN p_id INT)
BEGIN
    DELETE FROM DETALLE_VENTAS WHERE ID_DETALLE = p_id;
END $$
DELIMITER ;






-- STAF
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_staff(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_area VARCHAR(100),
    IN p_horario VARCHAR(100)
)
BEGIN
    INSERT INTO STAFF(NOMBRE_STAFF, APELLIDO_STAFF, AREA, HORARIO)
    VALUES(p_nombre, p_apellido, p_area, p_horario);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_staff(
    IN p_id INT,
    IN p_area VARCHAR(100)
)
BEGIN
    UPDATE STAFF SET AREA = p_area WHERE ID_STAFF = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_staff(IN p_id INT)
BEGIN
    DELETE FROM STAFF WHERE ID_STAFF = p_id;
END $$
DELIMITER ;



-- FAVORITOS
-- Insertar
DELIMITER $$
CREATE PROCEDURE insertar_favorito(
    IN p_usuario INT,
    IN p_producto INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO FAVORITOS(ID_USUARIO, ID_PRODUCTO, FECHA_AGREGADO)
    VALUES(p_usuario, p_producto, p_fecha);
END $$
DELIMITER ;

-- Modificar
DELIMITER $$
CREATE PROCEDURE actualizar_favorito(
    IN p_id INT,
    IN p_fecha DATE
)
BEGIN
    UPDATE FAVORITOS SET FECHA_AGREGADO = p_fecha WHERE ID_FAVORITO = p_id;
END $$
DELIMITER ;

-- Eliminar
DELIMITER $$
CREATE PROCEDURE eliminar_favorito(IN p_id INT)
BEGIN
    DELETE FROM FAVORITOS WHERE ID_FAVORITO = p_id;
END $$
DELIMITER ;