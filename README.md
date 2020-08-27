The main goal of this solo project is to introduce students to Kubernetes by orchestrating services similar to those used for a real website. Additionally students deepen their knowledge about Docker. Every service has to run in a dedicated container and must use Alpine Linux for performance reasons. We are not allowed to use Dockerhub and Kubernetes deployments must use self-made and local Docker images.

The services to deploy are a Wordpress, Phpmyadmin, Nginx, Ftps, Grafana (linked with InfluxDB receiving metrics from Telegraf). Additionally the Nginx container must be accessible through SSH and containers must restart in case they crash or the service becomes unavailable.

### Installation
To build the Docker images and deploy the services on MacOS (I have not tested the script on Linux) you can run the `setup.sh` script. It requires Minikube and Docker to be installed. You can run `display.sh` to display links to the deployed services.

`git clone https://github.com/paozer/ft_services && cd ft_services && ./setup.sh`

### Resources
This project requires reading a lot documentation and bumping into a lot of new concepts.

#### Wordpress
* [installation](https://wiki.alpinelinux.org/wiki/WordPress)
* [wp & kubernetes](https://vinta.ws/code/setup-scalable-wordpress-sites-on-kubernetes.html)

#### Mysql
* [installation](https://wiki.alpinelinux.org/wiki/Production_DataBases_:_mysql)
* [backups](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)

#### Nginx
* [installation](https://wiki.alpinelinux.org/wiki/Nginx_with_PHP)
* [configuration](https://nginx.org/en/docs/http/configuring_https_servers.html)
* [how-to tls/ssl certificate](https://www.humankode.com/ssl/create-a-selfsigned-certificate-for-nginx-in-5-minutes)

#### Ftps
* [configuration reference](https://linux.die.net/man/5/vsftpd.conf)
* [configuration guide](https://www.digitalocean.com/community/tutorials/how-to-configure-vsftpd-to-use-ssl-tls-on-a-centos-vps)
* [configuration guide (german)](https://www.netcup-wiki.de/wiki/VSFTPD_Installation_und_Einrichtung)
* [why/how-to chroot](https://linuxhint.com/vsftpd_chroot_home_dir/)

#### Influxdb, Telegraf & Grafana
* [full guide](https://aperogeek.fr/monitoring-docker-with-telegraf-influxdb-and-grafana/)
* [full guide](https://octoperf.com/blog/2019/09/19/kraken-kubernetes-influxdb-grafana-telegraf)
* [docker metrics for telegraf](https://github.com/influxdata/telegraf/tree/release-1.9/plugins/inputs/docker)

#### Kubernetes
* [reference](https://kubernetes.io/docs/)
* [liveness probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
* [services](https://matthewpalmer.net/kubernetes-app-developer/articles/service-kubernetes-example-tutorial.html)
* [labels & selectors](https://medium.com/@zwhitchcox/matchlabels-labels-and-selectors-explained-in-detail-for-beginners-d421bdd05362)

### Possible Improvements
* setup metallb.universe.tf loadbalancer
* use secrets for ssh certificates
* improve overall security
* improve ftps security
* add pod readiness probes

