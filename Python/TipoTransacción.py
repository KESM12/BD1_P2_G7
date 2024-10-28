import random
import csv

# Número de registros
num_registros = 50


# Crear el archivo CSV
with open('CSV/TipoTransaccion.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Tipo', 'IDSucursal/Agencia']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un Tipo de transacción aleatorio
        tipo = random.randint(1, 5)

        # Generar un ID de sucursal/agencia aleatorio
        IDSucursal_Agencia = random.randint(1, 60)
      
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Tipo': tipo,
            'IDSucursal/Agencia': IDSucursal_Agencia
        })

print(f"Se han generado {num_registros} registros")
