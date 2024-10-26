CREATE OR REPLACE PROCEDURE mover_efectivo(
    p_id_boveda_origen IN INTEGER,
    p_id_boveda_destino IN INTEGER,
    p_monto IN NUMBER
) AS efectivo_disponible NUMBER;
BEGIN
    
    SELECT efectivo_disponible INTO efectivo_disponible 
    FROM BOVEDAS WHERE id_boveda = p_id_boveda_origen;

    IF efectivo_disponible >= p_monto THEN
        UPDATE BOVEDAS
        SET efectivo_disponible = efectivo_disponible - p_monto
        WHERE id_boveda = p_id_boveda_origen;

        UPDATE BOVEDAS
        SET efectivo_disponible = efectivo_disponible + p_monto
        WHERE id_boveda = p_id_boveda_destino;

        INSERT INTO TRANSACCIONES_INTERBANCARIAS (id_interbancaria, id_boveda_origen, id_boveda_destino, monto, fecha, hora, BOVEDAS_id_boveda)
        VALUES (seq_transacciones_interbancarias.NEXTVAL, p_id_boveda_origen, p_id_boveda_destino, p_monto, SYSDATE, SYSDATE, p_id_boveda_origen);
        
        COMMIT;
    ELSE
        ROLLBACK
        RAISE_APPLICATION_ERROR(-20002, 'Efectivo insuficiente en la bóveda de origen.');
    END IF;
END;

