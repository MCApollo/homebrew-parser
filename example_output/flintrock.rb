name :
	 Flintrock
homepage :
	 https://github.com/nchammas/flintrock
url :
	 https://files.pythonhosted.org/packages/50/2b/615976ae41ae0060fbacb17c19030f6410e126c17ac93e1082bb8ac4429f/Flintrock-0.10.0.tar.gz
description :
	 Tool for launching Apache Spark clusters
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 inreplace "setup.py", "PyYAML == 3.12", "PyYAML == 3.13"
	 virtualenv_install_with_resources
