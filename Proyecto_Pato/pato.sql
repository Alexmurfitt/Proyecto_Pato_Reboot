CREATE DATABASE PATO2;
use PATO2;
CREATE TABLE `Personas` (
	`persona_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(255),
	`apellidos` VARCHAR(255),
	`rol` ENUM('Profesor Reeboot', 'Alumno Reboot', 'Limpiadora', 'Directora Reeboot', 'Policía', 'Portero', 'Joyero', 'Dependiente', 'Cajera', 'Repartidor'),
	`inventario_id` INTEGER,
	`color_pelo` ENUM('negro', 'rubio', 'pelirrojo'),
	`altura` ENUM('alto', 'medio', 'bajo'),
	`constitucion` ENUM('fuerte', 'normal', 'delagada'),
	PRIMARY KEY(`persona_id`)
);

CREATE TABLE `Registro_Reboot` (
	`registro_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`persona_id` INTEGER NOT NULL,
	`fecha` DATE,
	`hora_entrada` TIME,
	`hora_salida` TIME,
	PRIMARY KEY(`registro_id`)
);

CREATE TABLE `Inventario` (
	`inventario_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`tamaño` ENUM('Pequeño', 'Mediano', 'Grande'),
	`volumen_cm3` INTEGER,
	`descripcion` VARCHAR(255),
	PRIMARY KEY(`inventario_id`)
);

CREATE TABLE `Declaraciones` (
	`declaraciones_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`persona_id` INTEGER,
	`declaracion` VARCHAR(255),
	PRIMARY KEY(`declaraciones_id`)
);

CREATE TABLE `Ubicacion_Persona` (
	`up_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`persona_id` INTEGER,
	`lugar_id` INTEGER,
	`desde` TIME,
	`hasta` TIME,
	PRIMARY KEY(`up_id`)
);

CREATE TABLE `Lugares` (
	`lugar_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	`hora_apertura` TIME,
	`hora_cierre` TIME,
	PRIMARY KEY(`lugar_id`)
);

CREATE TABLE `Detalle_Tienda` (
	`tienda_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`fecha_transaccion` DATE,
	`oro_ingresado` INTEGER,
	`descripcion_persona` VARCHAR(255),
	`ticket` INTEGER,
	`lugar_id` INTEGER,
	`trabajador_id` INTEGER,
	PRIMARY KEY(`tienda_id`)
);

ALTER TABLE `Personas`
ADD FOREIGN KEY(`inventario_id`) REFERENCES `Inventario`(`inventario_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Registro_Reboot`
ADD FOREIGN KEY(`persona_id`) REFERENCES `Personas`(`persona_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Declaraciones`
ADD FOREIGN KEY(`persona_id`) REFERENCES `Personas`(`persona_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Ubicacion_Persona`
ADD FOREIGN KEY(`persona_id`) REFERENCES `Personas`(`persona_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Ubicacion_Persona`
ADD FOREIGN KEY(`lugar_id`) REFERENCES `Lugares`(`lugar_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Detalle_Tienda`
ADD FOREIGN KEY(`lugar_id`) REFERENCES `Lugares`(`lugar_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Detalle_Tienda`
ADD FOREIGN KEY(`trabajador_id`) REFERENCES `Personas`(`persona_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Insertando inventarios (mochilas)
INSERT INTO Inventario (tamaño, volumen_cm3, descripcion) VALUES
('Grande', 50, 'Mochila negra grande'),
('Mediano', 40, 'Mochila azul mediana'),
('Mediano', 40, 'Mochila azul mediana'),
('Pequeño', 30, 'Mochila roja pequeña'),
('Pequeño', 30, 'Bolso pequeño de cuero');

-- Insertando personas
INSERT INTO Personas (nombre, apellidos, rol, inventario_id, color_pelo, altura, constitucion) VALUES
('Rafiki', 'Ndiaye', 'Alumno Reboot', 1, 'negro', 'alto', 'delagada'),
('Mustafa', 'Jimenez', 'Alumno Reboot', 2, 'negro', 'bajo', 'fuerte'),
('Simba', 'Hernandez', 'Alumno Reboot', 3, 'negro', 'alto', 'delagada'),
('Mufasa', 'Lion', 'Alumno Reboot', 4, 'rubio', 'medio', 'delagada'),
('Nala', 'Ndiaye', 'Alumno Reboot', 5, 'pelirrojo', 'alto', 'fuerte'),
('Juan', 'Pérez', 'Profesor Reeboot', NULL, 'rubio', 'medio', 'normal'),
('María', 'López', 'Directora Reeboot', NULL, 'pelirrojo', 'bajo', 'fuerte'),
('Carlos', 'Gómez', 'Portero', NULL, 'negro', 'alto', 'fuerte'),
('Ana', 'Fernández', 'Joyero', NULL, 'rubio', 'medio', 'delagada'),
('David', 'Martínez', 'Dependiente', NULL, 'negro', 'bajo', 'normal');
INSERT INTO Personas (nombre, apellidos, rol, inventario_id, color_pelo, altura, constitucion) VALUES
('Jose', 'Martinez', 'Joyero', NULL, 'negro', 'medio', 'fuerte'),
('George', 'Smith', 'Joyero', NULL, 'rubio', 'alto', 'delagada');


-- Insertando lugares
INSERT INTO Lugares (name, hora_apertura, hora_cierre) VALUES
('Reboot Academy', '08:00:00', '18:00:00'),
('SPAR Ripoche', '10:00:00', '21:00:00'),
('Cafeteria Lanzarote', '08:00:00', '22:00:00'),
('Compro Oro 1', '09:00:00', '20:00:00'),
('Compro Oro 2', '09:00:00', '20:00:00'),
('Compro Oro 3', '09:00:00', '20:00:00');

-- Insertando registros de entrada y salida de Rafiki
INSERT INTO Registro_Reboot (persona_id, fecha, hora_entrada, hora_salida) VALUES
(1, '2025-03-10', '09:00:00', '16:00:00'),
(1, '2025-03-11', '09:00:00', '16:00:00'),
(1, '2025-03-12', '09:00:00', '16:00:00'),
(1, '2025-03-13', '09:00:00', '16:00:00'),
(1, '2025-03-14', '09:00:00', '16:00:00'),
-- 
(2, '2025-03-10', '09:00:00', '16:00:00'),
(2, '2025-03-11', '09:00:00', '16:00:00'),
(2, '2025-03-13', '09:00:00', '16:00:00'),
(2, '2025-03-14', '09:00:00', '16:00:00'),
-- 
(3, '2025-03-10', '09:00:00', '16:00:00'),
(3, '2025-03-11', '09:00:00', '16:00:00'),
(3, '2025-03-12', '09:00:00', '16:00:00'),
(3, '2025-03-13', '09:00:00', '16:00:00'),
(3, '2025-03-14', '09:00:00', '16:00:00'),
-- 
(4, '2025-03-10', '09:00:00', '16:00:00'),
(4, '2025-03-11', '09:00:00', '16:00:00'),
(4, '2025-03-12', '09:00:00', '16:00:00'),
(4, '2025-03-13', '09:00:00', '16:00:00'),
-- 
(5, '2025-03-10', '09:00:00', '16:00:00'),
(5, '2025-03-11', '09:00:00', '16:00:00'),
(5, '2025-03-12', '09:00:00', '16:00:00'),
(5, '2025-03-13', '09:00:00', '16:00:00'),
(5, '2025-03-14', '09:00:00', '16:00:00'),
-- 
(6, '2025-03-10', '08:00:00', '16:00:00'),
(6, '2025-03-11', '08:00:00', '16:00:00'),
(6, '2025-03-12', '08:00:00', '16:00:00'),
(6, '2025-03-13', '08:00:00', '16:00:00'),
(6, '2025-03-14', '08:00:00', '16:00:00'),
-- 
(7, '2025-03-10', '10:00:00', '14:00:00'),
(7, '2025-03-11', '10:00:00', '14:00:00'),
(7, '2025-03-12', '10:00:00', '14:00:00'),
(7, '2025-03-13', '10:00:00', '14:00:00'),
(7, '2025-03-14', '10:00:00', '14:00:00');


-- Insertando ubicaciones
INSERT INTO Ubicacion_Persona (persona_id, lugar_id, desde, hasta) VALUES
(1, 1, '13:00:00', '13:30:00'), 
(1, 4, '13:30:00', '13:40:00'), 
(1, 5, '13:40:00', '13:50:00'), 
(1, 6, '13:50:00', '14:00:00'), 
(2, 1, '13:00:00', '14:00:00'), 
(3, 1, '13:00:00', '13:15:00'), 
(3, 2, '13:15:00', '14:00:00'), 
(4, 2, '13:00:00', '14:00:00'), 
(5, 3, '13:00:00', '14:00:00'), 
(6, 1, '13:00:00', '13:15:00'), 
(6, 3, '13:15:00', '14:00:00'),
(7, 5, '13:00:00', '14:00:00'), 
(8, 1, '13:00:00', '14:30:00'), 
(8, 1, '13:30:00', '13:45:00'), 
(8, 1, '13:45:00', '14:00:00'), 
(9, 4, '13:00:00', '14:00:00'), 
(10, 3, '13:00:00', '14:00:00'), 
(11, 3, '13:00:00', '14:00:00'), 
(12, 2, '13:00:00', '14:00:00');

-- Insertando transacciones de oro (Rafiki vendiendo el oro en partes)
INSERT INTO Detalle_Tienda (fecha_transaccion, oro_ingresado, descripcion_persona, ticket, lugar_id, trabajador_id) VALUES
('2025-03-12', 150, 'Joven alto y de complexion delgada', 1001, 4, 9),
('2025-03-12', 150, 'Joven alto y de complexion delgada', 1001, 4, 9),
('2025-03-12', 150, 'Joven alto y de complexion delgada', 1001, 4, 9),
('2025-03-12', 150, 'Joven alto y de complexion delgada', 1001, 5, 11),
('2025-03-12', 200, 'Joven alto y de complexion delgada', 1001, 5, 11),
('2025-03-12', 200, 'Joven alto y de complexion delgada', 1001, 6, 12),
-- 
('2025-03-12', 100, 'Joven alto y fuerte', 1002, 4, 9),
('2025-03-12', 100, 'Joven alto y fuerte', 1002, 4, 9),
('2025-03-12', 100, 'Joven alto y fuerte', 1002, 4, 9),
('2025-03-12', 100, 'Joven alto y fuerte', 1002, 5, 11),
('2025-03-12', 100, 'Joven alto y fuerte', 1002, 5, 11),
('2025-03-12', 100, 'Joven alto y fuerte', 1002, 5, 11),
-- 
('2025-03-12', 800, 'Joven bajo y fuerte', 1003, 6, 12);

-- Insertando declaraciones
INSERT INTO Declaraciones (persona_id, declaracion) VALUES
(1, 'Me quede todo el día en clases'),
(2, 'Estuve todo el rato en la academia y creo recordar que alguién más estuvo por ahí.'),
(3, 'Estuve solo un ratito en la academia y luego me fui a comprar al Spar.'),
(4, 'Fui al Spar y me encontré con un compañero'),
(5, 'Fui a merendar a la cafetería'),
(6, 'Estuve en clases y luego me fui a la cafetería y vi a un compañero'),
(7, 'Fui a la joyería a vender mi anillo de boda junto al resto de mis joyas'),
(8, 'Estuve en la academia, salí a tomar un café y volví'),
(9, 'Una persona vino varias veces para vender oro.'), -- Joyero
(10, 'Estuve en el trabajo y vi a varios alumnos de reboot'), -- Spar
(11, 'Hubo una persona que vino muchas veces a vender oro'), -- Joyero
(12, 'Un joven alto y delgado vendió oro en varias ocasiones. Además, un compañero me dijo que habia hecho muchas ventas a un solo cliente.'); -- Joyero

-- Primero se verifica cuantas personas fueron a clase a clase.
SELECT distinct Personas.*, Registro_Reboot.fecha from Personas
inner join Registro_Reboot on Registro_Reboot.persona_id = Personas.persona_id
where  Registro_Reboot.fecha = '2025-03-12';
-- Luego se verifica cuantas personas se quedaron en clase durante el descanso
--
