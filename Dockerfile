ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Definir el directorio actual
WORKDIR /workspace

# Instalar los paquetes necesarios
RUN apk add terraform ansible openssh

# Copiar el script para crear la clave SSH
COPY generar_clave.sh /usr/local/bin/generar_clave.sh
RUN chmod +x /usr/local/bin/generar_clave.sh

# Copiar el script para leer las claves SSH
COPY leer_claves.sh /usr/local/bin/leer_claves.sh
RUN chmod +x /usr/local/bin/leer_claves.sh

# Copiar el script para ver si llegamos al servidor
COPY comprobar_conexion.sh /usr/local/bin/comprobar_conexion.sh
RUN chmod +x /usr/local/bin/comprobar_conexion.sh