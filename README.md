# OOMIE

Maps `/dev/kmsg` OOM messages to running Kubernetes pods. This is useful when the primary container forks multiple child processes, as well as mapping OOM's from init or sidecar containers.

<div align="center">
  <a href="https://dash.plotly.com/project-maintenance">
    <img src="https://dash.plotly.com/assets/images/maintained-by-plotly.png" width="400px" alt="Maintained by Plotly">
  </a>
</div>


## Installation

First compile and build the docker images

```
$ make all
```

Apply kubernetes manifests

```
$ kubectl apply -f example.yaml
```

```
$ kubectl get events -n demo-app
LAST SEEN   TYPE      REASON      OBJECT                         MESSAGE
30s         Warning   OOM         pod/demo-app-d944568f6-vnhk5   System OOM encountered, victim process: nginx, pid: 1270360, uid: 65534
```
