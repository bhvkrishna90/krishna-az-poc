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
RUN /usr/local/bin/install-plugins.sh kubernetes kubernetes-credentials

#pipeline 
RUN /usr/local/bin/install-plugins.sh pipeline-build-step build-pipeline-plugin pipeline-github pipeline-editor pipeline-stage-view

#Azure Plugins
RUN /usr/local/bin/install-plugins.sh azure-acs azure-ad azure-app-service azure-batch-parallel azure-credentials azure-function azure-publishersettings-credentials

# install Maven
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins