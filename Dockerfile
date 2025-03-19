FROM odoo:17

# Copiar archivos de configuración
COPY config/odoo.conf /etc/odoo/odoo.conf

# Cambiar a root para manejar permisos
USER root

# Crear directorios necesarios y establecer permisos
RUN mkdir -p /mnt/extra-addons && \
    mkdir -p /var/lib/odoo && \
    mkdir -p /var/log/odoo && \
    chown -R odoo:odoo /mnt/extra-addons && \
    chown -R odoo:odoo /etc/odoo && \
    chown -R odoo:odoo /var/lib/odoo && \
    chown -R odoo:odoo /var/log/odoo

# Exponer el puerto de Odoo
EXPOSE 8069

# Volver al usuario odoo
USER odoo

# Comando por defecto
CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "--log-level=debug", "--http-interface=0.0.0.0", "--http-port=8069", "--proxy-mode"] 