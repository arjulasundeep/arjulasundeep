FROM jenkins/jenkins:2.288

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

#Location of configuration as code file
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

#Copy in plugins file and execute installs
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

#Force upgrade of existing/local plugins
ENV PLUGINS_FORCE_UPGRADE=true

# Install utilities
USER root
RUN apt-get update -qq && apt-get install -y apt-transport-https apt-utils docker ca-certificates curl gnupg2 jq python python-pip software-properties-common zip
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN curl -L https://s3.amazonaws.com/aws-cli/awscli-bundle-1.18.147.zip -o awscli-bundle.zip && unzip awscli-bundle.zip && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && rm awscli-bundle.zip
RUN apt-get install -y gettext
RUN mkdir cacerts
COPY cacerts cacerts/
RUN keytool -importcert -storepass changeit -noprompt -trustcacerts -alias office365Base -file cacerts/office365Base.cer -keystore /opt/java/openjdk/jre/lib/security/cacerts && keytool -importcert -storepass changeit -noprompt -trustcacerts -alias office365middle -file cacerts/office365middle.cer -keystore /opt/java/openjdk/jre/lib/security/cacerts && keytool -importcert -storepass changeit -noprompt -trustcacerts -alias office365root -file cacerts/office365root.cer -keystore /opt/java/openjdk/jre/lib/security/cacerts 

USER jenkins
