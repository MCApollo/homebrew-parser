name :
	 SiscScheme
homepage :
	 http://sisc-scheme.org/
url :
	 https://downloads.sourceforge.net/project/sisc/SISC%20Lite/1.16.6/sisc-lite-1.16.6.tar.gz
description :
	 Extensive Java based Scheme interpreter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"sisc").write <<~EOS
	 #!/bin/sh
	 SISC_HOME=#{libexec}
	 exec #{libexec}/sisc "$@"
	 EOS
