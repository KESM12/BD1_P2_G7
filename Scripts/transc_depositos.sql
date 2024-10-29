CREATE OR REPLACE PROCEDURE realizar_deposito(
    p_id_cuenta IN INTEGER,
    p_monto IN NUMBER,
    p_descripcion IN VARCHAR,
    p_id_suc_agen IN INTEGER
) AS id_cliente INTEGER;
BEGIN

    SELECT id_cliente INTO id_cliente
    FROM CUENTAS 
    WHERE id_cuenta = p_id_cuenta;

    UPDATE cuentas
    SET saldo = saldo + p_monto
    WHERE id_cuenta = p_id_cuenta;

    /*
    UPDATE bovedas
    SET efectivo_disponible = efectivo_disponible + p_monto
    WHERE sucs_agens_id_suc_agen = p_id_suc_agen;
    */

    INSERT INTO transacciones (
        monto, 
        fecha,
        descripcion, 
        clientes_id_cliente, 
        tipo_transacs_id_tipo_tran
    )
    VALUES (
        p_monto, 
        SYSDATE, 
        p_descripcion, 
        id_cliente,
        1
    );
    
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'No se encontró la cuenta con el id con el ID proporcionado.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Ocurrió un error inesperado: ' || SQLERRM);
END;
/




