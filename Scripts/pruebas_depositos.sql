BEGIN
    realizar_deposito(
        p_id_cuenta => 1,         -- ID de la cuenta
        p_monto => 1100.00,        -- Monto a depositar
        p_descripcion => 'Depósito', -- Descripción de la transacción
        p_id_suc_agen => 1      -- ID de la sucursal/agencia
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 1,         
        p_monto => 2000.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 3    
    );
END;
/


BEGIN
    realizar_deposito(
        p_id_cuenta => 2,         
        p_monto => 400.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 4     
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 3,         
        p_monto => 2800.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 4     
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 4,         
        p_monto => 500.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 6     
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 4,         
        p_monto => 450.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 6     
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 4,         
        p_monto => 300.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 6     
    );
END;
/

BEGIN
    realizar_deposito(
        p_id_cuenta => 5,         
        p_monto => 2300.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 1     
    );
END;
/


BEGIN
    realizar_deposito(
        p_id_cuenta => 6,         
        p_monto => 2300.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 1     
    );
END;
/


BEGIN
    realizar_deposito(
        p_id_cuenta => 7,         
        p_monto => 800.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 10  
    );
END;
/


BEGIN
    realizar_deposito(
        p_id_cuenta => 8,         
        p_monto => 920.00,        
        p_descripcion => 'Depósito', 
        p_id_suc_agen => 4
    );
END;
/