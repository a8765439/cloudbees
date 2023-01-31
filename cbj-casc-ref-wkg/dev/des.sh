NS=cloudbees-core
OC=oc-casc-bundle
CB=cloudbees-core

APP="vstream cfactory test"
POD=$(kubectl get pods -n $NS -o name)
PVC=$(kubectl get pvc -n $NS -o name)
SVC=$(kubectl get service -n $NS -o name)
STS=$(kubectl get sts -n $NS -o name)
ING=$(kubectl get ingress -n $NS -o name)


echo "Pods in namespace: $POD"
echo "PVC in namespace: $PVC"
echo "SVC in namespace: $SVC"
echo "STS in namespace: $STS"
echo "ING in namespace: $ING"

kubectl delete configmap $OC -n $NS
helm uninstall $CB -n $NS
kubectl delete $POD -n $NS
kubectl delete $PVC -n $NS
kubectl delete $SVC -n $NS
kubectl delete $STS -n $NS
kubectl delete $ING -n $NS

kubectl get all -n $NS

kubectl get ingress -n $NS

sleep 30

