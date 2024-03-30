# Create key for user
```
openssl genrsa -out ./cer/alex_test.key 2048
```

# Create certificate signing request
```
openssl req -new -key ./cer/alex_test.key -out ./cer/alex_test.csr -subj "/CN=alex_test/O=devops"
```

# Creater user certificate
```
openssl x509 -req -in ./cer/alex_test.csr \
 -CA /var/snap/microk8s/current/certs/ca.crt \
 -CAkey /var/snap/microk8s/current/certs/ca.key \
 -CAcreateserial -out ./cer/alex_test.crt -days 3650
 ```

 # Add user to kubeconfig
 ```
kubectl config set-credentials alex_test \
--client-certificate=./cer/alex_test.crt \
--client-key=./cer/alex_test.key \
--embed-certs=true
 ```

 # Set context
 ```
kubectl config set-context test --cluster=microk8s-cluster --user=alex_test
 ```

 # Get context
 ```
kubectl config get-contexts
 ```

 # Change context
 ```
kubectl config use-context test
 ```

 # Apply role yaml
 ```
kubectl create -f 
 ```