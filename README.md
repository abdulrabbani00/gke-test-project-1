# Overview

This repostiroy is meant to highlight my understanding of the following DevOps tools:
- Terraform
- GitHub Actions
- Kubernetes/Docker 
- Google Cloud Platform
    - GKE 

## Authentication
The following section captures authentication throughout this project.
### Terraform
Authentication for Terraform is done via a service principal. The crednetials for the service principal are added to GitHub Actions. Terraform will share project and service account, but the code is structured to be able to easily seperate the project and service account per env.

# GitHub Actions
This project has 2 environments. A `develop` and a `prod` environment. There are subsequently two GitHub Environments that to store secrets.


