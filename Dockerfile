FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf

# Exponer el puerto de Odoo
EXPOSE 8069

# Variables de entorno para la base de datos
ENV PGHOST=${PGHOST}
ENV PGPORT=${PGPORT}
ENV PGUSER=${PGUSER}
ENV PGPASSWORD=${PGPASSWORD}
ENV PGDATABASE=${PGDATABASE}

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "--http-interface=0.0.0.0", "--http-port=8069"] 