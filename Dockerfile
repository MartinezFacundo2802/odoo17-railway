FROM odoo:17

ARG LOCALE=en_US.UTF-8

ENV LANGUAGE=${LOCALE}
ENV LC_ALL=${LOCALE}
ENV LANG=${LOCALE}

USER root

RUN apt-get -y update && apt-get install -y --no-install-recommends locales netcat-openbsd \
    && locale-gen ${LOCALE}

# Crear directorios necesarios y establecer permisos
RUN mkdir -p /etc/odoo && \
    mkdir -p /var/log/odoo && \
    mkdir -p /var/lib/odoo && \
    chown -R odoo:odoo /etc/odoo && \
    chown -R odoo:odoo /var/log/odoo && \
    chown -R odoo:odoo /var/lib/odoo

# Copiar archivos de configuración
COPY start.sh /start.sh

# Dar permisos de ejecución al script
RUN chmod +x /start.sh && \
    chown odoo:odoo /start.sh

# Exponer el puerto de Odoo
EXPOSE 8069

# Cambiar al usuario odoo
USER odoo

# Comando por defecto
CMD ["/bin/bash", "/start.sh"] 