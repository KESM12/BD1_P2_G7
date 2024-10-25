CREATE OR REPLACE PROCEDURE realizar_deposito(
    p_id_cuenta IN INTEGER,
    p_monto IN NUMBER,
    p_descripcion IN VARCHAR,
    p_id_suc_agen IN INTEGER
) AS
BEGIN
    UPDATE CUENTAS
    SET saldo = saldo + p_monto
    WHERE id_cuenta = p_id_cuenta;

    INSERT INTO TRANSACCIONES (
        id_transaccion, 
        id_cliente, 
        monto, 
        fecha, 
        hora, 
        descripcion, 
        id_suc_agen, 
        CLIENTES_id_cliente, 
        TIPO_TRANSACS_id_tipo_tran
    )
    VALUES (
        seq_transacciones.NEXTVAL, 
        (SELECT id_cliente FROM CUENTAS WHERE id_cuenta = p_id_cuenta), 
        p_monto, 
        SYSDATE, 
        SYSDATE, 
        p_descripcion, 
        p_id_suc_agen, 
        (SELECT id_cliente FROM CUENTAS WHERE id_cuenta = p_id_cuenta),
        1
    );
    
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE realizar_retiro(
    p_id_cuenta IN INTEGER,
    p_monto IN NUMBER,
    p_descripcion IN VARCHAR,
    p_id_suc_agen IN INTEGER
) AS
    saldo_actual NUMBER; 
BEGIN

    SELECT saldo INTO saldo_actual FROM CUENTAS WHERE id_cuenta = p_id_cuenta;

   
    IF saldo_actual >= p_monto THEN
        UPDATE CUENTAS
        SET saldo = saldo - p_monto
        WHERE id_cuenta = p_id_cuenta;

        INSERT INTO TRANSACCIONES (
            id_transaccion, 
            id_cliente, 
            monto, 
            fecha, 
            hora, 
            descripcion, 
            id_suc_agen, 
            CLIENTES_id_cliente, 
            TIPO_TRANSACS_id_tipo_tran
        )
        VALUES (
            seq_transacciones.NEXTVAL, 
            (SELECT id_cliente FROM CUENTAS WHERE id_cuenta = p_id_cuenta), 
            -p_monto, 
            SYSDATE, 
            SYSDATE, 
            p_descripcion,
            p_id_suc_agen,
            (SELECT CLIENTES_id_cliente FROM CUENTAS WHERE id_cuenta = p_id_cuenta), 
            2
        );
        
        COMMIT;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Saldo insuficiente para realizar el retiro.');
    END IF;
END;
/



