name :
	 Commandbox
homepage :
	 https://www.ortussolutions.com/products/commandbox
url :
	 https://downloads.ortussolutions.com/ortussolutions/commandbox/4.4.0/commandbox-bin-4.4.0.zip
description :
	 CFML embedded server, package manager, and app scaffolding tools
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "box"
	 (bin/"box").write_env_script libexec/"box", Language::Java.java_home_env("1.8")
	 doc.install resource("apidocs")
