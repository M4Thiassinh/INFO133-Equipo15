import mariadb
import sys
import random
from requests_html import HTMLSession
import time


def scraping(medio,URL):
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

    query = f"SELECT XPATH_Titulo,XPATH_Fecha FROM Noticias n JOIN Medios_Prensa m ON n.IDMedioPrensaN = m.IDMedioPrensa WHERE m.NombrePrensa = '{medio}' AND n.URL_Noticia = '{URL}'"
    cursor.execute(query)

    Datos = cursor.fetchall()

    for i in Datos:
        print(i)

    #Preguntar si se necesita preguntar directamente en la pagina o se guarda en la base de datos.
    
    cursor.close()
    conn.close()



Medio = input("Ingresa el nombre del medio: ")
URL = input("Ingresa el URL de la Noticia: ")

scraping(Medio,URL)