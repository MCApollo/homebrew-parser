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
conflicts :
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
