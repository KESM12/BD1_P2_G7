CREATE OR REPLACE PROCEDURE realizar_pago_prestamo(
    p_id_prestamo IN INTEGER,
    p_monto IN NUMBER,
    p_id_suc_agen   IN INTEGER
) AS 
    saldo_pendiente NUMBER;
    id_cliente NUMBER;
BEGIN

    SELECT saldo_pend, clientes_id_cliente INTO saldo_pendiente, id_cliente 
    FROM prestamos 
    WHERE id_prestamo = p_id_prestamo;
    
    IF saldo_pendiente > p_monto THEN

        UPDATE prestamos
        SET saldo_pend = saldo_pend - p_monto
        WHERE id_prestamo = p_id_prestamo;

        /*
        UPDATE bovedas
        SET efectivo_disponible = efectivo_disponible + p_monto
        WHERE sucs_agens_id_suc_agen = p_id_suc_agen;
        */

        INSERT INTO transacciones 
        ( monto, fecha, descripcion, clientes_id_cliente, tipo_transacs_id_tipo_tran)
        VALUES 
        ( p_monto, SYSDATE, 'Pago de préstamo', id_cliente, 1);

         COMMIT;
    ELSE 
        ROLLBACK;
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
