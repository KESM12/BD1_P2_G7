import random
import csv

# Lista de valores posibles para cada columna
id_cliente = ['1', '2', '3', '4', '5']
descripcion = ['Deposito', 'Retiro', 'Transferencia', 'Pago', 'Compra']

# Número de registros
num_registros = 50

# Crear el archivo CSV
with open('CSV/Transacciones.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Monto', 'Fecha', 'Hora', 'Descripcion', 'Cliente', 'TipoTransaccion']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un ID de cliente aleatorio
        id_cliente = random.randint(1, 5)
        
        # Generar un monto aleatorio
        monto = random.randint(1000, 100000)
        
        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
        #hora = f"{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}"

        # Generar una descripción aleatoria
        descripcion_random = random.choice(descripcion)

        # Generar un ID de sucursal/agencia aleatorio
        tipo = random.randint(1, 5)

        # Escribir la fila en el CSV
        writer.writerow({
            'Monto': monto,
            'Fecha': fecha,
           # 'Hora': hora,
            'Descripcion': descripcion_random,
            'TipoTransaccion': tipo,
            'Cliente': id_cliente,
        
        })

print(f"Se han generado {num_registros} registros")
