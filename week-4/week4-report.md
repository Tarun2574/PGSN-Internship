# Week 4 Report — Day-Wise Documentation

This report maps the supplied screenshots and YAML manifests to the Week 4 curriculum (Days 1–7). Every item is graded strictly from evidence — nothing is assumed.

---

## Day 1 – Kubernetes Fundamentals

**Curriculum:** cluster setup, kubectl install, deploy a simple pod, explore pods.

**Evidence:** A standalone `nginx-pod` was already running at the start of the captured session. It was inspected (`describe`), logged, exec'd into, and eventually deleted.

| Screenshot | What it shows |
|---|---|
| `01-pod-describe-nginx-pod-part1.png` | `kubectl describe pod nginx-pod` — Running, node `desktop-control-plane`, IP `10.244.0.7` |
| `02-pod-describe-nginx-pod-events.png` | Continued describe output + Events (Scheduled → Pulling → Pulled → Created → Started) |
| `03-pod-logs-nginx-pod.png` | `kubectl logs nginx-pod` — nginx startup log, worker processes spawning |
| `04-pod-exec-into-nginx-pod.png` | `kubectl exec -it nginx-pod -- /bin/bash` |
| `05-pod-exec-ls-filesystem.png` | `ls` inside the container |
| `06-pod-exec-pwd.png` | `pwd` inside the container |
| `07-pod-exec-exit.png` | `exit` from the container shell |
| `08-pod-get-wide.png` | `kubectl get pod nginx-pod -o wide` |
| `09–11-pod-get-yaml-part*.png` | `kubectl get pod nginx-pod -o yaml` — full manifest incl. status/conditions |
| `12-pod-delete-nginx-pod.png` | `kubectl delete pod nginx-pod` |
| `13-pod-delete-confirmation.png` | `kubectl get pods` → "No resources found" |

**Status:** ✅ Completed and clearly evidenced (cluster already running; explicit `minikube start` / `kind create cluster` command not shown, but cluster status commands and pod lifecycle are fully documented).

---

## Day 2 – Deployments & Services

**Curriculum:** Deployment with 3 replicas, expose via NodePort, scale 3→5, rolling update, rollback, verify HA.

**Evidence:**

| Screenshot | What it shows |
|---|---|
| `14-deployment-create-scale-3-replicas.png` | `kubectl create deployment nginx-deployment --image=nginx`, `kubectl scale --replicas=3`, `get deployments`/`get pods` (3/3 Running) |
| `15-service-expose-nodeport.png` | `kubectl expose deployment nginx-deployment --type=NodePort --port=80`, `get services` |
| `16-service-describe-part1.png` / `17-service-describe-part2.png` | `kubectl describe service nginx-deployment` — full Service detail, endpoints, an `Unauthorized` EndpointSlice warning event (informational, not failure) |
| `18-deployment-scale-to-5-replicas.png` | `kubectl scale deployment nginx-deployment --replicas=5`, confirms 5/5 |
| `19-deployment-rolling-update.png` | `kubectl set image deployment/nginx-deployment nginx=nginx:1.27`, `kubectl rollout status` — "successfully rolled out" |
| `20-deployment-self-healing-podwatch.png` | A pod manually deleted; `kubectl get pods -w` shows Kubernetes automatically recreating it |

**Status:** ✅ Create/scale/expose/rolling-update/self-healing all evidenced. **⚠️ Rollback (`kubectl rollout undo`) was not captured in any screenshot** — flagged as missing.

---

## Day 3 – Configuration Management

**Curriculum:** ConfigMaps, Secrets, inject into Pods, Persistent Volumes, Persistent Volume Claims, mount storage.

**Evidence:**

| Screenshot | What it shows |
|---|---|
| `21-configmap-apply-describe.png` | `kubectl apply -f configmap.yaml`, `get configmap`, `describe configmap app-config` (APP_NAME, APP_ENV, APP_VERSION) |
| `22-secret-apply-describe.png` | `kubectl apply -f secret.yaml`, `get secrets`, `describe secret app-secret` (Opaque, 2 keys) |
| `23-configmap-secret-consumption-verified.png` | `pod.yaml` applied → `config-secret-pod`; `printenv` inside the pod confirms `APP_NAME=KubernetesLab`, `APP_ENV=Development`, `USERNAME=admin`, `PASSWORD=password123` — proves both ConfigMap and Secret values are correctly injected |
| `24-pv-pvc-storage-verification.png` | `kubectl get pv` shows `app-pv` (1Gi, RWO, Retain, **Available**); `storage-pod.yaml` applied; exec into the pod, write `test.txt` to the mounted path, `cat` confirms the content — proves the PVC-backed volume mount works end-to-end |

**Status:** ✅ ConfigMap and Secret: fully evidenced, including consumption. PV: evidenced via `kubectl get pv` and the working mount. **⚠️ PVC: only indirect evidence** — `pvc.yaml` was supplied and `storage-pod` (which mounts via `claimName: app-pvc`) ran successfully, but no `kubectl get pvc` / `kubectl describe pvc` screenshot was captured to directly confirm the Bound status.

---

## Day 4 – Ingress & Networking

**Curriculum:** install Ingress Controller, configure Ingress, path-based routing test, Network Policies.

**Evidence:**

| Screenshot | What it shows |
|---|---|
| `25-ingress-controller-install-nginx2-deployment.png` | Full `ingress-nginx` controller install (ClusterRoles, RoleBindings, admission webhook, controller Deployment) → controller pod reaches `1/1 Running`; a second app `nginx2` deployment created and scaled to 2 replicas |
| `26-services-clusterip-expose.png` | `nginx-deployment` and `nginx2` each exposed as ClusterIP services (`nginx-service`, `nginx2-service`) on port 80 |
| `27-ingress-browser-app2-test.png` | Browser: `localhost:8080/app2` → "Welcome to nginx!" |
| `28-ingress-browser-app1-test.png` | Browser: `localhost:8080/app1` → "Welcome to nginx!" |
| `29-ingress-browser-app1-app2-sidebyside.png` | Both routes shown working side-by-side |

**Status:** ⚠️ **Partial.** The Ingress Controller was installed and path-based routing to two backend apps was demonstrably working through the browser. However, **no `ingress.yaml` manifest was supplied and no `kubectl get ingress` / `kubectl describe ingress` screenshot was captured**, so the actual Ingress resource definition that routes `/app1` and `/app2` cannot be verified or reviewed — only its observed effect. **Network Policies: no evidence at all** (no manifest, no command, no screenshot).

---

## Day 5 – Monitoring & Troubleshooting

**Curriculum:** resource requests/limits, liveness probe, readiness probe, generate failures, inspect logs/events, debug.

**Evidence:**

| Screenshot | What it shows |
|---|---|
| `30-resource-limits-deployment-apply.png` | `resource-deployment.yaml` applied → `resource-demo` deployment (1/1) with CPU/memory requests & limits defined in the manifest |
| `31-probe-demo-describe-readiness.png` | `kubectl describe pod probe-demo` — readiness probe config (`http-get :80`, delay 5s, period 5s) and startup Events |
| `32-liveness-probe-restart-trigger.png` | `kubectl exec probe-demo -- kill 1` (forces the main process to exit); `kubectl get pods -w` shows `RESTARTS: 1` — confirms the liveness probe / kubelet restart policy recovered the container |
| `33-probe-demo-logs-previous.png` | `kubectl logs probe-demo --previous` — nginx startup log of the terminated instance, plus `kube-probe/1.36` GET requests (evidence the readiness/liveness probes were actively polling) |
| `34-probe-demo-logs-shutdown.png` | Continuation — worker process shutdown/exit sequence of the killed container |

**Status:** ✅ Resource limits, readiness probe, liveness probe (including an intentional failure + observed self-healing), logs, and events are all clearly evidenced — this is one of the most thoroughly documented days.

---

## Day 6 – Helm Package Manager

**Curriculum:** install Helm, deploy nginx via Helm, create custom chart, parameterize, upgrade and rollback.

**Evidence:**

| Screenshot | What it shows |
|---|---|
| `35-helm-setup-repo-add-search.png` | `helm version` (v4.2.3), `helm repo add bitnami`, `helm repo update`, `helm search repo nginx` |
| `36-helm-install-bitnami-nginx.png` | `helm install my-nginx bitnami/nginx` — REVISION 1, deployed |
| `37-helm-list-verify-release.png` | `helm list` (my-nginx, deployed), `get pods`, `get svc` (my-nginx as LoadBalancer, pending external IP) |
| `38-helm-create-custom-chart.png` | `helm create mychart`, directory listing confirming the chart scaffold and all lab YAML files |
| `39-helm-lint-install-custom-chart.png` | `helm lint .\mychart` (0 failures), `helm install my-custom-app .\mychart` — REVISION 1 |
| `40-helm-upgrade-custom-chart.png` | `helm upgrade my-custom-app .\mychart` — REVISION 2; `get deployment`/`get pods` show `my-custom-app-mychart` scaled to 5/5 (implies `values.yaml` replica count was edited before upgrading) |
| `41-helm-upgrade-verification.png` | Follow-up `get pods` confirming the upgraded release is stable |

**Status:** ✅ Helm install (both third-party and custom chart) and Helm upgrade are fully evidenced. Chart creation and linting are evidenced. **⚠️ Helm Rollback was not performed** — no `helm rollback` or `helm history` command appears anywhere in the 42 screenshots. **Chart parameterization (image/replicas/service type in `values.yaml`) is inferred but not directly viewable**, since the actual `mychart/` files were not included in the upload (0-byte placeholder).

---

## Day 7 – Final Kubernetes Project (Multi-tier App)

**Curriculum:** Deploy a frontend + backend API + MySQL database using Deployments, Services, ConfigMaps, Secrets, PV, Ingress, and a Helm chart.

**Evidence:** None of the supplied screenshots show a frontend/backend/database multi-tier application. All workloads observed throughout the session use the `nginx` image only (`nginx-pod`, `nginx-deployment`, `nginx2`, `resource-demo`, `probe-demo`, `storage-pod`, `config-secret-pod`, the Bitnami nginx chart, and the custom `mychart`). No MySQL, backend API, or frontend component appears in any screenshot or manifest.

**Status:** ❌ **Not completed during Week 4.** This is stated explicitly per instruction — no Day 7 multi-tier project work is fabricated or implied.

---

## Consolidated Evidence Table

| Day | Task | Screenshot(s) | YAML | Status | Notes |
|---|---|---|---|---|---|
| 1 | Pod deploy & explore | 01–13 | — | ✅ Complete | Cluster startup command itself not captured |
| 2 | Deployment (3 replicas) | 14 | — | ✅ Complete | Imperative `kubectl create deployment` |
| 2 | Service (NodePort) | 15–17 | — | ✅ Complete | |
| 2 | Scale 3→5 | 18 | — | ✅ Complete | |
| 2 | Rolling update | 19 | — | ✅ Complete | |
| 2 | Rollback | — | — | ❌ Missing | No `rollout undo` evidence |
| 2 | Self-healing | 20 | — | ✅ Complete | |
| 3 | ConfigMap | 21, 23 | `configmap.yaml` | ✅ Complete | Consumption verified via `printenv` |
| 3 | Secret | 22, 23 | `secret.yaml` | ✅ Complete | Consumption verified via `printenv` |
| 3 | Persistent Volume | 24 | `pv.yaml` | ✅ Complete | `get pv` shows Available |
| 3 | Persistent Volume Claim | 24 (indirect) | `pvc.yaml` | ⚠️ Partial | No direct `get/describe pvc` screenshot |
| 3 | Storage mounted | 24 | `storage-pod.yaml` | ✅ Complete | Write/read test succeeded |
| 4 | Ingress Controller install | 25 | — | ✅ Complete | |
| 4 | Ingress resource / routing | 27–29 | — (no `ingress.yaml` supplied) | ⚠️ Partial | Effect proven via browser; manifest not captured |
| 4 | Network Policy | — | — | ❌ Missing | No evidence at all |
| 5 | Resource requests/limits | 30 | `resource-deployment.yaml` | ✅ Complete | |
| 5 | Readiness probe | 31 | `probe-pod.yaml` | ✅ Complete | |
| 5 | Liveness probe | 31–34 | `probe-pod.yaml` | ✅ Complete | Failure induced + recovery observed |
| 5 | Logs & events | 03, 31, 33, 34 | — | ✅ Complete | |
| 6 | Helm install (chart repo) | 35–37 | — | ✅ Complete | `bitnami/nginx` |
| 6 | Custom Helm chart | 38–39 | — (chart files not supplied) | ⚠️ Partial | Creation/lint/install evidenced; template contents unavailable |
| 6 | Helm upgrade | 40–41 | — | ✅ Complete | REVISION 1→2 |
| 6 | Helm rollback | — | — | ❌ Missing | No `helm rollback`/`helm history` evidence |
| 7 | Multi-tier project | — | — | ❌ Not completed | Explicitly stated per instructions |

---

## YAML Review

All 9 manifests are located in [`manifests/`](./manifests). Reviewed below:

### `configmap.yaml`
Valid and minimal. `APP_VERSION` is quoted as a string, which is correct practice for ConfigMap values.

### `pod.yaml` (`config-secret-pod`)
Correctly sources `APP_NAME`/`APP_ENV` from the ConfigMap and `USERNAME`/`PASSWORD` from the Secret via `valueFrom`. No resource requests/limits defined — fine for a lab pod, but note for production use.

### `probe-pad.yaml` and `probe-pod.yaml`
**These two files are byte-for-byte identical** (confirmed via diff) — `probe-pad.yaml` appears to be an accidental duplicate/typo of `probe-pod.yaml`. Recommend deleting `probe-pad.yaml` and keeping only `probe-pod.yaml` to avoid confusion in the repo. Both define readiness (5s delay/period) and liveness (10s delay/period) HTTP probes on port 80, which matches the observed `describe pod probe-demo` output.

### `pv.yaml`
Uses `hostPath` (appropriate for a local Docker Desktop cluster, not portable to a real multi-node cluster). No `storageClassName` is set, which is fine here since Docker Desktop's local cluster doesn't enforce a default StorageClass — but for clarity/predictability, consider adding `storageClassName: manual` explicitly, and `persistentVolumeReclaimPolicy` was correctly observed as `Retain` in the `get pv` output.

### `pvc.yaml`
Requests 500Mi against a 1Gi PV — valid. Also has no `storageClassName`, which (as above) relies on the PV/PVC both defaulting to an empty class to bind to each other. Recommend explicitly matching `storageClassName: manual` on both files so binding behavior is guaranteed rather than incidental, especially before moving this to a cluster that does have a default StorageClass.

### `resource-deployment.yaml`
Well-formed: requests `64Mi`/`250m`, limits `128Mi`/`500m` — sensible ratios. No liveness/readiness probes on this particular deployment (those were tested separately via `probe-pod.yaml`), which is fine given it's a focused resource-limits exercise.

### `secret.yaml`
Uses `stringData` (auto-encoded by the API server), type `Opaque` — correct approach. **Security note:** this file contains a plaintext password (`password123`) and should not be committed to a public GitHub repository as-is. Recommend either excluding it via `.gitignore`, replacing the value with a placeholder before committing, or referencing a secrets manager in real deployments.

### `storage-pod.yaml`
Correctly mounts the `app-pvc` claim at `/usr/share/nginx/html/data`. Matches the observed successful write/read test in screenshot 24.

**Ingress and Helm template manifests could not be reviewed** — neither `ingress.yaml` nor the `mychart/templates/*` files were included in the supplied uploads.
