name :
	 Automake
homepage :
	 https://www.gnu.org/software/automake/
url :
	 https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.xz
description :
	 Tool for generating GNU Standards-compliant Makefiles
build_deps :
link_deps :
	 autoconf
conflicts :
patches :
	 https://git.savannah.gnu.org/cgit/automake.git/patch/?id=a348d830659fffd2cfc42994524783b07e69b4b5
EOF_patch :
install :
	 ENV["PERL"] = "/usr/bin/perl"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 (share/"aclocal/dirlist").write <<~EOS
	 #{HOMEBREW_PREFIX}/share/aclocal
	 /usr/share/aclocal
	 EOS
