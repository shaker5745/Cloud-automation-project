# Kubernetes GitOps Deployment Automation

- Sample Python (Flask) microservice
- Helm chart for deployment
- Argo CD `Application` to sync Helm chart
- OPA Gatekeeper policies for best practices
- GitHub Actions to build/push to GHCR and update Helm values

## CI/CD via GitHub Actions
- `.github/workflows/build-and-deploy.yml` builds and pushes the image to GHCR, bumps the image tag in Helm `values.yaml`, commits back to repo.
- `security-scan.yml` runs Trivy on Dockerfile/image.

## Local dev
```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r app/requirements.txt
python app/src/app.py
```
