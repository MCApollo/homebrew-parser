name :
	 Asciidoctorj
homepage :
	 https://github.com/asciidoctor/asciidoctorj
url :
	 https://dl.bintray.com/asciidoctor/maven/org/asciidoctor/asciidoctorj/1.5.6/asciidoctorj-1.5.6-bin.zip
description :
	 Java wrapper and bindings for Asciidoctor
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 executable = libexec/"bin/asciidoctorj"
	 executable.chmod 0555
	 bin.write_exec_script executable
