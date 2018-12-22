name :
	 Pcb2gcode
homepage :
	 https://github.com/pcb2gcode/pcb2gcode
url :
	 https://github.com/pcb2gcode/pcb2gcode/releases/download/v1.3.2/pcb2gcode-1.3.2.tar.gz
description :
	 Command-line tool for isolation, routing and drilling of PCBs
build_deps :
	 pkg-config
link_deps :
	 gerbv
	 gtkmm
conflicts :
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 end
	 bootstrap_args = %W[
	 --prefix=#{buildpath}/boost
	 --libdir=#{buildpath}/boost/lib
	 --with-libraries=program_options
	 --without-icu
	 ]
	 args = %W[
	 --prefix=#{buildpath}/boost
	 --libdir=#{buildpath}/boost/lib
	 -d2
	 -j#{ENV.make_jobs}
	 --ignore-site-config
	 --layout=tagged
	 --user-config=user-config.jam
	 install
	 threading=multi
	 link=static
	 optimization=space
	 variant=release
	 cxxflags=-std=c++11
	 ]
	 if ENV.compiler == :clang
	 args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++"
	 end
	 system "./bootstrap.sh", *bootstrap_args
	 system "./b2", "headers"
	 system "./b2", *args
	 end
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-boost=#{buildpath}/boost",
	 "--enable-static-boost"
	 system "make", "install"
