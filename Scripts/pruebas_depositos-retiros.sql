BEGIN
    realizar_deposito(
        p_id_cuenta => 1,         -- ID de la cuenta
        p_monto => 100.00,        -- Monto a depositar
        p_descripcion => 'Depósito inicial', -- Descripción de la transacción
        p_id_suc_agen => 1      -- ID de la sucursal/agencia
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 1,         -- ID de la cuenta
        p_monto => 100.00,        -- Monto a depositar
        p_descripcion => 'Depósito inicial', -- Descripción de la transacción
        p_id_suc_agen => 2     -- ID de la sucursal/agencia
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 1,         -- ID de la cuenta
        p_monto => 50.00,         -- Monto a retirar
        p_descripcion => 'Retiro de efectivo', -- Descripción de la transacción
        p_id_suc_agen => 2       -- ID de la sucursal/agencia
    );
END;
/
