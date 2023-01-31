NS=cloudbees-core
OC=oc-casc-bundle-2.375.1.1/
HC=cloudbees-core-setup.alb.dev.2.375.1.1.yaml


kubectl create namespace $NS
# helm repo add cloudbees https://public-charts.artifacts.cloudbees.com/repository/public/
# helm repo update

kubectl get ingress -n $NS

kubectl create configmap oc-casc-bundle --from-file=$OC -n $NS
helm upgrade --install cloudbees-core cloudbees/cloudbees-core --namespace  $NS -f $HC
