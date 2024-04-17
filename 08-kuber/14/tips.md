kubectl apply -f nginx-multitool-deployment.yaml 

kubectl rollout history deployment/nginx-multitool
kubectl rollout status deployment/nginx-multitool
kubectl rollout undo deployment/nginx-multitool
kubectl rollout undo deployment/nginx-multitool --to-revision 2