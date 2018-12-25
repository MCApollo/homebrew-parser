name :
	 MongoOrchestration
homepage :
	 https://github.com/10gen/mongo-orchestration
url :
	 https://files.pythonhosted.org/packages/6d/b5/624a02d5f6cbfa8eb3c6554f5387c4739ad283bac7efb27ee99434a4d314/mongo-orchestration-0.6.11.tar.gz
description :
	 REST API to manage MongoDB configurations on a single host
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['bottle', 'CherryPy', 'pymongo', 'six']
	 ['https://files.pythonhosted.org/packages/bd/99/04dc59ced52a8261ee0f965a8968717a255ea84a36013e527944dbf3468c/bottle-0.12.13.tar.gz', 'https://files.pythonhosted.org/packages/50/c6/6c3d7a3221b0f098f8684037736e5604ea1586a3ba450c4a52b48f5fc2b4/CherryPy-7.0.0.tar.gz', 'https://files.pythonhosted.org/packages/a8/f6/f324f5c669478644ac64594b9d746a34e185d9c34d3f05a4a6a6dab5467b/pymongo-3.5.1.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
