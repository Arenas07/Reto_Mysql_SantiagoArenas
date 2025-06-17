USE ventas;

SELECT cl.id, cl.nombre, COUNT(pe.id) AS Total_pedidos
FROM cliente cl
INNER JOIN pedido pe ON cl.id = pe.id_cliente
WHERE cl.id = 1
GROUP BY cl.id, cl.nombre;

SELECT co.id, SUM(comision) AS Total_ganado
FROM comercial co
GROUP BY co.id;

SELECT cl.id, cl.nombre, COUNT(pe.id) AS Total_pedidos
FROM cliente cl
INNER JOIN pedido pe ON cl.id = pe.id_cliente
GROUP BY cl.id, cl.nombre
ORDER BY Total_pedidos DESC
LIMIT 1;

SELECT COUNT(*) AS pedidos_realizados
FROM pedido
WHERE YEAR(fecha) = 2024

SELECT cl.id, cl.nombre, AVG(pe.total) AS total_promedio
FROM cliente cl
INNER JOIN pedido pe ON pe.id_cliente = cl.id
GROUP BY cl.id, cl.nombre;