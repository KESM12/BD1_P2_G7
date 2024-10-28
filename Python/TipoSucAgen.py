import random
import csv

# Número de registros
num_registros = 50
#1 Sucursal Principal
#2 Agencia
#3 Cajero Automático


# Crear el archivo CSV
with open('CSV/TipoSucAgen.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Tipo', 'IDSucursal/Agencia']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Generar un Tipo de transacción aleatorio
        tipo = random.randint(1, 3)

        # Generar un ID de sucursal/agencia aleatorio
        IDSucursal_Agencia = random.randint(1, 60)
      
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Tipo': tipo,
            'IDSucursal/Agencia': IDSucursal_Agencia
        })

print(f"Se han generado {num_registros} registros")
