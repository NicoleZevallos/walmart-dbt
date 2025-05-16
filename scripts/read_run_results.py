import json

# Ruta del archivo run_results.json
run_results_file = 'C:/Users/INGRID/.dbt/walmart_dbt/target/run_results.json'

# Cargar el contenido del run_results.json
with open(run_results_file, 'r') as f:
    run_results = json.load(f)

# Ver los resultados de la ejecución
for result in run_results['results']:
    model_name = result['unique_id']
    status = result['status']
    execution_time = result['execution_time']
    
    print(f"Modelo: {model_name}")
    print(f"Estado: {status}")
    print(f"Tiempo de ejecución: {execution_time} segundos")
    print('-' * 40)


