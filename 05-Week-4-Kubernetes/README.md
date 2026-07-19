# Week 4 – Kubernetes Fundamentals & Application Deployment

**Intern:** Tarun | **Program:** PGSN AWS/Cloud Internship | **Module:** Kubernetes & Helm
**Environment:** Docker Desktop Kubernetes (single-node `desktop-control-plane`), Windows PowerShell
**Date of lab activity:** 10 July 2026

> This documentation is built strictly from the 42 usable screenshots and 9 YAML manifests supplied for Week 4. Where a task from the internship curriculum was not evidenced in the supplied material, it is explicitly marked **Not completed / No evidence** rather than assumed. See [`week4-report.md`](./week4-report.md) for the full day-by-day evidence table and [`submission-checklist.md`](./submission-checklist.md) for the final status list.

---

## Learning Objectives

- Understand Kubernetes architecture and core components
- Deploy containerized applications on Kubernetes
- Manage Pods, Deployments, ReplicaSets, and Services
- Configure ConfigMaps and Secrets
- Expose applications using Ingress
- Monitor and troubleshoot Kubernetes workloads
- Package and manage releases with Helm

## Tools & Technologies

| Tool | Observed Version / Detail |
|---|---|
| Kubernetes | Docker Desktop Kubernetes (node `desktop-control-plane`) |
| kubectl | Client used throughout via PowerShell |
| Helm | v3 (`v4.2.3` build shown in `helm version` output — see screenshot 35) |
| Container image | `nginx` (latest / `1.27` used for rolling update demo) |
| Helm repo | `bitnami` (`https://charts.bitnami.com/bitnami`) |
| OS shell | Windows PowerShell |

## Folder Structure

```
Week-4/
├── README.md                 → this file
├── deployment-guide.md       → step-by-step deployment/verification/cleanup guide
├── week4-report.md           → day-wise write-up, evidence table, YAML review
├── commands.md                → every kubectl/helm command observed, grouped by day
├── submission-checklist.md   → final pass/fail/missing checklist
├── manifests/                → all 9 YAML files as supplied (unmodified)
├── helm/mychart/              → placeholder for the custom Helm chart (see note below)
├── screenshots/               → 42 renamed, chronologically ordered screenshots
└── diagrams/architecture.md  → Mermaid architecture diagram
```

> **Note on `helm/mychart/`:** The screenshots confirm `helm create mychart`, `helm lint .\mychart`, `helm install`, and `helm upgrade` were run successfully (screenshots 38–41), but the actual chart files (`Chart.yaml`, `values.yaml`, `templates/*`) were not included in the upload — the `mychart` upload arrived as an empty 0-byte placeholder. The folder is kept here as a placeholder; re-export the chart from your machine (`helm create mychart` output directory) to complete it.

## Kubernetes Concepts Covered

Pods · Deployments · ReplicaSets (implicit via Deployments) · Services (NodePort, ClusterIP) · ConfigMaps · Secrets · Persistent Volumes · Persistent Volume Claims · Rolling Updates · Self-healing · Resource Requests/Limits · Liveness & Readiness Probes · Ingress Controller install · Helm charts, install, and upgrade.

**Not evidenced in the supplied material:** Network Policies, the Ingress *resource* manifest itself (only the controller install + working routing were captured), Helm Rollback, and the Day 7 multi-tier (frontend/backend/MySQL) project.

## Prerequisites

- Docker Desktop with Kubernetes enabled
- `kubectl` CLI configured against the Docker Desktop cluster
- Helm v3 installed
- Windows PowerShell (or any shell) with internet access for pulling images/charts

## Deployment Steps (summary)

See [`deployment-guide.md`](./deployment-guide.md) for full detail. In brief, the lab progressed through:

1. Standalone `nginx-pod` — inspected, exec'd into, and deleted
2. `nginx-deployment` — created, scaled 3→5, exposed via NodePort, rolling-updated, self-healing tested
3. `app-config` ConfigMap and `app-secret` Secret — created and injected into `config-secret-pod`
4. `app-pv` / `app-pvc` — persistent storage mounted into `storage-pod` and verified with a write/read test
5. NGINX Ingress Controller installed; `nginx2` deployment added; both apps exposed via ClusterIP and reached through the browser at `/app1` and `/app2`
6. `resource-demo` deployment with CPU/memory requests & limits
7. `probe-demo` pod with readiness/liveness probes; a container kill was used to trigger an automatic restart
8. Helm: `bitnami/nginx` installed via Helm; a custom chart `mychart` created, linted, installed, and upgraded
9. Cleanup attempted via `helm uninstall` and `kubectl delete --all` (cluster was already stopped by this point, so the `kubectl delete` commands failed with connection-refused errors — see screenshot 42)

## Verification Commands (used throughout)

```
kubectl get pods -o wide
kubectl describe pod <name>
kubectl logs <name> [--previous]
kubectl get deployments / kubectl get svc
kubectl describe service <name>
kubectl rollout status deployment/<name>
kubectl get pv / kubectl get pvc
kubectl exec -it <pod> -- /bin/sh
helm list
helm status <release>
```

## Helm Usage

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo nginx
helm install my-nginx bitnami/nginx
helm create mychart
helm lint .\mychart
helm install my-custom-app .\mychart
helm upgrade my-custom-app .\mychart
```

**Helm Rollback was not demonstrated** in any of the 42 screenshots — no `helm rollback` or `helm history` command appears. This is flagged as missing evidence rather than assumed complete.

## Learning Outcomes

- Practiced the full Pod lifecycle: describe, log, exec, delete
- Practiced Deployment scaling, exposure, rolling updates, and self-healing
- Learned to decouple configuration (ConfigMap) and sensitive data (Secret) from application code, and verified both are correctly injected as environment variables
- Provisioned and mounted persistent storage using PV/PVC and validated data persistence
- Installed and exercised an NGINX Ingress Controller with path-based routing to two backend services
- Applied resource requests/limits and configured liveness/readiness probes, then intentionally killed a container to confirm Kubernetes' self-healing behavior
- Used Helm to install a third-party chart and to author, lint, install, and upgrade a custom chart

## Conclusion

Week 4 covered the core operational surface of Kubernetes — workloads, networking, configuration, storage, health checks, and packaging with Helm — on a local Docker Desktop cluster. Most curriculum tasks (Days 1–3, 5, and most of Day 6) are backed by clear command + output evidence. Day 4 (Ingress) is partially evidenced (controller + working routes, but no ingress manifest/`kubectl get ingress` capture) and Network Policies were not attempted. Helm Rollback (Day 6) and the Day 7 multi-tier project were **not completed** during the period covered by this screenshot set.
