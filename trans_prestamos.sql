CREATE OR REPLACE PROCEDURE realizar_pago_prestamo(
    p_id_prestamo IN INTEGER,
    p_monto IN NUMBER,
    p_id_suc_agen   IN INTEGER
) AS 
    saldo_pendiente NUMBER;
    id_cliente NUMBER;
BEGIN

    SELECT saldo_pend, CLIENTES_id_cliente INTO saldo_pendiente, id_cliente 
    FROM PRESTAMOS 
    WHERE id_prestamo = p_id_prestamo;
    

    IF saldo_pendiente > p_monto THEN

        UPDATE PRESTAMOS
        SET saldo_pend = saldo_pend - p_monto
        WHERE id_prestamo = p_id_prestamo;

        INSERT INTO TRANSACCIONES 
        (id_transaccion, id_cliente, monto, fecha, hora, descripcion, id_suc_agen, CLIENTES_id_cliente, TIPO_TRANSACS_id_tipo_tran)
        VALUES 
        (seq_tipo_transacs.NEXTVAL, id_cliente, -p_monto, SYSDATE, SYSDATE, 'Pago de préstamo', p_id_suc_agen, id_cliente, 4);

        COMMIT;
    ELSIF saldo_pendiente = p_monto THEN 

        UPDATE PRESTAMOS
        SET saldo_pend = saldo_pend - p_monto,
            ESTADOS_PRESTAMOS_id_eprestamo = 3
        WHERE id_prestamo = p_id_prestamo;


        INSERT INTO TRANSACCIONES 
        (id_transaccion, id_cliente, monto, fecha, hora, descripcion, id_suc_agen, CLIENTES_id_cliente, TIPO_TRANSACS_id_tipo_tran)
        VALUES 
        (seq_tipo_transacs.NEXTVAL, id_cliente, -p_monto, SYSDATE, SYSDATE, 'Pago de préstamo', p_id_suc_agen, id_cliente, 4);

    ELSE 
        RAISE_APPLICATION_ERROR(-20003, 'El monto a pagar excede el saldo pendiente.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'No se encontró el préstamo con el ID proporcionado.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Ocurrió un error inesperado: ' || SQLERRM);
END;
/
