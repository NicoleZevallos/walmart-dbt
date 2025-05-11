import pandas as pd
import pyodbc

def import_excel_to_sql():
    excel_path = "C:\Users\USUARIO\Desktop\BI\Base en csv.csv"
    conn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        f'SERVER=LAPTOP-OOQES9VG;'
        f'DATABASE=WALMART_RAW;'
        'Trusted_Connection=yes;'
    )
    
    df = pd.read_excel(excel_path)
    
    df.to_sql(
        name='raw_walmart_data',
        con=conn,
        schema='raw',
        if_exists='replace',
        index=False
    )