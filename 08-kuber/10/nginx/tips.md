### Create helm
```
helm create nginx
```

### Install app from helm
```
helm upgrade --install --atomic nginx ./nginx -n nginx
```

### Change version app (nginx)
```
helm upgrade --install --atomic nginx ./nginx -n nginx --set image.tag=1.17.0
```

### Get inage version
```
kubectl describe po nginx-bbb8c4694-vnvch -n nginx | grep Image
or
kubectl describe deployment nginx -n nginx | grep Image
```

### Install app to diferent ns
```
helm upgrade --install --atomic nginx-1-1 ./nginx -n app1 --set nameOverride=nginx-app1-1
helm upgrade --install --atomic nginx-1-2 ./nginx -n app1 --set nameOverride=nginx-app1-2
helm upgrade --install --atomic nginx-2-1 ./nginx -n app2 --set nameOverride=nginx-app2-1
```