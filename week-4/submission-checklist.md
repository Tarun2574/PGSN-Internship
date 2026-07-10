# Week 4 – Submission Checklist

| # | Task | Status | Evidence |
|---|---|:---:|---|
| 1 | Cluster running / kubectl configured | ✅ | Implicit throughout (cluster already up at session start) |
| 2 | Deploy & explore a simple Pod | ✅ | Screenshots 01–13 |
| 3 | Deployment with 3 replicas | ✅ | Screenshot 14 |
| 4 | Expose via NodePort | ✅ | Screenshots 15–17 |
| 5 | Scale 3 → 5 replicas | ✅ | Screenshot 18 |
| 6 | Rolling update | ✅ | Screenshot 19 |
| 7 | Rollback | ❌ Missing | No `rollout undo` command captured |
| 8 | Self-healing verification | ✅ | Screenshot 20 |
| 9 | ConfigMap created & injected | ✅ | Screenshots 21, 23; `manifests/configmap.yaml` |
| 10 | Secret created & injected | ✅ | Screenshots 22, 23; `manifests/secret.yaml` |
| 11 | Persistent Volume | ✅ | Screenshot 24; `manifests/pv.yaml` |
| 12 | Persistent Volume Claim | ⚠️ Partial | `manifests/pvc.yaml` supplied + working mount, but no direct `get/describe pvc` screenshot |
| 13 | Storage mounted & verified | ✅ | Screenshot 24 |
| 14 | Ingress Controller installed | ✅ | Screenshot 25 |
| 15 | Ingress resource configured & routing tested | ⚠️ Partial | Screenshots 27–29 show working routes; no `ingress.yaml` or `get ingress` evidence |
| 16 | Network Policies | ❌ Missing | No evidence found |
| 17 | Resource requests/limits | ✅ | Screenshot 30; `manifests/resource-deployment.yaml` |
| 18 | Readiness probe | ✅ | Screenshot 31; `manifests/probe-pod.yaml` |
| 19 | Liveness probe (incl. induced failure) | ✅ | Screenshots 32–34 |
| 20 | Logs & events inspection | ✅ | Screenshots 03, 31, 33, 34 |
| 21 | Helm installed & repo added | ✅ | Screenshot 35 |
| 22 | Helm install (public chart) | ✅ | Screenshot 36 |
| 23 | Custom Helm chart created | ✅ | Screenshot 38 (chart template files not supplied) |
| 24 | Helm chart linted | ✅ | Screenshot 39 |
| 25 | Helm install (custom chart) | ✅ | Screenshot 39 |
| 26 | Helm upgrade | ✅ | Screenshots 40–41 |
| 27 | Helm rollback | ❌ Missing | No `helm rollback`/`helm history` evidence |
| 28 | Day 7 multi-tier project (frontend + backend + MySQL) | ❌ Not completed | No related screenshots, manifests, or Helm chart found |
| 29 | Cleanup | ⚠️ Inconclusive | `helm uninstall` ran without visible errors; all `kubectl delete`/`get all` failed — cluster was already stopped (screenshot 42) |

## Summary

- **Fully evidenced:** 20 of 29 items
- **Partially evidenced:** 3 items (PVC direct verification, Ingress resource manifest, cleanup)
- **Missing / not completed:** 6 items (rollback of Deployment, Network Policies, Helm rollback, Day 7 multi-tier project)

## Corrupted File Note

One file in the original screenshot folder, `Screenshot 2026-07-10 132614.png`, is a corrupted/blank capture (52×2 pixels, effectively empty). It has been excluded from the renamed `screenshots/` folder and is not referenced anywhere in this documentation.
