name :
	 AntlrAT2
homepage :
	 https://www.antlr2.org/
url :
	 https://www.antlr2.org/download/antlr-2.7.7.tar.gz
description :
	 ANother Tool for Language Recognition
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
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-csharp"
	 system "make"
	 libexec.install "antlr.jar"
	 include.install "lib/cpp/antlr"
	 lib.install "lib/cpp/src/libantlr.a"
	 (bin/"antlr").write <<~EOS
	 #!/bin/sh
	 java -classpath #{libexec}/antlr.jar antlr.Tool "$@"
	 EOS
