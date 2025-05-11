#!/bin/bash

# Configuración
LOG_FILE="/var/log/logrotate_job.log"
DATE=$(date +'%Y-%m-%d %H:%M:%S')

# Función para registrar mensajes
log() {
  echo "$DATE: $1" >> $LOG_FILE
  echo "$DATE: $1" # Imprimirlo también en la pantalla
}

# Rotar el archivo de log (opcional, pero buena práctica)
# Esto crea una copia del archivo de log con una fecha en el nombre
# y deja el original vacío para nuevos logs.
log "Rotando el archivo de log..."
cp $LOG_FILE $LOG_FILE.$(date +%Y%m%d)
truncate -s 0 $LOG_FILE
log "Rotación de log completada."

# Eliminar logs antiguos
# Encontrar archivos de log antiguos (más de 30 días)
log "Buscando logs antiguos..."
find /var/log/ -name "update_pihole_system.log.*" -mtime +30 -exec rm {} \; 2>&1 | tee -a $LOG_FILE
log "Eliminación de logs antiguos completada."

log "Proceso de rotación y eliminación de logs finalizado."
exit 0

