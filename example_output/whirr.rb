name :
	 Whirr
homepage :
	 https://whirr.apache.org/
url :
	 https://archive.apache.org/dist/whirr/whirr-0.8.2/whirr-0.8.2.tar.gz
description :
	 Set of libraries for running cloud services
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install %w[bin conf lib]
	 bin.write_exec_script libexec/"bin/whirr"
