# TaskFlow Demo Commands

## 1. Run Application Locally

Navigate to app folder:

```bash
cd app

Install dependencies:

pip install -r requirements.txt

Start Flask:

python app.py

Open:

http://localhost:5000
2. Docker Demo

Build image:

docker build -t mtarunkumar/taskflow:latest -f Docker/Dockerfile .

Check image:

docker images

Run container:

docker run -d -p 5000:5000 mtarunkumar/taskflow:latest

Check running container:

docker ps
3. Terraform Demo

Go to terraform folder:

cd terraform

Initialize:

terraform init

Validate:

terraform validate

Plan:

terraform plan

Deploy:

terraform apply

Check outputs:

terraform output

Destroy:

terraform destroy
4. Kubernetes Demo

Start Minikube:

minikube start

Enable ingress:

minikube addons enable ingress

Create deployment:

kubectl apply -f kubernetes/

Check pods:

kubectl get pods -n taskflow

Check service:

kubectl get svc -n taskflow

Access application:

minikube service taskflow-service -n taskflow
5. CI/CD Demo

Make code change:

Developer
   |
   v
Git Push
   |
   v
GitHub Actions
   |
   v
Docker Build
   |
   v
Docker Hub Image Update
6. Viva Explanation Flow
User opens TaskFlow dashboard.
Flask handles requests.
Data is stored persistently.
Docker packages the application.
Terraform creates AWS infrastructure.
EC2 runs the Docker container.
GitHub Actions automatically builds and pushes images.
Kubernetes deploys multiple replicas for availability.
Persistent Volume maintains task data.
TaskFlow = Flask + Docker + AWS + Terraform + Kubernetes + CI/CD