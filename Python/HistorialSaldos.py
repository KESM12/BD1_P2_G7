import random
import csv

# Número de registros
num_registros = 50


# Crear el archivo CSV
with open('CSV/HistSaldo.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Saldo', 'Fecha', 'Cuenta']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar saldo aleatorio
        saldo = random.randint(1, 1000000)

        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"

        # Generar cuenta aleatoria
        cuenta = random.randint(1, num_registros)  
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Saldo': saldo,
            'Fecha': fecha,
            'Cuenta': cuenta
        })

print(f"Se han generado {num_registros} registros")
