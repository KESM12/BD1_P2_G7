import random
import csv


# Número de registros
num_registros = 50

# Cantidad de bovedas
num_bovedas = 240

# Crear el archivo CSV
with open('CSV/TransaccionesInterbancarias.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['IdBovedaOrigen', 'IdBovedadDestino', 'Monto', 'Fecha']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un ID de boveda origen aleatorio
        id_boveda_origen = random.randint(1, num_bovedas)

        # Generar un ID de boveda destino aleatorio
        id_boveda_destino = random.randint(id_boveda_origen + 1, num_bovedas)
        
        # Generar un monto aleatorio
        monto = random.randint(1000, 100000)
        
        # Generar fecha y hora aleatorias
        fecha = f"{random.randint(2000, 2021)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
       # hora = f"{random.randint(0, 23):02d}:{random.randint(0, 59):02d}:{random.randint(0, 59):02d}"

        # Escribir la fila en el CSV
        writer.writerow({
            'IdBovedaOrigen': id_boveda_origen,
            'IdBovedadDestino': id_boveda_destino,
            'Monto': monto,
            'Fecha': fecha      
        })

print(f"Se han generado {num_registros} registros")
