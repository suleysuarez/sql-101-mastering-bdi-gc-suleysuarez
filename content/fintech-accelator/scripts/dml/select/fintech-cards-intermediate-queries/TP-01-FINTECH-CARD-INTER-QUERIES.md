# 🚀 SQL POWER QUEST: DOMINANDO EL ARTE DE LAS CONSULTAS FINANCIERAS

## ¡BIENVENIDO EXPLORADOR DE DATOS!

Este taller te llevará en un viaje a través del fascinante mundo de SQL aplicado a sistemas financieros. Aprenderás a extraer información valiosa de la base de datos `fintech_cards` y convertirte en un auté# 🚀 SQL POWER QUEST: DOMINANDO EL ARTE DE LAS CONSULTAS FINANCIERAS

## ¡BIENVENIDO EXPLORADOR DE DATOS!

Este taller te llevará en un viaje a través del fascinante mundo de SQL aplicado a sistemas financieros. Aprenderás a extraer información valiosa de la base de datos `fintech_cards` y convertirte en un auténtico maestro de las consultas.

## 🔍 MISIÓN INICIAL: PREPARACIÓN DEL TERRENO

1. Inicia sesión en PostgreSQL usando pgAdmin o la interfaz de línea de comandos:

```sql
psql -U fc_admin -d fintech_cards
```

2. Crea un nuevo archivo en el directorio `fintech-accelator/scripts/dml/insert/` llamado `02-insert-clients-transactions.sql` y copia el contenido del archivo disponible en el [repositorio GitHub](https://github.com/Doc-UP-AlejandroJaimes/sql-101-mastering/blob/main/content/fintech-accelator/scripts/dml/insert/02-insert-clients-transactions.sql).

3. Ejecuta el script para preparar nuestro campo de batalla con datos de prueba.

**Nota sobre el procedimiento almacenado:**
Este script contiene un procedimiento especial que genera transacciones con tarjetas de crédito simuladas. Podemos pensar en él como nuestra "máquina de datos" que crea rápidamente miles de registros para que podamos practicar nuestras habilidades de consulta. Aprenderemos más sobre estos poderosos procedimientos más adelante en el curso.

## 💻 DESAFÍO PRINCIPAL: DOMINA LAS CONSULTAS ESENCIALES

Crea los siguientes directorios para organizar tus consultas:
```
fintech-accelator/scripts/dml/select/basic-joins/
fintech-accelator/scripts/dml/select/aggregation-functions/
fintech-accelator/scripts/dml/select/group-by-clauses/
```

### 🔄 NIVEL 1: MAESTRO DE LOS JOINS (basic-joins.sql)

Tu misión es crear las siguientes consultas en un archivo llamado `basic-joins.sql`:

1. **INNER JOIN CHALLENGE**: 
   Listar todas las transacciones con detalles del cliente, incluyendo nombre del cliente, monto de la transacción, nombre del comercio y método de pago utilizado.

2. **LEFT JOIN CHALLENGE**: 
   Listar todos los clientes y sus tarjetas de crédito, incluyendo aquellos clientes que no tienen ninguna tarjeta registrada en el sistema.

3. **RIGHT JOIN CHALLENGE**: 
   Listar todas las ubicaciones comerciales y las transacciones realizadas en ellas, incluyendo aquellas ubicaciones donde aún no se han registrado transacciones.

4. **FULL JOIN CHALLENGE**: 
   Listar todas las franquicias y los países donde operan, incluyendo franquicias que no están asociadas a ningún país específico y países que no tienen franquicias operando en ellos.

5. **SELF JOIN CHALLENGE**: 
   Encontrar pares de transacciones realizadas por el mismo cliente en la misma ubicación comercial en diferentes fechas para identificar patrones de compra recurrentes.

### 📊 NIVEL 2: DOMADOR DE AGREGACIONES (aggregation-functions.sql)

Crea un solo archivo llamado `aggregation-functions.sql` con las siguientes misiones:

1. **SUM CHALLENGE**: 
   Calcular el monto total de transacciones realizadas por cada cliente en los últimos 3 meses, mostrando el nombre del cliente y el total gastado.

2. **AVG CHALLENGE**: 
   Obtener el valor promedio de las transacciones agrupadas por categoría de comercio y método de pago, para identificar los patrones de gasto según el tipo de establecimiento.

3. **COUNT CHALLENGE**: 
   Contar el número de tarjetas de crédito emitidas por cada entidad bancaria (issuer), agrupadas por franquicia, mostrando qué bancos tienen mayor presencia por tipo de tarjeta.

4. **MIN/MAX CHALLENGE**: 
   Mostrar el monto de transacción más bajo y más alto para cada cliente, junto con la fecha en que ocurrieron, para identificar patrones de gasto extremos.

### 🧩 NIVEL 3: ESTRATEGA DE GRUPOS (group-by-clauses.sql)

Crea el archivo `group-by-clauses.sql` con los siguientes desafíos:

1. **BIG SPENDERS CHALLENGE**: 
   Obtener el total de gastos por cliente en los últimos 6 meses, mostrando solo aquellos que han gastado más de $5,000, incluyendo su nombre completo y cantidad de transacciones realizadas.

2. **CATEGORY ANALYSIS CHALLENGE**: 
   Listar las categorías de comercios con el promedio de transacciones por país, mostrando solo aquellas categorías donde el promedio de transacción supere los $100 y se hayan realizado al menos 50 operaciones.

3. **REJECTION RATE CHALLENGE**: 
   Identificar las franquicias de tarjetas con mayor tasa de rechazo de transacciones por país, mostrando el nombre de la franquicia, país y porcentaje de rechazos, limitando a aquellas con más de 5% de rechazos y al menos 100 intentos de transacción.

4. **PAYMENT METHOD PREFERENCE CHALLENGE**: 
   Mostrar los métodos de pago más utilizados por cada ciudad, incluyendo el nombre del método, ciudad, país y cantidad de transacciones, filtrando solo aquellas combinaciones que representen más del 20% del total de transacciones de esa ciudad.

5. **DEMOGRAPHIC SPENDING CHALLENGE**: 
   Analizar el comportamiento de compra por género y rango de edad, mostrando el total gastado, promedio por transacción y número de operaciones completadas, incluyendo solo los grupos demográficos que tengan al menos 30 clientes activos.

## 🏆 COMPLETANDO LA MISIÓN

Para cada desafío:
1. Escribe tu consulta SQL
2. Ejecuta y verifica los resultados
3. Documenta brevemente qué información valiosa estás obteniendo

**Consejo de Maestro SQL**: Para cada consulta, piensa primero en qué tablas necesitarás unir, luego qué columnas seleccionar, y finalmente qué condiciones aplicar.

## 🎯 OBJETIVO FINAL

Al completar todos los desafíos, habrás dominado las técnicas fundamentales para extraer información crítica de sistemas financieros, que te permitirán:

* Identificar patrones de gasto de clientes
* Detectar posibles fraudes o anomalías
* Analizar tendencias de mercado por ubicación o demografía
* Optimizar estrategias comerciales basadas en datos reales

¡Buena suerte, explorador de datos! El mundo financiero espera ser descubierto a través de tus consultas.# 🚀 SQL POWER QUEST: DOMINANDO EL ARTE DE LAS CONSULTAS FINANCIERAS