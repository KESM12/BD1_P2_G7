### **Informe de Configuración de AWS para el Proyecto de Sistema Bancario**

#### **Resumen General**
Para desplegar la infraestructura de un sistema bancario en AWS, se seleccionaron Amazon RDS for Oracle, Amazon EC2 y Amazon S3. Estas configuraciones fueron elegidas específicamente para cumplir con los requisitos de alta disponibilidad, seguridad, y gestión de datos de un sistema bancario bajo las regulaciones de la Superintendencia de Bancos de Guatemala, garantizando que el sistema sea escalable, accesible y esté optimizado en costos.

---

### **1. Amazon RDS for Oracle**
   - **Tipo de instancia**: `db.m5.large`, configuración Multi-AZ.
   - **Almacenamiento**: 500 GB SSD (gp2) para la base de datos, más 100 GB adicionales para copias de seguridad.
   - **Licencia**: Bring Your Own License (BYOL), Edición Enterprise.
   - **Modelo de Precios**: Instancia reservada por un año con pago inicial parcial.

**Motivo de la Configuración**:
El servicio de Amazon RDS for Oracle fue seleccionado para soportar la base de datos crítica del sistema bancario debido a su capacidad para manejar datos transaccionales con altos niveles de seguridad y disponibilidad. La instancia `db.m5.large` proporciona el rendimiento necesario con 2 vCPU y 8 GB de memoria para gestionar las consultas y operaciones bancarias. La configuración Multi-AZ permite mantener alta disponibilidad, una exigencia clave para asegurar la continuidad del servicio. Además, el almacenamiento en SSD de uso general garantiza tiempos de respuesta rápidos, mientras que los 100 GB adicionales para copias de seguridad permiten un respaldo seguro y frecuente de los datos. Finalmente, la instancia reservada con BYOL y pago inicial parcial asegura una reducción en costos al mantener el servicio en funcionamiento durante el año.

---

### **2. Amazon EC2**
   - **Tipo de Instancia**: `t3.medium` (2 vCPU y 4 GiB de memoria).
   - **Modelo de Precios**: Compute Savings Plan por un año sin pago inicial.
   - **Almacenamiento (EBS)**: 100 GB SSD (gp3).
   - **Transferencia de datos**:
      - Salida de datos hacia Internet: 500 GB/mes.
      - Transferencia intra-región: 1 TB/mes.

**Motivo de la Configuración**:
La instancia `t3.medium` fue elegida para ejecutar la lógica del sistema y manejar las solicitudes que se conectan con Amazon RDS. Con 2 vCPU y 4 GiB de RAM, esta configuración es óptima para procesar las operaciones transaccionales y consultas del sistema. El almacenamiento en EBS (gp3) de 100 GB permite almacenar logs y otros archivos temporales con suficiente capacidad y rendimiento a un costo efectivo. El Compute Savings Plan de un año sin pago inicial reduce significativamente los costos en comparación con las opciones de pago por demanda, siendo adecuado para una instancia que estará en uso constante. La transferencia de datos hacia Internet fue estimada en 500 GB mensuales, mientras que la transferencia interna en 1 TB mensual, lo que cubrirá el volumen esperado de interacción entre EC2 y RDS y permite flexibilidad en el acceso externo.

---

### **3. Amazon S3**
   - **S3 Standard**:
      - Almacenamiento de 100 GB/mes.
      - 1,000 solicitudes PUT/COPY/POST al mes y 5,000 solicitudes GET/SELECT al mes.
   - **S3 Standard - Infrequent Access (IA)**:
      - Almacenamiento de 50 GB/mes.
      - 15 solicitudes de transición del ciclo de vida al mes.
   - **S3 Glacier Flexible Retrieval**:
      - Almacenamiento de 50 GB/mes, con tamaño de objeto de 16 MB.
      - 10 solicitudes de transición al mes.
   - **Transferencia de datos de salida**:
      - 1 TB al mes hacia Internet.

**Motivo de la Configuración**:
Amazon S3 fue seleccionado como el sistema de almacenamiento para respaldos de la base de datos y archivos históricos debido a su capacidad para gestionar grandes volúmenes de datos de manera escalable y segura. La clase de almacenamiento **S3 Standard** fue elegida para respaldos de acceso frecuente y archivos recientes, mientras que **S3 Standard-IA** permite almacenar datos de acceso menos frecuente a un costo menor. Además, **S3 Glacier Flexible Retrieval** fue configurado para respaldos históricos de largo plazo que necesitan archivarse con bajo costo de almacenamiento.

La configuración de transferencia de datos de salida a Internet de 1 TB/mes cubre el acceso externo a archivos y respaldos cuando sea necesario. Las reglas de ciclo de vida automatizan la transición de datos entre clases de almacenamiento, optimizando costos al archivar datos en Glacier después de 90 días.

---

### **Resumen de Costos**
   - **Costo Inicial**: $882 USD (principalmente el pago parcial por la instancia de RDS).
   - **Costo Mensual**: $390.70 USD.
   - **Costo Total por 12 Meses**: $5,570.40 USD.

**Conclusión**:
La configuración seleccionada para el sistema bancario en AWS cumple con los requisitos de seguridad, disponibilidad y rendimiento del proyecto, utilizando una combinación de instancias reservadas y planes de ahorro en RDS y EC2 para reducir los costos generales. Las clases de almacenamiento en S3 fueron elegidas para maximizar la economía a través de un ciclo de vida que optimiza los costos de almacenamiento de datos históricos y respaldos. En conjunto, esta configuración proporciona una infraestructura robusta y optimizada para la operación y expansión del sistema bancario en AWS.