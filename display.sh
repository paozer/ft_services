#!/bin/bash

if [ "$1" == "" ]; then
    NAMESPACE="pramella"
else
    NAMESPACE=$1
fi

MINIKUBE_IP=$(minikube ip)
INGRESS_IP=$(kubectl get ingress --namespace=$NAMESPACE | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')
SERVICE_LIST=$(minikube service list)

get_service_port () {
	for service in "$@"; do :; done
	echo "$@" | grep "$NAMESPACE" | grep "$service" | sed -n -e 's/^.*://p' | sed -n -e 's/\(^.*\)\ .*$/\1/p'
}

printf "\nwordpress:	admin|password	        http://$MINIKUBE_IP:"; get_service_port "$SERVICE_LIST" "wordpress"; printf "\t\tcoro|na123\n\t\t424242|242424\n"
printf "phpmyadmin:	root|password	        http://$MINIKUBE_IP:"; get_service_port "$SERVICE_LIST" "phpmyadmin"
printf "grafana:	admin|password	        http://$MINIKUBE_IP:"; get_service_port "$SERVICE_LIST" "grafana"
printf "ssh:		admin|password	        ssh admin@$MINIKUBE_IP -p "; get_service_port "$SERVICE_LIST" "nginx-ssh"
printf "ftps:		admin|password	        curl ftp://$MINIKUBE_IP:21 --ssl -k --user admin (-T test.txt)\n"
printf "nginx		https://$INGRESS_IP\n"