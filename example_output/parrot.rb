name :
	 Parrot
homepage :
	 http://www.parrot.org/
url :
description :
	 Open source virtual machine (for Perl6, et al.)
build_deps :
link_deps :
conflicts :
	 rakudo-star
patches :
	 https://github.com/parrot/parrot/commit/854aec65d6de8eaf5282995ab92100a2446f0cde.diff?full_index=1
EOF_patch :
install :
	 system "perl", "Configure.pl", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--debugging=0",
	 "--cc=#{ENV.cc}"
	 system "make"
	 system "make", "install"
	 rm_rf lib/"VERSION"
