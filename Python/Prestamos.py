import random
import csv
from datetime import datetime, timedelta

# Número de registros
num_registros = 50

# Crear el archivo CSV
with open('CSV/Prestamos.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Monto', 'TasaInteres', 'FechaDesembolso', 'FechaVencimiento', 'SaldoPendiente', 'Cliente', 'Estado']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        
        # Generar un monto aleatorio
        monto = random.randint(1000, 100000)
        
        # Generar una tasa de interés aleatoria
        tasa_interes = random.randint(1, 10)

        # Generar una fecha de desembolso aleatoria
        year_desembolso = random.randint(2000, 2021)
        month_desembolso = random.randint(1, 12)
        day_desembolso = random.randint(1, 28)  # Evitamos días fuera de rango
        fecha_desembolso = datetime(year_desembolso, month_desembolso, day_desembolso)

        # Generar una fecha de vencimiento aleatoria posterior a la fecha de desembolso
        days_until_vencimiento = random.randint(30, 365)  # Entre 1 y 12 meses aproximadamente
        fecha_vencimiento = fecha_desembolso + timedelta(days=days_until_vencimiento)

        # Convertir las fechas a formato de cadena
        fechaD_str = fecha_desembolso.strftime("%Y-%m-%d")
        fechaV_str = fecha_vencimiento.strftime("%Y-%m-%d")

        # Definir el saldo pendiente
        if random.random() < 0.5:  # 50% de probabilidad de tener un saldo pendiente
            saldo_pendiente = round(monto * random.uniform(0.2, 0.8), 2)  # Entre 20% y 80% del monto
        else:
            # Si no tiene saldo pendiente, consideramos el préstamo completamente pagado
            saldo_pendiente = 0.0

        # Generar un estado aleatorio
        estado = random.randint(1, 3)
        
        # Generar un ID de cliente aleatorio
        id_cliente = random.randint(1, num_registros)
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Cliente': id_cliente,
            'Monto': monto,
            'TasaInteres': tasa_interes,
            'FechaDesembolso': fechaD_str,
            'FechaVencimiento': fechaV_str,
            'SaldoPendiente': saldo_pendiente,
            'Estado': estado          
        })

print(f"Se han generado {num_registros} registros")
