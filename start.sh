#!/bin/bash
service nginx restart
gunicorn -b 0.0.0.0:8000 -w 5 app:app #--daemon