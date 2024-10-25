CREATE OR REPLACE PROCEDURE realizar_pago_prestamo(
    p_id_prestamo IN INTEGER,
    p_monto IN NUMBER
) AS saldo_pendiente NUMBER
BEGIN
  
    SELECT saldo_pend INTO saldo_pendiente FROM PRESTAMOS WHERE id_prestamo = p_id_prestamo;

    IF saldo_pendiente >= p_monto THEN
        UPDATE PRESTAMOS
        SET saldo_pend = saldo_pend - p_monto
        WHERE id_prestamo = p_id_prestamo;

        INSERT INTO TRANSACCIONES (id_cliente, monto, fecha, hora, descripcion, id_suc_agen, CLIENTES_id_cliente, TIPO_TRANSACS_id_tipo_tran)
        VALUES ((SELECT CLIENTES_id_cliente FROM PRESTAMOS WHERE id_prestamo = p_id_prestamo), -p_monto, SYSDATE, SYSDATE, 'Pago de préstamo', NULL, (SELECT CLIENTES_id_cliente FROM PRESTAMOS WHERE id_prestamo = p_id_prestamo), NULL);
        
        COMMIT;
    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'El monto a pagar excede el saldo pendiente.');
    END IF;
END;
/