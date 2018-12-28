#Docker File for Jenkins

FROM jenkins/jenkins:2.60.3

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh email-ext
RUN /usr/local/bin/install-plugins.sh mailer
RUN /usr/local/bin/install-plugins.sh slack

# Artifacts
RUN /usr/local/bin/install-plugins.sh htmlpublisher

# UI
RUN /usr/local/bin/install-plugins.sh greenballs
RUN /usr/local/bin/install-plugins.sh simple-theme-plugin

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes kubernetes-credentials

#pipeline 
RUN /usr/local/bin/install-plugins.sh pipeline-build-step build-pipeline-plugin pipeline-github pipeline-editor pipeline-stage-view

# install Maven
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins