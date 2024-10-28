-- SELECT SUM(saldo) AS "Depositos" FROM cuentas;
-- SELECT SUM(saldo) * 0.20 AS "20% de Depositos" FROM cuentas;
-- SELECT efectivo_disponible AS "Efectivo en Boveda central" FROM bovedas WHERE id_suc_agen = 1;


SELECT
    depositos,
    encaje_bancario,
    efectivo_boveda_central,
    (encaje_bancario - efectivo_boveda_central) AS diferencia,
    CASE
        WHEN (encaje_bancario - efectivo_boveda_central) > 0
            THEN 'Traslado de agencias a boveda central: ' || (encaje_bancario - efectivo_boveda_central)
            ELSE 'Sin traslado necesario'
    END AS "Acción"
FROM (
    SELECT
        (SELECT SUM(saldo) FROM cuentas) AS depositos,
        (SELECT SUM(saldo) * 0.20 FROM cuentas) AS encaje_bancario,
        (SELECT efectivo_disponible FROM bovedas WHERE id_suc_agen = 1) AS efectivo_boveda_central FROM dual
) disponible_traslado_boveda_central;