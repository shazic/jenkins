# Jenkins container with additional software installed
Jenkins container generally comes with the jre, git and jenkins installed.

This project takes the official image `jenkinsci/blueocean:latest` as the base and installs the following on top of it:
- Python3
- pip
- AWS CLI using pip3

## Usage
```
$ docker build -t jenkins-aws:latest .
```

Once the image is created, it can be used to spin up containers.

```
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /volumes/jenkins/home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins \
  jenkins-aws:latest
  ```
If the underlying OS has docker installed, then the option `-v /var/run/docker.sock:/var/run/docker.sock` would enable the container to execute docker commands. If that is not the case, or if you don't wish to call docker commands from within the container, then omit the option.
