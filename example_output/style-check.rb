name :
	 StyleCheck
homepage :
	 https://www.cs.umd.edu/~nspring/software/style-check-readme.html
url :
	 https://www.cs.umd.edu/~nspring/software/style-check-0.14.tar.gz
description :
	 Parses latex-formatted text in search of forbidden phrases
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "style-check.rb", "/etc/style-check.d/", etc/"style-check.d/"
	 system "make", "PREFIX=#{prefix}",
	 "SYSCONFDIR=#{etc}/style-check.d",
	 "install"
