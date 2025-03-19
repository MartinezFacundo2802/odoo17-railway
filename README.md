# Odoo 17 en Railway

Este es un proyecto de Odoo 17 configurado para funcionar con Railway.

## Requisitos

- Docker
- Docker Compose
- Cuenta en Railway

## Configuración

1. Clona este repositorio
2. Configura las variables de entorno en Railway:
   - `DB_HOST`: Host de la base de datos PostgreSQL
   - `DB_PORT`: Puerto de la base de datos (5432)
   - `DB_NAME`: Nombre de la base de datos
   - `DB_USER`: Usuario de la base de datos
   - `DB_PASSWORD`: Contraseña de la base de datos

## Desarrollo Local

Para ejecutar el proyecto localmente:

```bash
docker-compose up -d
```

Accede a Odoo en: http://localhost:8069

## Despliegue en Railway

1. Conecta tu repositorio a Railway
2. Configura las variables de entorno en Railway
3. Railway desplegará automáticamente tu aplicación

## Estructura del Proyecto

- `config/`: Archivos de configuración de Odoo
- `addons/`: Módulos personalizados de Odoo
- `docker-compose.yml`: Configuración de Docker Compose 