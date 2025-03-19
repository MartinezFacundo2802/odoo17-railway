FROM odoo:17

# Copiar archivos de configuración
COPY start.sh /start.sh

# Dar permisos de ejecución al script
RUN chmod +x /start.sh

# Exponer el puerto de Odoo
EXPOSE 8069

# Comando por defecto
CMD ["/start.sh"] 