build:
	docker build -t jenkins-withdocker .
	docker tag jenkins-withdocker code.senomas.com:5000/jenkins-withdocker:lts
	docker push code.senomas.com:5000/jenkins-withdocker:lts
