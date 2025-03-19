FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf

# Crear directorio para addons
RUN mkdir -p /mnt/extra-addons

# Exponer el puerto de Odoo
EXPOSE 8069

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"] 