# mychart — placeholder

The screenshots confirm this chart was created (`helm create mychart`), linted (`helm lint`), installed (`helm install my-custom-app .\mychart`), and upgraded (`helm upgrade my-custom-app .\mychart`, revision 1 → 2).

However, the actual chart files (`Chart.yaml`, `values.yaml`, `templates/*.yaml`, `charts/`) were not included in the upload provided for this documentation — the upload for `mychart` arrived as an empty 0-byte file rather than a folder.

**To complete this folder:** copy the real `mychart/` directory from `C:\k8s-labs\mychart` on the lab machine into this location.
