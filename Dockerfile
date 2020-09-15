FROM ubuntu:18.04 AS core

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Pacific

RUN     echo 'Creating a Custom Image For AWS Code Build - Kubernetes Applications' \
	&& apt-get update -y \
	&& apt-get install -y tzdata \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing Python3 \
	&& echo '------------------------------------------------------------------------------' \
	&& apt-get install -y python3 \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing AWSCLI \
	&& echo '------------------------------------------------------------------------------' \
	&& apt-get install -y awscli
	
RUN     echo '------------------------------------------------------------------------------' \
	&& echo Installing JDK and JRE \
	&& echo '------------------------------------------------------------------------------' \
        && apt-get install -y openjdk-8-jdk \
	&& apt-get install -y openjdk-8-jre \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing Maven \
	&& echo '------------------------------------------------------------------------------' \	
	&& mkdir -p /usr/share/maven /usr/share/maven/ref \
	&& echo '------------------------------------------------------------------------------' 	
