	-- Pre-Entrega 4. Carlos Rodriguez Villa

-- Nota: Se añadió más datos en la tabla ventas para realizar consultas en mayor lapsos de tiempo (En total 20 registros)

USE Ventas_Tech_DB;

-- Consulta 1. Resumen ejecutivo mensual

SELECT 
SUM (cantidad * precio_unitario) AS Total_Facturado,
COUNT (id_venta) AS Cantidad_de_Pedidos,
AVG (cantidad * precio_unitario) AS Ticket_Promedio,
MONTH (fecha_venta) AS Mes
FROM ventas
GROUP BY MONTH (fecha_venta)
ORDER BY Mes ASC

-- Consulta 2. Ranking de productos

SELECT TOP 5 id_producto,
SUM (cantidad) AS Unidades_Vendidas,
SUM (cantidad*precio_unitario) AS Total_Generado
FROM ventas
GROUP BY id_producto
ORDER BY Total_Generado DESC

-- Consulta 3. Clientes recurrentes

SELECT id_cliente,
COUNT (*) AS Cantidad_Pedidos,
SUM (cantidad*precio_unitario) AS Total_Gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT (*) > 1
ORDER BY Total_Gastado DESC

-- Consulta 4. Meses por encima/por debajo del promedio

SELECT
MONTH (fecha_venta) AS Mes,
SUM (cantidad*precio_unitario) AS Total_Facturado,
CASE WHEN
SUM (cantidad*precio_unitario) > (SELECT AVG (total_mes)
FROM ( SELECT SUM (cantidad*precio_unitario) AS Total_Mes
FROM ventas 
GROUP BY MONTH (fecha_venta))
AS subconsulta)
THEN 'Por Encima' ELSE 'Por Debajo'
END AS Comparacion
FROM ventas
GROUP BY MONTH (fecha_venta)
ORDER BY Mes ASC

-- HALLAZGOS
-- 1. El producto 1 es el que mayor facturación representa, con un total de $7.200 representando un 56% del total generado
-- 2. De los clientes con mayor gasto fue el 1, con 4 pedidos y un total de $5.280 gastado entre los meses de Marzo a Mayo
-- 3. El mes con mayor facturación fue en Marzo (3) con un total de $6.444 representando un 50% del total general
