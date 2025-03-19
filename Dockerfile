FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf

# Exponer el puerto de Odoo
EXPOSE 8069

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "--http-interface=0.0.0.0", "--http-port=8069", "--db_host=${DB_HOST}", "--db_port=${DB_PORT}", "--db_user=${DB_USER}", "--db_password=${DB_PASSWORD}", "--db_name=${DB_NAME}", "--db_sslmode=require", "--no-cron", "--log-level=debug", "--log-handler=odoo:DEBUG"] 