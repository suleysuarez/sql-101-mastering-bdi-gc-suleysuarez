-- 01. Create user
CREATE USER smart_admin WITH PASSWORD 'sm2025**';

-- 02. Create database (with ENCODING='UTF8', TEMPLATE=template0, OWNER: smart_admin)
CREATE DATABASE smart_health_db
WITH ENCODING='UTF8'
     LC_COLLATE='es_CO.UTF-8'
     LC_CTYPE='es_CO.UTF-8'
     TEMPLATE=template0
     OWNER=smart_admin;

-- 03. Grant privileges
GRANT ALL PRIVILEGES ON DATABASE smart_health_db TO smart_admin;

CREATE SCHEMA IF NOT EXISTS smart_health AUTHORIZATION sm_admin;

-- 05. Comment on database
COMMENT ON DATABASE smarthdb IS 'Base de datos para el control de pacientes y citas';

-- 06. Comment on schema
COMMENT ON SCHEMA smart_health IS 'Esquema principal para el sistema de control de pacientes y citas';