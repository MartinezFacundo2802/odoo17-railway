FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf
COPY init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto de Odoo
EXPOSE 8069

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "--http-interface=0.0.0.0", "--http-port=8069"] 