#!/bin/bash

USER = # enter your user

# Установите путь к директории вашего сервера Minecraft (внутри контейнера)
SERVER_DATA_DIR="/home/$USER/russian-stan-server/data"

# Папка для хранения бэкапов
BACKUP_DIR="/home/$USER/russian-stan-server/backup/"

# Дата для уникальности бэкапа
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Создание архива с бэкапом
tar czf $BACKUP_DIR/rs_backup_$DATE.tar.gz -C $SERVER_DATA_DIR .

# Пример удаления старых бэкапов (хранить только последние 7)
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

