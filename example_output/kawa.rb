name :
	 Kawa
homepage :
	 https://www.gnu.org/software/kawa/
url :
	 https://ftp.gnu.org/gnu/kawa/kawa-3.0.zip
description :
	 Programming language for Java (implementation of Scheme)
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["bin/*.bat"]
	 inreplace "bin/kawa", "thisfile=`command -v $0`",
	 "thisfile=#{libexec}/bin/kawa"
	 libexec.install "bin", "lib"
	 bin.install_symlink libexec/"bin/kawa"
	 doc.install Dir["doc/*"]
