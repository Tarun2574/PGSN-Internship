# TaskFlow Viva Questions

## 1. What is TaskFlow?

A cloud-native task management application built using Flask and deployed using Docker, Terraform, AWS, Kubernetes, and GitHub Actions.

---

## 2. Why did you use Docker?

Docker packages the application and its dependencies into a portable container, ensuring consistent execution across environments.

---

## 3. What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool used to provision and manage cloud resources declaratively.

---

## 4. Why use Infrastructure as Code?

It provides automation, repeatability, version control, and reduces manual configuration errors.

---

## 5. What is a VPC?

A Virtual Private Cloud is an isolated virtual network in AWS where cloud resources are deployed securely.

---

## 6. Difference between Public and Private Subnet?

Public subnet has internet access through an Internet Gateway.
Private subnet does not have direct internet access.

---

## 7. Why did you use an Internet Gateway?

To allow resources in the public subnet to communicate with the internet.

---

## 8. Why use a Security Group?

Security Groups act as virtual firewalls controlling inbound and outbound traffic to AWS resources.

---

## 9. Why use Amazon EBS?

Amazon EBS provides persistent block storage that remains even if the Docker container restarts.

---

## 10. What is an EBS Snapshot?

A point-in-time backup of an EBS volume stored in Amazon S3.

---

## 11. Why Docker Hub?

Docker Hub stores container images, allowing them to be pulled and deployed anywhere.

---

## 12. What is Kubernetes?

Kubernetes is a container orchestration platform used to automate deployment, scaling, and management of containers.

---

## 13. Difference between Pod and Deployment?

A Pod is the smallest deployable unit.
A Deployment manages Pods, ensuring the desired number of replicas are always running.

---

## 14. Why use NodePort?

NodePort exposes the Kubernetes application externally using a port on each node.

---

## 15. Why use ConfigMap?

To store non-sensitive configuration separately from application code.

---

## 16. Why use Secret?

To securely store sensitive configuration such as passwords or API keys.

---

## 17. What is a Persistent Volume?

A Persistent Volume provides storage independent of the Pod lifecycle.

---

## 18. Why use a Persistent Volume Claim?

A PVC allows Pods to request storage without knowing the underlying storage implementation.

---

## 19. What is HPA?

Horizontal Pod Autoscaler automatically adjusts the number of Pods based on resource usage.

---

## 20. What is a Network Policy?

A Network Policy controls communication between Pods for improved security.

---

## 21. What is a Service Account?

A Service Account provides an identity for Pods to interact with the Kubernetes API.

---

## 22. What is a Pod Disruption Budget?

It ensures a minimum number of Pods remain available during voluntary disruptions.

---

## 23. What does GitHub Actions do?

It automates building and pushing Docker images whenever code is pushed to GitHub.

---

## 24. Explain your project workflow.

Flask → Docker → Docker Hub → Terraform → AWS EC2 → Kubernetes → GitHub Actions.

---

## 25. What did you learn from this project?

Docker, Terraform, AWS networking, EC2 deployment, Kubernetes orchestration, CI/CD, Infrastructure as Code, and cloud-native application deployment.