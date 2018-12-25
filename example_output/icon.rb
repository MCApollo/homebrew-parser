name :
	 Icon
homepage :
	 https://www.cs.arizona.edu/icon/
url :
	 https://www.cs.arizona.edu/icon/ftp/packages/unix/icon-v951src.tgz
description :
	 General-purpose programming language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "Configure", "name=posix"
	 system "make"
	 bin.install "bin/icon", "bin/icont", "bin/iconx"
	 doc.install Dir["doc/*"]
	 man1.install Dir["man/man1/*.1"]
