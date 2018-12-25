name :
	 Ode
homepage :
	 https://www.ode.org/
url :
	 https://bitbucket.org/odedevs/ode/downloads/ode-0.15.2.tar.gz
description :
	 Simulating articulated rigid body dynamics
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libccd
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}", "--enable-libccd"]
	 args << "--enable-double-precision" if build.with? "double-precision"
	 inreplace "bootstrap", "libtoolize", "glibtoolize"
	 system "./bootstrap"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
