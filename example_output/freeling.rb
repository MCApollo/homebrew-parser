name :
	 Freeling
homepage :
	 http://nlp.lsi.upc.edu/freeling/
url :
	 https://github.com/TALP-UPC/FreeLing/releases/download/4.1/FreeLing-4.1.tar.gz
description :
	 Suite of language analyzers
build_deps :
	 cmake
link_deps :
	 icu4c
optional_deps :
conflicts :
	 hunspell
resource :
	 ['boost']
	 ['https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2']
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
	 end
	 bootstrap_args = %W[
	 --prefix=#{libexec}/boost
	 --libdir=#{libexec}/boost/lib
	 --with-icu=#{Formula["icu4c"].opt_prefix}
	 --with-libraries=atomic,chrono,date_time,filesystem,program_options,regex,system,thread
	 ]
	 args = %W[
	 --prefix=#{libexec}/boost
	 --libdir=#{libexec}/boost/lib
	 -d2
	 -j#{ENV.make_jobs}
	 --ignore-site-config
	 --layout=tagged
	 --user-config=user-config.jam
	 install
	 threading=multi
	 link=shared
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
	 (libexec/"boost/lib").each_child do |dylib|
	 MachO::Tools.change_dylib_id(dylib.to_s, dylib.to_s)
	 end
	 %w[chrono filesystem thread].each do |library|
	 macho = MachO.open("#{libexec}/boost/lib/libboost_#{library}-mt.dylib")
	 macho.change_dylib("libboost_system-mt.dylib",
	 "#{libexec}/boost/lib/libboost_system-mt.dylib")
	 macho.write!
	 end
	 mkdir "build" do
	 system "cmake", "..",  "-DBoost_INCLUDE_DIR=#{libexec}/boost/include",
	 "-DBoost_LIBRARY_DIR_RELEASE=#{libexec}/boost/lib",
	 *std_cmake_args
	 system "make", "install"
	 end
	 libexec.install "#{bin}/fl_initialize"
	 inreplace "#{bin}/analyze",
	 ". $(cd $(dirname $0) && echo $PWD)/fl_initialize",
	 ". #{libexec}/fl_initialize"
