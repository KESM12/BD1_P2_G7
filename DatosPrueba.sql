-- Insertar datos en la tabla BOVEDAS
INSERT INTO BOVEDAS (id_boveda, id_suc_agen, efectivo_disponible, efectivo_disponible_1, SUCS_AGENS_id_suc_agen)
VALUES (BOVEDAS_SEQ.NEXTVAL, 1, 100000.00, '100000.00', 1);

INSERT INTO BOVEDAS (id_boveda, id_suc_agen, efectivo_disponible, efectivo_disponible_1, SUCS_AGENS_id_suc_agen)
VALUES (BOVEDAS_SEQ.NEXTVAL, 2, 150000.00, '150000.00', 2);

INSERT INTO BOVEDAS (id_boveda, id_suc_agen, efectivo_disponible, efectivo_disponible_1, SUCS_AGENS_id_suc_agen)
VALUES (BOVEDAS_SEQ.NEXTVAL, 3, 200000.00, '200000.00', 3);

-- Insertar datos en la tabla CLIENTES
INSERT INTO CLIENTES (id_cliente, nombre, apellido, telefono)
VALUES (CLIENTES_SEQ.NEXTVAL, 'Juan', 'Pérez', '1234567890');

INSERT INTO CLIENTES (id_cliente, nombre, apellido, telefono)
VALUES (CLIENTES_SEQ.NEXTVAL, 'María', 'González', '2345678901');

INSERT INTO CLIENTES (id_cliente, nombre, apellido, telefono)
VALUES (CLIENTES_SEQ.NEXTVAL, 'Carlos', 'Rodríguez', '3456789012');

-- Insertar datos en la tabla CUENTAS
INSERT INTO CUENTAS (id_cuenta, id_cliente, id_tipo_cuenta, numero_cuenta, saldo, CLIENTES_id_cliente, TIPOCUENTAS_id_tipo_cuenta, HISTORIAL_SALDOS_id_historial, ESTADO_FINANCIERO_id_estado)
VALUES (CUENTAS_SEQ.NEXTVAL, 1, 1, '1000001', 5000.00, 1, 1, 1, 1);

INSERT INTO CUENTAS (id_cuenta, id_cliente, id_tipo_cuenta, numero_cuenta, saldo, CLIENTES_id_cliente, TIPOCUENTAS_id_tipo_cuenta, HISTORIAL_SALDOS_id_historial, ESTADO_FINANCIERO_id_estado)
VALUES (CUENTAS_SEQ.NEXTVAL, 2, 2, '1000002', 10000.00, 2, 2, 2, 2);

INSERT INTO CUENTAS (id_cuenta, id_cliente, id_tipo_cuenta, numero_cuenta, saldo, CLIENTES_id_cliente, TIPOCUENTAS_id_tipo_cuenta, HISTORIAL_SALDOS_id_historial, ESTADO_FINANCIERO_id_estado)
VALUES (CUENTAS_SEQ.NEXTVAL, 3, 1, '1000003', 7500.00, 3, 1, 3, 3);

-- Insertar datos en la tabla DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS (id_departamento, nombre_dep, id_municipio)
VALUES (DEPARTAMENTOS_SEQ.NEXTVAL, 'Ventas', 1);

INSERT INTO DEPARTAMENTOS (id_departamento, nombre_dep, id_municipio)
VALUES (DEPARTAMENTOS_SEQ.NEXTVAL, 'Marketing', 2);

INSERT INTO DEPARTAMENTOS (id_departamento, nombre_dep, id_municipio)
VALUES (DEPARTAMENTOS_SEQ.NEXTVAL, 'Recursos Humanos', 3);

-- Insertar datos en la tabla EMPLEADOS
INSERT INTO EMPLEADOS (id_empleado, nombre, apellido, id_rol, id_departamento, id_suc_agen, telefono, DEPARTAMENTOS_id_departamento, ROLES_id_rol, SUCS_AGENS_id_suc_agen)
VALUES (EMPLEADOS_SEQ.NEXTVAL, 'Ana', 'Martínez', 1, 1, 1, '4567890123', 1, 1, 1);

INSERT INTO EMPLEADOS (id_empleado, nombre, apellido, id_rol, id_departamento, id_suc_agen, telefono, DEPARTAMENTOS_id_departamento, ROLES_id_rol, SUCS_AGENS_id_suc_agen)
VALUES (EMPLEADOS_SEQ.NEXTVAL, 'Luis', 'García', 2, 2, 2, '5678901234', 2, 2, 2);

INSERT INTO EMPLEADOS (id_empleado, nombre, apellido, id_rol, id_departamento, id_suc_agen, telefono, DEPARTAMENTOS_id_departamento, ROLES_id_rol, SUCS_AGENS_id_suc_agen)
VALUES (EMPLEADOS_SEQ.NEXTVAL, 'Elena', 'López', 3, 3, 3, '6789012345', 3, 3, 3);

-- Insertar datos en la tabla ESTADOS_PRESTAMOS
INSERT INTO ESTADOS_PRESTAMOS (id_eprestamo, estado_prestamo)
VALUES (ESTADOS_PRESTAMOS_SEQ.NEXTVAL, 'Activo');

INSERT INTO ESTADOS_PRESTAMOS (id_eprestamo, estado_prestamo)
VALUES (ESTADOS_PRESTAMOS_SEQ.NEXTVAL, 'Pagado');

INSERT INTO ESTADOS_PRESTAMOS (id_eprestamo, estado_prestamo)
VALUES (ESTADOS_PRESTAMOS_SEQ.NEXTVAL, 'Atrasado');

-- Insertar datos en la tabla ESTADO_FINANCIERO
INSERT INTO ESTADO_FINANCIERO (id_estado, id_cuenta, ingresos, egresos, capital, fecha)
VALUES (ESTADO_FINANCIERO_SEQ.NEXTVAL, 1, 5000.00, 2000.00, 3000.00, SYSDATE);

INSERT INTO ESTADO_FINANCIERO (id_estado, id_cuenta, ingresos, egresos, capital, fecha)
VALUES (ESTADO_FINANCIERO_SEQ.NEXTVAL, 2, 7000.00, 3000.00, 4000.00, SYSDATE);

INSERT INTO ESTADO_FINANCIERO (id_estado, id_cuenta, ingresos, egresos, capital, fecha)
VALUES (ESTADO_FINANCIERO_SEQ.NEXTVAL, 3, 6000.00, 2500.00, 3500.00, SYSDATE);

-- Continuar con el resto de las tablas...

-- Nota: Asegúrate de que todas las secuencias mencionadas (por ejemplo, BOVEDAS_SEQ, CLIENTES_SEQ, etc.) 
-- hayan sido creadas antes de ejecutar este script.