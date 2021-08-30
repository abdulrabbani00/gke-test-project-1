# Overview

This repostiroy is meant to highlight my understanding of the following DevOps tools:
- Terraform
- GitHub Actions
- Kubernetes/Docker 
- Google Cloud Platform
    - GKE 
- Helm

The code here and the pipeline are not very in-depth. The purpose here is to capture a working pipeline with various components.

## Authentication
The following section captures authentication throughout this project.

### Terraform
Authentication for Terraform is done via a service principal. The crednetials for the service principal are added to GitHub Actions. Terraform will share project and service account, but the code is structured to be able to easily seperate the project and service account per env.

# GitHub Actions
This project has 2 environments. A `develop` and a `prod` environment. There are subsequently two GitHub Environments that to store secrets.


# GKE + Helm
A simple GKE cluster was created and Helm is used for deployments. A few things to notice:
- Terraform outputs the `cluster_name` and `cluster_location` as environment variables so that they may be used for authentication.
- The GKE cluster is very simple, the purpose is simply to stand something up and deploy to it using Helm.