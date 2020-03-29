# Project of a load balanced Infrastructure with Elastic stack to monitor

- Load balanced by HAProxy
- Multiple instances of apache app
- Injection of chaos with Pumba to test reliability

## Getting started
To start the load balanced apache with ELK
```
git clone git@github.com:edonadei/create-scaling-webapp-with-elasticsearch.git
cd create-scaling-webapp-with-elasticsearch
docker-compose up -d
```

- Then you can access to the application by reaching **localhost**
- Kibana is also accessible by reaching **localhost:5601**
- Elasticsearch is set up on **localhost:9200**

## Command to start Pumba 
```docker
docker run -it --rm  -v /var/run/docker.sock:/var/run/docker.sock gaiaadm/pumba --interval=20s --random --log-level=info kill --signal=SIGKILL 
```

## Schema of infrastructure
**V1**
![Schema](schema_infra.png)
