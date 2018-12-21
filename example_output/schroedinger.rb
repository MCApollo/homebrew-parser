name :
	 Schroedinger
homepage :
	 https://launchpad.net/schroedinger
url :
	 https://launchpad.net/schroedinger/trunk/1.0.11/+download/schroedinger-1.0.11.tar.gz
description :
	 High-speed implementation of the Dirac codec
build_deps :
	 pkg-config
link_deps :
	 orc
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 inreplace "Makefile" do |s|
	 s.change_make_var! "SUBDIRS", "schroedinger doc tools"
	 s.change_make_var! "DIST_SUBDIRS", "schroedinger doc tools"
