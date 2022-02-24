# jenkins-deploy-k8

Configuration for base deployment of Jenkins on Kubernetes, with the intent of utilizing Kustomize to overlay environment-specific values.

Current prerequisites include:

1) a registry secret is created in the namespace containing credentials to the docker repository
2) an nginx ingress/controller is already deployed in the cluster
3) an efs/fss share is established for the persistent volume to connect
4) the efs/fss volume should be mounted on a workstation, with ownership of the volume to user and group of 1000 (chown -R 1000:1000 .) 
5) the casc.yaml file should be copied to the root of the efs/fss volume prior to prod deployment
6) values in the jenkins-secrets.yaml file in the overlay directory are updated and applied locally before deployment. DO NOT COMMIT SECRET VALUES INTO THE GIT REPO!
7) a valid TLS certificate for the fqdn jenkins will run in should be obtained and created as a tls secret in the namespace
8) post-install step will require a kubectl config file to be generated and copied to the jenkins home directory on the persistent volume. base/jenkins-kubectl.sh script may be used to create the file or serve as reference

The overlays/env folder serves as a template for directories under the jenkins/overlays folder in a specific deployment repository associated with a given tenancy/cluster (i.e. jenkins/overlays/prod in repo deployments-simeeio.automation-aws).  

