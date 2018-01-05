example-kubernetes-jobs
=======================

## Preparation

### Install minikube

https://github.com/kubernetes/minikube#installation

I confirmed with following environment.

```
$ minikube version
minikube version: v0.24.1

$ kubectl version
Client Version: version.Info{Major:"1", Minor:"9", GitVersion:"v1.9.1", GitCommit:"3a1c9449a956b6026f075fa3134ff92f7d55f812", GitTreeState:"clean", BuildDate:"2018-01-04T19:58:48Z", GoVersion:"go1.9.2", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.0", GitCommit:"0b9efaeb34a2fc51ff8e4d34ad9bc6375459c4a4", GitTreeState:"clean", BuildDate:"2017-11-29T22:43:34Z", GoVersion:"go1.9.1", Compiler:"gc", Platform:"linux/amd64"}
```

### Use docker which running in VM as minikube

Then you can use built docker image directly from Kubernetes without pulling from Docker Hub.

```sh
$ eval $(minikube docker-env)
```

## Build docker images

```sh
$ docker build -t slackboard     docker/slackboard
$ docker build -t slackboard-cli docker/slackboard-cli/
```

## Create Kubernetes resources

```sh
# Create slackboard.toml as a Kubernetes configmap
$ kubectl create configmap slackboard --from-file=conf/slackboard.toml

# Create other resources
$ kubectl create -f slackboard.yaml
$ kubectl create -f slackboard-cli.yaml
```

```sh
$ kubectl proxy
```

Access [slackboard ui](http://127.0.0.1:8001/api/v1/namespaces/default/services/slackboard:29800/proxy/ui/)
