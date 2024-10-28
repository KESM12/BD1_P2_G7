-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-28 16:55:30 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE bovedas (
    id_boveda                    INTEGER NOT NULL,
    efectivo_disponible          NUMBER(10, 2),
    efectivo_disponible_1        VARCHAR2(10),
    sucs_agens_id_suc_agen       INTEGER NOT NULL,
    traninterbs_id_interbancaria INTEGER NOT NULL
);

CREATE UNIQUE INDEX bovedas__idx ON
    bovedas (
        sucs_agens_id_suc_agen
    ASC );

ALTER TABLE bovedas ADD CONSTRAINT bovedas_pk PRIMARY KEY ( id_boveda );

CREATE TABLE clientes (
    id_cliente INTEGER NOT NULL,
    nombre     VARCHAR2(50),
    apellido   VARCHAR2(50),
    telefono   VARCHAR2(12)
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( id_cliente );

CREATE TABLE cuentas (
    id_cuenta                  INTEGER NOT NULL,
    numero_cuenta              VARCHAR2(20),
    saldo                      NUMBER(10, 2),
    clientes_id_cliente        INTEGER NOT NULL,
    tipocuentas_id_tipo_cuenta INTEGER NOT NULL
);

ALTER TABLE cuentas ADD CONSTRAINT cuentas_pk PRIMARY KEY ( id_cuenta );

CREATE TABLE departamentos (
    id_departamento INTEGER NOT NULL,
    nombre_dep      VARCHAR2(100)
);

ALTER TABLE departamentos ADD CONSTRAINT departamentos_pk PRIMARY KEY ( id_departamento );

CREATE TABLE empleados (
    id_empleado                   INTEGER NOT NULL,
    nombre                        VARCHAR2(50),
    apellido                      VARCHAR2(50),
    telefono                      VARCHAR2(12),
    roles_id_rol                  INTEGER NOT NULL,
    sucs_agens_id_suc_agen        INTEGER NOT NULL,
    departamentos_id_departamento INTEGER NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE est_tarjetas (
    id_estado INTEGER NOT NULL,
    estado    VARCHAR2(50)
);

ALTER TABLE est_tarjetas ADD CONSTRAINT est_tarjetas_pk PRIMARY KEY ( id_estado );

CREATE TABLE estfinacieros (
    id_estado         INTEGER NOT NULL,
    ingresos          NUMBER(10, 2),
    egresos           NUMBER(10, 2),
    capital           NUMBER(10, 2),
    fecha             DATE,
    cuentas_id_cuenta INTEGER NOT NULL
);

ALTER TABLE estfinacieros ADD CONSTRAINT estfinacieros_pk PRIMARY KEY ( id_estado );

CREATE TABLE estprests (
    id_eprestamo    INTEGER NOT NULL,
    estado_prestamo VARCHAR2(50)
);

ALTER TABLE estprests ADD CONSTRAINT estprests_pk PRIMARY KEY ( id_eprestamo );

CREATE TABLE histaudtorias (
    id_auditoria                 INTEGER NOT NULL,
    fecha                        DATE,
    hora                         DATE,
    transacciones_id_transaccion INTEGER NOT NULL,
    empleados_id_empleado        INTEGER NOT NULL
);

ALTER TABLE histaudtorias ADD CONSTRAINT histaudtorias_pk PRIMARY KEY ( id_auditoria );

CREATE TABLE historial_saldos (
    id_historial      INTEGER NOT NULL,
    saldo             NUMBER(10, 2),
    fecha             DATE,
    cuentas_id_cuenta INTEGER NOT NULL
);

ALTER TABLE historial_saldos ADD CONSTRAINT historial_saldos_pk PRIMARY KEY ( id_historial );

CREATE TABLE histpres (
    id_historial_prestamo INTEGER NOT NULL,
    fecha_solicitud       DATE,
    estado                VARCHAR2(50),
    prestamos_id_prestamo INTEGER NOT NULL
);

ALTER TABLE histpres ADD CONSTRAINT histpres_pk PRIMARY KEY ( id_historial_prestamo );

CREATE TABLE municipios (
    id_municipio                  INTEGER NOT NULL,
    nombre_mun                    VARCHAR2(100),
    direccion                     VARCHAR2(255),
    codigo_postal                 VARCHAR2(10),
    departamentos_id_departamento INTEGER NOT NULL
);

ALTER TABLE municipios ADD CONSTRAINT municipios_pk PRIMARY KEY ( id_municipio );

CREATE TABLE prestamos (
    id_prestamo            INTEGER NOT NULL,
    monto_prest            NUMBER(10, 2),
    tasa_interes           NUMBER(10, 2),
    fecha_des              DATE,
    fecha_ven              DATE,
    saldo_pend             NUMBER(10, 2),
    clientes_id_cliente    INTEGER NOT NULL,
    estprests_id_eprestamo INTEGER NOT NULL
);

ALTER TABLE prestamos ADD CONSTRAINT prestamos_pk PRIMARY KEY ( id_prestamo );

CREATE TABLE roles (
    id_rol INTEGER NOT NULL,
    rol    VARCHAR2(50)
);

ALTER TABLE roles ADD CONSTRAINT roles_pk PRIMARY KEY ( id_rol );

CREATE TABLE secacces (
    id_acceso             INTEGER NOT NULL,
    rol_acceso            VARCHAR2(50),
    fecha_acceso          DATE,
    hora_acceso           DATE,
    empleados_id_empleado INTEGER NOT NULL
);

ALTER TABLE secacces ADD CONSTRAINT secacces_pk PRIMARY KEY ( id_acceso );

CREATE TABLE sucs_agens (
    id_suc_agen                   INTEGER NOT NULL,
    nombre                        VARCHAR2(100),
    telefono                      VARCHAR2(12),
    departamentos_id_departamento INTEGER NOT NULL
);

ALTER TABLE sucs_agens ADD CONSTRAINT sucs_agens_pk PRIMARY KEY ( id_suc_agen );

CREATE TABLE tarjs_cred (
    id_tarjeta             INTEGER NOT NULL,
    numero_tarjeta         VARCHAR2(20),
    limite_credito         NUMBER(10, 2),
    saldo_actual           NUMBER(10, 2),
    fecha_emision          DATE,
    fecha_expiracion       DATE,
    fecha_corte            DATE,
    dia_ciclo              INTEGER,
    clientes_id_cliente    INTEGER NOT NULL,
    est_tarjetas_id_estado INTEGER NOT NULL
);

ALTER TABLE tarjs_cred ADD CONSTRAINT tarjs_cred_pk PRIMARY KEY ( id_tarjeta );

CREATE TABLE tipo_sucs_agens (
    id_tipo_suc_agen       INTEGER NOT NULL,
    tipo_suc_agen          VARCHAR2(50),
    sucs_agens_id_suc_agen INTEGER NOT NULL
);

CREATE UNIQUE INDEX tipo_sucs_agens__idx ON
    tipo_sucs_agens (
        sucs_agens_id_suc_agen
    ASC );

ALTER TABLE tipo_sucs_agens ADD CONSTRAINT tipo_sucs_agens_pk PRIMARY KEY ( id_tipo_suc_agen,
                                                                            sucs_agens_id_suc_agen );

CREATE TABLE tipo_transacs (
    id_tipo_tran           INTEGER NOT NULL,
    tipo_tran              VARCHAR2(50),
    sucs_agens_id_suc_agen INTEGER NOT NULL
);

ALTER TABLE tipo_transacs ADD CONSTRAINT tipo_transacs_pk PRIMARY KEY ( id_tipo_tran );

CREATE TABLE tipocuentas (
    id_tipo_cuenta INTEGER NOT NULL,
    tipo_cuenta    VARCHAR2(50)
);

ALTER TABLE tipocuentas ADD CONSTRAINT tipocuentas_pk PRIMARY KEY ( id_tipo_cuenta );

CREATE TABLE traninterbs (
    id_interbancaria  INTEGER NOT NULL,
    id_boveda_origen  INTEGER,
    id_boveda_destino INTEGER,
    monto             NUMBER(10, 2),
    fecha             DATE,
    hora              DATE
);

ALTER TABLE traninterbs ADD CONSTRAINT traninterbs_pk PRIMARY KEY ( id_interbancaria );

CREATE TABLE transacciones (
    id_transaccion             INTEGER NOT NULL,
    monto                      NUMBER(10, 2),
    fecha                      DATE,
    hora                       DATE,
    descripcion                VARCHAR2(255),
    clientes_id_cliente        INTEGER NOT NULL,
    tipo_transacs_id_tipo_tran INTEGER NOT NULL
);

ALTER TABLE transacciones ADD CONSTRAINT transacciones_pk PRIMARY KEY ( id_transaccion );

ALTER TABLE bovedas
    ADD CONSTRAINT bovedas_sucs_agens_fk FOREIGN KEY ( sucs_agens_id_suc_agen )
        REFERENCES sucs_agens ( id_suc_agen );

ALTER TABLE bovedas
    ADD CONSTRAINT bovedas_traninterbs_fk FOREIGN KEY ( traninterbs_id_interbancaria )
        REFERENCES traninterbs ( id_interbancaria );

ALTER TABLE cuentas
    ADD CONSTRAINT cuentas_clientes_fk FOREIGN KEY ( clientes_id_cliente )
        REFERENCES clientes ( id_cliente );

ALTER TABLE cuentas
    ADD CONSTRAINT cuentas_tipocuentas_fk FOREIGN KEY ( tipocuentas_id_tipo_cuenta )
        REFERENCES tipocuentas ( id_tipo_cuenta );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_departamentos_fk FOREIGN KEY ( departamentos_id_departamento )
        REFERENCES departamentos ( id_departamento );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_roles_fk FOREIGN KEY ( roles_id_rol )
        REFERENCES roles ( id_rol );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_sucs_agens_fk FOREIGN KEY ( sucs_agens_id_suc_agen )
        REFERENCES sucs_agens ( id_suc_agen );

ALTER TABLE estfinacieros
    ADD CONSTRAINT estfinacieros_cuentas_fk FOREIGN KEY ( cuentas_id_cuenta )
        REFERENCES cuentas ( id_cuenta );

ALTER TABLE histaudtorias
    ADD CONSTRAINT histaudtorias_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE histaudtorias
    ADD CONSTRAINT histaudtorias_transacciones_fk FOREIGN KEY ( transacciones_id_transaccion )
        REFERENCES transacciones ( id_transaccion );

ALTER TABLE historial_saldos
    ADD CONSTRAINT historial_saldos_cuentas_fk FOREIGN KEY ( cuentas_id_cuenta )
        REFERENCES cuentas ( id_cuenta );

ALTER TABLE histpres
    ADD CONSTRAINT histpres_prestamos_fk FOREIGN KEY ( prestamos_id_prestamo )
        REFERENCES prestamos ( id_prestamo );

ALTER TABLE municipios
    ADD CONSTRAINT municipios_departamentos_fk FOREIGN KEY ( departamentos_id_departamento )
        REFERENCES departamentos ( id_departamento );

ALTER TABLE prestamos
    ADD CONSTRAINT prestamos_clientes_fk FOREIGN KEY ( clientes_id_cliente )
        REFERENCES clientes ( id_cliente );

ALTER TABLE prestamos
    ADD CONSTRAINT prestamos_estprests_fk FOREIGN KEY ( estprests_id_eprestamo )
        REFERENCES estprests ( id_eprestamo );

ALTER TABLE secacces
    ADD CONSTRAINT secacces_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE sucs_agens
    ADD CONSTRAINT sucs_agens_departamentos_fk FOREIGN KEY ( departamentos_id_departamento )
        REFERENCES departamentos ( id_departamento );

ALTER TABLE tarjs_cred
    ADD CONSTRAINT tarjs_cred_clientes_fk FOREIGN KEY ( clientes_id_cliente )
        REFERENCES clientes ( id_cliente );

ALTER TABLE tarjs_cred
    ADD CONSTRAINT tarjs_cred_est_tarjetas_fk FOREIGN KEY ( est_tarjetas_id_estado )
        REFERENCES est_tarjetas ( id_estado );

ALTER TABLE tipo_sucs_agens
    ADD CONSTRAINT tipo_sucs_agens_sucs_agens_fk FOREIGN KEY ( sucs_agens_id_suc_agen )
        REFERENCES sucs_agens ( id_suc_agen );

ALTER TABLE tipo_transacs
    ADD CONSTRAINT tipo_transacs_sucs_agens_fk FOREIGN KEY ( sucs_agens_id_suc_agen )
        REFERENCES sucs_agens ( id_suc_agen );

ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_clientes_fk FOREIGN KEY ( clientes_id_cliente )
        REFERENCES clientes ( id_cliente );

ALTER TABLE transacciones
    ADD CONSTRAINT transacciones_tipo_transacs_fk FOREIGN KEY ( tipo_transacs_id_tipo_tran )
        REFERENCES tipo_transacs ( id_tipo_tran );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            22
-- CREATE INDEX                             2
-- ALTER TABLE                             45
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
