FROM postgres

# Variables de entorno para configurar la base de datos
ENV POSTGRES_DB=midb
ENV POSTGRES_USER=webUser
ENV POSTGRES_PASSWORD=159753

# Copiar el script de inicialización al directorio de inicialización de PostgreSQL
COPY eventos.sql /docker-entrypoint-initdb.d/
