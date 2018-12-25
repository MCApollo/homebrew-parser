name :
	 Dateutils
homepage :
	 https://www.fresse.org/dateutils/
url :
	 https://github.com/hroptatyr/dateutils/releases/download/v0.4.5/dateutils-0.4.5.tar.xz
description :
	 Tools to manipulate dates with a focus on financial data
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
	 system "autoreconf", "-iv" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
