-- BOVEDAS
CREATE TABLE BOVEDAS (
    id_boveda INTEGER NOT NULL,
    id_suc_agen INTEGER,
    efectivo_disponible NUMBER(10,2),
    efectivo_disponible_1 VARCHAR2(10),
    PRIMARY KEY (id_boveda)
);

-- CLIENTES
CREATE TABLE CLIENTES (
    id_cliente INTEGER NOT NULL,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    telefono VARCHAR2(12),
    PRIMARY KEY (id_cliente)
);

-- CUENTAS
CREATE TABLE CUENTAS (
    id_cuenta INTEGER NOT NULL,
    id_cliente INTEGER,
    id_tipo_cuenta INTEGER,
    numero_cuenta VARCHAR2(20),
    saldo NUMBER(10,2),
    PRIMARY KEY (id_cuenta),
    CONSTRAINT fk_cuentas_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    CONSTRAINT fk_cuentas_tipocuenta FOREIGN KEY (id_tipo_cuenta) REFERENCES TIPOCUENTAS(id_tipo_cuenta)
);

-- DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
    id_departamento INTEGER NOT NULL,
    nombre_dep VARCHAR2(100),
    id_municipio INTEGER,
    PRIMARY KEY (id_departamento)
);

-- EMPLEADOS
CREATE TABLE EMPLEADOS (
    id_empleado INTEGER NOT NULL,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    id_rol INTEGER,
    id_departamento INTEGER,
    id_suc_agen INTEGER,
    telefono VARCHAR2(12),
    PRIMARY KEY (id_empleado),
    CONSTRAINT fk_empleados_departamento FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTOS(id_departamento),
    CONSTRAINT fk_empleados_rol FOREIGN KEY (id_rol) REFERENCES ROLES(id_rol),
    CONSTRAINT fk_empleados_sucagen FOREIGN KEY (id_suc_agen) REFERENCES SUCS_AGENS(id_suc_agen)
);

-- ESTADOS_PRESTAMOS
CREATE TABLE ESTADOS_PRESTAMOS (
    id_eprestamo INTEGER NOT NULL,
    estado_prestamo VARCHAR2(50),
    PRIMARY KEY (id_eprestamo)
);

-- ESTADO_FINANCIERO
CREATE TABLE ESTADO_FINANCIERO (
    id_estado INTEGER NOT NULL,
    id_cuenta INTEGER,
    ingresos NUMBER(10,2),
    egresos NUMBER(10,2),
    capital NUMBER(10,2),
    fecha DATE,
    PRIMARY KEY (id_estado)
);

-- EST_TARJETAS
CREATE TABLE EST_TARJETAS (
    id_estado INTEGER NOT NULL,
    estado VARCHAR2(50),
    PRIMARY KEY (id_estado)
);

-- HISTORIAL_AUDITORIA
CREATE TABLE HISTORIAL_AUDITORIA (
    id_auditoria INTEGER NOT NULL,
    id_transaccion INTEGER,
    id_empleado INTEGER,
    fecha DATE,
    hora TIMESTAMP,
    PRIMARY KEY (id_auditoria),
    CONSTRAINT fk_hist_aud_empleado FOREIGN KEY (id_empleado) REFERENCES EMPLEADOS(id_empleado),
    CONSTRAINT fk_hist_aud_transaccion FOREIGN KEY (id_transaccion) REFERENCES TRANSACCIONES(id_transaccion)
);

-- HISTORIAL_PRESTAMOS
CREATE TABLE HISTORIAL_PRESTAMOS (
    id_historial_prestamo INTEGER NOT NULL,
    id_prestamo INTEGER,
    fecha_solicitud DATE,
    estado VARCHAR2(50),
    PRIMARY KEY (id_historial_prestamo),
    CONSTRAINT fk_hist_prestamo FOREIGN KEY (id_prestamo) REFERENCES PRESTAMOS(id_prestamo)
);

-- HISTORIAL_SALDOS
CREATE TABLE HISTORIAL_SALDOS (
    id_historial INTEGER NOT NULL,
    id_cuenta INTEGER,
    saldo NUMBER(10,2),
    fecha DATE,
    PRIMARY KEY (id_historial),
    CONSTRAINT fk_hist_saldo_cuenta FOREIGN KEY (id_cuenta) REFERENCES CUENTAS(id_cuenta)
);

-- MUNICIPIOS
CREATE TABLE MUNICIPIOS (
    id_municipio INTEGER NOT NULL,
    nombre_mun VARCHAR2(100),
    direccion VARCHAR2(255),
    codigo_postal VARCHAR2(10),
    PRIMARY KEY (id_municipio)
);

-- PRESTAMOS
CREATE TABLE PRESTAMOS (
    id_prestamo INTEGER NOT NULL,
    id_cliente INTEGER,
    monto_prest NUMBER(10,2),
    tasa_interes NUMBER(10,2),
    fecha_des DATE,
    fecha_ven DATE,
    saldo_pend NUMBER(10,2),
    id_eprestamo INTEGER,
    PRIMARY KEY (id_prestamo),
    CONSTRAINT fk_prestamos_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    CONSTRAINT fk_prestamos_estado FOREIGN KEY (id_eprestamo) REFERENCES ESTADOS_PRESTAMOS(id_eprestamo)
);

-- ROLES
CREATE TABLE ROLES (
    id_rol INTEGER NOT NULL,
    rol VARCHAR2(50),
    PRIMARY KEY (id_rol)
);

-- SEGURIDAD_ACCESO
CREATE TABLE SEGURIDAD_ACCESO (
    id_acceso INTEGER NOT NULL,
    id_empleado INTEGER,
    rol_acceso VARCHAR2(50),
    fecha_acceso DATE,
    hora_acceso TIMESTAMP,
    PRIMARY KEY (id_acceso),
    CONSTRAINT fk_seguridad_empleado FOREIGN KEY (id_empleado) REFERENCES EMPLEADOS(id_empleado)
);

-- SUCURSALES/AGENCIAS
CREATE TABLE SUCS_AGENS (
    id_suc_agen INTEGER NOT NULL,
    nombre VARCHAR2(100),
    id_tipo_suc_agen INTEGER,
    id_departamento INTEGER,
    telefono VARCHAR2(12),
    PRIMARY KEY (id_suc_agen),
    CONSTRAINT fk_sucagens_departamento FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTOS(id_departamento)
);

-- TARJETAS DE CREDITO
CREATE TABLE TARJS_CRED (
    id_tarjeta INTEGER NOT NULL,
    id_cliente INTEGER,
    numero_tarjeta VARCHAR2(20),
    limite_credito NUMBER(10,2),
    saldo_actual NUMBER(10,2),
    fecha_emision DATE,
    fecha_expiracion DATE,
    id_estado INTEGER,
    fecha_corte DATE,
    dia_ciclo INTEGER,
    PRIMARY KEY (id_tarjeta),
    CONSTRAINT fk_tarjeta_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    CONSTRAINT fk_tarjeta_estado FOREIGN KEY (id_estado) REFERENCES EST_TARJETAS(id_estado)
);

-- TIPOCUENTAS
CREATE TABLE TIPOCUENTAS (
    id_tipo_cuenta INTEGER NOT NULL,
    tipo_cuenta VARCHAR2(50),
    PRIMARY KEY (id_tipo_cuenta)
);

-- TRANSACCIONES
CREATE TABLE TRANSACCIONES (
    id_transaccion INTEGER NOT NULL,
    id_cliente INTEGER,
    monto NUMBER(10,2),
    fecha DATE,
    hora TIMESTAMP,
    descripcion VARCHAR2(255),
    id_suc_agen INTEGER,
    PRIMARY KEY (id_transaccion),
    CONSTRAINT fk_trans_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    CONSTRAINT fk_trans_sucagen FOREIGN KEY (id_suc_agen) REFERENCES SUCS_AGENS(id_suc_agen)
);

-- TRANSACCIONES_INTERBANCARIAS
CREATE TABLE TRANSACCIONES_INTERBANCARIAS (
    id_interbancaria INTEGER NOT NULL,
    id_boveda_origen INTEGER,
    id_boveda_destino INTEGER,
    monto NUMBER(10,2),
    fecha DATE,
    hora TIMESTAMP,
    PRIMARY KEY (id_interbancaria),
    CONSTRAINT fk_interbancaria_boveda FOREIGN KEY (id_boveda_origen) REFERENCES BOVEDAS(id_boveda)
);
