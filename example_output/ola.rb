name :
	 Ola
homepage :
	 https://www.openlighting.org/ola/
url :
	 https://github.com/OpenLightingProject/ola/releases/download/0.10.7/ola-0.10.7.tar.gz
description :
	 Open Lighting Architecture for lighting control information
build_deps :
	 pkg-config
link_deps :
	 liblo
	 libmicrohttpd
	 libusb
	 ossp-uuid
	 protobuf@3.1
	 python@2
optional_deps :
conflicts :
resource :
	 ['protobuf-c']
	 ['https://github.com/protobuf-c/protobuf-c/releases/download/v1.2.1/protobuf-c-1.2.1.tar.gz']
patches :
EOF_patch :
install :
	 resource("protobuf-c").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{buildpath}/vendor/protobuf-c"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", buildpath/"vendor/protobuf-c/lib/pkgconfig"
	 protobuf_pth = Formula["protobuf@3.1"].opt_lib/"python2.7/site-packages/homebrew-protobuf.pth"
	 (buildpath/".brew_home/Library/Python/2.7/lib/python/site-packages").install_symlink protobuf_pth
	 args = %W[
	 --disable-fatal-warnings
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --disable-unittests
	 --enable-python-libs
	 --enable-rdm-tests
	 ]
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", *args
	 system "make", "install"
