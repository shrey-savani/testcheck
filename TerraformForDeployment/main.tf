provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Kubernetes Deployment for Nginx
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-deployment"
    namespace = "demo-namespace" 
    labels = {
      app = "nginx"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Kubernetes Service for Nginx
resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx-service"
    namespace = "demo-namespace"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}

# Output the Nginx Pod Name
output "nginx_pod_name" {
  value = kubernetes_deployment.nginx.metadata[0].name
}

# Get the Nginx Service NodePort (Fixed)
output "nginx_service_url" {
  value = "http://localhost:${kubernetes_service.nginx_service.spec[0].port[0].node_port}"
}