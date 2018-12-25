name :
	 Smake
homepage :
	 https://s-make.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/s-make/smake-1.2.5.tar.bz2
description :
	 Portable make program with automake features
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
	 ENV.O1 if DevelopmentTools.clang_build_version >= 900
	 system "make", "GMAKE_NOWARN=true", "INS_BASE=#{libexec}", "INS_RBASE=#{libexec}", "install"
	 bin.install_symlink libexec/"bin/smake"
	 man1.install_symlink Dir["#{libexec}/share/man/man1/*.1"]
	 man5.install_symlink Dir["#{libexec}/share/man/man5/*.5"]
