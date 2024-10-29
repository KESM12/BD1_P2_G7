
--- Liquidez Bancaria

WITH datos AS (
    SELECT
        SUM(saldo) AS depositos,
        SUM(saldo) * 0.20 AS encaje_bancario
    FROM cuentas
),
efectivo AS (
    SELECT SUM(efectivo_disponible) AS efectivo_en_bovedas
    FROM bovedas
    --WHERE sucs_agens_id_suc_agen = 1
)
SELECT
    TO_CHAR(d.depositos, 'FM$999,999,999,999.00') AS "TOTAL DEPOSITOS",
    TO_CHAR(d.encaje_bancario, 'FM$999,999,999,999.00') AS "ENCAJE BANCARIO 20%",
    TO_CHAR(e.efectivo_en_bovedas, 'FM$999,999,999,999.00') AS "EFECTIVO DISPONIBLE" ,
    TO_CHAR(d.encaje_bancario - e.efectivo_en_bovedas, 'FM$999,999,999,999.00') AS "DIFERENCIA" ,
    CASE
        WHEN (d.encaje_bancario - e.efectivo_en_bovedas) > 0
            THEN 'Falta de liquidez de: Q. ' ||  TO_CHAR(d.encaje_bancario - e.efectivo_en_bovedas, 'FM$999,999,999,999.00')
            ELSE 'Estado con sobre liquidez de: Q. ' || TO_CHAR(ABS(d.encaje_bancario - e.efectivo_en_bovedas), 'FM$999,999,999,999.00')
    END AS "Acción"
FROM datos d, efectivo e;