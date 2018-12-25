name :
	 ApacheCtakes
homepage :
	 https://ctakes.apache.org
url :
	 https://apache.osuosl.org/ctakes/ctakes-4.0.0/apache-ctakes-4.0.0-bin.tar.gz
description :
	 NLP system for extraction of information from EMR clinical text
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat", "bin/*.cmd", "bin/ctakes.profile", "bin/ctakes-ytex",
	 "libexec/*.bat", "libexec/*.cmd"]
	 libexec.install %w[bin config desc lib resources]
	 pkgshare.install_symlink libexec/"resources/org/apache/ctakes/examples"
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
