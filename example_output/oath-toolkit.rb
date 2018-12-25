name :
	 OathToolkit
homepage :
	 https://www.nongnu.org/oath-toolkit/
url :
	 https://download.savannah.gnu.org/releases/oath-toolkit/oath-toolkit-2.6.2.tar.gz
description :
	 Tools for one-time password authentication systems
build_deps :
	 pkg-config
link_deps :
	 libxmlsec1
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
