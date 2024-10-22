
CREATE TABLE BOVEDAS
  (
    id_boveda              INTEGER NOT NULL ,
    id_suc_agen            INTEGER ,
    efectivo_disponible    NUMBER (10,2) ,
    efectivo_disponible_1  VARCHAR2 (10) ,
    SUCS_AGENS_id_suc_agen INTEGER NOT NULL
  ) ;
ALTER TABLE BOVEDAS ADD CONSTRAINT BOVEDAS_PK PRIMARY KEY ( id_boveda ) ;


CREATE TABLE CLIENTES
  (
    id_cliente INTEGER NOT NULL ,
    nombre     VARCHAR2 (50) ,
    apellido   VARCHAR2 (50) ,
    telefono   VARCHAR2 (12)
  ) ;
ALTER TABLE CLIENTES ADD CONSTRAINT CLIENTES_PK PRIMARY KEY ( id_cliente ) ;


CREATE TABLE CUENTAS
  (
    id_cuenta                     INTEGER NOT NULL ,
    id_cliente                    INTEGER ,
    id_tipo_cuenta                INTEGER ,
    numero_cuenta                 VARCHAR2 (20) ,
    saldo                         NUMBER (10,2) ,
    CLIENTES_id_cliente           INTEGER NOT NULL ,
    TIPOCUENTAS_id_tipo_cuenta    INTEGER NOT NULL ,
    HISTORIAL_SALDOS_id_historial INTEGER NOT NULL ,
    ESTADO_FINANCIERO_id_estado   INTEGER NOT NULL
  ) ;
ALTER TABLE CUENTAS ADD CONSTRAINT CUENTA_PK PRIMARY KEY ( id_cuenta ) ;


CREATE TABLE DEPARTAMENTOS
  (
    id_departamento INTEGER NOT NULL ,
    nombre_dep      VARCHAR2 (100) ,
    id_municipio    INTEGER
  ) ;
ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY ( id_departamento ) ;


CREATE TABLE EMPLEADOS
  (
    id_empleado                   INTEGER NOT NULL ,
    nombre                        VARCHAR2 (50) ,
    apellido                      VARCHAR2 (50) ,
    id_rol                        INTEGER ,
    id_departamento               INTEGER ,
    id_suc_agen                   INTEGER ,
    telefono                      VARCHAR2 (12) ,
    DEPARTAMENTOS_id_departamento INTEGER NOT NULL ,
    ROLES_id_rol                  INTEGER NOT NULL ,
    SUCS_AGENS_id_suc_agen        INTEGER NOT NULL
  ) ;
ALTER TABLE EMPLEADOS ADD CONSTRAINT EMPLEADOS_PK PRIMARY KEY ( id_empleado ) ;


CREATE TABLE ESTADOS_PRESTAMOS
  (
    id_eprestamo    INTEGER NOT NULL ,
    estado_prestamo VARCHAR2 (50)
  ) ;
ALTER TABLE ESTADOS_PRESTAMOS ADD CONSTRAINT ESTADO_PRESTAMO_PK PRIMARY KEY ( id_eprestamo ) ;


CREATE TABLE ESTADO_FINANCIERO
  (
    id_estado INTEGER NOT NULL ,
    id_cuenta INTEGER ,
    ingresos  NUMBER (10,2) ,
    egresos   NUMBER (10,2) ,
    capital   NUMBER (10,2) ,
    fecha     DATE
  ) ;
ALTER TABLE ESTADO_FINANCIERO ADD CONSTRAINT ESTADO_FINANCIERO_PK PRIMARY KEY ( id_estado ) ;


CREATE TABLE EST_TARJETAS
  (
    id_estado INTEGER NOT NULL ,
    estado    VARCHAR2 (50)
  ) ;
ALTER TABLE EST_TARJETAS ADD CONSTRAINT ESTADO_TARJETA_PK PRIMARY KEY ( id_estado ) ;


CREATE TABLE HISTORIAL_AUDITORIA
  (
    id_auditoria                 INTEGER NOT NULL ,
    id_transaccion               INTEGER ,
    id_empleado                  INTEGER ,
    fecha                        DATE ,
    hora                         DATE ,
    EMPLEADOS_id_empleado        INTEGER NOT NULL ,
    TRANSACCIONES_id_transaccion INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX HISTORIAL_AUDITORIA__IDX ON HISTORIAL_AUDITORIA
  (
    TRANSACCIONES_id_transaccion ASC
  )
  ;
ALTER TABLE HISTORIAL_AUDITORIA ADD CONSTRAINT HISTORIAL_AUDITORIA_PK PRIMARY KEY ( id_auditoria ) ;


CREATE TABLE HISTORIAL_PRESTAMOS
  (
    id_historial_prestamo INTEGER NOT NULL ,
    id_prestamo           INTEGER ,
    fecha_solicitud       DATE ,
    estado                VARCHAR2 (50) ,
    PRESTAMOS_id_prestamo INTEGER NOT NULL
  ) ;
ALTER TABLE HISTORIAL_PRESTAMOS ADD CONSTRAINT HISTORIAL_PRESTAMOS_PK PRIMARY KEY ( id_historial_prestamo ) ;


CREATE TABLE HISTORIAL_SALDOS
  (
    id_historial INTEGER NOT NULL ,
    id_cuenta    INTEGER ,
    saldo        NUMBER (10,2) ,
    fecha        DATE
  ) ;
ALTER TABLE HISTORIAL_SALDOS ADD CONSTRAINT HISTORIAL_SALDOS_PK PRIMARY KEY ( id_historial ) ;


CREATE TABLE MUNICIPIOS
  (
    id_municipio                  INTEGER NOT NULL ,
    nombre_mun                    VARCHAR2 (100) ,
    direccion                     VARCHAR2 (255) ,
    codigo_postal                 VARCHAR2 (10) ,
    DEPARTAMENTOS_id_departamento INTEGER NOT NULL
  ) ;
ALTER TABLE MUNICIPIOS ADD CONSTRAINT MUNICIPIO_PK PRIMARY KEY ( id_municipio ) ;


CREATE TABLE PRESTAMOS
  (
    id_prestamo                    INTEGER NOT NULL ,
    id_cliente                     INTEGER ,
    monto_prest                    NUMBER (10,2) ,
    tasa_interes                   NUMBER (10,2) ,
    fecha_des                      DATE ,
    fecha_ven                      DATE ,
    saldo_pend                     NUMBER (10,2) ,
    id_eprestamo                   INTEGER ,
    CLIENTES_id_cliente            INTEGER NOT NULL ,
    ESTADOS_PRESTAMOS_id_eprestamo INTEGER NOT NULL
  ) ;
ALTER TABLE PRESTAMOS ADD CONSTRAINT PRESTAMO_PK PRIMARY KEY ( id_prestamo ) ;


CREATE TABLE ROLES
  ( id_rol INTEGER NOT NULL , rol VARCHAR2 (50)
  ) ;
ALTER TABLE ROLES ADD CONSTRAINT ROL_PK PRIMARY KEY ( id_rol ) ;


CREATE TABLE SEGURIDAD_ACCESO
  (
    id_acceso             INTEGER NOT NULL ,
    id_empleado           INTEGER ,
    rol_acceso            VARCHAR2 (50) ,
    fecha_acceso          DATE ,
    hora_acceso           DATE ,
    EMPLEADOS_id_empleado INTEGER NOT NULL
  ) ;
ALTER TABLE SEGURIDAD_ACCESO ADD CONSTRAINT SEGURIDAD_ACCESO_PK PRIMARY KEY ( id_acceso ) ;


CREATE TABLE SUCS_AGENS
  (
    id_suc_agen                   INTEGER NOT NULL ,
    nombre                        VARCHAR2 (100) ,
    id_tipo_suc_agen              INTEGER ,
    id_departamento               INTEGER ,
    telefono                      VARCHAR2 (12) ,
    DEPARTAMENTOS_id_departamento INTEGER NOT NULL
  ) ;
ALTER TABLE SUCS_AGENS ADD CONSTRAINT SUCURSALES_AGENCIAS_PK PRIMARY KEY ( id_suc_agen ) ;


CREATE TABLE TARJS_CRED
  (
    id_tarjeta             INTEGER NOT NULL ,
    id_cliente             INTEGER ,
    numero_tarjeta         VARCHAR2 (20) ,
    limite_credito         NUMBER (10,2) ,
    saldo_actual           NUMBER (10,2) ,
    fecha_emision          DATE ,
    fecha_expiracion       DATE ,
    id_estado              INTEGER ,
    fecha_corte            DATE ,
    dia_ciclo              INTEGER ,
    CLIENTES_id_cliente    INTEGER NOT NULL ,
    EST_TARJETAS_id_estado INTEGER NOT NULL
  ) ;
ALTER TABLE TARJS_CRED ADD CONSTRAINT TARJETAS_CREDITO_PK PRIMARY KEY ( id_tarjeta ) ;


CREATE TABLE TIPOCUENTAS
  (
    id_tipo_cuenta INTEGER NOT NULL ,
    tipo_cuenta    VARCHAR2 (50)
  ) ;
ALTER TABLE TIPOCUENTAS ADD CONSTRAINT TIPOCUENTA_PK PRIMARY KEY ( id_tipo_cuenta ) ;


CREATE TABLE TIPO_SUCS_AGENS
  (
    id_tipo_suc_agen       INTEGER NOT NULL ,
    tipo_suc_agen          VARCHAR2 (50) ,
    SUCS_AGENS_id_suc_agen INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX TIPO_SUCURSAL_AGENCIA__IDX ON TIPO_SUCS_AGENS
  (
    SUCS_AGENS_id_suc_agen ASC
  )
  ;
ALTER TABLE TIPO_SUCS_AGENS ADD CONSTRAINT TIPO_SUCURSAL_AGENCIA_PK PRIMARY KEY ( id_tipo_suc_agen ) ;


CREATE TABLE TIPO_TRANSACS
  (
    id_tipo_tran           INTEGER NOT NULL ,
    tipo_tran              VARCHAR2 (50) ,
    SUCS_AGENS_id_suc_agen INTEGER NOT NULL
  ) ;
ALTER TABLE TIPO_TRANSACS ADD CONSTRAINT TIPO_TRANSACCION_PK PRIMARY KEY ( id_tipo_tran ) ;


CREATE TABLE TRANSACCIONES
  (
    id_transaccion             INTEGER NOT NULL ,
    id_cliente                 INTEGER ,
    monto                      NUMBER (10,2) ,
    fecha                      DATE ,
    hora                       DATE ,
    descripcion                VARCHAR2 (255) ,
    id_suc_agen                INTEGER ,
    CLIENTES_id_cliente        INTEGER NOT NULL ,
    TIPO_TRANSACS_id_tipo_tran INTEGER NOT NULL
  ) ;
ALTER TABLE TRANSACCIONES ADD CONSTRAINT TRANSACCIONES_PK PRIMARY KEY ( id_transaccion ) ;


CREATE TABLE TRANSACCIONES_INTERBANCARIAS
  (
    id_interbancaria  INTEGER NOT NULL ,
    id_boveda_origen  INTEGER ,
    id_boveda_destino INTEGER ,
    monto             NUMBER (10,2) ,
    fecha             DATE ,
    hora              DATE ,
    BOVEDAS_id_boveda INTEGER NOT NULL
  ) ;
--  ERROR: PK name length exceeds maximum allowed length(30)
ALTER TABLE TRANSACCIONES_INTERBANCARIAS ADD CONSTRAINT TRANSACCIONES_INTERBANCARIAS_PK PRIMARY KEY ( id_interbancaria ) ;


ALTER TABLE BOVEDAS ADD CONSTRAINT BOVEDAS_SUCS_AGENS_FK FOREIGN KEY ( SUCS_AGENS_id_suc_agen ) REFERENCES SUCS_AGENS ( id_suc_agen ) ;

ALTER TABLE CUENTAS ADD CONSTRAINT CUENTAS_CLIENTES_FK FOREIGN KEY ( CLIENTES_id_cliente ) REFERENCES CLIENTES ( id_cliente ) ;

ALTER TABLE CUENTAS ADD CONSTRAINT CUENTAS_ESTADO_FINANCIERO_FK FOREIGN KEY ( ESTADO_FINANCIERO_id_estado ) REFERENCES ESTADO_FINANCIERO ( id_estado ) ;

ALTER TABLE CUENTAS ADD CONSTRAINT CUENTAS_HISTORIAL_SALDOS_FK FOREIGN KEY ( HISTORIAL_SALDOS_id_historial ) REFERENCES HISTORIAL_SALDOS ( id_historial ) ;

ALTER TABLE CUENTAS ADD CONSTRAINT CUENTAS_TIPOCUENTAS_FK FOREIGN KEY ( TIPOCUENTAS_id_tipo_cuenta ) REFERENCES TIPOCUENTAS ( id_tipo_cuenta ) ;

ALTER TABLE EMPLEADOS ADD CONSTRAINT EMPLEADOS_DEPARTAMENTOS_FK FOREIGN KEY ( DEPARTAMENTOS_id_departamento ) REFERENCES DEPARTAMENTOS ( id_departamento ) ;

ALTER TABLE EMPLEADOS ADD CONSTRAINT EMPLEADOS_ROLES_FK FOREIGN KEY ( ROLES_id_rol ) REFERENCES ROLES ( id_rol ) ;

ALTER TABLE EMPLEADOS ADD CONSTRAINT EMPLEADOS_SUCS_AGENS_FK FOREIGN KEY ( SUCS_AGENS_id_suc_agen ) REFERENCES SUCS_AGENS ( id_suc_agen ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE HISTORIAL_AUDITORIA ADD CONSTRAINT HISTORIAL_AUDITORIA_EMPLEADOS_FK FOREIGN KEY ( EMPLEADOS_id_empleado ) REFERENCES EMPLEADOS ( id_empleado ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE HISTORIAL_AUDITORIA ADD CONSTRAINT HISTORIAL_AUDITORIA_TRANSACCIONES_FK FOREIGN KEY ( TRANSACCIONES_id_transaccion ) REFERENCES TRANSACCIONES ( id_transaccion ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE HISTORIAL_PRESTAMOS ADD CONSTRAINT HISTORIAL_PRESTAMOS_PRESTAMOS_FK FOREIGN KEY ( PRESTAMOS_id_prestamo ) REFERENCES PRESTAMOS ( id_prestamo ) ;

ALTER TABLE MUNICIPIOS ADD CONSTRAINT MUNICIPIOS_DEPARTAMENTOS_FK FOREIGN KEY ( DEPARTAMENTOS_id_departamento ) REFERENCES DEPARTAMENTOS ( id_departamento ) ;

ALTER TABLE PRESTAMOS ADD CONSTRAINT PRESTAMOS_CLIENTES_FK FOREIGN KEY ( CLIENTES_id_cliente ) REFERENCES CLIENTES ( id_cliente ) ;

ALTER TABLE PRESTAMOS ADD CONSTRAINT PRESTAMOS_ESTADOS_PRESTAMOS_FK FOREIGN KEY ( ESTADOS_PRESTAMOS_id_eprestamo ) REFERENCES ESTADOS_PRESTAMOS ( id_eprestamo ) ;

ALTER TABLE SEGURIDAD_ACCESO ADD CONSTRAINT SEGURIDAD_ACCESO_EMPLEADOS_FK FOREIGN KEY ( EMPLEADOS_id_empleado ) REFERENCES EMPLEADOS ( id_empleado ) ;

ALTER TABLE SUCS_AGENS ADD CONSTRAINT SUCS_AGENS_DEPARTAMENTOS_FK FOREIGN KEY ( DEPARTAMENTOS_id_departamento ) REFERENCES DEPARTAMENTOS ( id_departamento ) ;

ALTER TABLE TARJS_CRED ADD CONSTRAINT TARJS_CRED_CLIENTES_FK FOREIGN KEY ( CLIENTES_id_cliente ) REFERENCES CLIENTES ( id_cliente ) ;

ALTER TABLE TARJS_CRED ADD CONSTRAINT TARJS_CRED_EST_TARJETAS_FK FOREIGN KEY ( EST_TARJETAS_id_estado ) REFERENCES EST_TARJETAS ( id_estado ) ;

ALTER TABLE TIPO_SUCS_AGENS ADD CONSTRAINT TIPO_SUCS_AGENS_SUCS_AGENS_FK FOREIGN KEY ( SUCS_AGENS_id_suc_agen ) REFERENCES SUCS_AGENS ( id_suc_agen ) ;

ALTER TABLE TIPO_TRANSACS ADD CONSTRAINT TIPO_TRANSACS_SUCS_AGENS_FK FOREIGN KEY ( SUCS_AGENS_id_suc_agen ) REFERENCES SUCS_AGENS ( id_suc_agen ) ;

ALTER TABLE TRANSACCIONES ADD CONSTRAINT TRANSACCIONES_CLIENTES_FK FOREIGN KEY ( CLIENTES_id_cliente ) REFERENCES CLIENTES ( id_cliente ) ;

--  ERROR: FK name length exceeds maximum allowed length(30)
ALTER TABLE TRANSACCIONES_INTERBANCARIAS ADD CONSTRAINT TRANSACCIONES_INTERBANCARIAS_BOVEDAS_FK FOREIGN KEY ( BOVEDAS_id_boveda ) REFERENCES BOVEDAS ( id_boveda ) ;

ALTER TABLE TRANSACCIONES ADD CONSTRAINT TRANSACCIONES_TIPO_TRANSACS_FK FOREIGN KEY ( TIPO_TRANSACS_id_tipo_tran ) REFERENCES TIPO_TRANSACS ( id_tipo_tran ) ;


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
-- ERRORS                                   5
-- WARNINGS                                 0
