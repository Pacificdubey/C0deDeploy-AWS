#!/bin/bash
cd /var/www/myapp/
ls -la 
python3 app.py > /var/www/myapp/myapp.log 2>&1 &
