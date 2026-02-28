# Cloud-Native CI/CD Pipeline for Full-Stack Application Using GitHub Actions & AWS EKS

## 📌 Project Overview

This project demonstrates a complete end-to-end CI/CD pipeline for a Dockerized full-stack application deployed on AWS EKS. 

The pipeline automatically builds, tags, pushes, and deploys backend and frontend services whenever code is pushed to the main branch.

---

## 🏗️ Architecture

GitHub → GitHub Actions (Self-Hosted Runner) → Docker Build → Amazon ECR → Amazon EKS → Kubernetes Deployment

---

## 🛠️ Technologies Used

- Git & GitHub
- GitHub Actions (Self-Hosted Runner)
- Docker
- Amazon ECR
- Amazon EKS
- Kubernetes
- AWS CLI
- Linux (EC2)

---

## ⚙️ CI/CD Workflow Explanation

### 1️⃣ Code Push
When code is pushed to the `main` branch, the GitHub Actions workflow is triggered.

### 2️⃣ Checkout Repository
The runner checks out the latest source code.

### 3️⃣ Generate Commit SHA
The pipeline retrieves the short Git commit SHA and uses it as a Docker image tag for version control.

### 4️⃣ Build Docker Images
- Backend image is built from `/backend`
- Frontend image is built from `/frontend`

### 5️⃣ Push Images to Amazon ECR
Images are tagged with commit SHA and pushed to Amazon ECR.

### 6️⃣ Configure EKS Access
The pipeline updates kubeconfig to connect to the EKS cluster.

### 7️⃣ Deploy to Kubernetes
Kubernetes manifests are updated with the new image tag and applied using kubectl.

---

## 🔄 Versioning Strategy

Instead of using `latest`, Docker images are tagged with the Git commit SHA. 

This ensures:
- Traceable deployments
- Easy rollback
- No image overwriting
- Production-safe versioning

---

## ☁️ Infrastructure Provisioning

Infrastructure was automated using Terraform.

Terraform was used to build and manage:

- Virtual Private Cloud (VPC)
- Subnets and Route Tables
- Internet Gateway and NAT Gateway
- Amazon EKS Cluster
- Amazon ECR Repositories
- EC2 Self-Hosted GitHub Actions Runner

Using Infrastructure as Code ensured reproducibility, scalability, and version control of cloud resources.


## 📂 Project Structure


.
├── backend/
├── frontend/
├── k8s/
├── terraform/
├── .github/workflows/
│ └── ci-cd.yaml
└── README.md


---

## 🚀 Key Features

- Automated CI/CD pipeline
- Commit-based image versioning
- Kubernetes rolling updates
- Self-hosted GitHub runner on EC2
- Fully automated EKS deployment

---

## 🎯 What I Learned

- Implementing end-to-end CI/CD pipelines
- Managing Docker image versioning using commit SHA
- Deploying applications to Amazon EKS
- Debugging Kubernetes Pending pod issues
- Working with AWS IAM roles and ECR authentication

---

## 📌 Future Improvements

- Add Blue-Green Deployment
- Add Ingress with AWS Load Balancer Controller
- Implement Helm charts
- Add monitoring with Prometheus & Grafana

---

## 👨‍💻 Author

Varun Madineni

