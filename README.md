# application-helm-chart
General helm chart required for basic application deployment in aws environment. 

Context:  
    Everytime you start deployment for a fresh application, helm provides `helm create repo` command for generating the chart sample which has to be further modified for adding ingress, secret manager, readiness, liveness , prestop hooks, environment references, service account etc for fully functional applicatino deployment. 
    This sample helm chart has basic configurable chart and parameters in basic values.yml file which can be overriden during deployment and is reusable for all kind of applications. 

    