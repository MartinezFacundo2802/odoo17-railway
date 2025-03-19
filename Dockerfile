FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf

# Crear directorio para addons
RUN mkdir -p /mnt/extra-addons

# Exponer el puerto de Odoo
EXPOSE 8069

# Variables de entorno por defecto
ENV HOST=${PGHOST}
ENV USER=${PGUSER}
ENV PASSWORD=${PGPASSWORD}
ENV DB_HOST=${PGHOST}
ENV DB_PORT=${PGPORT}
ENV DB_NAME=${PGDATABASE}
ENV DB_USER=${PGUSER}
ENV DB_PASSWORD=${PGPASSWORD}

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"] 