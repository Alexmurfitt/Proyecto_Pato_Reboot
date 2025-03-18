USE Pato3;


-- Quienes han estado el día del robo en Reboot
SELECT p.nombre, rb.*
FROM registro_reboot rb
JOIN personas p ON p.persona_id = rb.persona_id
WHERE fecha = '2025-03-12';

-- Guardamos la lista de sospechosos
-- CREATE VIEW sospechosos AS
SELECT p.nombre, rb.*
FROM registro_reboot rb
JOIN personas p ON p.persona_id = rb.persona_id
WHERE fecha = '2025-03-12';

-- Donde ha estado la gente que fue ese día en determinada hora (Falta añadir fecha)
SELECT p.nombre, p.rol, up.*, l.name
FROM ubicacion_persona up
JOIN personas p ON p.persona_id = up.persona_id
JOIN lugares l ON l.lugar_id = up.lugar_id
WHERE p.persona_id IN (SELECT persona_id FROM sospechosos);

-- Quienes han estado en reboot durante el descanso de 13:00 a 14:00
-- CREATE VIEW Sospechosos_Reboot AS
SELECT p.*, up.lugar_id, up.desde, up.hasta, l.name
FROM ubicacion_persona up
JOIN personas p ON p.persona_id = up.persona_id
JOIN lugares l ON l.lugar_id = up.lugar_id
WHERE p.persona_id IN (SELECT persona_id FROM sospechosos) AND up.desde >= '13:00:00' AND up.hasta <='14:00:00' AND l.name = 'Reboot Academy'; -- mirar filtro

-- Revisamos las mochilas de los sospechosos que estuvieron en Reboot durante el descanso.
SELECT p.nombre, i.*
FROM inventario i
JOIN personas p ON p.inventario_id = i.inventario_id
WHERE p.persona_id IN (SELECT persona_id FROM Sospechosos_Reboot);

  -- Creamos vista
--  VIEW mochila_nombre AS
SELECT p.nombre, i.*
FROM inventario i
JOIN personas p ON p.inventario_id = i.inventario_id
WHERE p.persona_id IN (SELECT persona_id FROM Sospechosos_Reboot);

-- Comparamos el tamaño de la mochila con el volumen del pato
SELECT nombre, volumen_cm3 FROM mochila_nombre WHERE volumen_cm3 > 45;	-- Aqui ya tenemos a la persona

-- Miramos las declaraciones de los principales sospechosos
SELECT p.persona_id, p.nombre, d.declaracion
FROM declaraciones d
JOIN personas p ON p.persona_id = d.persona_id
WHERE p.nombre LIKE '%Rafiki%' OR p.nombre LIKE '%Pedro%' OR p.nombre LIKE '%Paco%';

-- Corroboramos las declaraciones
SELECT p.persona_id, p.nombre, d.declaracion
FROM declaraciones d
JOIN personas p ON p.persona_id = d.persona_id
WHERE p.nombre LIKE '%Matias%';

-- Se confirma de que una declaracion es cierta, miramos ubicaciones para corroborar.
-- CREATE VIEW comprobar_coartada AS
SELECT up.*, p.nombre, l.name
FROM ubicacion_persona up
JOIN personas p ON p.persona_id = up.persona_id
JOIN lugares l ON l.lugar_id = up.lugar_id
WHERE p.nombre LIKE '%Rafiki%' OR p.nombre LIKE '%Pedro%' OR p.nombre LIKE '%Paco%';

-- Creamos vista con los que han estado en la tienda de oro
-- CREATE VIEW persona_oro AS
SELECT * FROM comprobar_coartada
WHERE name LIKE '%Oro%' OR name LIKE '%Joyeria%';
-- Se detectan dos personas que han ido a un compra oro: Sospechosos 2 (Pedro y Rafiki)
-- Se revisa las tiendas que corresponden con el nombre de las ubicaciones
SELECT l.name, dt.*
FROM lugares l
JOIN detalle_tienda dt ON l.lugar_id = dt.lugar_id;
-- sumamos el oro ingresado
SELECT SUM(oro_ingresado) AS total_oro
FROM detalle_tienda
WHERE ticket = 1001;

SELECT SUM(oro_ingresado) AS total_oro
FROM detalle_tienda
WHERE ticket = 1002;
-- buscamos la declaracion de los que han vendido al ticket 1001
SELECT persona_id, declaracion FROM declaraciones
WHERE persona_id IN (SELECT trabajador_id FROM detalle_tienda WHERE ticket = '1001');
-- Buscamos las caracteristicas del ticket 1001 entre las personas quehan estado en el compra oro
SELECT nombre, color_pelo, altura, constitucion FROM personas
WHERE altura LIKE '%alto' AND constitucion LIKE 'delgada' AND nombre IN (SELECT nombre FROM persona_oro);
-- Solucionado
