CREATE OR REPLACE PROCEDURE mover_efectivo(
    p_id_boveda_origen IN INTEGER,
    p_id_boveda_destino IN INTEGER,
    p_monto IN NUMBER
) AS efectivo_disponible NUMBER;
BEGIN
    
    SELECT efectivo_disponible INTO efectivo_disponible 
    FROM bovedas WHERE id_boveda = p_id_boveda_origen;

    IF efectivo_disponible >= p_monto THEN

        UPDATE bovedas
        SET efectivo_disponible = efectivo_disponible - p_monto
        WHERE id_boveda = p_id_boveda_origen;

        UPDATE bovedas
        SET efectivo_disponible = efectivo_disponible + p_monto
        WHERE id_boveda = p_id_boveda_destino;

        INSERT INTO traninterbs (id_boveda_origen, id_boveda_destino, monto, fecha)
        VALUES (p_id_boveda_origen, p_id_boveda_destino, p_monto, SYSDATE);
        
        COMMIT;
    ELSE
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Efectivo insuficiente en la bóveda de origen.');
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'No se encontró la cuenta con el id con el ID proporcionado.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Ocurrió un error inesperado: ' || SQLERRM);

END;

