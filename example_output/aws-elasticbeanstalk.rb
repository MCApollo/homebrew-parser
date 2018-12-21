name :
	 AwsElasticbeanstalk
homepage :
	 https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html
url :
	 https://files.pythonhosted.org/packages/cd/52/74d6fb2c789f061c5abfd0084b9f0592b3d7f39ae73c24b8a885a07d09d4/awsebcli-3.14.6.tar.gz
description :
	 Client for Amazon Elastic Beanstalk web service
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bash_completion.install libexec/"bin/eb_completion.bash"
