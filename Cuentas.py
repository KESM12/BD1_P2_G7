import random
import csv

# Número de registros
num_registros = 250000

# Crear el archivo CSV
with open('CSV/Cuentas.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Cliente', 'TipoCuenta', 'NumeroCuenta', 'Saldo']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un cliente.
        cliente = random.randint(0, 250000)

        # Generar un saldo aleatorio
        saldo = random.randint(1000, 1000000)
        
        # Asignar un número de cuenta (secuencial)
        numero_cuenta = f"{random.randint(10000000000000000000, 99999999999999999999)}"  # varchar(20)

        # Elegir un tipo de cuenta aleatorio
        tipo = random.randint(1, 3)

        # Generar un saldo aleatorio
        saldo = random.randint(1000, 1000000)
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Cliente': cliente,
            'TipoCuenta': tipo, 
            'NumeroCuenta': numero_cuenta, 
            'Saldo': saldo
            })

print("El archivo 'clientes.csv' ha sido generado con 500,000 registros.")
