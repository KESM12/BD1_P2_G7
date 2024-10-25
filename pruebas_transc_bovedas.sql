BEGIN
    mover_efectivo(
        p_id_boveda_origen => 1,
        p_id_boveda_destino => 2,
        p_monto => 2000
    );
END;
/

BEGIN
    mover_efectivo(
        p_id_boveda_origen => 3,
        p_id_boveda_destino => 2,
        p_monto => 1000
    );
END;
/

BEGIN
    mover_efectivo(
        p_id_boveda_origen => 3,
        p_id_boveda_destino => 1,
        p_monto => 900
    );
END;
/