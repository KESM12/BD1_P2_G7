-- 1. Consultas Relacionadas con Clientes

INSERT INTO clientes (id_cliente, nombre, apellido, telefono)
VALUES (seq_id_cliente.NEXTVAL, 'Juan', 'Pérez', '5551234567');


UPDATE clientes
SET nombre = 'Juan Carlos', apellido = 'Pérez González', telefono = '5557654321'
WHERE id_cliente = 1;


SELECT c.id_cliente, c.nombre, c.apellido, ct.numero_cuenta, ct.saldo
FROM clientes c
JOIN cuentas ct ON c.id_cliente = ct.clientes_id_cliente
WHERE ct.numero_cuenta = '14870506981385521592';



SELECT c.id_cliente, c.nombre, c.apellido, c.telefono, tc.tipo_cuenta
FROM clientes c
JOIN cuentas ct ON c.id_cliente = ct.clientes_id_cliente
JOIN tipocuentas tc ON ct.tipocuentas_id_tipo_cuenta = tc.id_tipo_cuenta
WHERE c.id_cliente = 500;
