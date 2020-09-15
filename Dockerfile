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
	&& echo '------------------------------------------------------------------------------' \
	&& aws sts get-caller-identity \
	&& echo '------------------------------------------------------------------------------' \
	&& aws s3 cp s3://pge-ecm-crmis-dependencies1/apache-maven-3.6.3-bin.tar.gz /tmp/apache-maven-3.6.3-bin.tar.gz \
	&& echo '------------------------------------------------------------------------------' \	
	&& tar -xzf /tmp/apache-maven-3.6.3-bin.tar.gz -C /usr/share/maven --strip-components=1 \
	&& echo '------------------------------------------------------------------------------' \	
	&& rm -f /tmp/apache-maven-3.6.3-bin.tar.gz \
	&& echo '------------------------------------------------------------------------------' \	
	&& ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Setting Up CRMIS Dependencies For CRMIS Microservices Building \
	&& echo '------------------------------------------------------------------------------' \
	&& mkdir ~/.m2 \
	&& mkdir ~/.m2/repository \
	&& aws s3 cp s3://pge-ecm-crmis-dependencies/com.zip ~/.m2/repository/com.zip \
	&& apt-get install -y zip \
	&& cd ~/.m2/repository \
	&& unzip ~/.m2/repository/com.zip \
	&& rm -fR ~/.m2/repository/com.zip \
	&& echo '-----------------------------------------------------------------------------' \
	&& echo Customer Image For AWS Code Pipeline Completed Sucessfully \
	&& echo '------------------------------------------------------------------------------'
