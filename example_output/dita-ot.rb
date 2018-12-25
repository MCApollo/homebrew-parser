name :
	 DitaOt
homepage :
	 https://www.dita-ot.org/
url :
	 https://github.com/dita-ot/dita-ot/releases/download/3.2.1/dita-ot-3.2.1.zip
description :
	 DITA Open Toolkit is an implementation of the OASIS DITA specification
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
	 rm_f Dir["bin/*.bat", "config/env.bat", "startcmd.*"]
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/dita"
