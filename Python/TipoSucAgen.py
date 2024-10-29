import random
import csv

# Número de registros
num_registros = 3
#1 Sucursal Principal
#2 Agencia
#3 Cajero Automático


# Crear el archivo CSV
with open('CSV/TipoSucAgen.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Tipo']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un Tipo de transacción aleatorio
        tipo = random.choice(['Sucursal Principal', 'Agencia', 'Cajero Automático'])

        # Generar un ID de sucursal/agencia aleatorio
      
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Tipo': tipo,
        })

print(f"Se han generado {num_registros} registros")
