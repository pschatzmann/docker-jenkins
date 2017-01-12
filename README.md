# Overview
Base jenkins image which also includes maven
see https://hub.docker.com/_/jenkins/

# Docker Compose
I am using the following docker-compose file

    version: '2'
    services:
      jenkins:
        image: pschatzmann/jenkins
        container_name: jenkins
        ports:
            - "8000:8080"
            - "50000"
        volumes:
            - /srv/jenkins:/var/jenkins_home
            - /var/run/docker.sock:/var/run/docker.sock
        extra_hosts:
            - nuc.local:10.0.1.20 
        dns: 8.8.8.8
        restart: always

# Comments
- dns is needed so that docker can find any additional plugins
- extra_hosts is used to make the svn repository location available
- /var/run/docker.sock:/var/run/docker.sock is making the docker command line available by using the docker installation on the host
