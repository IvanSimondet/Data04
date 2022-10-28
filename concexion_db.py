import mysql.connector
from mysql.connector import Error


def concexion_servidor(host_name, user_name, user_password, db_name):
    conexion = None
    try:
        conexion = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
        print("Conexion con la base de datos MySQL exitosa")
    except Error as err:
        print(f"Error: '{err}'")

    return conexion

conexion = concexion_servidor("localhost","root","Dq#14c04UTks","precios_productos")