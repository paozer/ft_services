#!/bin/bash

SERVICES=(
	nginx		\
	mysql		\
	phpmyadmin 	\
	wordpress	\
	influxdb	\
	telegraf 	\
	grafana		\
	ftps		\
)

PROJECT_DIR=$(pwd)
NAMESPACE=pramella

printf "
____ ___     ____ ____ ____ _  _ _ ____ ____ ____
|___  |      [__  |___ |__/ |  | | |    |___ [__
|     |  ___ ___] |___ |  \  \/  | |___ |___ ___]\n"

printf "\nwe will use the '$NAMESPACE' namespace\nctrl-C if you want to change it in the scripts variables\n\n"
sleep 3

if [[ $1 == "super-clean" ]]; then
	eval $(minikube docker-env)
	printf "deleting $NAMESPACE namespace... "
	kubectl delete namespace $NAMESPACE > /dev/null 2>&1
	printf "✅ \n"
	for service in "${SERVICES[@]}"
	do
		printf "🐳 removing $service\n"
		docker rmi -f $service:v1 > /dev/null 2>&1
	done
	printf "🐳 running container/system prune\n"
	echo "y" | docker system prune -a -f > /dev/null
	echo "y" | docker container prune -f > /dev/null
	exit 0
fi

printf "starting minikube... "
minikube start > /dev/null
printf "✅\n"

MINIKUBE_IP=$(minikube ip)

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

printf "\n✨ enabling and deploying ingress\n"
minikube addons enable ingress > /dev/null
kubectl apply -f srcs/ingress/ingress.yaml --namespace=$NAMESPACE> /dev/null

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

printf "\n🌈 done...\n"

./display.sh $NAMESPACE

# kubectl exec -it $(kubectl get pod -l "app=nginx" -o name | sed 's/pods\///') -- /bin/sh -c "ps"
# kubectl exec -it $(kubectl get pod -l "app=nginx" -o name | sed 's/pods\///') -- /bin/sh -c "kill pid"
