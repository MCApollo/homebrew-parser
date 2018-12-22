name :
	 Epubcheck
homepage :
	 https://github.com/IDPF/epubcheck
url :
	 https://github.com/IDPF/epubcheck/releases/download/v4.1.0/epubcheck-4.1.0.zip
description :
	 Validate IDPF EPUB files, version 2.0 and later
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 jarname = "epubcheck.jar"
	 libexec.install jarname, "lib"
	 bin.write_jar_script libexec/jarname, "epubcheck"
