#!/bin/bash

SERVICES=(
	nginx		\
	mysql		\
	phpmyadmin 	\
	wordpress	\
	influxdb	\
	telegraf 	\
	grafana		\
	#ftps		\
)

PROJECT_DIR=$(pwd)
NAMESPACE=pramella

get_service_port () {
	for service in "$@"; do :; done
	echo "$@" |grep "$NAMESPACE" |grep "$service" | sed -n -e 's/^.*://p' | sed -n -e 's/\(^.*\)\ .*$/\1/p'
}

printf "
____ ___     ____ ____ ____ _  _ _ ____ ____ ____
|___  |      [__  |___ |__/ |  | | |    |___ [__
|     |  ___ ___] |___ |  \  \/  | |___ |___ ___]\n"

printf "\nwe will use the '$NAMESPACE' namespace\nctrl-C if you want to change it in the scripts variables\n\n"
sleep 3

if [[ $1 == "super-clean" ]]; then
	printf "deleting $NAMESPACE namespace... "
	kubectl delete namespace $NAMESPACE > /dev/null 2>&1
	printf "✅ \n"
	exit 0
fi

printf "starting minikube... "
minikube start > /dev/null
printf "✅\n"

printf "telling minikube to use docker daemon... "
eval $(minikube docker-env)
printf "✅ \n"

if [[ $1 == "clean" ]]; then
	printf "deleting $NAMESPACE namespace... "
	kubectl delete namespace $NAMESPACE > /dev/null 2>&1
	printf "✅ \n"
fi

printf "creating $NAMESPACE namespace... "
kubectl create namespace $NAMESPACE > /dev/null 2>&1
printf "✅ \n"

MINIKUBE_IP=$(minikube ip)

# dirty way to update minikube ip for wp url/home in swl db to fit
cp srcs/mysql/srcs/wp.sql.bak srcs/mysql/srcs/wp.sql
sed -i "" "s/__MINIKUBE_IP__/$MINIKUBE_IP/g" srcs/mysql/srcs/wp.sql

for service in "${SERVICES[@]}"
do
	printf "\n🐳 building $service\n"
	docker build -t $service:v1 $PROJECT_DIR/srcs/$service > /dev/null
	printf "✨ deploying $service\n"
	kubectl apply -R -f $PROJECT_DIR/srcs/$service/k8s --namespace=$NAMESPACE > /dev/null
done

printf "\n✨ enabling and deploying ingress\n"
minikube addons enable ingress > /dev/null
kubectl apply -f srcs/ingress/ingress.yaml --namespace=$NAMESPACE> /dev/null

SERVICE_LIST=$(minikube service list)
INGRESS_IP=$(kubectl get ingress --namespace=$NAMESPACE |grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')

printf "🌈 done...\n"

printf "\nwordpress:	admin|password	http://$MINIKUBE_IP:"; get_service_port "$SERVICE_LIST" "wordpress"; printf "\t\tcoro|na123\n\t\t424242|242424\n"
printf "phpmyadmin:	root|password	http://$MINIKUBE_IP:"; get_service_port "$SERVICE_LIST" "phpmyadmin"
printf "grafana:	admin|password	http://$MINIKUBE_IP:"; get_service_port "$SERVICE_LIST" "grafana"
printf "ssh:		admin|password	ssh admin@$MINIKUBE_IP -p "; get_service_port "$SERVICE_LIST" "nginx-ssh"
printf "nginx		http://$INGRESS_IP https://$INGRESS_IP\n"

# kubectl exec -it $(kubectl get pod -l "app=nginx" -o name | sed 's/pods\///') -- /bin/sh -c "ps"
# kubectl exec -it $(kubectl get pod -l "app=nginx" -o name | sed 's/pods\///') -- /bin/sh -c "kill pid"
