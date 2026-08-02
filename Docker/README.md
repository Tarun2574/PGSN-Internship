# TaskFlow Docker Setup

## Build Docker Image

Run from project root:

```bash
docker build -t mtarunkumar/taskflow:latest -f Docker/Dockerfile .
Run Container
docker run -d -p 5000:5000 mtarunkumar/taskflow:latest
Check Running Container
docker ps
Stop Container
docker stop <container_id>
Remove Container
docker rm <container_id>
Docker Hub Push

Login:

docker login

Push image:

docker push mtarunkumar/taskflow:latest
Docker Compose

Run:

docker compose -f Docker/docker-compose.yml up

Stop:

docker compose -f Docker/docker-compose.yml down
Image Details

Image:

mtarunkumar/taskflow:latest

Container Port:

5000

Application:

Flask TaskFlow Dashboard