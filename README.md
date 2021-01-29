# terraformer-template
Run your terraformer scripts in a docker container

Add your credentials to credentials file
The provider can be provided as an env variable however for now by default aws is selected

To Run Terraformer import run - 
```
docker build -t terraformer .
docker run -d terraformer --name terraformer

docker exec -it <container_id> bash
```
Terraformer example
```
terraformer import aws --resources=vpc,subnet --filter=vpc=myvpcid
```
