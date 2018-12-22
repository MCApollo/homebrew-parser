name :
	 Ioke
homepage :
	 https://ioke.org/
url :
	 https://ioke.org/dist/ioke-P-ikj-0.4.0.tar.gz
description :
	 Dynamic language targeted at virtual machines
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 inreplace libexec/"bin/ioke" do |s|
	 s.change_make_var! "IOKE_HOME", libexec
	 end
	 bin.install_symlink libexec/"bin/ioke",
	 libexec/"bin/ispec",
	 libexec/"bin/dokgen"
