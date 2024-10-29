CREATE OR REPLACE PROCEDURE pagar_prestamo (
    p_id_prestamo IN PRESTAMOS.id_prestamo%TYPE,
    p_monto IN NUMBER
) IS
BEGIN
    UPDATE PRESTAMOS
    SET SALDO_PEND = PRESTAMOS.SALDO_PEND - p_monto
    WHERE id_prestamo = p_id_prestamo;

    COMMIT;
END;