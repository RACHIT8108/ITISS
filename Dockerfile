FROM jenkins/jenkins:lts

# Switch to root user to install packages
USER root

# Install Python, pip, and Docker CLI
RUN apt-get update && \
    apt-get install -y python3 python3-pip docker.io && \
    rm -rf /var/lib/apt/lists/*

# Grant jenkins user access to docker socket group if needed
RUN usermod -aG docker jenkins

# Switch back to default jenkins user
USER jenkins
