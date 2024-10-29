import random
import csv

# Número de registros
num_registros = 50


# Crear el archivo CSV
with open('CSV/SecAcces.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Rol', 'Fecha', 'Hora', 'IdEmpleado']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar rol aleatorio
        roles = random.randint(1, 4)

        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
       # hora = f"{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}"
        
        # Generar un estado aleatorio
        idTransaccion = random.randint(1, num_registros)

        # Generar un ID de usuario aleatorio
        user = random.randint(1, num_registros)
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Rol': roles,
            'Fecha': fecha,
        #    'Hora': hora,
            'IdEmpleado': user
        })
         

print(f"Se han generado {num_registros} registros")
