USE ventas;



DELIMITER //

CREATE FUNCTION fc_total_pedidos(p_cliente_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE _total INT;

    SELECT COUNT(pe.id) INTO _total
    FROM pedido pe
    WHERE pe.id_cliente = p_cliente_id;

    RETURN _total;
END //
DELIMITER ;
SELECT fc_total_pedidos(1) AS Total_pedidos;






DELIMITER //

CREATE FUNCTION fc_comision_total(p_comercial_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE _comision FLOAT;

    SELECT SUM(pe.total * co.comision) INTO _comision
    FROM comercial co
    INNER JOIN pedido pe ON pe.id_comercial = co.id
    WHERE co.id = p_comercial_id;

    RETURN _comision;
END //
DELIMITER ;
SELECT fc_comision_total(2) AS Comision_total;






DELIMITER //

CREATE FUNCTION fc_mayor_total()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE _id_cliente INT;

    SELECT id_cliente INTO _id_cliente
    FROM pedido
    GROUP BY id_cliente
    ORDER BY SUM(total) DESC
    LIMIT 1;

    RETURN _id_cliente;
END //
DELIMITER ;
SELECT fc_mayor_total() AS Cliente_mayor_total;






DELIMITER //

CREATE FUNCTION fc_pedidos_año(p_pedido_fecha INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE _total INT; 

    SELECT COUNT(id) INTO _total
    FROM pedido
    WHERE YEAR(fecha) = p_año;
    RETURN _total;
END //
DELIMITER ;
SELECT fc_pedidos_año(2024) AS Total_pedidos;





DELIMITER //
CREATE FUNCTION fc_promedio_pedidos()
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE _promedio FLOAT;   
    DECLARE _total_pedidos INT;
    DECLARE _total_clientes INT;
    SELECT COUNT(id) INTO _total_pedidos FROM pedido;
    SELECT COUNT(DISTINCT id_cliente) INTO _total_clientes FROM pedido;
    IF _total_clientes = 0 THEN
        SET _promedio = 0;
    ELSE
        SET _promedio = _total_pedidos / _total_clientes;        
    END IF;
    RETURN _promedio;
END //
DELIMITER ;

SELECT fc_promedio_pedidos_por_cliente() AS Promedio_pedidos;