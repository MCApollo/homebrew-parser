name :
	 AardvarkShellUtils
homepage :
	 http://www.laffeycomputer.com/shellutils.html
url :
	 https://web.archive.org/web/20170106105512/downloads.laffeycomputer.com/current_builds/shellutils/aardvark_shell_utils-1.0.tar.gz
description :
	 Utilities to aid shell scripts or command-line users
build_deps :
link_deps :
optional_deps :
conflicts :
	 coreutils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
