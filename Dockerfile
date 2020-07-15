########################################################################################################
# Written By: Arun Kumar C
#
# Description: This docker images to use as  runtime environment for the AWS Code Build.
#                          Which gives use the Kubectl, AWSCLI, Helm, Python3, AWS IAM Authenticator etc.
########################################################################################################


FROM ubuntu:18.04 AS core

RUN echo 'Creating a Custom Image For AWS Code Build - Kubernetes Applications' \
	&& apt-get update -y \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing Python3 \
	&& echo '------------------------------------------------------------------------------' \
	&& apt-get install -y python3 \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing AWSCLI \
	&& echo '------------------------------------------------------------------------------' \
	&& apt-get install -y awscli \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing GIT Repository \
	&& echo '------------------------------------------------------------------------------' \
	&& apt-get install -y git \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Installing cURL \
	&& echo '------------------------------------------------------------------------------' \
	&& apt-get install -y curl \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Downloading AWS IAM Authenticator And Installing AWS IAM Authenticator \
	&& echo '------------------------------------------------------------------------------' \
	&& curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator \
	&& chmod +x ./aws-iam-authenticator \
	&& mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Downloading K8s Kubectl And Installing Kubectl \
	&& echo '------------------------------------------------------------------------------' \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
	&& chmod +x kubectl \
	&& mv ./kubectl /usr/local/bin/kubectl \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Kubectl Installation Completed \
	&& kubectl version --client\
	&& echo '------------------------------------------------------------------------------' \
	&& echo Downloading Helm And Installing Helm \
	&& echo '------------------------------------------------------------------------------' \
	&& curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh \
	&& chmod 700 get_helm.sh \
	&& /bin/bash get_helm.sh \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Helm Installation Completed \
	&& helm version \
	&& echo '------------------------------------------------------------------------------' \
	&& echo Customer Image For AWS Code Pipeline Completed Sucessfully \
	&& echo '------------------------------------------------------------------------------'
