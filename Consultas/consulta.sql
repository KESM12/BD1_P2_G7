-- CONSULTAS BASICAS


-- nombre y apellido de los clientes
SELECT nombre, apellido FROM Clientes;

-- obtener el saldo especifico de una cuenta 
SELECT saldo FROM Cuentas WHERE cuenta_id = 123;


-- mostrar transacciones de un cliente en orden descendente 
SELECT * FROM Transacciones WHERE cuenta_id = 456 ORDER BY fecha DESC;



-- CONSULTAS MEDIAS

-- obtener saldo promedio de las cuentas
SELECT c.id_cliente, cl.nombre, cl.apellido, AVG(c.saldo) AS saldo_promedio
FROM CUENTAS c
JOIN CLIENTES cl ON c.id_cliente = cl.id_cliente
GROUP BY c.id_cliente, cl.nombre, cl.apellido;


-- lista de sucursales y sus respectivos departamentos
SELECT s.nombre AS sucursal, d.nombre_dep AS departamento
FROM SUCS_AGENS s
JOIN DEPARTAMENTOS d ON s.id_departamento = d.id_departamento;


-- numero de empleados de cada sucursal
SELECT s.nombre AS sucursal, COUNT(e.id_empleado) AS num_empleados
FROM SUCS_AGENS s
JOIN EMPLEADOS e ON s.id_suc_agen = e.id_suc_agen
GROUP BY s.nombre;



-- CONSULTAS COMPLEJAS

-- lista de clientes con prestamos activos y con el monto total
SELECT cl.nombre, cl.apellido, SUM(p.monto_prest) AS total_prestamos
FROM CLIENTES cl
JOIN PRESTAMOS p ON cl.id_cliente = p.id_cliente
JOIN ESTADOS_PRESTAMOS ep ON p.id_eprestamo = ep.id_eprestamo
WHERE ep.estado_prestamo = 'Activo'
GROUP BY cl.nombre, cl.apellido;



-- obtener saldo de todas las cuentas y el total de efectivo en la boveda, por cada sucursal
SELECT sa.nombre AS sucursal, SUM(c.saldo) AS total_saldo, SUM(b.efectivo_disponible) AS total_efectivo
FROM SUCS_AGENS sa
JOIN CUENTAS c ON sa.id_suc_agen = c.CLIENTES_id_cliente
JOIN BOVEDAS b ON sa.id_suc_agen = b.SUCS_AGENS_id_suc_agen
GROUP BY sa.nombre;



-- historial de transacciones realizadas con cliente por rango de fecha, monto y descripcion de la transaccion
SELECT cl.nombre, cl.apellido, t.fecha, t.monto, t.descripcion
FROM CLIENTES cl
JOIN TRANSACCIONES t ON cl.id_cliente = t.id_cliente
WHERE t.fecha BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
ORDER BY cl.nombre, cl.apellido, t.fecha;
