FROM jenkinsci/blueocean:latest
# if we want to install via apt
USER root

# Install python and pip
RUN apk update && apk add python3
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py

# Install AWS CLI tool
RUN pip3 install awscli --upgrade
# This would install `aws` tool at /usr/local/bin

# drop back to the regular jenkins user - good practice
USER jenkins