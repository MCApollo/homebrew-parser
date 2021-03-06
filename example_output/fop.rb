name :
	 Fop
homepage :
	 https://xmlgraphics.apache.org/fop/index.html
url :
	 https://www.apache.org/dyn/closer.cgi?path=/xmlgraphics/fop/binaries/fop-2.3-bin.tar.gz
description :
	 XSL-FO print formatter for making PDF or PS documents
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['hyph']
	 ['https://downloads.sourceforge.net/project/offo/offo-hyphenation-utf8/0.1/offo-hyphenation-fop-stable-utf8.zip']
patches :
EOF_patch :
install :
	 rm_rf Dir["fop/*.bat"]
	 libexec.install Dir["*"]
	 executable = libexec/"fop/fop"
	 executable.chmod 0555
	 bin.write_exec_script executable
	 resource("hyph").stage do
	 (libexec/"build").install "fop-hyph.jar"
	 end
