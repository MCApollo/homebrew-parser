name :
	 Moreutils
homepage :
	 https://joeyh.name/code/moreutils/
url :
	 https://git.joeyh.name/git/moreutils.git
description :
	 Collection of tools that nobody wrote when UNIX was young
build_deps :
	 docbook-xsl
link_deps :
conflicts :
	 parallel
	 parallel
	 pwntools
	 errno
	 task-spooler
	 ts
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resource("Time::Duration").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "--skipdeps"
	 system "make", "install"
