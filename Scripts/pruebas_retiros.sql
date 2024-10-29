BEGIN
    realizar_retiro(
        p_id_cuenta => 1,         
        p_monto => 50.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 2       
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 1,         
        p_monto => 75.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 2       
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 2,         
        p_monto => 100.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 1
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 3,         
        p_monto => 80.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 1
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 3,         
        p_monto => 90.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 2
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 3,         
        p_monto => 45.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 3
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 4,         
        p_monto => 155.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 8
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 4,         
        p_monto => 105.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 7
    );
END;
/


BEGIN
    realizar_retiro(
        p_id_cuenta => 5,         
        p_monto => 205.00,         
        p_descripcion => 'Retiro de efectivo', 
        p_id_suc_agen => 5
    );
END;
/