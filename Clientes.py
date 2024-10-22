import random
import csv

# Lista de nombres y apellidos
nombres_apellidos = [
    "WALTER JOSUE DE LA CRUZ LOPEZ",
    "ESDRAS BENJAMIN COTTO REVOLORIO",
    "EDUARDO ISMAEL LLAMAS CALDERON",
    "JESER OBDULIO COLLADO GONZALEZ",
    "VICTOR ABDIEL LUX JURACÁN",
    "EDDY ALEJANDRO MURGA BARILLAS",
    "MANOLO RICARDO RAMIREZ MAZARIEGOS",
    "CARLOS JEZEH GEDEONI TOSCANO PALACIOS",
    "KEVIN ESTUARDO SECAIDA MOLINA",
    "OSCAR EDUARDO MORALES GIRÓN",
    "JOSÉ JAVIER SANTIZO DÍAZ",
    "JONATHAN JOSUÉ ARGUETA SALAZAR",
    "JAVIER ANDRÉS VALDEZ GONZÁLEZ",
    "CARLOS EDUARDO CARRERA AGUILAR",
    "JOSUÉ ALEJANDRO PÉREZ BENITO",
    "MARÍA ISABEL MASAYA CORDOVA",
    "LUIS EDUARDO MONROY PÉREZ",
    "JOHATAN ERNESTO FUENTES OSOY",
    "LUIS FERNANDO GÓMEZ RENDÓN",
    "ERICK ABDUL CHACON BARILLAS",
    "JONNATHAN ALEXANDER CHOCÓN GÓMEZ",
    "JUAN SEBASTIAN HIGUEROS DE LEÓN",
    "PABLO DANIEL FERNÁNDEZ CHACÓN",
    "JOHNNY WHILLMAN ALDANA OSORIO",
    "JUAN JOSÉ GERARDI HERNÁNDEZ",
    "JHONATAN JOSUÉ TZUNÚN YAX",
    "WALTER DANIEL JIMÉNEZ HERNÁNDEZ",
    "KELLY ZUCETH GUTIÉRREZ VELÁSQUEZ",
    "CARLOS ALEJANDRO ROSALES MEDINA",
    "KEVIN EDUARDO CASTAÑEDA HERNÁNDEZ",
    "LOURDES PATRICIA REYES CASTILLO",
    "LUISA DANIELA VELÁSQUEZ RODAS",
    "IVAN ALESSANDRO HILARIO CHACÓN",
    "ALLAN RICARDO BARILLAS SOSA",
    "BRAYAN ESTIBEN MICA PEREZ",
    "OSCAR FERNANDO LÓPEZ PIRIR",
    "KERVIN ADOLFO CARDONA RAMÍREZ",
    "MOISES ANTONIO CONDE HERNANDEZ",
    "DIANA ESTEFANIA BERDUCIDO DOMINGO",
    "PEDRO LUIS PU TAVICO",
    "LUIS EDUARDO DE LEÓN PACHECO",
    "BRIAN ESTUARDO AJUCHÁN TOCOCH",
    "CARMEN MARIA MARROQUIN LLAMAS",
    "KEVIN ORLANDO CAMBARA GARCIA",
    "JORGE SEBASTIAN ZAMORA POLANCO",
    "TOBÍAS FRANCISCO ZAMORA SANTOS",
    "SEBASTIAN EDGARDO GODOY SALVATIERRA",
    "EDUARDO ANDRÉS CUEVAS TZÚN",
    "ALLAN JOSUÉ GÓMEZ CÚN",
    "DAMARIS MAGALI ARCE GUZMAN",
    "KARLA ERNESTINA GONZALEZ POLANCO",
    "LUIS CESAR LIZAMA QUIÑONEZ",
    "RAMIRO AGUSTÍN TÉLLES CARCUZ",
    "EDWIN AMAN SAM PUM",
    "EDWIN SANDOVAL LÓPEZ",
    "RIVER ANDERSON ISMALEJ ROMAN",
    "WILLIAM ADOLFO MAZARIEGOS GARCÍA",
    "MAURICIO ANTONIO CASTRO GUERRA",
    "LOPEZ LEMUS JOSE MANUEL",
    "FRANCISCO DANIEL PERUCH DE LEÓN",
    "ALVARO ESAU ARENAS GONZALEZ",
    "RICHARD ALEXANDRO MARROQUIN ARANA",
    "SERGIO SAUL RALDA MEJIA",
    "RUBÉN ALEJANDRO RALDA MEJIA",
    "ISAI DARDON MAYEN"
]

# Número de registros
num_registros = 500000

# Crear el archivo CSV
with open('clientes.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Nombre', 'Apellido', 'Telefono', 'NumeroCuenta']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    
    # Escribir la cabecera
    writer.writeheader()
    
    for i in range(num_registros):
        # Elegir un nombre aleatorio
        nombre_apellido = random.choice(nombres_apellidos).split()
        nombre = ' '.join(nombre_apellido[:-1])
        apellido = ' '.join(nombre_apellido[-1:])
        
        # Generar un número de teléfono
        telefono = f"+502{random.randint(10000000, 99999999)}"
        
        # Asignar un número de cuenta (secuencial)
        numero_cuenta = f"{random.randint(10000000000000000000, 99999999999999999999)}"  # varchar(20)
        
        # Escribir la fila en el CSV
        writer.writerow({'Nombre': nombre, 'Apellido': apellido, 'Telefono': telefono, 'NumeroCuenta': numero_cuenta})

print("El archivo 'clientes.csv' ha sido generado con 500,000 registros.")
