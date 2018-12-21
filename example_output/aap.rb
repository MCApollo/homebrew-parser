name :
	 Aap
homepage :
	 http://www.a-a-p.org
url :
	 https://downloads.sourceforge.net/project/a-a-p/aap-1.094.zip
description :
	 Make-like tool to download, build, and install software
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 system "./aap", "install", "PREFIX=#{prefix}", "MANSUBDIR=share/man"
