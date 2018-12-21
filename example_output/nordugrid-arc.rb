name :
	 NordugridArc
homepage :
	 http://www.nordugrid.org/
url :
	 https://download.nordugrid.org/packages/nordugrid-arc/releases/5.0.2/src/nordugrid-arc-5.0.2.tar.gz
description :
	 Grid computing middleware
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 glibmm
	 globus-toolkit
	 libxml2
	 :macos
conflicts :
patches :
	 https://gist.githubusercontent.com/tschoonj/065dabc33be5ec636058/raw/beee466cdf5fe56f93af0b07022532b1945e9d2e/nordugrid-arc.diff
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-swig",
	 "--prefix=#{prefix}"
	 system "make", "install"
