#!/bin/sh
if [ -z "$DOCKER_ACCOUNT" ]; then
    DOCKER_ACCOUNT=ashwin139
fi;

docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}
docker build --tag=microservice-kubernetes-demo-apache apache
docker tag microservice-kubernetes-demo-apache ashwin139/microservice-kubernetes-demo-apache:latest
docker push ashwin139/microservice-kubernetes-demo-apache

docker build --tag=microservice-kubernetes-demo-catalog microservice-kubernetes-demo-catalog
docker tag microservice-kubernetes-demo-catalog ashwin139/microservice-kubernetes-demo-catalog:latest
docker push ashwin139/microservice-kubernetes-demo-catalog

docker build --tag=microservice-kubernetes-demo-customer microservice-kubernetes-demo-customer
docker tag microservice-kubernetes-demo-customer ashwin139/microservice-kubernetes-demo-customer:latest
docker push ashwin139/microservice-kubernetes-demo-customer

docker build --tag=microservice-kubernetes-demo-order microservice-kubernetes-demo-order
docker tag microservice-kubernetes-demo-order ashwin139/microservice-kubernetes-demo-order:latest
docker push ashwin139/microservice-kubernetes-demo-order
