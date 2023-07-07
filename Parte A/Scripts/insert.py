#Insertar los datos de manera manual a traves de terminal
import mariadb
import sys
import random
import time


def insert():
    try:
        conn = mariadb.connect(
            user="nicolas",
            password="colocolo89",
            host="localhost",
            port=3306,
            database="MediosPrensa"
        )

    except mariadb.Error as e:
        print(f"Error connecting to MariaDB Platform: {e}")
        sys.exit(1)

    cursor = conn.cursor()

    
    print("Selecciona una tabla a la que quiere añadir datos: ")
    cursor.execute("SHOW TABLES")
    Tablas = cursor.fetchall()
    i  = 1
    for tabla in Tablas:
        print(str(i) +".- "+tabla[0])
        i = i+1

    Respuesta  = input("Seleccione un numero: ")

    while (int(Respuesta) < 1 or int(Respuesta) > 6):
        Respuesta  = input("Ingrese un numero valido: ")

    print("Ingrese los datos de la siguiente forma separados por un espacio: ")
    print()
    Denuevo = True
    if (int(Respuesta) == 1):
        while(Denuevo):
            print("========================================================================")
            Denuevo = False
            IDCategoria = input("IDCategoria: ")
            IDMedioPrensaCa = input("IDMedioPrensaCa: ")
            URLCategoria = input("URLCategoria: ")
            NombreCategoria = input("NombreCategoria: ")
            XPATH_URL = input("XPATH_URL: ")

            query = f"INSERT INTO Categorias (IDCategoria, IDMedioPrensaCa, URLCategoria, NombreCategoria, XPATH_Url) Values('{IDCategoria}','{IDMedioPrensaCa}','{URLCategoria}','{NombreCategoria}','{XPATH_URL}')"
            cursor.execute(query)
            if (input("Inserte un 1 si quiere agregar un dato , 0 sino : ") == '1'):
                Denuevo = True

    
    elif(int(Respuesta) == 2):
        while(Denuevo):
            print("========================================================================")
            IDcuenta = input("IDcuenta: ")
            IDMedioPrensaC = input("IDMedioPrensaC: ")
            Redsocial = input("Redsocial: ")
            NombreCuenta = input("NombreCuenta: ")
            NumeroSeguidores = input("NumeroSeguidores: ")
            FechaActualizo = input("FechaActualizo: ")
            
            query = f"INSERT INTO CuentaRedSocial (IDcuenta, IDMedioPrensaC, Redsocial, NombreCuenta, NumeroSeguidores, FechaActualizo) Values('{IDcuenta}','{IDMedioPrensaC}','{Redsocial}','{NombreCuenta}','{NumeroSeguidores}','{FechaActualizo}')"
            cursor.execute(query)
            if (input("Inserte un 1 si quiere agregar un dato , 0 sino : ") == '1'):
                Denuevo = True

    elif(int(Respuesta) == 3):
        while(Denuevo):
            print("========================================================================")
            IDFundadores = input("IDFundadores: ")
            NombreFundador = input("NombreFundador: ")

            query = f"INSERT INTO Fundadores (IDFundadores, NombreFundador) VALUES ('{IDFundadores}',{NombreFundador})"
            cursor.execute(query)
            if (input("Inserte un 1 si quiere agregar un dato , 0 sino : ") == '1'):
                Denuevo = True

    elif(int(Respuesta) == 4):
        while(Denuevo):
            print("========================================================================")
            IDFundadores = input("IDFundadores: ")
            IDMedioPrensa = input("IDMedioPrensa: ")

            query = f"INSERT INTO LoRealiza (IDFundadores, IDMedioPrensa) VALUES ('{IDFundadores}','{IDMedioPrensa}')"
            cursor.execute(query)
            if (input("Inserte un 1 si quiere agregar un dato , 0 sino : ") == '1'):
                Denuevo = True

    elif(int(Respuesta) == 5):
        while(Denuevo):
            print("========================================================================")
            IDMedioPrensa = input("IDMedioPrensa: ")
            NombrePrensa = input("NombrePrensa: ")
            Fundacion = input("Fundacion: ")
            SitioWeb = input("SitioWeb: ")
            CiudadPrensa = input("CiudadPrensa: ")
            PaisPrensa = input("PaisPrensa: ")
            RegionPrensa = input("RegionPrensa: ")
            ContinentePrensa = input("ContinentePrensa: ")

            query = f"INSERT INTO Medios_Prensa (IDMedioPrensa, NombrePrensa, Fundacion, SitioWeb, CiudadPrensa, PaisPrensa, RegionPrensa, ContinentePrensa) VALUES ('{IDMedioPrensa}','{NombrePrensa}','{Fundacion}','{SitioWeb}','{CiudadPrensa}','{PaisPrensa}','{RegionPrensa}','{ContinentePrensa}')"
            cursor.execute(query)
            if (input("Inserte un 1 si quiere agregar un dato , 0 sino : ") == '1'):
                Denuevo = True

    elif(int(Respuesta) == 6):
        while(Denuevo):
            print("========================================================================")
            IDNoticia = input("IDNoticia: ")
            IDMedioPrensaN = input("IDMedioPrensaN: ")
            URL_Noticia = input("URL_Noticia: ")
            XPATH_Fecha = input("XPATH_Fecha: ")
            XPATH_Titulo = input("XPATH_Titulo: ")
            XPATH_Contenido = input("XPATH_Contenido: ")

            query = f"INSERT INTO Noticias (IDNoticia, IDMedioPrensaN, URL_Noticia, XPATH_Fecha, XPATH_Titulo, XPATH_Contenido) VALUES ('{IDNoticia}','{IDMedioPrensaN}','{URL_Noticia}','{XPATH_Fecha}','{XPATH_Titulo}','{XPATH_Contenido}')"
            cursor.execute(query)
            if (input("Inserte un 1 si quiere agregar un dato , 0 sino : ") == '1'):
                Denuevo = True

    print("========================================================================")
    conn.commit()

    cursor.close()
    conn.close()


insert()

print("Terminado")