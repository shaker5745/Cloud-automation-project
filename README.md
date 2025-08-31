# Cloud Automation Portfolio

Two production-style DevOps projects you can push to GitHub and demo:

1. **Multi-Cloud Automation Framework (AWS + Azure)** — Terraform modules for VPC/VNet, IAM/RBAC, and **EKS/AKS** clusters, plus CI (Jenkinsfile + GitHub Actions).
2. **Kubernetes GitOps Deployment Automation** — Sample app + Helm chart, **Argo CD** application, **OPA Gatekeeper** policies, and CI to build/push image and update deployments.

---


### Project 1: Multi-Cloud (Terraform)
- Fill in variables in `multi-cloud-automation/envs/*/terraform.tfvars.example`, copy to `terraform.tfvars`, then:
```bash
cd multi-cloud-automation/envs/aws/dev
terraform init && terraform plan
# terraform apply
```

### Project 2: GitOps (Kubernetes)
- Build the app and push to GHCR, then Argo CD pulls the Helm chart automatically:
```bash
cd k8s-gitops
# (Optional) Build locally
docker build -t ghcr.io/<YOUR-USER>/sample-app:0.1.0 ./app
docker login ghcr.io
docker push ghcr.io/<YOUR-USER>/sample-app:0.1.0
```
- Apply Argo CD + Gatekeeper manifests after your cluster is ready:
```bash
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f k8s-gitops/policies/gatekeeper/templates/
kubectl apply -f k8s-gitops/policies/gatekeeper/constraints/
kubectl apply -f k8s-gitops/argocd/namespace.yaml
kubectl apply -f k8s-gitops/argocd/app.yaml
```
---

## Notes
- For AWS, set env: `AWS_PROFILE` or `AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY`.
- For Azure, login with `az login` and `ARM_*` variables as needed.
- The code is structured for clarity and demonstration. Pin provider versions before applying in production.
