import random
import csv

# Número de registros
num_registros = 200000


# Crear el archivo CSV
with open('CSV/EstadoFinanciero.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Ingresos', 'Egresos', 'Capital', 'Fecha', 'Cuenta']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):

        # Generar ingresos aleatorios
        ingresos = random.randint(1, 1000000)

        # Generar egresos aleatorios
        egresos = random.randint(1, ingresos)

        # Generar saldo aleatorio
        Capital = ingresos - egresos

        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"

        # Generar cuenta aleatoria
        cuenta = random.randint(1, num_registros)  
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Ingresos': ingresos,
            'Egresos': egresos,
            'Capital': Capital,
            'Fecha': fecha,
            'Cuenta': cuenta
        })

print(f"Se han generado {num_registros} registros")
