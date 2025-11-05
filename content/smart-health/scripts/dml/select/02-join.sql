
--La tercera consulta obtiene el listado de municipios y sus respectivos departamentos, 
--uniendo ambas tablas mediante la clave foránea department_code.
-- Se ordena por el nombre del departamento para facilitar la localización geográfica, mostrando los 15 primeros resultados.

--INNER JOIN
--1. TABLAS ASOCIADAS
--smart_health.municipalites T1
--smart_helath.deparments T2

--2.

SELECT 
    T1.municipality_code AS codigo_municipio,
    T1.municipality_name AS nombre_municipio,
    T2.department_name AS nombre_departamento

FROM smart_health.municipalities T1
INNER JOIN smart_health.departments T2 ON T1.department_code = T2.department_code
ORDER BY department_name
LIMIT 15;

--contar los pacientes que tengan o no tengan un numero de telefono asociado

--RIGTH JOIN
--1. TABLAS ASOCIADAS
--patient_phone
--patients
--2 llaves de cruce 
--
SELECT 
    COUNT(DISTINCT T1.patient_id)
FROM patient_phones T1
RIGHT JOIN patients T2 on T1.patient_id = T2.patient_id;

--que doctores no tienen especialdiad

--LEFT JOIN
SELECT
    COUNT(*)
FROM doctor_specialties T1
LEFT JOIN  doctors T2 ON T1.doctor_id = T2.doctor_id
WHERE T1.specialty_id= NULL;

-- 4. Mostrar las citas que se haya cancelado
-- entre el 20 de octubre del 2025 y el 23 de octubre del 2025.
-- Adicionalmente, es importante conocer, en que cuarto se iban 
-- a atender estas citas. Y la razon de la cancelacion si la hay.
-- Mostrar solo los 10 primeros registros.
SELECT
    T1.reason AS razon,
    T2.room_name AS cuarto,
    T1.appointment_date
FROM appointments T1
LEFT JOIN rooms T2 ON T1.room_id = T2.room_id
WHERE T1.appointment_date BETWEEN '2025-10-20' AND '2025-10-23'
  AND T1.status = 'Cancelled'
ORDER BY T2.room_name
LIMIT 10;

SELECT
    COUNT(*)
FROM appointments T1
LEFT JOIN rooms T2 ON T1.room_id = T2.room_id
WHERE T1.appointment_date BETWEEN '2025-10-20' AND '2025-10-23'
  AND T1.status = 'Cancelled';


--tabla pacientes: tipo de sangre, mostrar cuantos de cada uno( contar) por ejemplo a:, b+ : ,asi.
