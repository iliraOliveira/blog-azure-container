# blog-azure-container

# Neste módulo, foi possível aprender como criar resource group, Container Registry e Container Apps fazendo com que possamos executar uma aplicação em um Docker na nuvem.

docker build -t blog-lira-app:latest .

# Run the Docker container
docker run -d -p 8080:80 --name blog-lira-app blog-lira-app:latest

# Login to Azure CLI
az login

# Create a resource group in Azure
# Note: Ensure that the name is unique within your Azure subscription
az group create --name containerappslab03 --location eastus

# Create an Azure Container Registry
# Note: Ensure that the name is globally unique
az acr create --resource-group containerappslab03 --name blogliraappacr --sku Basic

# Log in to the Azure Container Registry
az acr login --name blogliraappacr --expose-token

# Tag the Docker image for Azure Container Registry
docker tag blog-lira-app:latest blogliraappacr.azurecr.io/blog-lira-app:latest

# Push the Docker image to Azure Container Registry
docker push blogliraappacr.azurecr.io/blog-lira-app:latest

# ContainerID = blogliraappacr.azurecr.io/blog-lira-app:latest
# User: <seu-usuario>
# Password: <sua-senha>

# Create Environment for Azure Container Apps
az containerapp env create --name blogliraapp-env --resource-group containerappslab03 --location eastus

# Create the Azure Container App
# Note: Ensure that the name is unique within your Azure subscription
# The target port is set to 80, which is the default for web applications
az containerapp create --name blogliraapp --resource-group containerappslab03 --environment blogliraapp-env --image blogliraappacr.azurecr.io/blog-lira-app:latest --target-port 80 --ingress 'external' --cpu 0.5 --memory 1.0Gi --registry-server blogliraappacr.azurecr.io --registry-username <seu-usuario> --registry-password <sua-senha> --registry-server blogliraappacr.azurecr.io



# Aplicação Blog rodado no Azure
![image](https://github.com/user-attachments/assets/ff9d7e9b-9062-4920-9d79-c1794dd87273)
