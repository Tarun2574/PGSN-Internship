install:
	pip install -r app/requirements.txt


run:
	python app/app.py


docker-build:
	docker build -t mtarunkumar/taskflow:latest -f Docker/Dockerfile .


docker-run:
	docker run -p 5000:5000 mtarunkumar/taskflow:latest


docker-push:
	docker push mtarunkumar/taskflow:latest


terraform-init:
	cd terraform && terraform init


terraform-plan:
	cd terraform && terraform plan


terraform-apply:
	cd terraform && terraform apply


k8s-deploy:
	kubectl apply -f kubernetes/


k8s-status:
	kubectl get all -n taskflow