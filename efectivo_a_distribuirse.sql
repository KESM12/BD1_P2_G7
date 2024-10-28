WITH Totales AS (
    SELECT
        COUNT(id_transaccion) AS total_transacciones,
        SUM(monto) AS total_monto
    FROM
        TRANSACCIONES
),
disponible_traslado_boveda_central AS (
    SELECT
        (SELECT SUM(saldo) * 0.20 FROM cuentas) AS encaje_bancario,
        (SELECT efectivo_disponible FROM bovedas WHERE id_suc_agen = 1) AS efectivo_boveda_central
    FROM dual
)
SELECT
    t.id_suc_agen,
    COUNT(t.id_transaccion) AS numero_transacciones,
    ABS(SUM(t.monto)) AS monto_total,
    ROUND(COUNT(t.id_transaccion) * 100.0 / (SELECT total_transacciones FROM Totales),2) AS porcentaje_transacciones,
    (SUM(t.monto) * 100.0 / (SELECT total_monto FROM Totales)) AS porcentaje_monto,
    ROUND((d.encaje_bancario - d.efectivo_boveda_central) * (COUNT(t.id_transaccion) / (SELECT total_transacciones FROM Totales)),2) AS traslado_boveda_central
FROM
    TRANSACCIONES t
CROSS JOIN
    disponible_traslado_boveda_central d
GROUP BY
    t.id_suc_agen, d.encaje_bancario, d.efectivo_boveda_central;
