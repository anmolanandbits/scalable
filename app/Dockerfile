FROM python:3.9.1
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD [ "gunicorn","-b","0.0.0.0:8000","-w","5","app:app" ]