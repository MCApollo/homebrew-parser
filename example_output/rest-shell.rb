name :
	 RestShell
homepage :
	 https://github.com/spring-projects/rest-shell
url :
	 http://download.gopivotal.com/rest-shell/1.2.1/rest-shell-1.2.1.RELEASE.tar.gz
description :
	 Shell to work with Spring HATEOAS-compliant REST resources
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.write_exec_script libexec/"bin/rest-shell"
