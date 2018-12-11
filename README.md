elastic-hbase
=============

As seen at HBaseCon 2015 - [[slides](http://www.slideshare.net/clehene/elastic-hbase-on-mesos) | [video](https://vimeo.com/128208572)]
## Kubernetes / GKE (Standalone only for now)

    kubectl appply -f kubernetes/hbase.yaml

This creates headless service (`clusterIp: None`) 

    ➜  ~ kubectl get pods
    NAME                                 READY     STATUS    RESTARTS   AGE
    hbase-0                              1/1       Running   0          21m

Open HBase shell

    kubectl exec -it hbase-0 -- /hbase/bin/hbase shell
    
    ➜  ~ kubectl exec -it hbase-0 -- /hbase/bin/hbase shell
    2018-12-11 01:16:44,229 WARN  [main] util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
    HBase Shell
    Use "help" to get list of supported commands.
    Use "exit" to quit this interactive shell.
    For Reference, please visit: http://hbase.apache.org/2.0/book.html#shell
    Version 2.1.1, rb60a92d6864ef27295027f5961cb46f9162d7637, Fri Oct 26 19:27:03 PDT 2018
    Took 0.0037 seconds
    hbase(main):001:0>

## Marathon
Run HBase as a Marathon workload on top of Mesos

HBase runs in a Docker container

The Marathon application manifests is used to push the environment configuration 

    curl -X POST -H "Content-Type: application/json" \
    http://MARATHON_HOST/v2/apps\
    -d@marathon/hbase-regionserver.json


    curl -X POST -H "Content-Type: application/json" \
    http://MARATHON_HOST/v2/apps\
    -d@marathon/hbase-master.json

## Building
* `env.sh` contains the variables for the HBase version that will be pulled along with the registry, etc.
* `build.sh` builds and tags the docker container
  * `${REPO}/hbase:${VERSION}-${TAG}`
* `release.sh` pushes the docker container to the registry
