-- Secuencias para las claves primarias
CREATE SEQUENCE seq_bovedas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cuentas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_departamentos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_empleados START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_estados_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_estado_financiero START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_est_tarjetas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_historial_auditoria START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_historial_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_historial_saldos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_municipios START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_roles START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_seguridad_acceso START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_sucs_agens START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tarjs_cred START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipocuentas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipo_sucs_agens START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipo_transacs START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transacciones START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transacciones_interbancarias START WITH 1 INCREMENT BY 1;

INSERT INTO DEPARTAMENTOS (id_departamento, nombre_dep, id_municipio) 
    VALUES (seq_departamentos.NEXTVAL, 'Departamento A', 1);
INSERT INTO DEPARTAMENTOS (id_departamento, nombre_dep, id_municipio) 
    VALUES (seq_departamentos.NEXTVAL, 'Departamento B', 2);
INSERT INTO DEPARTAMENTOS (id_departamento, nombre_dep, id_municipio) 
    VALUES (seq_departamentos.NEXTVAL, 'Departamento C', 3);


INSERT INTO MUNICIPIOS (id_municipio, nombre_mun, direccion, codigo_postal, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_municipios.NEXTVAL, 'Municipio 1', 'Calle 1, Ciudad A', '10001', 1);
INSERT INTO MUNICIPIOS (id_municipio, nombre_mun, direccion, codigo_postal, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_municipios.NEXTVAL, 'Municipio 2', 'Calle 2, Ciudad B', '20002', 2);
INSERT INTO MUNICIPIOS (id_municipio, nombre_mun, direccion, codigo_postal, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_municipios.NEXTVAL, 'Municipio 3', 'Calle 3, Ciudad C', '30003', 3);


INSERT INTO SUCS_AGENS (id_suc_agen, nombre, id_tipo_suc_agen, id_departamento, telefono, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_sucs_agens.NEXTVAL, 'Sucursal Central', NULL, 1, '5550001', 1);
INSERT INTO SUCS_AGENS (id_suc_agen, nombre, id_tipo_suc_agen, id_departamento, telefono, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_sucs_agens.NEXTVAL, 'Sucursal Norte', NULL, 2, '5550002', 2);
INSERT INTO SUCS_AGENS (id_suc_agen, nombre, id_tipo_suc_agen, id_departamento, telefono, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_sucs_agens.NEXTVAL, 'Sucursal Sur', NULL, 3, '5550003', 3);
INSERT INTO SUCS_AGENS (id_suc_agen, nombre, id_tipo_suc_agen, id_departamento, telefono, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_sucs_agens.NEXTVAL, 'Agencia Oeste', NULL, 1, '5550004', 1);
INSERT INTO SUCS_AGENS (id_suc_agen, nombre, id_tipo_suc_agen, id_departamento, telefono, DEPARTAMENTOS_id_departamento) 
    VALUES (seq_sucs_agens.NEXTVAL, 'Agencia Este', NULL, 2, '5550005', 2);


INSERT INTO TIPO_SUCS_AGENS (id_tipo_suc_agen, tipo_suc_agen, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_sucs_agens.NEXTVAL, 'Sucursal', 1);
INSERT INTO TIPO_SUCS_AGENS (id_tipo_suc_agen, tipo_suc_agen, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_sucs_agens.NEXTVAL, 'Agencia', 3);
INSERT INTO TIPO_SUCS_AGENS (id_tipo_suc_agen, tipo_suc_agen, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_sucs_agens.NEXTVAL, 'Sucursal', 2);


INSERT INTO TIPO_TRANSACS (id_tipo_tran, tipo_tran, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_transacs.NEXTVAL, 'Depósito', 1);
INSERT INTO TIPO_TRANSACS (id_tipo_tran, tipo_tran, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_transacs.NEXTVAL, 'Retiro', 2);
INSERT INTO TIPO_TRANSACS (id_tipo_tran, tipo_tran, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_transacs.NEXTVAL, 'Transferencia', 3);
INSERT INTO TIPO_TRANSACS (id_tipo_tran, tipo_tran, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_tipo_transacs.NEXTVAL, 'Pago', 1);


INSERT INTO CLIENTES (id_cliente, nombre, apellido, telefono) 
    VALUES (seq_clientes.NEXTVAL, 'Juan', 'Pérez', '555-1234');
INSERT INTO CLIENTES (id_cliente, nombre, apellido, telefono) 
    VALUES (seq_clientes.NEXTVAL, 'Ana', 'Gómez', '555-5678');
INSERT INTO CLIENTES (id_cliente, nombre, apellido, telefono) 
    VALUES (seq_clientes.NEXTVAL, 'Luis', 'Martínez', '555-8765');

INSERT INTO TIPOCUENTAS (id_tipo_cuenta, tipo_cuenta) VALUES (seq_tipocuentas.NEXTVAL, 'Ahorros');
INSERT INTO TIPOCUENTAS (id_tipo_cuenta, tipo_cuenta) VALUES (seq_tipocuentas.NEXTVAL, 'Corriente');


INSERT INTO HISTORIAL_SALDOS (id_historial, id_cuenta, saldo, fecha) 
    VALUES (1, 1, 500.00, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO HISTORIAL_SALDOS (id_historial, id_cuenta, saldo, fecha) 
    VALUES (2, 1, 600.00, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO HISTORIAL_SALDOS (id_historial, id_cuenta, saldo, fecha) 
    VALUES (3, 2, 300.00, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO HISTORIAL_SALDOS (id_historial, id_cuenta, saldo, fecha) 
    VALUES (4, 2, 350.00, TO_DATE('2024-02-15', 'YYYY-MM-DD'));


INSERT INTO ESTADO_FINANCIERO (id_estado, id_cuenta, ingresos, egresos, capital, fecha) 
    VALUES (1, 1, 1000.00, 200.00, 800.00, TO_DATE('2024-01-31', 'YYYY-MM-DD'));
INSERT INTO ESTADO_FINANCIERO (id_estado, id_cuenta, ingresos, egresos, capital, fecha) 
    VALUES (2, 1, 1200.00, 300.00, 900.00, TO_DATE('2024-02-28', 'YYYY-MM-DD'));
INSERT INTO ESTADO_FINANCIERO (id_estado, id_cuenta, ingresos, egresos, capital, fecha) 
    VALUES(3, 2, 800.00, 150.00, 650.00, TO_DATE('2024-01-31', 'YYYY-MM-DD'));



INSERT INTO CUENTAS (id_cuenta, id_cliente, id_tipo_cuenta, numero_cuenta, saldo, CLIENTES_id_cliente, TIPOCUENTAS_id_tipo_cuenta, HISTORIAL_SALDOS_id_historial, ESTADO_FINANCIERO_id_estado) 
    VALUES (seq_cuentas.NEXTVAL, 1, 1, '001-00001', 500.00, 1, 1, 1, 1);
INSERT INTO CUENTAS (id_cuenta, id_cliente, id_tipo_cuenta, numero_cuenta, saldo, CLIENTES_id_cliente, TIPOCUENTAS_id_tipo_cuenta, HISTORIAL_SALDOS_id_historial, ESTADO_FINANCIERO_id_estado) 
    VALUES (seq_cuentas.NEXTVAL, 2, 1, '001-00002', 300.00, 2, 1, 1, 2);
INSERT INTO CUENTAS (id_cuenta, id_cliente, id_tipo_cuenta, numero_cuenta, saldo, CLIENTES_id_cliente, TIPOCUENTAS_id_tipo_cuenta, HISTORIAL_SALDOS_id_historial, ESTADO_FINANCIERO_id_estado) 
    VALUES (seq_cuentas.NEXTVAL, 3, 2, '001-00003', 150.00, 3, 2, 1, 3);



INSERT INTO BOVEDAS (id_boveda, id_suc_agen, efectivo_disponible, efectivo_disponible_1, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_bovedas.NEXTVAL, 1, 15000.00, '15000', 1);

INSERT INTO BOVEDAS (id_boveda, id_suc_agen, efectivo_disponible, efectivo_disponible_1, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_bovedas.NEXTVAL, 2, 12000.00, '12000', 2);

INSERT INTO BOVEDAS (id_boveda, id_suc_agen, efectivo_disponible, efectivo_disponible_1, SUCS_AGENS_id_suc_agen) 
    VALUES (seq_bovedas.NEXTVAL, 3, 8000.00, '8000', 3);



INSERT INTO ESTADOS_PRESTAMOS (id_eprestamo, estado_prestamo) VALUES
(seq_estados_prestamos.NEXTVAL, 'Activo');

INSERT INTO ESTADOS_PRESTAMOS (id_eprestamo, estado_prestamo) VALUES
(seq_estados_prestamos.NEXTVAL, 'Vencido');

INSERT INTO ESTADOS_PRESTAMOS (id_eprestamo, estado_prestamo) VALUES
(seq_estados_prestamos.NEXTVAL, 'Cancelado');




INSERT INTO PRESTAMOS (id_prestamo, id_cliente, monto_prest, tasa_interes, fecha_des, fecha_ven, saldo_pend, id_eprestamo, CLIENTES_id_cliente, ESTADOS_PRESTAMOS_id_eprestamo) VALUES
(seq_prestamos.NEXTVAL, 1, 5000.00, 5.00, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 5000.00, NULL, 1, 1);

INSERT INTO PRESTAMOS (id_prestamo, id_cliente, monto_prest, tasa_interes, fecha_des, fecha_ven, saldo_pend, id_eprestamo, CLIENTES_id_cliente, ESTADOS_PRESTAMOS_id_eprestamo) VALUES
(seq_prestamos.NEXTVAL, 2, 7500.00, 6.50, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), 7500.00, NULL, 2, 1);

INSERT INTO PRESTAMOS (id_prestamo, id_cliente, monto_prest, tasa_interes, fecha_des, fecha_ven, saldo_pend, id_eprestamo, CLIENTES_id_cliente, ESTADOS_PRESTAMOS_id_eprestamo) VALUES
(seq_prestamos.NEXTVAL, 3, 3000.00, 4.00, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'), 3000.00, NULL, 3, 1);


INSERT INTO TRANSACCIONES (id_transaccion, id_cliente, num_cuenta, tipo_transaccion, monto, descripcion, sucursal_agencia) VALUES
(seq_transacciones.NEXTVAL, 210, '123456789', 'Depósito', 5000, 'Depósito inicial de cuenta', 'Sucursal Central');

INSERT INTO TRANSACCIONES (id_transaccion, id_cliente, num_cuenta, tipo_transaccion, monto, descripcion, sucursal_agencia) VALUES
(seq_transacciones.NEXTVAL, 280, '987654321', 'Retiro', 2000, 'Retiro en efectivo', 'Agencia Norte');

INSERT INTO TRANSACCIONES (id_transaccion, id_cliente, num_cuenta, tipo_transaccion, monto, descripcion, sucursal_agencia) VALUES
(seq_transacciones.NEXTVAL, 299, '543216789', 'Transferencia', 3000, 'Transferencia a otra cuenta', 'Agencia Sur');



INSERT INTO ROLES (id_rol, nombre_rol) VALUES
(seq_roles.NEXTVAL, 'Gerente');

INSERT INTO ROLES (id_rol, nombre_rol) VALUES
(seq_roles.NEXTVAL, 'Cajero');

INSERT INTO ROLES (id_rol, nombre_rol) VALUES
(seq_roles.NEXTVAL, 'Servicio al Cliente');

INSERT INTO HISTORIAL_PRESTAMOS (id_prestamo, id_cliente, monto, tasa_interes, fecha_desembolso, fecha_vencimiento, estado_prestamo) VALUES
(seq_historial_prestamos.NEXTVAL, 205, 10000, 5.5, TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Activo');

INSERT INTO HISTORIAL_PRESTAMOS (id_prestamo, id_cliente, monto, tasa_interes, fecha_desembolso, fecha_vencimiento, estado_prestamo) VALUES
(seq_historial_prestamos.NEXTVAL, 250, 15000, 6.2, TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'Vencido');

INSERT INTO HISTORIAL_PRESTAMOS (id_prestamo, id_cliente, monto, tasa_interes, fecha_desembolso, fecha_vencimiento, estado_prestamo) VALUES
(seq_historial_prestamos.NEXTVAL, 300, 20000, 4.8, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Cancelado');



INSERT INTO HISTORIAL_AUDITORIA (id_auditoria, usuario) VALUES
(seq_historial_auditoria.NEXTVAL, 20, 1, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

INSERT INTO HISTORIAL_AUDITORIA (id_auditoria, usuario) VALUES
(seq_historial_auditoria.NEXTVAL, 34, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'));

INSERT INTO HISTORIAL_AUDITORIA (id_auditoria, usuario) VALUES
(seq_historial_auditoria.NEXTVAL, 45, 1, TO_DATE('2023-11-01', 'YYYY-MM-DD'));


INSERT INTO EMPLEADOS (id_empleado, nombre, apellido, telefono, rol, departamento, sucursal_agencia) VALUES
(seq_empleados.NEXTVAL, 'Juan', 'Pérez', '5551234567', 'Gerente', 1, 1);

INSERT INTO EMPLEADOS (id_empleado, nombre, apellido, telefono, rol, departamento, sucursal_agencia) VALUES
(seq_empleados.NEXTVAL, 'Ana', 'Gómez', '5557654321', 'Cajero', 2, 3);

INSERT INTO EMPLEADOS (id_empleado, nombre, apellido, telefono, rol, departamento, sucursal_agencia) VALUES
(seq_empleados.NEXTVAL, 'Carlos', 'Rodríguez', '5559876543', 'Servicio al Cliente', 22, 4);
