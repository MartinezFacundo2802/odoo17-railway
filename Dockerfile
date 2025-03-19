FROM odoo:17

# Crear directorios necesarios y establecer permisos
USER root
RUN mkdir -p /etc/odoo && \
    mkdir -p /var/log/odoo && \
    chown -R odoo:odoo /etc/odoo && \
    chown -R odoo:odoo /var/log/odoo

# Copiar archivos de configuración
COPY start.sh /start.sh

# Dar permisos de ejecución al script
RUN chmod +x /start.sh

# Exponer el puerto de Odoo
EXPOSE 8069

# Volver al usuario odoo
USER odoo

# Comando por defecto
CMD ["/start.sh"] 