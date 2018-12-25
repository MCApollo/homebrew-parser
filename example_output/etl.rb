name :
	 Etl
homepage :
	 https://synfig.org
url :
	 https://downloads.sourceforge.net/project/synfig/releases/1.0.2/source/ETL-0.04.19.tar.gz
description :
	 Extensible Template Library
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
