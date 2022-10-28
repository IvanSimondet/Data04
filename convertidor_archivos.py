import pandas as pd 
import os 
import re


'''Se toman los archivos para poder leerlos segun si tipo y luego pasarlos individualemente a csv'''
def convertidor(archivo):

    '''Para obtener el nombre sin la extension se usa el Modulo re'''
    patron_sin_extension = r'\w*\.'
    nombre = re.match(patron_sin_extension, archivo)
    nombre = nombre.group()

    '''En el caso de excel se leen todas las hojas y se unen'''
    if archivo.endswith('.xlsx'):
        df = pd.concat(pd.read_excel('Datasets/'+ archivo ,sheet_name=None), ignore_index=True)
        df.to_csv('Datasets/'+nombre+'csv', index=False, encoding='utf-8')
    elif archivo.endswith('.json'):
        df = pd.read_json('Datasets/'+ archivo)
        df.to_csv('Datasets/'+nombre+'csv', index=False, encoding='utf-8')
    elif archivo.endswith('.txt'):
        df = pd.read_csv('Datasets/'+ archivo, sep='|')
        df.to_csv('Datasets/'+nombre+'csv', index=False, encoding='utf-8')
    elif archivo.endswith('.parquet'):
        df = pd.read_parquet('Datasets/producto.parquet', engine='pyarrow')
        df.to_csv('Datasets/'+nombre+'csv', index=False, encoding='utf-8')


'''Toma solo los archivos que no tiene el formato csv de la carpeta Datasets'''
def archivos_a_convertir_csv(archivos):
    patron_csv = r".*\.csv$"
    for archivo in archivos:
        if re.match(patron_csv, archivo):
            pass
        else:
            convertidor(archivo)


archivos = os.listdir('Datasets/')

archivos_a_convertir_csv(archivos)