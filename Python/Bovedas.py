import random
import csv

# Número de registros
num_registros = 50


# Crear el archivo CSV
with open('CSV/Bovedas.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['efectivo', 'efectivo1', 'idSucAgen', 'TransaccionesInterbancarias']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar efectivo disponible
        efectivo = random.randint(1000, 10000)

        # Generar efectivo disponible
        efectivo1 = random.randint(efectivo, 90000)

        # Generar idSucAgen
        idSucAgen = random.randint(1, 60)

        # Generar TransaccionesInterbancarias
        interBanc = random.randint(1, num_registros)

        # Escribir la fila en el CSV
        writer.writerow({
            'efectivo': efectivo,
            'efectivo1': efectivo1,
            'idSucAgen': idSucAgen,
            'TransaccionesInterbancarias': interBanc
        })

print(f"Se han generado {num_registros} registros")
