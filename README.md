# cloudmile-assginment-sre

## Task 5: Continuous Integration (Theoretical Question)
To automate the deployment of the Nexus application to a test environment upon changes in Git, I would implement a CI/CD pipeline using a tool like GitHub Actions or GitLab CI.

The pipeline steps would be:

Trigger: Push to the main or develop branch.

Build: The CI runner executes docker build using the updated Dockerfile or configurations.

Push: The new image is tagged and pushed to a container registry (e.g., Google Container Registry / Artifact Registry).

Deploy (GitOps approach): The pipeline updates the image tag in the Helm values.yaml file. A GitOps tool like ArgoCD or FluxCD running on the GKE cluster detects the state change in the repository and automatically applies the new Helm configuration, rolling out the updated Nexus pods without manual intervention.