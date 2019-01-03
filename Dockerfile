#Docker File for Jenkins

FROM jenkins/jenkins:lts

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh email-ext mailer slack

# Artifacts
RUN /usr/local/bin/install-plugins.sh htmlpublisher

# User Interface Plugins
RUN /usr/local/bin/install-plugins.sh greenballs simple-theme-plugin

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes kubernetes-credentials kubernetes-cli

#pipeline 
RUN /usr/local/bin/install-plugins.sh build-pipeline-plugin pipeline-github pipeline-stage-view pipeline-build-step

#Azure Plugins
RUN /usr/local/bin/install-plugins.sh azure-acs azure-ad azure-app-service azure-batch-parallel azure-credentials azure-function azure-publishersettings-credentials

#Scrpting Plugins
RUN /usr/local/bin/install-plugins.sh powershell terraform

# install Maven
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins