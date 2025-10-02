import os
import sys
# import mysql.connector # Se importa, pero no se usa para SQL Server
import pandas as pd
from datetime import datetime, timedelta
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()


# --------------------------
# Función de verificación de configuración
# --------------------------
def check_configuration():
    # Leer las credenciales necesarias para cualquier conexión DB
    DB_HOST = os.getenv("DB_HOST")
    DB_USER = os.getenv("DB_USER")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_NAME = os.getenv("DB_NAME")

    print("Verificando la configuración de las variables en .env...")

    # Comprobar si todas las variables críticas están presentes
    if not all([DB_HOST, DB_USER, DB_PASSWORD, DB_NAME]):
        print("\n❌ [NO CONECTADO - FALLA DE CONFIGURACIÓN]")
        print("Faltan variables críticas (DB_HOST, DB_USER, etc.) en su archivo .env.")
        sys.exit(1)
    else:
        # La configuración es correcta, el problema es el bloqueo de red.
        print("\n[✔] CONFIGURACIÓN VÁLIDA: Todas las credenciales están presentes.")
        print("El script está listo. El problema es el bloqueo de red a LocalDB.")
        # Se asume que el flujo debe continuar
        return True

# Ejecutar la verificación
check_configuration()