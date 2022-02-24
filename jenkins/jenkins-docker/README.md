# jenkins-docker

Dockerfile and supporting files for containerized Jenkins model

The Dockerfile installs necessary utilities such as kubectl, aws-cli, python. It also installs the Configuration-As-Code plugin, which will manage the jenkins configuration. The file will be included in the jenkins-deploy-k8 repository, along with a base set of kubernetes files for deployment.

Any required plugins should be defined in the plugins.txt file, which is read and included as part of Docker image build.

Utilize the version.txt file for version control. This maps to the image tag in the docker build job.