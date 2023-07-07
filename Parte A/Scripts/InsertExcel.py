import mariadb
import sys
import pandas as pd

try:
    conn = mariadb.connect(
        user="nicolas",
        password="colocolo89",
        host="127.0.0.1",
        port=3306,
        database="MediosPrensa"
    )

except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)


cursor = conn.cursor()

print("Que Datos de tablas desea Insertar ? :")
cursor.execute("SHOW TABLES")

Tablas = cursor.fetchall()

i  = 1
for tabla in Tablas:
    print(str(i) +".- "+tabla[0])
    i = i+1

print(str(i) +".- Todas")

Respuesta  = input("Seleccione un numero: ")

data_frame = pd.read_excel("MediosPrensa.xlsx", engine='openpyxl')

def insertarMedios():
    for row in data_frame.itertuples(index=False):
        if (str(row[0]) != 'nan'):
            IDMedioPrensa = row[0]
            NombrePrensa = row[1]
            Fundacion = row[2]
            print(Fundacion)
            SitioWeb = row[3]
            CiudadPrensa = row[4]
            PaisPrensa = row[5]
            RegionPrensa = row[6]
            ContinentePrensa = row[7]

            query = f"INSERT INTO Medios_Prensa (IDMedioPrensa, NombrePrensa, Fundacion, SitioWeb, CiudadPrensa, PaisPrensa, RegionPrensa, ContinentePrensa) VALUES ('{IDMedioPrensa}','{NombrePrensa}','{Fundacion}','{SitioWeb}','{CiudadPrensa}','{PaisPrensa}','{RegionPrensa}','{ContinentePrensa}')"
            cursor.execute(query)
            conn.commit()


def insertarCuentas():
    for row in data_frame.itertuples(index = False):
        if (str(row[9]) != 'nan'):
            IDcuenta = row[9]
            NombreCuenta = row[10]
            Redsocial = row[11]
            NumeroSeguidores = row[12]
            FechaActualizo = row[13]
            IDMedioPrensaC = row[14]
    
            query = f"INSERT INTO CuentaRedSocial (IDcuenta, IDMedioPrensaC, Redsocial, NombreCuenta, NumeroSeguidores, FechaActualizo) Values('{IDcuenta}','{IDMedioPrensaC}','{Redsocial}','{NombreCuenta}','{NumeroSeguidores}','{FechaActualizo}')"
            cursor.execute(query)
            conn.commit()

def insertarFundador():
    for row in data_frame.itertuples(index = False):
        if (str(row[16]) != 'nan'):
            IDFundadores = row[16]
            NombreFundador = row[17]
            query = f"INSERT INTO Fundadores (IDFundadores, NombreFundador) VALUES ('{IDFundadores}','{NombreFundador}')"
            cursor.execute(query)
            conn.commit()


def insertarCategoria():
    for row in data_frame.itertuples(index = False):
        if (str(row[19]) != 'nan'):
            IDCategoria = row[19]
            URLCategoria = row[20]
            NombreCategoria = row[21]
            XPATH_URL = row[22]
            IDMedioPrensaCa = row[23]
            query = f"INSERT INTO Categorias (IDCategoria, IDMedioPrensaCa, URLCategoria, NombreCategoria, XPATH_Url) Values('{IDCategoria}','{IDMedioPrensaCa}','{URLCategoria}','{NombreCategoria}','{XPATH_URL}')"
            cursor.execute(query)
            conn.commit()


def insertarNoticias():
    for row in data_frame.itertuples(index = False):
        if (str(row[25]) != 'nan'):
            IDNoticia = row[25]
            URL_Noticia = row[26]
            XPATH_Fecha = row[27]
            XPATH_Titulo = row[28]
            XPATH_Contenido = row[29]
            IDMedioPrensaN = row[30]

            query = f"INSERT INTO Noticias (IDNoticia, IDMedioPrensaN, URL_Noticia, XPATH_Fecha, XPATH_Titulo, XPATH_Contenido) VALUES ('{IDNoticia}','{IDMedioPrensaN}','{URL_Noticia}','{XPATH_Fecha}','{XPATH_Titulo}','{XPATH_Contenido}')"
            cursor.execute(query)
            conn.commit()

def insertarLoRealiza():
    for row in data_frame.itertuples(index = False):
        if (str(row[32]) != 'nan'):
            IDFundadores = row[32]
            IDMedioPrensa = row[33]
            query = f"INSERT INTO LoRealiza (IDFundadores, IDMedioPrensa) VALUES ('{IDFundadores}','{IDMedioPrensa}')"
            cursor.execute(query)
            conn.commit()

if(int(Respuesta) == 1):
    insertarCategoria()
elif(int(Respuesta) == 2):
    insertarCuentas()
elif(int(Respuesta) == 3):
    insertarFundador()
elif(int(Respuesta) == 4):
    insertarLoRealiza()
elif (int(Respuesta) == 5):
    insertarMedios()
elif(int(Respuesta) == 6):
    insertarNoticias()
elif(int(Respuesta) == 7):
    insertarMedios()
    insertarCategoria()
    insertarCuentas()
    insertarFundador()
    insertarLoRealiza()
    insertarNoticias()

print("Terminado")
conn.close()
