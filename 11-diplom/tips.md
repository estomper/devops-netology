1. terraform create SA - 

get key sa:
```
yc iam key create \
  --service-account-id ajefg0ufej7vsoc8vep2 \
  --folder-name default \
  --output /home/alex/git/netology/devops-netology/11-diplom/terraform/1-2-s3-bucket/sa-key.json
```

get access-key
https://ydb.tech/docs/ru/reference/ydb-cli/export-import/auth-s3
Также можно через tfstate

```
yc iam access-key list --service-account-name=sa
```

2. Create S3
https://yandex.cloud/ru/docs/ydb/terraform/dynamodb-tables
https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-state-storage
https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-state-storage#configure-provider

```
export ACCESS_KEY="<идентификатор_ключа>"
export SECRET_KEY="<секретный_ключ>"

terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```

3. Docker
```
docker build -t nginx-netology .
docker run --name nginx-netology -d -p 8080:80 nginx-netology
```

4. Yandex Registry
https://yandex.cloud/en/docs/container-registry/operations/registry/registry-create
https://yandex.cloud/ru/docs/container-registry/quickstart/?from=int-console-empty-state

Перетегать образ для ya registry - cr.yandex/<идентификатор_реестра>/<имя_Docker-образа>:<тег>
```
docker tag nginx-netology cr.yandex/crpul4f5308ai5814ctv/nginx-netology:1.17
```
Docker push
```
docker push cr.yandex/crpul4f5308ai5814ctv/nginx-netology:1.17
```

5. kube-prometheus
https://github.com/prometheus-operator/kube-prometheus/tree/release-0.13
https://yandex.cloud/ru/docs/managed-kubernetes/operations/create-load-balancer

```
kubectl apply --server-side -f manifests/setup
kubectl wait \
	--for condition=Established \
	--all CustomResourceDefinition \
	--namespace=monitoring
kubectl apply -f manifests/

kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```
quay.io/prometheus/blackbox-exporter:v0.24.0
grafana/grafana:9.5.3
jimmidyson/configmap-reload:v0.5.0
quay.io/brancz/kube-rbac-proxy:v0.14.2
quay.io/prometheus-operator/prometheus-operator:v0.67.1

docker pull registry.docker-cn.com/grafana/grafana:9.5.3
docker pull quay.io/prometheus/blackbox-exporter:v0.24.0
docker pull public.ecr.aws/k2x7k5i7/jimmidyson/configmap-reload:v0.5.0
docker pull quay.io/brancz/kube-rbac-proxy:v0.14.2
docker pull quay.io/prometheus-operator/prometheus-operator:v0.67.1

docker tag mirror.gcr.io/grafana/grafana:9.5.3 cr.yandex/crpul4f5308ai5814ctv/grafana:9.5.3
docker tag quay.io/prometheus/blackbox-exporter:v0.24.0 cr.yandex/crpul4f5308ai5814ctv/blackbox-exporter:v0.24.0
docker tag public.ecr.aws/k2x7k5i7/jimmidyson/configmap-reload:v0.5.0 cr.yandex/crpul4f5308ai5814ctv/configmap-reload:v0.5.0
docker tag quay.io/brancz/kube-rbac-proxy:v0.14.2 cr.yandex/crpul4f5308ai5814ctv/kube-rbac-proxy:v0.14.2
docker tag quay.io/prometheus-operator/prometheus-operator:v0.67.1 cr.yandex/crpul4f5308ai5814ctv/prometheus-operator:v0.67.1

docker push cr.yandex/crpul4f5308ai5814ctv/grafana:9.5.3
docker push cr.yandex/crpul4f5308ai5814ctv/blackbox-exporter:v0.24.0
docker push cr.yandex/crpul4f5308ai5814ctv/configmap-reload:v0.5.0
docker push cr.yandex/crpul4f5308ai5814ctv/kube-rbac-proxy:v0.14.2
docker push cr.yandex/crpul4f5308ai5814ctv/prometheus-operator:v0.67.1


Список актуальных зеркал docker hub (docker registry-mirrors):

https://mirror.gcr.io - зеркало Google
https://dockerhub.timeweb.cloud - зеркало Timeweb
https://dockerhub1.beget.com - зеркало Бегет
https://c.163.com - зеркало Китай
https://registry.docker-cn.com - зеркало Китай
https://daocloud.io - зеркало Китай
https://cr.yandex/mirror - зеркало Яндекс
https://noohub.ru - зеркало noosoft
https://quay.io - зеркало Redhat
https://registry.access.redhat.com - зеркало Redhat
https://registry.redhat.io - зеркало Redhat
https://public.ecr.aws - зеркало Amazon

6. Git Hub CI-CD

git checkout -b dev
git push