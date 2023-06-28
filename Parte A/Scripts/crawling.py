import mariadb
import sys
import random
from requests_html import HTMLSession
import time

def crawling(medio,categoria):
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

    query = f"SELECT URLCategoria FROM Categorias c JOIN Medios_Prensa m ON c.IDMedioPrensaCa = m.IDMedioPrensa WHERE c.NombreCategoria = '{Categoria}' AND m.NombrePrensa = '{Medio}'"
    cursor.execute(query)
    
    Url = cursor.fetchall()

    for urls in Url:
        print(urls[0])

    cursor.close()
    conn.close()


Medio = input("Ingresa el nombre del medio: ")
Categoria = input("Ingresa el nombre de la categoria: ")

crawling(Medio,Categoria)


