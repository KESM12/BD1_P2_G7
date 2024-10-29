import random
import csv

# Número de registros
num_registros = 1000

# Crear el archivo CSV
with open('CSV/Auditoria.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Transaccion', 'Empleado', 'Fecha']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un ID de cliente aleatorio
        id_transaccion = random.randint(1, 50)
        
        # Generar un Id de empleado aleatorio
        id_empleado = random.randint(1, 4)

        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
       #hora = f"{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}"

        
        # Escribir la fila en el CSV
        writer.writerow({
            "Transaccion": id_transaccion,
            "Empleado": id_empleado,
            "Fecha": fecha
          #  "Hora": hora
        })

print(f"Se han generado {num_registros} registros")
