import random
import csv

# Lista de nombres y apellidos
nombres = [
    "WALTER", "JOSUE",
    "ESDRAS", "BENJAMIN",
    "EDUARDO", "ISMAEL",
    "JESER", "OBDULIO",
    "VICTOR", "ABDIEL",
    "EDDY", "ALEJANDRO",
    "MANOLO", "RICARDO",
    "CARLOS", "JEZEH", "GEDEONI",
    "KEVIN", "ESTUARDO",
    "OSCAR", "EDUARDO",
    "JOSÉ", "JAVIER",
    "JONATHAN", "JOSUÉ",
    "JAVIER", "ANDRÉS",
    "CARLOS", "EDUARDO",
    "JOSUÉ", "ALEJANDRO",
    "MARÍA", "ISABEL",
    "LUIS", "EDUARDO",
    "JOHATAN", "ERNESTO",
    "LUIS", "FERNANDO",
    "ERICK", "ABDUL",
    "JONNATHAN", "ALEXANDER",
    "JUAN", "SEBASTIAN",
    "PABLO", "DANIEL",
    "JOHNNY", "WHILLMAN",
    "JUAN", "JOSÉ",
    "JHONATAN", "JOSUÉ",
    "WALTER", "DANIEL",
    "KELLY", "ZUCETH",
    "CARLOS", "ALEJANDRO",
    "KEVIN", "EDUARDO",
    "LOURDES", "PATRICIA",
    "LUISA", "DANIELA",
    "IVAN", "ALESSANDRO",
    "ALLAN", "RICARDO",
    "BRAYAN", "ESTIBEN",
    "OSCAR", "FERNANDO",
    "KERVIN", "ADOLFO",
    "MOISES", "ANTONIO",
    "DIANA", "ESTEFANIA",
    "PEDRO", "LUIS",
    "LUIS", "EDUARDO",
    "BRIAN", "ESTUARDO",
    "CARMEN", "MARIA",
    "KEVIN", "ORLANDO",
    "JORGE", "SEBASTIAN",
    "TOBÍAS", "FRANCISCO",
    "SEBASTIAN", "EDGARDO",
    "EDUARDO", "ANDRÉS",
    "ALLAN", "JOSUÉ",
    "DAMARIS", "MAGALI",
    "KARLA", "ERNESTINA",
    "LUIS", "CESAR",
    "RAMIRO", "AGUSTÍN",
    "EDWIN", "AMAN",
    "EDWIN",
    "RIVER", "ANDERSON",
    "WILLIAM", "ADOLFO",
    "MAURICIO", "ANTONIO",
    "LOPEZ", "LEMUS",
    "FRANCISCO", "DANIEL",
    "ALVARO", "ESAU",
    "RICHARD", "ALEXANDRO",
    "SERGIO", "SAUL",
    "RUBÉN", "ALEJANDRO",
    "ISAI"
]

apellidos = [
"DE LA CRUZ", "LOPEZ",
"COTTO", "REVOLORIO",
"LLAMAS", "CALDERON",
"COLLADO", "GONZALEZ",
"LUX", "JURACÁN",
"MURGA", "BARILLAS",
"RAMIREZ", "MAZARIEGOS",
"TOSCANO", "PALACIOS",
"SECAIDA", "MOLINA",
"MORALES", "GIRÓN",
"SANTIZO", "DÍAZ",
"ARGUETA", "SALAZAR",
"VALDEZ", "GONZÁLEZ",
"CARRERA", "AGUILAR",
"PÉREZ", "BENITO",
"MASAYA", "CORDOVA",
"MONROY", "PÉREZ",
"FUENTES", "OSOY",
"GÓMEZ", "RENDÓN",
"CHACON", "BARILLAS",
"CHOCÓN", "GÓMEZ",
"HIGUEROS", "DE LEÓN",
"FERNÁNDEZ", "CHACÓN",
"ALDANA", "OSORIO",
"GERARDI", "HERNÁNDEZ",
"TZUNÚN", "YAX",
"JIMÉNEZ", "HERNÁNDEZ",
"GUTIÉRREZ", "VELÁSQUEZ",
"ROSALES", "MEDINA",
"CASTAÑEDA", "HERNÁNDEZ",
"REYES", "CASTILLO",
"VELÁSQUEZ", "RODAS",
"HILARIO", "CHACÓN",
"BARILLAS", "SOSA",
"MICA", "PEREZ",
"LÓPEZ", "PIRIR",
"CARDONA", "RAMÍREZ",
"CONDE", "HERNANDEZ",
"BERDUCIDO", "DOMINGO",
"PU", "TAVICO",
"DE LEÓN", "PACHECO",
"AJUCHÁN", "TOCOCH",
"MARROQUIN", "LLAMAS",
"CAMBARA", "GARCIA",
"ZAMORA", "POLANCO",
"ZAMORA", "SANTOS",
"GODOY", "SALVATIERRA",
"CUEVAS", "TZÚN",
"GÓMEZ", "CÚN",
"ARCE", "GUZMAN",
"GONZALEZ", "POLANCO",
"LIZAMA", "QUIÑONEZ",
"TÉLLES", "CARCUZ",
"SAM", "PUM",
"SANDOVAL", "LÓPEZ",
"ISMALEJ", "ROMAN",
"MAZARIEGOS", "GARCÍA",
"CASTRO", "GUERRA",
"JOSE", "MANUEL",
"PERUCH", "DE LEÓN",
"ARENAS", "GONZALEZ",
"MARROQUIN", "ARANA",
"RALDA", "MEJIA",
"DARDON", "MAYEN"
]


# Número de registros
num_registros = 500000

# Crear el archivo CSV
<<<<<<< Updated upstream:Clientes.py
with open('clientes.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Nombre', 'Apellido', 'Telefono', 'NumeroCuenta', 'TipoCuenta', 'Saldo', 'NumeroTarjeta']
=======
with open('CSV/Clientes.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Nombre', 'Apellido', 'Telefono']
>>>>>>> Stashed changes:Python/Clientes.py
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for _ in range(num_registros):
        # Elegir un nombre y apellido aleatorios
        nombre = random.choice(nombres)
        apellido = random.choice(apellidos)
        
        # Generar un número de teléfono
        telefono = f"+502{random.randint(10000000, 99999999)}"
        
        # Escribir la fila en el CSV
        writer.writerow({
            'Nombre': nombre,
            'Apellido': apellido,
            'Telefono': telefono
        })

print("El archivo 'clientes.csv' ha sido generado con 500,000 registros.")
