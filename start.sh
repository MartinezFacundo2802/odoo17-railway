#!/bin/bash

# Imprimir variables de entorno para depuración
echo "Variables de entorno:"
echo "PGHOST: ${PGHOST}"
echo "PGPORT: ${PGPORT}"
echo "PGDATABASE: ${PGDATABASE}"

# Crear el archivo de configuración dinámicamente
cat > /etc/odoo/odoo.conf << EOF
[options]
admin_passwd = admin
addons_path = /usr/lib/python3/dist-packages/odoo/addons
log_level = debug
logfile = /var/log/odoo/odoo.log
log_handler = [':DEBUG']

[db]
host = ${PGHOST}
port = ${PGPORT}
user = facu
password = tu_nueva_contraseña
db_name = ${PGDATABASE}
sslmode = require
EOF

# Asegurar permisos correctos
chmod 644 /etc/odoo/odoo.conf

# Mostrar el contenido del archivo de configuración (sin la contraseña)
echo "Contenido del archivo de configuración (sin contraseña):"
sed 's/password = .*/password = ****/' /etc/odoo/odoo.conf

# Ejecutar Odoo con el usuario facu
exec odoo -c /etc/odoo/odoo.conf --http-interface=0.0.0.0 --http-port=8069 --no-cron --log-level=debug --db_host=${PGHOST} --db_port=${PGPORT} --db_user=facu --db_password=tu_nueva_contraseña --db_name=${PGDATABASE} --db_sslmode=require --database=${PGDATABASE} 