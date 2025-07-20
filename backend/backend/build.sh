#!/usr/bin/env bash

# 1. Instala las dependencias
pip install -r requirements.txt

# 2. Aplica migraciones
python manage.py migrate
# Si estás usando un entorno virtual, asegúrate de activarlo antes de ejecutar los siguientes comandos.
# Si tienes un archivo de migraciones específico, puedes usar:
# python manage.py migrate app_name


# Si necesitas crear un superusuario, puedes hacerlo con:
# python manage.py createsuperuser
# Si necesitas cargar datos iniciales, puedes usar:
# python manage.py loaddata initial_data.json
# Si tienes archivos de migración pendientes, puedes generarlos con:
# python manage.py makemigrations
# Si necesitas compilar archivos estáticos, puedes usar:
# python manage.py collectstatic --noinput

# 3. Recolecta archivos estáticos
python manage.py collectstatic --noinput

# 4. Inicia el servidor Gunicorn
gunicorn backend.wsgi:application --bind
