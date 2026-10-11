	-- Pre-Entrega 5. Carlos Rodriguez Villa

USE Ventas_Tech_DB

-- Consulta 1. Vista base del proyecto

SELECT
v.id_venta,
v.fecha_venta AS Fecha_Venta,
c.id_cliente,
c.nombre AS Cliente,
c.ciudad AS Región,
p.nombre_producto AS Producto,
cat.nombre_categoria AS Categoria,
v.cantidad AS Cantidad,
v.precio_unitario AS Precio_Unitario,
v.cantidad * v.precio_unitario AS Total_Venta
FROM ventas AS v
INNER JOIN clientes   AS c   ON v.id_cliente   = c.id_cliente
INNER JOIN productos  AS p   ON v.id_producto  = p.id_producto
INNER JOIN categorias AS cat ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta, v.id_venta

-- Consulta 2. Clientes sin ventas (LEFT JOIN)

SELECT
c.nombre AS Nombre_Cliente,
c.email AS Email,
c.fecha_registro AS Fecha_Registro
FROM clientes AS c
LEFT JOIN ventas AS v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL

-- Consulta 3. Productos sin ventas (LEFT JOIN)

SELECT
p.nombre_producto AS Nombre_Producto,
cat.nombre_categoria AS Categoria,
p.precio AS Precio
FROM productos AS p
INNER JOIN categorias AS cat ON p.id_categoria = cat.id_categoria
LEFT JOIN  ventas     AS v   ON p.id_producto  = v.id_producto
WHERE v.id_venta IS NULL

-- Consulta 4. Consolidado por canal (UNION ALL) -- Ventas por Fecha/Mes

SELECT
fecha_venta AS Fecha ,
SUM(precio_unitario * cantidad) AS Total,
'Ventas Marzo' AS Canal
FROM ventas
WHERE fecha_venta BETWEEN '2024-03-01' AND '2024-03-31'
GROUP BY fecha_venta

UNION ALL

SELECT
fecha_venta AS Fecha,
SUM(precio_unitario * cantidad) AS Total,
'Ventas Abril' AS Canal
FROM ventas
WHERE fecha_venta BETWEEN '2024-04-01' AND '2024-04-30' 
GROUP BY fecha_venta

UNION ALL

SELECT
fecha_venta AS Fecha,
SUM(precio_unitario * cantidad) AS Total,
'Ventas Mayo' AS Canal
FROM ventas
WHERE fecha_venta BETWEEN '2024-05-01' AND '2024-05-31' 
GROUP BY fecha_venta
