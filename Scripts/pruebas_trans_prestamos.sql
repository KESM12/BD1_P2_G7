BEGIN
    realizar_pago_prestamo(
        p_id_prestamo => 1,
        p_monto => 1000,
        p_id_suc_agen => 1
    );
END;
/

BEGIN
    realizar_pago_prestamo(
        p_id_prestamo => 1,
        p_monto => 2000,
        p_id_suc_agen => 2
    );
END;
/

BEGIN
    realizar_pago_prestamo(
        p_id_prestamo => 1,
        p_monto => 2000,
        p_id_suc_agen => 2
    );
END;
/