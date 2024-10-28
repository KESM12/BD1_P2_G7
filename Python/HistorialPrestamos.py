import random
import csv

# Número de registros
num_registros = 50


# Crear el archivo CSV
with open('CSV/HistPrestamos.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['FechaSolicitud', 'Estado', 'Prestamo']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"

        # Generar un estado aleatorio
        estado = random.randint(1, 3)

        # Generar un ID de préstamo aleatorio
        prestamo = random.randint(1, num_registros)
        
        # Escribir la fila en el CSV
        writer.writerow({
            'FechaSolicitud': fecha,
            'Estado': estado,
            'Prestamo': prestamo
        })

print(f"Se han generado {num_registros} registros")
