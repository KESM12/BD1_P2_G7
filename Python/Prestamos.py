import random
import csv

# Número de registros
num_registros = 250000

# Crear el archivo CSV
with open('Prestamos.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Cliente', 'Monto', 'TasaInteres',  'FechaDesembolso',  'FechaVencimiento', 'Estado']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un ID de cliente aleatorio
        id_cliente = random.randint(1, 300)
        
        # Generar un monto aleatorio
        monto = random.randint(1000, 100000)
        
        # Generar una tasa de interés aleatoria
        tasa_interes = random.randint(1, 10)

        # Generar fecha y hora aleatorias
        fechaD = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
        fechaV = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"

        # Generar un estado aleatorio
        estado = random.randint(1, 3)

        # Escribir la fila en el CSV
        writer.writerow({
            'Cliente': id_cliente,
            'Monto': monto,
            'TasaInteres': tasa_interes,
            'FechaDesembolso': fechaD,
            'FechaVencimiento': fechaV,
            'Estado': estado          
        })

print(f"Se han generado {num_registros} registros")
