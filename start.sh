#!/bin/bash

# Habilitar modo de depuración
set -x

# Imprimir información del sistema
echo "=== Información del sistema ==="
echo "Usuario actual: $(whoami)"
echo "Directorio actual: $(pwd)"
echo "Contenido del directorio: $(ls -la)"

# Imprimir variables de entorno para depuración
echo "=== Variables de entorno ==="
echo "PGHOST: ${PGHOST}"
echo "PGPORT: ${PGPORT}"
echo "PGDATABASE: ${PGDATABASE}"
echo "RAILWAY_PUBLIC_DOMAIN: ${RAILWAY_PUBLIC_DOMAIN}"
echo "RAILWAY_PRIVATE_DOMAIN: ${RAILWAY_PRIVATE_DOMAIN}"

# Crear el archivo de configuración dinámicamente
echo "=== Creando archivo de configuración ==="
cat > /etc/odoo/odoo.conf << EOF
[options]
admin_passwd = admin
addons_path = /usr/lib/python3/dist-packages/odoo/addons
log_level = debug
logfile = /var/log/odoo/odoo.log
log_handler = [':DEBUG']
http_interface = 0.0.0.0
http_port = 8069

[db]
host = ${PGHOST}
port = ${PGPORT}
user = facu
password = tu_nueva_contraseña
db_name = ${PGDATABASE}
sslmode = require
EOF

# Asegurar permisos correctos
echo "=== Configurando permisos ==="
chmod 644 /etc/odoo/odoo.conf

# Mostrar el contenido del archivo de configuración (sin la contraseña)
echo "=== Contenido del archivo de configuración (sin contraseña) ==="
sed 's/password = .*/password = ****/' /etc/odoo/odoo.conf

# Verificar que el puerto está disponible
echo "=== Verificando puerto 8069 ==="
netstat -tulpn | grep 8069 || echo "Puerto 8069 no está en uso"

# Ejecutar Odoo con el usuario facu
echo "=== Iniciando Odoo ==="
exec odoo -c /etc/odoo/odoo.conf --http-interface=0.0.0.0 --http-port=8069 --no-cron --log-level=debug --db_host=${PGHOST} --db_port=${PGPORT} --db_user=facu --db_password=tu_nueva_contraseña --db_name=${PGDATABASE} --db_sslmode=require --database=${PGDATABASE} 