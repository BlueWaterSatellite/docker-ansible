FROM ubuntu:trusty
MAINTAINER Brian Friedmann <brian.friedmann@satelytics.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

# Copy baked in playbooks
COPY ansible /ansible

# Volume for Ansible Playbooks
VOLUME /ansible
WORKDIR /ansible

# Entrypoint
ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]
