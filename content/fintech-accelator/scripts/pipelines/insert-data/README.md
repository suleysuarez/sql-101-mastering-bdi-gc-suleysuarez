# PostgreSQL SQL Pipeline Executor

Este script automatiza la ejecución de scripts SQL en una base de datos PostgreSQL, diseñado específicamente para poblar la base de datos fintech_cards con datos de prueba.

## Requisitos Previos

- **Base de datos configurada**: Asegúrate de haber creado la base de datos `fintech_cards` y el esquema `fintech`
- **Datos generados**: Debes haber ejecutado previamente el pipeline de generación de datos ficticios
- **Dependencias**:
  - Python 3.6+
  - psycopg2-binary (para conexión PostgreSQL)
  - tqdm (para barras de progreso)

## Instalación

1. Instala las dependencias necesarias:

```bash
pip install psycopg2-binary tqdm
```

## Estructura de Archivos SQL

El pipeline ejecutará los siguientes archivos SQL en orden secuencial:

1. `01-FINTECH-REGIONS.sql`
2. `02-FINTECH-COUNTRIES.sql`
3. `03-FINTECH-PAYMENT-METHODS.sql`
4. `04-FINTECH-CLIENTS.sql`
5. `05-FINTECH-ISSUERS.sql`
6. `06-FINTECH-FRANCHISES.sql`
7. `07-FINTECH-MERCHANT_LOCATIONS.sql`
8. `08-FINTECH-CREDIT_CARDS.sql`
9. `09-FINTECH-TRANSACTIONS.sql`

## Uso

Ejecuta el pipeline con el siguiente comando:

```bash
python sql_insert_pipeline_auto.py --user <usuario> --password <contraseña> --db-name fintech_cards --sql-dir ../../../data/sql --delay 1.5
```

### Parámetros Disponibles

| Parámetro     | Descripción                                  | Valor por defecto   |
|---------------|---------------------------------------------|---------------------|
| --host        | Host de PostgreSQL                          | localhost           |
| --port        | Puerto de PostgreSQL                        | 5433                |
| --user        | Nombre de usuario (requerido)               | -                   |
| --password    | Contraseña (requerido)                      | -                   |
| --db-name     | Nombre de la base de datos                  | fintech_cards       |
| --schema-name | Nombre del esquema                          | fintech             |
| --sql-dir     | Directorio con archivos SQL                 | . (directorio actual)|
| --max-retries | Intentos máximos de conexión                | 3                   |
| --delay       | Retardo entre archivos (segundos)           | 1.0                 |

### Ejemplo de Ejecución

```bash
python sql_insert_pipeline_auto.py --user fc_admin --password "pwd" --db-name fintech_cards --sql-dir ../../../data/sql --delay 1.5
```

**Output:**
```
2025-05-02 13:15:18,532 - sql_pipeline - INFO - Starting SQL Pipeline
2025-05-02 13:15:18,532 - sql_pipeline - INFO - Using SQL directory: C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql
2025-05-02 13:15:18,584 - sql_pipeline - INFO - Connected to PostgreSQL (attempt 1)
2025-05-02 13:15:18,586 - sql_pipeline - INFO - Schema exists: True
Processing SQL files:   0%|                                                                                                                                                                                                                                       | 0/9 [00:00<?, ?it/s, file=01-FINTECH-REGI...]2025-05-02 13:15:18,661 - sql_pipeline - INFO - Successfully executed 2 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\01-FINTECH-REGIONS.sql
Processing SQL files:  11%|████████████████████████▊                                                                                                                                                                                                      | 1/9 [00:01<00:12,  1.54s/it, file=02-FINTECH-COUN...]2025-05-02 13:15:20,304 - sql_pipeline - INFO - Successfully executed 245 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\02-FINTECH-COUNTRIES.sql
025-05-02 13:15:21,848 - sql_pipeline - INFO - Successfully executed 2 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\03-FINTECH-PAYMENT-METHODS.sql
Processing SQL files:  33%|██████████████████████████████████████████████████████████████████████████▎                                                                                                                                                    | 3/9 [00:04<00:09,  1.58s/it, file=04-FINTECH-CLIE...]2025-05-02 13:16:03,444 - sql_pipeline - INFO - Successfully executed 100000 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\04-FINTECH-CLIENTS.sql
Processing SQL files:  44%|███████████████████████████████████████████████████████████████████████████████████████████████████                                                                                                                            | 4/9 [00:46<01:26, 17.38s/it, file=05-FINTECH-ISSU...]2025-05-02 13:16:45,900 - sql_pipeline - INFO - Successfully executed 100000 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\05-FINTECH-ISSUERS.sql
Processing SQL files:  56%|███████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▉                                                                                                   | 5/9 [01:28<01:45, 26.42s/it, file=06-FINTECH-FRAN...]2025-05-02 13:17:29,814 - sql_pipeline - INFO - Successfully executed 100000 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\06-FINTECH-FRANCHISES.sql
Processing SQL files:  67%|████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▋                                                                          | 6/9 [02:12<01:37, 32.37s/it, file=07-FINTECH-MERC...]2025-05-02 13:18:12,059 - sql_pipeline - INFO - Successfully executed 100000 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\07-FINTECH-MERCHANT_LOCATIONS.sql
Processing SQL files:  78%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▍                                                 | 7/9 [02:54<01:11, 35.60s/it, file=08-FINTECH-CRED...]2025-05-02 13:18:59,583 - sql_pipeline - INFO - Successfully executed 100000 statements from C:\Users\study_2025\Documents\Github\Doc-UP-AlejandroJaimes\sql-101-mastering\content\fintech-accelator\data\sql\08-FINTECH-CREDIT_CARDS.sql
Processing SQL files:  89%|██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▏                        | 8/9 [03:42<00:39, 39.39s/it, file=09-FINTECH-TRAN...]2
```

## Características Clave

- **Conexión robusta**: Reintentos automáticos con backoff exponencial
- **Validación de archivos**: Verifica existencia y legibilidad de los scripts SQL
- **Transacciones**: Manejo automático de transacciones por archivo
- **Progreso visual**: Barras de progreso para el pipeline general y por archivo
- **Manejo de errores**: Detiene la ejecución si falla algún script y hace rollback
- **Logging detallado**: Registro de cada operación para diagnóstico

## Estructura del Proyecto

```
fintech-accelator/
├── data/
│   └── sql/
│       ├── 01-FINTECH-REGIONS.sql
│       ├── 02-FINTECH-COUNTRIES.sql
│       ├── ... (otros archivos SQL)
│       └── FK-Values/
│           ├── FK-FINTECH-COUNTRIES.txt
│           └── ... (otros archivos de FK)
└── pipelines/
    └── insert-data/
        ├── sql_insert_pipeline_auto.py
        └── README.md
```

## Notas Importantes

1. **Orden de ejecución**: Los archivos SQL se ejecutan en el orden numérico especificado
2. **Dependencias**: Cada script depende de los anteriores, no modificar el orden
3. **Esquema**: Asegúrate que el esquema `fintech` exista en la base de datos
4. **Permisos**: El usuario debe tener permisos suficientes en la base de datos
5. **Tiempo de ejecución**: Puede variar según la cantidad de datos y rendimiento del servidor

## Solución de Problemas

Si encuentras errores:

1. Verifica que todos los archivos SQL existan en el directorio especificado
2. Confirma las credenciales de la base de datos
3. Revisa los logs para mensajes de error específicos
4. Asegúrate que el esquema `fintech` exista
5. Si falla la conexión, intenta aumentar `--max-retries`

## Ejemplo de Salida con Error

```
2025-05-03 10:05:00 - sql_pipeline - ERROR - Error in statement: relation "fintech.regions" does not exist
2025-05-03 10:05:00 - sql_pipeline - ERROR - Failed to execute 01-FINTECH-REGIONS.sql
```

En este caso, verifica que el esquema esté creado correctamente.