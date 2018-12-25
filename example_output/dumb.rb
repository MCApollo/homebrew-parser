name :
	 Dumb
homepage :
	 https://dumb.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/dumb/dumb/0.9.3/dumb-0.9.3.tar.gz
description :
	 IT, XM, S3M and MOD player library
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
	 (buildpath/"make/config.txt").write <<~EOS
	 include make/unix.inc
	 ALL_TARGETS := core core-examples core-headers
	 PREFIX := #{prefix}
	 EOS
	 bin.mkpath
	 include.mkpath
	 lib.mkpath
	 system "make"
	 system "make", "install"
