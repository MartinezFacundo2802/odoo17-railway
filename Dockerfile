FROM odoo:17

ARG LOCALE=en_US.UTF-8
ARG PYTHON_VERSION=3.9

ENV LANGUAGE=${LOCALE}
ENV LC_ALL=${LOCALE}
ENV LANG=${LOCALE}
ENV PYTHONPATH=/usr/lib/python3/dist-packages:/usr/lib/python3/dist-packages/odoo/addons:/mnt/extra-addons

USER root

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    locales \
    netcat-openbsd \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-distutils \
    && locale-gen ${LOCALE}

# Crear directorios necesarios y establecer permisos
RUN mkdir -p /etc/odoo && \
    mkdir -p /var/log/odoo && \
    mkdir -p /var/lib/odoo && \
    mkdir -p /mnt/extra-addons && \
    chown -R odoo:odoo /etc/odoo && \
    chown -R odoo:odoo /var/log/odoo && \
    chown -R odoo:odoo /var/lib/odoo && \
    chown -R odoo:odoo /mnt/extra-addons && \
    chmod -R 755 /mnt/extra-addons

# Copiar archivos de configuración
COPY odoo.conf /etc/odoo/odoo.conf
COPY start.sh /start.sh

# Copiar addons personalizados
COPY custom-addons/ /mnt/extra-addons/

# Dar permisos de ejecución al script
RUN chmod +x /start.sh && \
    chown odoo:odoo /start.sh && \
    chown odoo:odoo /etc/odoo/odoo.conf && \
    chown -R odoo:odoo /mnt/extra-addons && \
    chmod -R 755 /mnt/extra-addons

# Exponer el puerto de Odoo
EXPOSE 8069

# Cambiar al usuario odoo
USER odoo

# Comando por defecto
CMD ["/bin/bash", "/start.sh"] 