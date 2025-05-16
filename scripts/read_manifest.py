import json

# Ruta al archivo manifest.json
manifest_path = 'C:/Users/INGRID/.dbt/walmart_dbt/target/manifest.json'

# Leer el archivo JSON
with open(manifest_path) as f:
    manifest = json.load(f)

# Mostrar los modelos 
print("Modelos en el manifest:")
for model in manifest['nodes']:
    print(f"Modelo: {model}")
    print(f"Descripción: {manifest['nodes'][model].get('description', 'No disponible')}")
    print(f"Configuración: {manifest['nodes'][model].get('config', 'No disponible')}")
    print('-' * 50)

# Mostrar las columnas 
for model in manifest['nodes']:
    if 'columns' in manifest['nodes'][model]:
        print(f"Columnas en {model}:")
        for column in manifest['nodes'][model]['columns']:
            print(f"Columna: {column}")
            print(f"Descripción: {manifest['nodes'][model]['columns'][column].get('description', 'No disponible')}")
            print('-' * 50)

# Mostrar los tests 
print("\nTests ejecutados:")
for model in manifest['nodes']:
    if 'tests' in manifest['nodes'][model]:
        for test in manifest['nodes'][model]['tests']:
            print(f"Prueba: {test}")
            print(f"Estado: {manifest['nodes'][model]['tests'][test].get('status', 'No disponible')}")
            print('-' * 50)


