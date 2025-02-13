# Deploy a Kubernetes cluster with a web server that is exposed
This project demonstrates how to set up a Kubernetes cluster on Windows using **Minikube** and deploy a web server using **Terraform**. It also provides bonus points for **Helm** and **CI/CD integration** for automating deployments.

## Prerequisites
1. **Minikube**
2. **Docker Desktop**
3. **Terraform**
4. **kubectl**
5. **Helm**

### Start Minikube Cluster
1. minikube start --driver=docker
2. kubectl get nodes
      
# Create Kubernetes Deployment with NGINX
1. Create a file called nginx-deployment.yaml
  1.1 - kubectl apply -f nginx-deployment.yaml
2. To expose the web server (NGINX)
  2.1 - kubectl apply -f nginx-service.yaml

# Access the web server from your local machine
- minikube service nginx-service

# Expose the Web Server to the Local Network
- kubectl port-forward service/nginx-service 30008:80

# Access via: 
- http://localhost:30008 or http://127.0.0.1:30008

# Verify the deployment
- kubectl get deployments
- kubectl get services
- kubectl get pods

# Export Kubernetes Resources to YAML
- kubectl get all -A -o yaml > kubernetes_cluster_resources.yaml

## 1. Create a New Helm Chart for the NGINX deployment
- helm create nginx-webserver

# After creating the Helm chart, you can deploy it to your Kubernetes cluster using the following command
- helm install nginx-webserver ./nginx-webserver

# Verify the Deployment
kubectl get pods
kubectl get svc nginx-webserver

## Terraform Configuration
- main.tf - reating a virtual machine using AWS as the provider.
1. aws configure

# Initialize Terraform
1. terraform init
2. terraform apply -auto-approve

## 2. CI/CD Integration with GitHub Actions to Deploy Resources
- GitHub Actions CI/CD Pipeline
- Workflow file - k8s-deploy.yaml

##3. Demonstrating a Working Terraform Deployment to the Kubernetes Cluster
- minikube start --driver=docker
- kubectl get nodes

# Setup terraform & initialize
- terraform init
- terraform apply -auto-approve
- kubectl get pods
- kubectl get services
- minikube IP

# Cleanup the Resources
- terraform destroy -auto-approve









