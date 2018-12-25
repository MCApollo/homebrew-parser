name :
	 Autogen
homepage :
	 https://autogen.sourceforge.io
url :
	 https://ftp.gnu.org/gnu/autogen/rel5.18.12/autogen-5.18.12.tar.xz
description :
	 Automated text file generator
build_deps :
	 pkg-config
link_deps :
	 guile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0de886b/autogen/allow-guile-2.2.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
