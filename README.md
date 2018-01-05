example-kubernetes-jobs
=======================

# Setup Slackboard

## Preparation

Use docker which running in VM as minikube

```sh
$ eval $(minikube docker-env)
```

## Build docker images

```sh
$ docker build -t slackboard docker/slackboard
```

## Create Kubernetes resources

```sh
# Create slackboard.toml as a Kubernetes configmap
$ kubectl create configmap slackboard --from-file=conf/slackboard.toml

# Create other resources
$ kubectl create -f slackboard.yaml
```

```sh
$ kubectl proxy
```

Access [slackboard ui](http://127.0.0.1:8001/api/v1/namespaces/default/services/slackboard:29800/proxy/ui/)
