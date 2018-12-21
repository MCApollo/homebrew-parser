name :
	 Vcprompt
homepage :
	 https://bitbucket.org/gward/vcprompt
url :
	 https://bitbucket.org/gward/vcprompt/downloads/vcprompt-1.2.1.tar.gz
description :
	 Provide version control info in shell prompts
build_deps :
link_deps :
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 system "autoconf" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "PREFIX=#{prefix}",
	 "MANDIR=#{man1}",
	 "install"
