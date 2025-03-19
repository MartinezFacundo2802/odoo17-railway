FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf

# Crear directorios necesarios y establecer permisos
RUN mkdir -p /mnt/extra-addons && \
    mkdir -p /var/lib/odoo && \
    chown -R odoo:odoo /mnt/extra-addons && \
    chown -R odoo:odoo /etc/odoo && \
    chown -R odoo:odoo /var/lib/odoo

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

# Cambiar al usuario odoo
USER odoo

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "--log-level=debug"] 