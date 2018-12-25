name :
	 Xsane
homepage :
	 http://www.xsane.org
url :
	 https://ftp.osuosl.org/pub/blfs/conglomeration/xsane/xsane-0.999.tar.gz
description :
	 Graphical scanning frontend
build_deps :
	 pkg-config
link_deps :
	 gtk+
	 sane-backends
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e1a592d/xsane/patch-src__xsane-save.c-libpng15-compat.diff
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
