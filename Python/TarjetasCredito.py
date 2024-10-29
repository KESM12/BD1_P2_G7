import random
import csv
from datetime import datetime, timedelta

# Número de registros
num_registros = 200000

# Crear el archivo CSV
with open('CSV/TarjetasCreditos.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['NumeroTarjeta', 'Limite', 'Saldo', 'FechaEmision', 'FechaExpiración', 'FechaCorte', 'DíaCiclo', 'Cliente', 'Estado']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        
        # Generar un número de tarjeta aleatorio de 16 dígitos
        numero_tarjeta = ''.join([str(random.randint(0, 9)) for _ in range(16)])

        # Generar un límite de crédito aleatorio
        limite = random.randint(5000, 50000)  # Limite entre 5,000 y 50,000

        # Generar un saldo actual aleatorio, que debe ser menor o igual al límite de crédito
        saldo = round(random.uniform(0, limite), 2)

        # Generar una fecha de emisión aleatoria
        year_emision = random.randint(2015, 2021)
        month_emision = random.randint(1, 12)
        day_emision = random.randint(1, 28)
        fecha_emision = datetime(year_emision, month_emision, day_emision)

        # Generar una fecha de expiración entre 3 y 5 años después de la emisión
        años_hasta_expiracion = random.randint(3, 5)
        fecha_expiracion = fecha_emision + timedelta(days=365 * años_hasta_expiracion)

        # Definir la fecha de corte, un día aleatorio en el mes de emisión
        dia_corte = random.randint(1, 28)
        fecha_corte = fecha_emision.replace(day=dia_corte)

        # Día del ciclo de facturación (es el día de corte)
        dia_ciclo = dia_corte

        # Generar un estado aleatorio (1 = Activa, 2 = Suspendida, 3 = Cancelada)
        estado = random.randint(1, 3)

        # Generar un ID de cliente aleatorio
        id_cliente = random.randint(1, num_registros)
        
        # Escribir la fila en el CSV
        writer.writerow({
            'NumeroTarjeta': numero_tarjeta,
            'Limite': limite,
            'Saldo': saldo,
            'FechaEmision': fecha_emision.strftime("%Y-%m-%d"),
            'FechaExpiración': fecha_expiracion.strftime("%Y-%m-%d"),
            'FechaCorte': fecha_corte.strftime("%Y-%m-%d"),
            'DíaCiclo': dia_ciclo,
            'Cliente': id_cliente,
            'Estado': estado          
        })

print(f"Se han generado {num_registros} registros")
