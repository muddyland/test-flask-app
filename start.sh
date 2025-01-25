#!/bin/bash

# Activate your virtual environment if needed
# source /path/to/your/virtualenv/bin/activate

# Export the Flask app name and Gunicorn bind address
export FLASK_APP=main:app
export GUNICORN_BIND_ADDRESS=0.0.0.0:5000

echo Running in $(pwd)

echo Starting Web Server
/usr/bin/python3 -m gunicorn -b $GUNICORN_BIND_ADDRESS $FLASK_APP & 

while true; do

   sleep 5

   # Check if Gunicorn is running by looking for the process
   if pgrep -f gunicorn &> /dev/null; then
      echo "Gunicorn server is running."
   else
      echo "Gunicorn server failed"
      exit 101
   fi

   sleep 300
done
