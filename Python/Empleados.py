import random
import csv

# Lista de nombres y apellidos
nombres = [
    "WALTER JOSUE",
"ESDRAS BENJAMIN",
"EDUARDO ISMAEL",
"JESER OBDULIO",
"VICTOR ABDIEL",
"EDDY ALEJANDRO",
"MANOLO RICARDO",
"CARLOS JEZEH GEDEONI",
"KEVIN ESTUARDO",
"OSCAR EDUARDO",
"JOSÉ JAVIER",
"JONATHAN JOSUÉ",
"JAVIER ANDRÉS",
"CARLOS EDUARDO",
"JOSUÉ ALEJANDRO",
"MARÍA ISABEL",
"LUIS EDUARDO",
"JOHATAN ERNESTO",
"LUIS FERNANDO",
"ERICK ABDUL",
"JONNATHAN ALEXANDER",
"JUAN SEBASTIAN",
"PABLO DANIEL",
"JOHNNY WHILLMAN",
"JUAN JOSÉ",
"JHONATAN JOSUÉ",
"WALTER DANIEL",
"KELLY ZUCETH",
"CARLOS ALEJANDRO",
"KEVIN EDUARDO",
"LOURDES PATRICIA",
"LUISA DANIELA",
"IVAN ALESSANDRO",
"ALLAN RICARDO",
"BRAYAN ESTIBEN",
"OSCAR FERNANDO",
"KERVIN ADOLFO",
"MOISES ANTONIO",
"DIANA ESTEFANIA",
"PEDRO LUIS",
"LUIS EDUARDO",
"BRIAN ESTUARDO",
"CARMEN MARIA",
"KEVIN ORLANDO",
"JORGE SEBASTIAN",
"TOBÍAS FRANCISCO",
"SEBASTIAN EDGARDO",
"EDUARDO ANDRÉS",
"ALLAN JOSUÉ",
"DAMARIS MAGALI",
"KARLA ERNESTINA",
"LUIS CESAR",
"RAMIRO AGUSTÍN",
"EDWIN AMAN",
"EDWIN",
"RIVER ANDERSON",
"WILLIAM ADOLFO",
"MAURICIO ANTONIO",
"LOPEZ LEMUS",
"FRANCISCO DANIEL",
"ALVARO ESAU",
"RICHARD ALEXANDRO",
"SERGIO SAUL",
"RUBÉN ALEJANDRO",
"ISAI"
]

apellidos = [
"DE LA CRUZ LOPEZ",
"COTTO REVOLORIO",
"LLAMAS CALDERON",
"COLLADO GONZALEZ",
"LUX JURACÁN",
"MURGA BARILLAS",
"RAMIREZ MAZARIEGOS",
"TOSCANO PALACIOS",
"SECAIDA MOLINA",
"MORALES GIRÓN",
"SANTIZO DÍAZ",
"ARGUETA SALAZAR",
"VALDEZ GONZÁLEZ",
"CARRERA AGUILAR",
"PÉREZ BENITO",
"MASAYA CORDOVA",
"MONROY PÉREZ",
"FUENTES OSOY",
"GÓMEZ RENDÓN",
"CHACON BARILLAS",
"CHOCÓN GÓMEZ",
"HIGUEROS DE LEÓN",
"FERNÁNDEZ CHACÓN",
"ALDANA OSORIO",
"GERARDI HERNÁNDEZ",
"TZUNÚN YAX",
"JIMÉNEZ HERNÁNDEZ",
"GUTIÉRREZ VELÁSQUEZ",
"ROSALES MEDINA",
"CASTAÑEDA HERNÁNDEZ",
"REYES CASTILLO",
"VELÁSQUEZ RODAS",
"HILARIO CHACÓN",
"BARILLAS SOSA",
"MICA PEREZ",
"LÓPEZ PIRIR",
"CARDONA RAMÍREZ",
"CONDE HERNANDEZ",
"BERDUCIDO DOMINGO",
"PU TAVICO",
"DE LEÓN PACHECO",
"AJUCHÁN TOCOCH",
"MARROQUIN LLAMAS",
"CAMBARA GARCIA",
"ZAMORA POLANCO",
"ZAMORA SANTOS",
"GODOY SALVATIERRA",
"CUEVAS TZÚN",
"GÓMEZ CÚN",
"ARCE GUZMAN",
"GONZALEZ POLANCO",
"LIZAMA QUIÑONEZ",
"TÉLLES CARCUZ",
"SAM PUM",
"SANDOVAL LÓPEZ",
"ISMALEJ ROMAN",
"MAZARIEGOS GARCÍA",
"CASTRO GUERRA",
"JOSE MANUEL",
"PERUCH DE LEÓN",
"ARENAS GONZALEZ",
"MARROQUIN ARANA",
"RALDA MEJIA",
"RALDA MEJIA",
"DARDON MAYEN"
]

tipo_cuenta = ['Ahorro', 'Monetaria', 'Corriente']
Roles = ['Cajero', 'Gerente', 'Auxiliar', 'RRHH', 'Contador', 'Auditor', 'Asesor']
 

# Número de registros
num_registros = 240

# Número de sucursales
num_sucursales = 23


# Crear el archivo CSV
with open('Empleados.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Nombre', 'Apellido', 'Telefono', 'Rol', 'Departamento', 'Suc/Agen']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()

    # Para la agencia principal
    for _ in range(20):
        writer.writerow({
            'Nombre': random.choice(nombres),
            'Apellido': random.choice(apellidos),
            'Telefono': f'+502{random.randint(10000000, 99999999)}',
            'Rol': random.choice(Roles),
            'Departamento': 1,
            'Suc/Agen': 1
        })
    
    # Para el resto de agencias o sucursales.
    for sucursales in range (2, num_sucursales +1):
        for _ in range(10):
            writer.writerow({
                'Nombre': random.choice(nombres),
                'Apellido': random.choice(apellidos),
                'Telefono': f'+502{random.randint(10000000, 99999999)}',
                'Rol': random.choice(Roles),
                'Departamento': f'{random.randint(2, 22)}',
                'Suc/Agen': sucursales
            })
            
print(f'Se han generado {num_registros} registros en el archivo clientes.csv')