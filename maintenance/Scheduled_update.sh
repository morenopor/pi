#!/bin/bash

# Configuración
LOG_FILE="/var/log/update_pihole_system.log"
DATE=$(date +'%Y-%m-%d %H:%M:%S')

# Función para registrar mensajes
log() {
  echo "$DATE: $1" >> $LOG_FILE
  echo "$DATE: $1" # Imprimirlo también en la pantalla
}

# Iniciar la actualización
log "Iniciando proceso de actualización..."

# Actualizar listas
log "Actualizando listas de bloqueo Gravity..."
sudo pihole -g 2>&1 | tee -a $LOG_FILE
log "Actualización de listas de bloqueo Gravity completada."

# Actualizar el sistema
log "Actualizando el sistema..."
sudo apt update 2>&1 | tee -a $LOG_FILE
sudo apt upgrade -y 2>&1 | tee -a $LOG_FILE
log "Actualización del sistema completada."

# Auto-remove
log "Removiendo paquetes innecesarios..."
sudo apt autoremove -y 2>&1 | tee -a $LOG_FILE
log "Paquetes innecesarios removidos."

# Autoclean
log "Limpiando paquetes descargados..."
sudo apt autoclean -y 2>&1 | tee -a $LOG_FILE
log "Paquetes descargados limpiados."
#Pausa por 60 segundos
sleep 60

# Actualizar Pi-hole
log "Actualizando Pi-hole..."
sudo pihole -up 2>&1 | tee -a $LOG_FILE
log "Actualización de Pi-hole completada."

# --- Start: AIDE Database Update ---
log "Iniciando actualización de la base de datos de AIDE..."
# Run AIDE update; if successful, then move the new database
if sudo aide.wrapper --update 2>&1 | sudo tee -a "$LOG_FILE" >/dev/null; then
  log "Creación de la nueva base de datos de AIDE exitosa."
  log "Reemplazando base de datos de AIDE activa..."
  # Check if the new file exists before moving, just in case
  if [ -f /var/lib/aide/aide.db.new ]; then
    if sudo mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db 2>&1 | sudo tee -a "$LOG_FILE" >/dev/null; then
      log "Base de datos de AIDE actualizada correctamente."
    else
      log "ERROR: Falló al reemplazar la base de datos activa de AIDE."
    fi
  else
    log "ERROR: Nueva AIDE database file (/var/lib/aide/aide.db.new) not found after --update."
  fi
else
  log "ERROR: Falló la creación de la nueva base de datos de AIDE (--update)."
fi
log "Proceso de actualización de AIDE completado."
# --- End: AIDE Database Update ---


# Manejo de errores

ERROR_COUNT=$(grep -c -i "error" $LOG_FILE)
if [ "$ERROR_COUNT" -gt 0 ]; then
  log "Se encontraron $ERROR_COUNT errores durante la actualización."
  # Accion para enviar un correo electrónico:
   echo "Se encontraron errores. Revisa el log: $LOG_FILE" | mail -s "Errores en actualización Pi-hole" morenopor@gmail.com
else
  log "No se encontraron errores durante la actualización."
fi

log "Proceso de actualización completado."
exit 0

