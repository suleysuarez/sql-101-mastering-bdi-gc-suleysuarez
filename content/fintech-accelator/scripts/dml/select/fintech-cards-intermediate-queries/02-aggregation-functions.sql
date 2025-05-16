-- AGGREGATION FUNCTIONS APPLICATIONS
-- DATABASE: FINTECH_CARDS
-- LAST_UPDATED: 16/05/2025


/**
1. Análisis de Gastos del Cliente:
Calcule los montos totales de transacciones 
por cliente dentro del período de tres meses más reciente, 
mostrando identificación del cliente y gasto total.
**/
-- FK: (transactions -> credit_cards -> clients)
SELECT
	cl.client_id,
    (cl.first_name ||' '||cl.last_name) AS client,
    COUNT(*) AS total_transactions_done,
    SUM(tr.amount) AS total_amount_spent
FROM 
    fintech.transactions AS tr
INNER JOIN fintech.credit_cards AS cc
    ON tr.card_id = cc.card_id
INNER JOIN fintech.clients AS cl
    ON cc.client_id = cl.client_id
WHERE 
    tr.transaction_date >= (CURRENT_DATE - INTERVAL '3 months')
GROUP BY cl.client_id, cl.first_name, cl.last_name
ORDER BY cl.client_id DESC
LIMIT 5;



/**
2. Distribución de Valor de Transacción:
Determine los valores promedio de transacciones agrupados 
por categoría de comercio y método de pago para identificar 
patrones de gasto en diferentes tipos de establecimientos.
**/

/**
3. Distribución de Emisión de Tarjetas:
Cuantifique las tarjetas de crédito emitidas por cada institución financiera,
categorizadas por franquicia, para determinar la penetración de 
mercado por tipo de tarjeta.
**/

/**
4. Análisis de Límites de Gasto:
Identifique los montos de transacción mínimos 
y máximos para cada cliente junto con las fechas correspondientes 
para establecer patrones de rango de gasto.
**/