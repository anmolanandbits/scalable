build:
	docker build -t taskmanager .
install:
	pip install -r requirements.txt
run:
	docker run -d -p 80:8000 --name TaskManagerWeb taskmanager
reset: 
	docker stop TaskManagerWeb 
	docker rm TaskManagerWeb